<%@ Page Title="Daftar Author" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DaftarAuthor.aspx.vb" Inherits="SampleApp1.DaftarAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView runat="server" AutoGenerateColumns="False" 
        ID="gvAuthor" ItemType="BO.Author"
        SelectMethod="gvAuthor_GetData">
        <Columns>
            <asp:BoundField DataField="AuthorID" HeaderText="Kode" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
        </Columns>
    </asp:GridView>

</asp:Content>
