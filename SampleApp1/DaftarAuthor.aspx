<%@ Page Title="Daftar Author" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DaftarAuthor.aspx.vb" Inherits="SampleApp1.DaftarAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .errorMerah {color:red;}
    </style>

    <div class="row">
        <h2>Daftar Author</h2>
        <br />
        <asp:ValidationSummary runat="server" CssClass="errorMerah" HeaderText="Pesan Kesalahan" ShowModelStateErrors="true" />

        <asp:FormView runat="server" ID="frmTambahAuthor" DefaultMode="Insert" ItemType="BO.Author"
            DataKeyNames="AuthorID" InsertMethod="frmTambahAuthor_InsertItem" RenderOuterTable="false">
            <InsertItemTemplate>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="txtFirstName">First Name :</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtFirstName" Text="<%# BindItem.FirstName %>"
                                CssClass="form-control" placeholder="Enter first name" />
                            <asp:RequiredFieldValidator ErrorMessage="{FirstName Required}" CssClass="errorMerah" ControlToValidate="txtFirstName" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="txtLastName">Last Name:</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtLastName" Text="<%# BindItem.LastName %>"
                                CssClass="form-control" placeholder="Enter last name" />
                            <asp:RequiredFieldValidator ErrorMessage="{LastName Required}" CssClass="errorMerah" ControlToValidate="txtLastName" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="txtEmail">Email:</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email"
                                Text="<%# BindItem.Email %>"
                                CssClass="form-control" placeholder="Enter email" />
                            <asp:RequiredFieldValidator ErrorMessage="{Email Required}" CssClass="errorMerah" ControlToValidate="txtEmail" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button ID="btnSubmit" Text="Submit" CommandName="Insert" CssClass="btn btn-primary" runat="server" />
                        </div>
                    </div>
                </div>
            </InsertItemTemplate>
        </asp:FormView>

        <br />
       
        <asp:Literal ID="ltPesan" runat="server" />

        <asp:Panel ScrollBars="Auto" ID="pnlGrid" runat="server">
            <asp:GridView runat="server" CssClass="table table-striped" AutoGenerateColumns="False"
                ID="gvAuthor" ItemType="BO.Author" DataKeyNames="AuthorID"
                UpdateMethod="gvAuthor_UpdateItem"
                SelectMethod="gvAuthor_GetData"
                DeleteMethod="gvAuthor_DeleteItem">
                <Columns>
                    <asp:BoundField DataField="AuthorID" ReadOnly="true" HeaderText="Kode" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
    </div>




</asp:Content>
