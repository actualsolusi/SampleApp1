Imports BO
Imports DAL

Public Class DaftarAuthor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvAuthor_GetData() As IEnumerable(Of BO.Author)
        Dim authorDAL As New AuthorDAL
        Dim results = authorDAL.GetAll()
        Return results
    End Function
End Class