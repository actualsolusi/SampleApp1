<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" 
    CodeBehind="SampleServerControl.aspx.vb"
     Inherits="SampleApp1.SampleServerControl" ViewStateMode="Disabled" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Button Text="Submit" ID="btnSubmit" runat="server"  />
    <asp:Label ID="lblBil" Text="1" runat="server" ViewStateMode="Enabled" />


</asp:Content>
