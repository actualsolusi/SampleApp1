Imports System.ComponentModel.DataAnnotations
Public Class Author
    Public Property AuthorID As Integer

    <Required(ErrorMessage:="First Name tidak boleh kosong !")>
    Public Property FirstName As String
    Public Property LastName As String
    Public Property Email As String
End Class
