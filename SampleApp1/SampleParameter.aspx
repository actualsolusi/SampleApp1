<%@ Page Title="Menggunakan Control Param" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleParameter.aspx.vb" Inherits="SampleApp1.SampleParameter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:SqlDataSource runat="server" ID="sdsCategory" 
        ConnectionString="<%$ ConnectionStrings:SampleShopDbConnectionString %>" 
        SelectCommand="SELECT * FROM [Categories]" />
    <asp:DropDownList runat="server" AutoPostBack="true" ID="ddCategory" DataSourceID="sdsCategory" DataTextField="CategoryName" DataValueField="CategoryID">
    </asp:DropDownList>

    <asp:SqlDataSource runat="server" ID="sdsBook"  
        ConnectionString="<%$ ConnectionStrings:SampleShopDbConnectionString %>" 
        SelectCommand="SELECT * FROM [Books] WHERE ([CategoryID] = @CategoryID)" >
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="CategoryID" SessionField="MyCategory" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView runat="server"  ID="gvBook" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="sdsBook">
        <Columns>
            <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
            <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" SortExpression="AuthorID" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="PublicationDate" HeaderText="PublicationDate" SortExpression="PublicationDate" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="CoverImage" HeaderText="CoverImage" SortExpression="CoverImage" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:HyperLinkField DataNavigateUrlFields="BookID" DataNavigateUrlFormatString="Detail.aspx?BookID={0}" DataTextFormatString="Detail" Text="Detail" />
        </Columns>
    </asp:GridView>
</asp:Content>
