Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq

Public Class SampleBacaSON
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnBacaJson_Click(sender As Object, e As EventArgs) Handles btnBacaJson.Click
        Dim data As JObject = JObject.Parse(txtJSONString.Text)

        Dim kdJenisPeserta As String = CType(data("response")("peserta")("jenisPeserta")("kdJenisPeserta"), String)
        Dim nmJenisPeserta As String = CType(data("response")("peserta")("jenisPeserta")("nmJenisPeserta"), String)
        lblIsiJSON.Text = "Kode :" & kdJenisPeserta & " - Jenis Peserta : " & nmJenisPeserta
    End Sub
End Class