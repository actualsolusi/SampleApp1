﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DataCategory.aspx.vb" Inherits="SampleApp1.DataCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Data Category</h2>
    <br />

    <asp:UpdatePanel runat="server" ID="pnlCategory">
        <ContentTemplate>
            <asp:GridView runat="server" CssClass="table table-striped" ID="gvCategory" ItemType="BO.Category"
                AutoGenerateColumns="False" AllowPaging="true" PageSize="3" AllowSorting="true"
                SelectMethod="gvCategory_GetData" >
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="ID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Name" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
