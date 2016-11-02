Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        'ambil informasi 
        Dim urlsegemen = Page.RouteData.Values("id").ToString

        lblParam.Text = Request.QueryString("nama") + " " + Request.QueryString("alamat")


    End Sub
End Class