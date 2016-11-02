<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="SampleApp1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="page-header">Daftar Pasien
        <small>halaman untuk pasien</small>
    </h1>
    <ol class="breadcrumb">
        <li>
            <i class="fa fa-dashboard"></i><a href="~/Default.aspx" runat="server">Homepage</a>
        </li>
        <li class="active">
            <i class="fa fa-file"></i>Daftar Pasien
        </li>
    </ol>
    <asp:Label ID="lblParam" runat="server" />
</asp:Content>
