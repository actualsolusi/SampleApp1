<%@ Page Title="Contoh Template" Language="vb" AutoEventWireup="false"
    MasterPageFile="~/Site.Master" CodeBehind="ContohTemplate.aspx.vb" Inherits="SampleApp1.ContohTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="page-header">List Pasien
        <small>halaman untuk pasien</small>
    </h1>
    <ol class="breadcrumb">
        <li>
            <i class="fa fa-dashboard"></i><a href="~/Default.aspx" runat="server">Homepage</a>
        </li>
        <li class="active">
            <i class="fa fa-file"></i>List Pasien
        </li>
    </ol>
</asp:Content>
