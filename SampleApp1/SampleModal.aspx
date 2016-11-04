<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleModal.aspx.vb" Inherits="SampleApp1.SampleModal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .selectCategory {
            width: 200px;
        }
    </style>
    <script src="Scripts/select2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".selectCategory").select2();
        });

        function CloseForm() {
            $(function () {
                $('#myModal').modal('toggle');
            });
        }
    </script>

    <h2>Sample Modal</h2>
    <br />
    <button type="button" class="btn btn-info" id="btnModal" data-toggle="modal" data-target="#myModal">Open Modal</button>
    <asp:UpdatePanel runat="server" ID="pnlMAster">
        <ContentTemplate>
            <asp:GridView runat="server" ID="gvMaster" CssClass="table table-striped" AutoGenerateColumns="false"
                ItemType="BO.MasterBook"
                SelectMethod="gvMaster_GetData" DataKeyNames="NoTransaksi">
                <Columns>
                    <asp:BoundField DataField="NoTransaksi" HeaderText="No Transaksi" />
                    <asp:BoundField DataField="NamaGroupBuku" HeaderText="Nama Group" />
                </Columns>
            </asp:GridView>

            <br />
            <asp:Button Text="Save All" ID="btnSaveAll" OnClick="btnSaveAll_Click" CssClass="btn btn-primary" 
                runat="server" /><br />
            <asp:Literal ID="ltKet" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <br />

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3>Form Modal</h3>
                </div>
                <div class="modal-body">

                    <asp:UpdatePanel runat="server" ID="pnlChild">
                        <ContentTemplate>
                            <div class="row">

                                <div class="form-horizontal">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="control-label col-sm-2" for="txtNo">Nama Group :</label>
                                            <div class="col-sm-10">
                                                <asp:TextBox runat="server" ID="txtNamaGroup"
                                                    CssClass="form-control" placeholder="Enter nama group" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="txtBookID">Book ID :</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" ID="txtBookID"
                                                CssClass="form-control" placeholder="Enter title" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="ddCategory">Category:</label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList runat="server" CssClass="selectCategory" ID="ddCategory" ItemType="BO.Category"
                                                SelectMethod="gvCategory_GetData" DataTextField="CategoryName" DataValueField="CategoryID">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="ddAuthor">Author:</label>
                                        <div class="col-sm-10">
                                            <asp:DropDownList runat="server" CssClass="selectCategory" ID="ddAuthor" ItemType="BO.Author"
                                                SelectMethod="gvAuthor_GetData" DataTextField="FirstName" DataValueField="AuthorID">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="txtTitle">Title:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" ID="txtTitle"
                                                CssClass="form-control" placeholder="Enter title" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="txtDate">Date:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" ID="txtDate" TextMode="Date"
                                                CssClass="form-control" placeholder="Enter date" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="txtPrice">Price:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" ID="txtPrice" TextMode="Number"
                                                CssClass="form-control" placeholder="Enter price" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="txtPublisher">Publisher:</label>
                                        <div class="col-sm-10">
                                            <asp:TextBox runat="server" ID="txtPublisher"
                                                CssClass="form-control" placeholder="Enter publisher" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <asp:Button ID="btnCreate" Text="Create" OnClick="btnCreate_Click" CssClass="btn btn-primary" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div>
                                    <asp:GridView runat="server" ID="gvBook" CssClass="table table-striped" DataKeyNames="BookID"
                                        AutoGenerateColumns="False" SelectMethod="gvBook_GetData" ItemType="BO.Book">
                                        <Columns>
                                            <asp:BoundField DataField="BookID" HeaderText="ID" />
                                            <asp:BoundField DataField="Title" HeaderText="Title" />
                                            <asp:BoundField DataField="Price" DataFormatString="{0:N0}" HeaderText="Price">
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:CommandField ShowSelectButton="true" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:Literal ID="ltPesan" runat="server" /><br />
                                    <asp:Button Text="Save" ID="btnSave" CssClass="btn btn-info" OnClientClick="CloseForm()" OnClick="btnSave_Click" runat="server" /><br /><br />
                                </div>
                                <%--<div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>--%>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>

        </div>
    </div>




    <div style="height: 400px"></div>
</asp:Content>
