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
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "insert into Category(CategoryName) values(@CategoryName)"

            Dim params = New With {.CategoryName = model.CategoryName}

            Try
                conn.Execute(strSql, params)
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            End Try
        End Using
    End Sub

    Public Sub Delete(id As String) Implements ICrud(Of Category).Delete
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "delete from Category where CategoryID=@CategoryID"

            Dim params = New With {.CategoryID = id}

            Try
                conn.Execute(strSql, params)
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            End Try
        End Using
    End Sub

    Public Sub Update(model As Category) Implements ICrud(Of Category).Update
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "update Category set CategoryName=@CategoryName 
                          where CategoryID=@CategoryID"

            Dim params = New With {
                .CategoryName = model.CategoryName,
                .CategoryID = model.CategoryID
            }

            Try
                conn.Execute(strSql, params)
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            End Try
        End Using
    End Sub

    Public Function GetAll() As IEnumerable(Of Category) Implements ICrud(Of Category).GetAll
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from Categories 
                          order by CategoryName"

            Dim results = conn.Query(Of Category)(strSql)

            Return results
        End Using
    End Function


    Public Function GetAllByName(categoryName As String) As IEnumerable(Of Category)
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from Categories
                          where CategoryName like @CategoryName 
                          order by CategoryName"

            Dim params = New With {.CategoryName = "%" & categoryName & "%"}

            Dim results = conn.Query(Of Category)(strSql, params)

            Return results
        End Using
    End Function

    Public Function GetPrefixName(prefixText As String, count As Integer) As IEnumerable(Of String)
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select (CategoryName + ';' + str(CategoryID)) from Categories 
                          where CategoryName like @CategoryName 
                          order by CategoryName asc 
                          offset 0 rows 
                          fetch next @count rows only"

            Dim params = New With {.CategoryName = prefixText & "%", .count = count}

            Return conn.Query(Of String)(strSql, params)
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
