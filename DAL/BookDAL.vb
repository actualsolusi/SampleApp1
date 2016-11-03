Imports System.Data.SqlClient
Imports System.Configuration
Imports BO
Imports DAL
Imports Dapper

Public Class BookDAL
    Implements ICrud(Of Book)

    Private Function GetConn() As String
        Return ConfigurationManager.ConnectionStrings("SampleShopDbConnectionString").ConnectionString
    End Function


    Public Sub Create(model As Book) Implements ICrud(Of Book).Create
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "insert into Book(AuthorID,CategoryID,Title,PublicationDate,ISBN,CoverImage,Price,Description,Publisher) 
            values(@AuthorID,@CategoryID,@Title,@PublicationDate,@ISBN,@CoverImage,@Price,@Description,@Publisher)"

            Dim params = New With {
            .AuthorID = model.AuthorID,
            .CategoryID = model.CategoryID,
            .Title = model.Title,
            .PublicationDate = model.PublicationDate,
            .ISBN = model.ISBN,
            .CoverImage = model.CoverImage,
            .Price = model.Price,
            .Description = model.Description,
            .Publisher = model.Publisher
            }

            Try
                conn.Execute(strSql, params)
            Catch sqlEx As SqlException
                Throw New Exception(sqlEx.Number & " " & sqlEx.Message)
            End Try
        End Using
    End Sub

    Public Sub Delete(id As String) Implements ICrud(Of Book).Delete
        Throw New NotImplementedException()
    End Sub

    Public Sub Update(model As Book) Implements ICrud(Of Book).Update
        Throw New NotImplementedException()
    End Sub

    Public Function GetAll() As IEnumerable(Of Book) Implements ICrud(Of Book).GetAll
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from Books left join Categories on Books.CategoryID=Categories.CategoryID 
                          left join Authors on Books.AuthorID=Authors.AuthorID"

            Dim results = conn.Query(Of Book, Category, Author, Book)(strSql, Function(b, c, a)
                                                                                  b.Category = c
                                                                                  b.Author = a
                                                                                  Return b
                                                                              End Function, splitOn:="CategoryID,AuthorID")
            Return results
        End Using
    End Function

    Public Function GetByID(id As String) As Book Implements ICrud(Of Book).GetByID
        Using conn As New SqlConnection(GetConn())
            Dim strSql = "select * from Books left join Categories on Books.CategoryID=Categories.CategoryID 
                          left join Authors on Books.AuthorID=Authors.AuthorID 
                          where Books.BookID=@BookID"

            Dim params = New With {.BookID = id}

            Dim results = conn.Query(Of Book, Category, Author, Book)(strSql, Function(b, c, a)
                                                                                  b.Category = c
                                                                                  b.Author = a
                                                                                  Return b
                                                                              End Function, params, splitOn:="CategoryID,AuthorID")
            Return results.SingleOrDefault
        End Using
    End Function
End Class
