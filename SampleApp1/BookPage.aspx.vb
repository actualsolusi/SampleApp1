Imports DAL
Imports BO
Imports System.Web.ModelBinding

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

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvCategory_GetData(<Control> txtSearchCategory As String) As IEnumerable(Of BO.Category)
        Dim categoryDAL As New CategoryDAL
        Return categoryDAL.GetAllByName(txtSearchCategory)
    End Function

    Protected Sub txtSearchCategory_TextChanged(sender As Object, e As EventArgs)
        Dim myGrid = CType(frmBook.FindControl("gvCategory"), GridView)
        myGrid.DataBind
    End Sub
End Class