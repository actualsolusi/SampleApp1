Imports System.ComponentModel.DataAnnotations
Public Class Author
    Public Property AuthorID As Integer

    <Required(ErrorMessage:="First Name tidak boleh kosong !")>
    Public Property FirstName As String

    <Required(ErrorMessage:="Last Name tidak boleh kosong !")>
    Public Property LastName As String

    <Required(ErrorMessage:="Email tidak boleh kosong !")>
    <EmailAddress(ErrorMessage:="Format Email tidak sesuai !")>
    Public Property Email As String
End Class
