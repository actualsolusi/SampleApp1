Imports System.Data.SqlClient
Imports System.Configuration
Imports BO
Imports DAL
Imports Dapper

Public Class MasterBookDAL
    Implements ICrud(Of MasterBook)
    Private Function GetConn() As String
        Return ConfigurationManager.ConnectionStrings("SampleShopDbConnectionString").ConnectionString
    End Function

    Public Function GetAll() As IEnumerable(Of MasterBook) Implements ICrud(Of MasterBook).GetAll
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from MasteerBook"

            Return conn.Query(Of MasterBook)(strSql)
        End Using
    End Function

    Public Function GetByID(id As String) As MasterBook Implements ICrud(Of MasterBook).GetByID
        Throw New NotImplementedException()
    End Function

    Public Sub Create(model As MasterBook) Implements ICrud(Of MasterBook).Create
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "insert into MasterBook(NoTransaksi,NamaGroupBuku) 
            values(@NoTransaksi,@NamaGroupBuku)"

            Dim params = New With {
            .NoTransaksi = model.NoTransaksi,
            .NamaGroupBuku = model.NamaGroupBuku
            }

            Try
                conn.Execute(strSql, params)
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            End Try
        End Using
    End Sub

    Public Sub Update(model As MasterBook) Implements ICrud(Of MasterBook).Update
        Throw New NotImplementedException()
    End Sub

    Public Sub Delete(id As String) Implements ICrud(Of MasterBook).Delete
        Throw New NotImplementedException()
    End Sub
End Class
