Imports DAL
Imports BO

Public Class SampleModal
    Inherits System.Web.UI.Page

    Private Shared tblMaster As New List(Of MasterBook)
    Private Shared tblBookMaster As New List(Of Book)

    'yg belum ada nomor transaksi
    Private Shared tblBook As New List(Of Book)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function gvCategory_GetData() As IEnumerable(Of BO.Category)
        Dim categoryDAL As New CategoryDAL
        Return categoryDAL.GetAll
    End Function

    Public Function gvAuthor_GetData() As IEnumerable(Of BO.Author)
        Dim authorDAL As New AuthorDAL
        Return authorDAL.GetAll
    End Function

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvBook_GetData() As IEnumerable(Of BO.Book)
        Return tblBook
    End Function

    Private Sub AddBook()
        Dim newBook As New Book With {
            .BookID = CInt(txtBookID.Text),
            .Title = txtTitle.Text,
            .AuthorID = CInt(ddAuthor.SelectedValue),
            .CategoryID = CInt(ddCategory.SelectedValue),
            .PublicationDate = CDate(txtDate.Text),
            .Price = CDec(txtPrice.Text),
            .Publisher = txtPublisher.Text
        }

        tblBook.Add(newBook)
        gvBook.DataBind()
    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs)
        AddBook()
    End Sub


    Private Sub ClearControl()
        txtBookID.Text = String.Empty
        txtTitle.Text = String.Empty
        txtDate.Text = String.Empty
        txtPrice.Text = String.Empty
        txtPublisher.Text = String.Empty

        tblBook.Clear()
        gvBook.DataBind()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        If tblBook.Count <> 0 Then
            'update notransaksi pada semua item
            Dim randomNumber = Guid.NewGuid.ToString.Substring(0, 8)
            For Each book In tblBook
                book.NoTransaksi = randomNumber
                tblBookMaster.Add(book)
            Next

            Dim newMaster As New MasterBook With {
                .NoTransaksi = randomNumber,
                .NamaGroupBuku = txtNamaGroup.Text}
            tblMaster.Add(newMaster)
            gvMaster.DataBind()
        End If
        ClearControl()
    End Sub

    ' The return type can be changed to IEnumerable, however to support
    ' paging and sorting, the following parameters must be added:
    '     ByVal maximumRows as Integer
    '     ByVal startRowIndex as Integer
    '     ByRef totalRowCount as Integer
    '     ByVal sortByExpression as String
    Public Function gvMaster_GetData() As IEnumerable(Of BO.MasterBook)
        Return tblMaster
    End Function

    Protected Sub btnSaveAll_Click(sender As Object, e As EventArgs)
        Dim masterBookDAL As New MasterBookDAL
        Dim bookDAL As New BookDAL
        Try
            'masukan data ke table MasterBook
            For Each m In tblMaster
                masterBookDAL.Create(m)
            Next

            'masukan data ke table Book
            For Each b In tblBookMaster
                bookDAL.Create(b)
            Next

            ltKet.Text = "<div class='alert alert-success'>Semua data sudah dimasukan ke tabel</div>"
            tblMaster.Clear()
            tblBookMaster.Clear()

            gvMaster.DataBind()
        Catch ex As Exception
            ltKet.Text = "<div class='alert alert-danger'>" & ex.Message & "</div>"
        End Try
    End Sub

    ' The id parameter name should match the DataKeyNames value set on the control
    Public Sub gvBook_DeleteItem(ByVal BookID As Integer)
        Dim delData = (From b In tblBook
                       Where b.BookID = CInt(bookID)
                       Select b).SingleOrDefault

        tblBook.Remove(delData)
        gvBook.DataBind()
    End Sub
End Class