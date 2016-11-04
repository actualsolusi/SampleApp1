Public Class Book
    Public Property BookID As Integer
    Public Property NoTransaksi As String
    Public Property AuthorID As Integer
    Public Property CategoryID As Integer
    Public Property Title As String
    Public Property PublicationDate As DateTime
    Public Property ISBN As String
    Public Property CoverImage As String
    Public Property Price As Decimal
    Public Property Description As String
    Public Property Publisher As String

    Public Property Author As Author
    Public Property Category As Category
End Class
