Imports DAL
Imports BO
Public Class BookPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvBook_GetData() As IEnumerable(Of BO.Book)
        Dim bookDAL As New BookDAL
        Return bookDAL.GetAll()
    End Function
End Class