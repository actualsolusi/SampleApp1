<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleValidation.aspx.vb" Inherits="SampleApp1.SampleValidation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Form Registrasi</h2>

    <fieldset>
        <label for="txtUsername">Username :</label><br />
        <asp:TextBox runat="server" ID="txtUsername" />
        <asp:RequiredFieldValidator ErrorMessage="{Username Required}" 
            ControlToValidate="txtUsername" ForeColor="Red" runat="server" /><br /><br />

        <label for="txtPassword">Password :</label><br />
        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" />
        <asp:RequiredFieldValidator ErrorMessage="{Password Required}" ForeColor="Red" ControlToValidate="txtPassword" runat="server" /><br /><br />

        <label for="txtRepassword">Repassword :</label><br />
        <asp:TextBox runat="server" TextMode="Password"  ID="txtRepassword" />

        <label for="txtUmur">Umur :</label>
        <asp:TextBox runat="server"  />
        <asp:Button Text="Submit" ID="btnSubmit" runat="server" />
    </fieldset>
</asp:Content>
