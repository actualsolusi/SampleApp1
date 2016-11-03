Imports System.Data.SqlClient
Imports System.Configuration
Imports BO
Imports DAL
Imports Dapper

Public Class CategoryDAL
    Implements ICrud(Of Category)

    Private Function GetConn() As String
        Return ConfigurationManager.ConnectionStrings("SampleShopDbConnectionString").ConnectionString
    End Function


    Public Sub Create(model As Category) Implements ICrud(Of Category).Create
        Throw New NotImplementedException()
    End Sub

    Public Sub Delete(id As String) Implements ICrud(Of Category).Delete
        Throw New NotImplementedException()
    End Sub

    Public Sub Update(model As Category) Implements ICrud(Of Category).Update
        Throw New NotImplementedException()
    End Sub

    Public Function GetAll() As IEnumerable(Of Category) Implements ICrud(Of Category).GetAll
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from Categories 
                          order by CategoryName"

            Dim results = conn.Query(Of Category)(strSql)

            Return results
        End Using
    End Function

    Public Function GetByID(id As String) As Category Implements ICrud(Of Category).GetByID
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from Categories 
                          where CategoryID=@CategoryID"

            Dim params = New With {.CategoryID = id}

            Dim results = conn.Query(Of Category)(strSql, params)

            Return results.SingleOrDefault()
        End Using
    End Function
End Class
