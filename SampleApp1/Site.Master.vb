Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim namaMenu1 = "Generate Code"

        ltMenu.Text = String.Format("<li>
                          <a href='~/Default' runat='server'><i class='fa fa-fw fa-dashboard'></i>{0}</a>
                       </li>", namaMenu1)


    End Sub
End Class