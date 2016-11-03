<%@ Page Title="Book Page" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BookPage.aspx.vb" Inherits="SampleApp1.BookPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Book Page</h2>
    <br />

    <asp:FormView runat="server" ID="frmBook" ItemType="BO.Book" DataKeyNames="BookID"
        DefaultMode="Insert" RenderOuterTable="false">
        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="txtCategoryID">Category :</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtCategoryID" Text="<%# BindItem.CategoryID %>"
                                    CssClass="form-control" placeholder="Enter category id" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="txtAuthorID">Author :</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtAuthorID" Text="<%# BindItem.AuthorID %>"
                                    CssClass="form-control" placeholder="Enter author id" />

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtCategoryName" CssClass="form-control" placeholder="category name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="first name" ID="txtFirstName" />
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="last name" ID="txtLastName" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtTitle">Title:</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtTitle"
                            Text="<%# BindItem.Title %>"
                            CssClass="form-control" placeholder="Enter title" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtDate">Date:</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtDate" TextMode="Date"
                            Text="<%# BindItem.PublicationDate %>"
                            CssClass="form-control" placeholder="Enter date" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtISBN">ISBN:</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="TextBox1"
                            Text="<%# BindItem.ISBN %>"
                            CssClass="form-control" placeholder="Enter isbn" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtPrice">Price:</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtPrice"
                            Text="<%# BindItem.Price %>" TextMode="Number"
                            CssClass="form-control" placeholder="Enter isbn" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtDescription">Description:</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtDescription" Rows="10"
                            Text="<%# BindItem.Description %>" TextMode="MultiLine"
                            CssClass="form-control" placeholder="Enter description" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtPublisher">Publisher:</label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtPublisher"
                            Text="<%# BindItem.Publisher %>"
                            CssClass="form-control" placeholder="Enter publisher" />
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

    <asp:GridView runat="server" CssClass="table table-striped"
        ID="gvBook" ItemType="BO.Book" AutoGenerateColumns="false"
        DataKeyNames="BookID" SelectMethod="gvBook_GetData">
        <Columns>
            <asp:BoundField DataField="BookID" HeaderText="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Category.CategoryName" HeaderText="Category" />
            <asp:BoundField DataField="Author.FirstName" HeaderText="Author" />
            <asp:BoundField DataField="Price" DataFormatString="{0:N0}" HeaderText="Price">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>

    </asp:GridView>
</asp:Content>
