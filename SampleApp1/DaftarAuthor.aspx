<%@ Page Title="Daftar Author" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DaftarAuthor.aspx.vb" Inherits="SampleApp1.DaftarAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2>Daftar Author</h2><br />
    <asp:ValidationSummary runat="server" HeaderText="Pesan Kesalahan" ShowModelStateErrors="true" />
    <asp:Literal ID="ltPesan" runat="server" />
    <asp:GridView runat="server" AutoGenerateColumns="False" 
        ID="gvAuthor" ItemType="BO.Author" DataKeyNames="AuthorID" 
        UpdateMethod="gvAuthor_UpdateItem"
        SelectMethod="gvAuthor_GetData" >
        <Columns>
            <asp:BoundField DataField="AuthorID" ReadOnly="true" HeaderText="Kode" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" /> 
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>

</asp:Content>
