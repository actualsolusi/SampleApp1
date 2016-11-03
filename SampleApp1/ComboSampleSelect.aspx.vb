Imports BO
Imports DAL
Public Class ComboSampleSelect
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function cmbCategory_GetData() As IEnumerable(Of BO.Category)
        Dim categoryDAL As New CategoryDAL
        Return categoryDAL.GetAll()
    End Function

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        lblCAtegory.Text = "Value " & ddCategory.SelectedValue.ToString
    End Sub
End Class