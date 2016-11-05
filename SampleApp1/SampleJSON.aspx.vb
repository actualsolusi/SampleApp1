Imports DAL
Public Class SampleJSON
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGetData_Click(sender As Object, e As EventArgs) Handles btnGetData.Click
        Dim bacaJsonDAL As New BacaJSONDAL
        lblData.Text = bacaJsonDAL.GetJenisPeserta
    End Sub
End Class