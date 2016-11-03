Imports BO
Imports DAL

Public Class DaftarAuthor
    Inherits System.Web.UI.Page

    Private authorDAL As New AuthorDAL

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvAuthor_GetData() As IEnumerable(Of BO.Author)
        Dim results = authorDAL.GetAll()
        Return results
    End Function

    ' The id parameter name should match the DataKeyNames value set on the control
    Public Sub gvAuthor_UpdateItem(ByVal AuthorID As Integer)

        Dim item As BO.Author = authorDAL.GetByID(AuthorID.ToString)
        ' Load the item here, e.g. item = MyDataLayer.Find(id)
        If item Is Nothing Then
            ' The item wasn't found
            ModelState.AddModelError("", String.Format("Item with id {0} was not found", AuthorID))
            Return
        End If
        TryUpdateModel(item)
        If ModelState.IsValid Then
            Try
                authorDAL.Update(item)
                ltPesan.Text = "<div class='alert alert-success'>Data berhasil diupdate !</div>"
            Catch ex As Exception
                ModelState.AddModelError("", String.Format("Error {0}", ex.Message))
            End Try
        End If
    End Sub

    ' The id parameter name should match the DataKeyNames value set on the control
    Public Sub gvAuthor_DeleteItem(ByVal AuthorID As Integer)
        Dim item As BO.Author = authorDAL.GetByID(AuthorID.ToString)

        If item Is Nothing Then
            ModelState.AddModelError("", String.Format("Item with id {0} was not found", AuthorID))
            Return
        End If

        Try
            authorDAL.Delete(AuthorID.ToString)
            ltPesan.Text = "<div class='alert alert-success'>Data berhasil didelete !</div>"
        Catch ex As Exception
            ModelState.AddModelError("", String.Format("Error {0}", ex.Message))
        End Try
    End Sub
End Class