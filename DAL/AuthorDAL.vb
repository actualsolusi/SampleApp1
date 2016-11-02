Imports System.Data.SqlClient
Imports System.Configuration
Public Class AuthorDAL

    Private Function GetConn() As String
        Return ConfigurationManager.ConnectionStrings("SampleShopDbConnectionString").ConnectionString
    End Function



End Class
