using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.FileIO;
using Ionic.Zip;

namespace fnsignManager
{
    public partial class sessions_import : System.Web.UI.Page
    {
        public string total_media = "0";
        public string facebook_media = "0";
        public string instagram_media = "0";
        public string twitter_media = "0";
        public string unapproved_media = "0";
        public string all_media = "0";
        public Int32 event_id = 0;
        public Event ev = new Event();
        public string total_records;
        public string zipfile;

        private schedInterface.users _users = new schedInterface.users();
        private schedInterface.database _database = new schedInterface.database();
        private schedInterface.events _events = new schedInterface.events();
        private schedInterface.imports _imports = new schedInterface.imports();
        private schedInterface.sessions _sessions = new schedInterface.sessions();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            event_id = Convert.ToInt32(Session["event_id"] as string);

            ev = _events.single(event_id);

            btn_process.Text = "Import";

            ph_history.Controls.Clear();
            
            foreach (ImportHistory ih in _imports.by_event(event_id))
            {                   
                ph_history.Controls.Add(new LiteralControl("<tr><td data-title=\"Import #\">#" + ih.id.ToString() + "</td><td data-title=\"Status\" class=\"hidden-xs hidden-sm\">" + ih.status + "</td><td data-title=\"Imported\" class=\"hidden-xs hidden-sm\">" + string.Format("{0:n0}", ih.imported) + "</td><td data-title=\"Imported By\" class=\"hidden-xs hidden-sm\">" + ih.imported_by + "</td><td data-title=\"Type\">" + ih.type + "</td><td data-title=\"Comments\" class=\"\">" + ih.comments + "</td><td><a href=\"/uploads/" + ih.filename + "\" class=\"fa fa-cloud-download\"></a></td></tr>"));
            }

            if (!Page.IsPostBack)
            {
                
            }
        }

        protected void update(object sender, EventArgs e)
        {
            string type_of_import = import_type.SelectedValue;

            DateTime today = DateTime.Now;

            if (csv_file.HasFile)
            {
                string path = Server.MapPath("~/uploads/");
                string unique = "EVENT_" + event_id.ToString() + "_SESSION_IMPORT_" + type_of_import.ToUpper() + "_" +
                                today.Month.ToString() + "-" + today.Day.ToString() + "-" + today.Year.ToString() + "_" +
                                today.Hour.ToString() + today.Minute.ToString() + ".csv";

                string extension = Path.GetExtension(csv_file.FileName.ToString());

                if (extension == ".csv")
                {
                    // upload and process it
                    csv_file.SaveAs(path + unique);

                    // now the file is uploaded, let's process it
                    import(path + unique, unique);
                }
                else
                {
                    // only CSV files allowed
                    pnl_failure.Visible = true;
                }
            }

            if (zip_file.HasFile)
            {
                DateTime ztoday = DateTime.Now;

                string zpath = Server.MapPath("~/uploads/");
                string zunique = "IMAGES_" + ztoday.Month.ToString() + ztoday.Day.ToString() + ztoday.Year.ToString() + ztoday.Hour.ToString() + ztoday.Minute.ToString() + ztoday.Second.ToString();
                string zextension = Path.GetExtension(zip_file.FileName.ToString());

                zipfile = zip_file.FileName;

                if (zextension == ".zip")
                {
                    zip_file.SaveAs(zpath + zunique + zextension);

                    parseImages(zpath + zunique + zextension, zunique + zextension);
                }
                else
                {
                    pnl_zip_failure.Visible = true;
                }
            }
        }

        private void permissions()
        {
            if (string.IsNullOrEmpty(Session["event_id"] as string))
            {
                Response.Redirect("/login");
            }

            if (string.IsNullOrEmpty(Session["user_access"] as string))
            {
                Response.Redirect("/login");
            }
            else
            {
                check_levels(Session["user_access"] as string);
            }
        }

        private void check_levels(string user_level)
        {
            switch (user_level)
            {
                case "system":
                    event_link.Visible = true;
                    display_link.Visible = true;
                    user_link.Visible = true;
                    preference_link.Visible = true;
                    break;
                case "event":
                    display_link.Visible = true;
                    preference_link.Visible = true;
                    security_level.Visible = false;
                    break;
                case "content":
                    security_level.Visible = false;
                    break;
            }
        }

        private void import(string path, string filename)
        {
            DataTable csv = new DataTable();

            if (import_type.SelectedIndex > 0)
            {
                _sessions.clear_by_event(event_id);
            }

            try
            {
                using (TextFieldParser csvReader = new TextFieldParser(path))
                {
                    csvReader.SetDelimiters(new string[] { "," });
                    csvReader.HasFieldsEnclosedInQuotes = true;
                    string[] colFields = csvReader.ReadFields();
                    foreach (string column in colFields)
                    {
                        DataColumn datecolumn = new DataColumn(column);
                        datecolumn.AllowDBNull = true;
                        csv.Columns.Add(datecolumn);
                    }
                    while (!csvReader.EndOfData)
                    {
                        string[] fieldData = csvReader.ReadFields();
                        //Making empty value as null
                        for (int i = 0; i < fieldData.Length; i++)
                        {
                            if (fieldData[i] == "")
                            {
                                fieldData[i] = null;
                            }
                        }
                        csv.Rows.Add(fieldData);
                    }
                }
            }
            catch (Exception ex)
            {

            }

            ImportHistory history = _imports.parseData(csv, event_id);

            history.event_id = event_id;
            history.createdate = DateTime.Now;
            history.total = history.imported + history.errored;
            history.filename = filename;
            history.status = "IMPORTED";
            history.type = import_type.SelectedValue.ToString().ToUpper();
            history.comments = comments.Text;
            history.imported_by = Session["user_name"].ToString();

            _imports.create(history);

            total_records = history.imported.ToString();

            pnl_failure.Visible = false;
            pnl_success.Visible = true;

            ph_history.Controls.Clear();

            foreach (ImportHistory ih in _imports.by_event(event_id))
            {
                ph_history.Controls.Add(new LiteralControl("<tr><td data-title=\"Import #\">#" + ih.id.ToString() + "</td><td data-title=\"Status\" class=\"hidden-xs hidden-sm\">" + ih.status + "</td><td data-title=\"Imported\" class=\"hidden-xs hidden-sm\">" + string.Format("{0:n0}", ih.imported) + "</td><td data-title=\"Imported By\" class=\"hidden-xs hidden-sm\">" + ih.imported_by + "</td><td data-title=\"Type\">" + ih.type + "</td><td data-title=\"Comments\" class=\"\">" + ih.comments + "</td><td><a href=\"/uploads/" + ih.filename + "\" class=\"fa fa-cloud-download\"></a></td></tr>"));
            }
        }

        private void parseImages(string path, string filename)
        {
            string extract = Server.MapPath("~/uploads/");

            ZipFile zip = ZipFile.Read(path);

            zip.ExtractAll(extract);

            pnl_zip_failure.Visible = false;
            pnl_zip_success.Visible = true;
        }
    }
}