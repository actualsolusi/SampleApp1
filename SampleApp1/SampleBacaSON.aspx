<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleBacaSON.aspx.vb" Inherits="SampleApp1.SampleBacaSON" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>JSON Sample</h2>
    <br />
    Masukan JSON :<br />
    <asp:TextBox runat="server" Width="600" ID="txtJSONString" TextMode="MultiLine" Rows="20" />
    <br /><br />
    <asp:Button Text="Baca JSON" ID="btnBacaJson" runat="server" /><br />

    <asp:Label ID="lblIsiJSON" runat="server" />


</asp:Content>
