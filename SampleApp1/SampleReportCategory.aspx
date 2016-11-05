<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleReportCategory.aspx.vb" Inherits="SampleApp1.SampleReportCategory" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <label for="txtSearchByNama">Search By Nama :</label>
            <asp:TextBox runat="server" ID="txtSearchByNama" />
            <asp:Button Text="Search" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />
            <rsweb:ReportViewer ID="ReportViewer1" Width="800" ShowPrintButton="true" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                <LocalReport ReportPath="Report\ReportCategory.rdlc">
                </LocalReport>
            </rsweb:ReportViewer>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

