Imports System.Data.SqlClient
Imports System.Configuration
Imports BO
Imports DAL
Imports Dapper

Public Class ReportSampleTableDAL
    Private Function GetConn() As String
        Return ConfigurationManager.ConnectionStrings("SampleShopDbConnectionString").ConnectionString
    End Function

    Public Function GetAll() As IEnumerable(Of ReportSampleTable)
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from ReportSampleTable"

            Dim results = conn.Query(Of ReportSampleTable)(strSql)
            Return results
        End Using
    End Function
End Class
