Imports System.Data.SqlClient
Imports System.Configuration
Imports BO
Imports DAL

Public Class AuthorDAL
    Implements ICrud(Of Author)

    Public Sub Create(model As Author) Implements ICrud(Of Author).Create
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "insert into Authors(FirstName,LastName,Email) 
                          values(@FirstName,@LastName,@Email)"

            Dim cmd As New SqlCommand(strSql, conn)
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("FirstName", model.FirstName)
            cmd.Parameters.AddWithValue("LastName", model.LastName)
            cmd.Parameters.AddWithValue("Email", model.Email)

            Try
                conn.Open()
                cmd.ExecuteNonQuery()
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            Finally
                cmd.Dispose()
                conn.Close()
            End Try
        End Using
    End Sub

    Public Sub Delete(id As String) Implements ICrud(Of Author).Delete
        Throw New NotImplementedException()
    End Sub

    Public Sub Update(model As Author) Implements ICrud(Of Author).Update
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "update Authors set FirstName=@FirstName,
                          LastName=@LastName,Email=@Email 
                          where AuthorID=@AuthorID"

            Dim cmd As New SqlCommand(strSql, conn)
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("FirstName", model.FirstName)
            cmd.Parameters.AddWithValue("LastName", model.LastName)
            cmd.Parameters.AddWithValue("Email", model.Email)
            cmd.Parameters.AddWithValue("AuthorID", model.AuthorID)

            Try
                conn.Open()
                cmd.ExecuteNonQuery()
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            Finally
                cmd.Dispose()
                conn.Close()
            End Try
        End Using
    End Sub

    Public Function GetAll() As IEnumerable(Of Author) Implements ICrud(Of Author).GetAll

        Using conn As New SqlConnection(GetConn())
            Dim lstAuthor As New List(Of Author)

            Dim strSql = "select * from Authors 
                          order by FirstName"

            Dim cmd As New SqlCommand(strSql, conn)
            conn.Open()
            Dim dr = cmd.ExecuteReader()
            If dr.HasRows Then
                While (dr.Read())
                    lstAuthor.Add(New Author With {
                                  .AuthorID = CInt(dr("AuthorID")),
                                  .FirstName = dr("FirstName").ToString,
                                  .LastName = dr("LastName").ToString,
                                  .Email = dr("Email").ToString
                                  })
                End While
            End If
            dr.Close()
            cmd.Dispose()
            conn.Close()

            Return lstAuthor
        End Using
    End Function

    Public Function GetByID(id As String) As Author Implements ICrud(Of Author).GetByID
        Using conn As New SqlConnection(GetConn())
            Dim _author As New Author
            Dim strSql = "select * from Authors 
                          where AuthorID=@AuthorID"

            Dim cmd As New SqlCommand(strSql, conn)
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("AuthorID", id)

            conn.Open()
            Dim dr = cmd.ExecuteReader
            If dr.HasRows Then
                While dr.Read
                    _author.AuthorID = CInt(dr("AuthorID"))
                    _author.FirstName = dr("FirstName").ToString
                    _author.LastName = dr("LastName").ToString
                    _author.Email = dr("Email").ToString
                End While
            End If

            dr.Close()
            cmd.Dispose()

            Return _author
        End Using
    End Function

    Private Function GetConn() As String
        Return ConfigurationManager.ConnectionStrings("SampleShopDbConnectionString").ConnectionString
    End Function



End Class
