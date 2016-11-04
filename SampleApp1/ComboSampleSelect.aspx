<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ComboSampleSelect.aspx.vb" Inherits="SampleApp1.ComboSampleSelect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script src="Scripts/select2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ddCategory").select2();
        });
    </script>


    <asp:DropDownList runat="server" ID="ddCategory" 
        ClientIDMode="Static" DataValueField="CategoryID" 
        DataTextField="CategoryName" ItemType="BO.Category" 
        CssClass="form-control"
        SelectMethod="cmbCategory_GetData">
    </asp:DropDownList>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" /><br />

    <asp:Label ID="lblCAtegory" runat="server" />

    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

   
</asp:Content>
