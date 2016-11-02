<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleValidation.aspx.vb" Inherits="SampleApp1.SampleValidation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Form Registrasi</h2>
    <br />
    <asp:ValidationSummary runat="server" HeaderText="Pesan Kesalahan" ShowMessageBox="true" ShowSummary="true" />
    <br />
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
        <asp:CompareValidator ErrorMessage="{Password dan Repassword tidak sama}"
             ControlToValidate="txtRepassword" ControlToCompare="txtPassword" 
             Type="String" Operator="Equal" ForeColor="Red" runat="server" /><br /><br />

        <label for="txtUmur">Umur :</label><br />
        <asp:TextBox runat="server" ID="txtUmur" />
        <asp:RangeValidator ErrorMessage="{Umur harus antara 17-60}" 
            ControlToValidate="txtUmur" MinimumValue="17" MaximumValue="60" ForeColor="Red" runat="server" />
        <asp:CompareValidator ErrorMessage="{Harus integer}" ForeColor="Red"
             ControlToValidate="txtUmur" Type="Integer" Operator="DataTypeCheck"
             runat="server" />
        <br /><br />

        <label for="txtEmail">Email :</label><br />
        <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" />
        <asp:RegularExpressionValidator ErrorMessage="{Format email tidak tepat}" 
            ControlToValidate="txtEmail" runat="server" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ForeColor="Red" /><br /><br />

        <label for="txtKodePasien">Kode Pasien :</label><br />
        <asp:TextBox runat="server" ID="txtKodePasien" />
        <asp:CustomValidator ErrorMessage="{Kode tidak tepat}" 
            ControlToValidate="txtKodePasien" ID="cvKode" OnServerValidate="cvKode_ServerValidate" 
            ForeColor="Red"  runat="server" />
        <br /><br />

        <asp:Button Text="Submit" ID="btnSubmit" runat="server" />
    </fieldset>
</asp:Content>
