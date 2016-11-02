Public Class SampleServerControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim bil = CInt(lblBil.Text)
        bil += 1
        lblBil.Text = bil.ToString
    End Sub
End Class