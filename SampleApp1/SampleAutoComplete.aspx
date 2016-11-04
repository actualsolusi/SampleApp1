<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleAutoComplete.aspx.vb" Inherits="SampleApp1.SampleAutoComplete" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Menggunakan Auto Complete Extender</h2>
    <br /><br />

    <label for="txtCategoryName">Category Name :</label>
    <asp:TextBox runat="server" ID="txtCategoryName" AutoComplete="off" />

    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" 
        runat="server" TargetControlID="txtCategoryName" ServicePath="~/MyWebService.asmx" 
        ServiceMethod="GetSuggestCategory" MinimumPrefixLength="2" 
        CompletionInterval="500" EnableCaching="true"
        CompletionSetCount="50" ></ajaxToolkit:AutoCompleteExtender>

    <asp:Button Text="Submit" ID="btnSubmit" runat="server" /><br /><br />
    <asp:Label ID="lblCategory" runat="server" />
</asp:Content>
