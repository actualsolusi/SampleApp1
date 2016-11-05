Imports BO
Imports DAL
Imports System.Runtime.InteropServices
Public Class DataCategory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     <OUt()> ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvCategory_GetData(maximumRows As Integer,
                                       startRowIndex As Integer,
                                       <Out()> ByRef totalRowCount As Integer,
                                       sortByExpression As String) As IEnumerable(Of BO.Category)

        Dim categoryDAL As New CategoryDAL
        Dim results = categoryDAL.GetAllPaging(maximumRows, startRowIndex, totalRowCount, sortByExpression)
        Return results
    End Function
End Class