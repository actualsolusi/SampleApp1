<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleComboBox.aspx.vb" Inherits="SampleApp1.SampleComboBox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2" for="txtCategory">Category :</label>
            <div class="col-sm-10">
                <ajaxToolkit:ComboBox ID="cmbCategory" DataTextField="CategoryName" DataValueField="CategoryID"
                    runat="server" DropDownStyle="DropDownList" AutoCompleteMode="Suggest"
                    CaseSensitive="false" ItemInsertLocation="Append" ItemType="BO.Category"
                    SelectMethod="cmbCategory_GetData" CssClass="form-control">
                </ajaxToolkit:ComboBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button Text="Pilih" ID="btnPilih" CssClass="btn btn-primary" runat="server" /><br />
            </div>
        </div>

        <br />
        <asp:Label ID="lblData" runat="server" />
    </div>



    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
