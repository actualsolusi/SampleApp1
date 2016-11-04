Option Strict Off
Public Class SampleAutoComplete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim arrCat = txtCategoryName.Text.Split(";")
        lblCategory.Text = arrCat(1).Trim()
    End Sub
End Class