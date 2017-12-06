<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="template_builder_live_preview_select_options.aspx.cs" Inherits="fnsignManager.template_builder_live_preview_select_options" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        
        body { background-color: #000; }
        .wrapper { width: 600px;height: 1000px;margin: auto;background-color: #fff; }
        .element { width: 100%;float: left;position: relative;padding-top: 30px;padding-bottom: 30px;padding-left: 20px;}
            
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div class="element">
            <label>Event</label><br />
            <asp:DropDownList runat="server" ID="ddl_events" AutoPostBack="True" OnSelectedIndexChanged="get_locations" />
        </div>
        <div class="element">
            <label>Location</label><br />
            <asp:DropDownList runat="server" ID="ddl_locations" />
        </div>
        <div class="element">
            <label>Priority Announcement Template</label><br />
            <asp:DropDownList runat="server" ID="ddl_priority_announcement">
            </asp:DropDownList>
        </div>
        <div class="element">
            <label>End of Day Template</label><br />
            <asp:DropDownList runat="server" ID="ddl_end_of_day">
            </asp:DropDownList>
        </div>
        <div class="element">
            <label>All Sessions:</label>
            <asp:CheckBox runat="server" ID="ck_allsessions" />
        </div>
        <div class="element">
            <label>Scroll Speed (how many seconds should the scrolling block take to cycle?)</label><br />
            <asp:DropDownList runat="server" ID="ddl_speed">
                <asp:ListItem Value="0">Autocalculate Based on Size</asp:ListItem>
                <asp:ListItem Value="1">1 Second</asp:ListItem>
                <asp:ListItem Value="2">2 Seconds</asp:ListItem>
                <asp:ListItem Value="3">3 Seconds</asp:ListItem>
                <asp:ListItem Value="4">4 Seconds</asp:ListItem>
                <asp:ListItem Value="5">5 Seconds</asp:ListItem>
                <asp:ListItem Value="6">6 Seconds</asp:ListItem>
                <asp:ListItem Value="7">7 Seconds</asp:ListItem>
                <asp:ListItem Value="8">8 Seconds</asp:ListItem>
                <asp:ListItem Value="9">9 Seconds</asp:ListItem>
                <asp:ListItem Value="10">10 Seconds</asp:ListItem>
                <asp:ListItem Value="11">11 Seconds</asp:ListItem>
                <asp:ListItem Value="12">12 Seconds</asp:ListItem>
                <asp:ListItem Value="13">13 Seconds</asp:ListItem>
                <asp:ListItem Value="14">14 Seconds</asp:ListItem>
                <asp:ListItem Value="15">15 Seconds</asp:ListItem>
                <asp:ListItem Value="16">16 Seconds</asp:ListItem>
                <asp:ListItem Value="17">17 Seconds</asp:ListItem>
                <asp:ListItem Value="18">18 Seconds</asp:ListItem>
                <asp:ListItem Value="19">19 Seconds</asp:ListItem>
                <asp:ListItem Value="20">20 Seconds</asp:ListItem>
                <asp:ListItem Value="21">21 Seconds</asp:ListItem>
                <asp:ListItem Value="22">22 Seconds</asp:ListItem>
                <asp:ListItem Value="23">23 Seconds</asp:ListItem>
                <asp:ListItem Value="24">24 Seconds</asp:ListItem>
                <asp:ListItem Value="25">25 Seconds</asp:ListItem>
                <asp:ListItem Value="26">26 Seconds</asp:ListItem>
                <asp:ListItem Value="27">27 Seconds</asp:ListItem>
                <asp:ListItem Value="28">28 Seconds</asp:ListItem>
                <asp:ListItem Value="29">29 Seconds</asp:ListItem>
                <asp:ListItem Value="30">30 Seconds</asp:ListItem>
                <asp:ListItem Value="31">31 Seconds</asp:ListItem>
                <asp:ListItem Value="32">32 Seconds</asp:ListItem>
                <asp:ListItem Value="33">33 Seconds</asp:ListItem>
                <asp:ListItem Value="34">34 Seconds</asp:ListItem>
                <asp:ListItem Value="35">35 Seconds</asp:ListItem>
                <asp:ListItem Value="36">36 Seconds</asp:ListItem>
                <asp:ListItem Value="37">37 Seconds</asp:ListItem>
                <asp:ListItem Value="38">38 Seconds</asp:ListItem>
                <asp:ListItem Value="39">39 Seconds</asp:ListItem>
                <asp:ListItem Value="40">40 Seconds</asp:ListItem>
                <asp:ListItem Value="41">41 Seconds</asp:ListItem>
                <asp:ListItem Value="42">42 Seconds</asp:ListItem>
                <asp:ListItem Value="43">43 Seconds</asp:ListItem>
                <asp:ListItem Value="44">44 Seconds</asp:ListItem>
                <asp:ListItem Value="45">45 Seconds</asp:ListItem>
                <asp:ListItem Value="46">46 Seconds</asp:ListItem>
                <asp:ListItem Value="47">47 Seconds</asp:ListItem>
                <asp:ListItem Value="48">48 Seconds</asp:ListItem>
                <asp:ListItem Value="49">49 Seconds</asp:ListItem>
                <asp:ListItem Value="50">50 Seconds</asp:ListItem>
                <asp:ListItem Value="51">51 Seconds</asp:ListItem>
                <asp:ListItem Value="52">52 Seconds</asp:ListItem>
                <asp:ListItem Value="53">53 Seconds</asp:ListItem>
                <asp:ListItem Value="54">54 Seconds</asp:ListItem>
                <asp:ListItem Value="55">55 Seconds</asp:ListItem>
                <asp:ListItem Value="56">56 Seconds</asp:ListItem>
                <asp:ListItem Value="57">57 Seconds</asp:ListItem>
                <asp:ListItem Value="58">58 Seconds</asp:ListItem>
                <asp:ListItem Value="59">59 Seconds</asp:ListItem>
                <asp:ListItem Value="60">60 Seconds</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="element">
            <label>Group by Start Time:</label>
            <asp:CheckBox runat="server" ID="ck_group_by_start" />
        </div>
        <div class="element">
            <label>Group by Location:</label>
            <asp:CheckBox runat="server" ID="ck_group_by_location" />
        </div>
        <div class="element">
            <asp:Button runat="server" ID="btn_submit" Text="Submit" OnClick="preview" />
        </div>
    </div>
    </form>
</body>
</html>
