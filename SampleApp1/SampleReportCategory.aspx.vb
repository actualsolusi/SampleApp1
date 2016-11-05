Imports BO
Imports DAL
Imports Microsoft.Reporting.WebForms

Public Class SampleReportCategory
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim categoryDAL As New CategoryDAL
            Dim results = categoryDAL.GetAll()
            Dim ds As New ReportDataSource("DataSet1", results)
            ReportViewer1.LocalReport.DataSources.Add(ds)
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
        Dim categoryDAL As New CategoryDAL
        Dim results = categoryDAL.GetAllByName(txtSearchByNama.Text)
        Dim ds As New ReportDataSource("DataSet1", results)
        ReportViewer1.LocalReport.DataSources.Add(ds)
        ReportViewer1.LocalReport.Refresh()
    End Sub
End Class