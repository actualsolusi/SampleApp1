Imports BO
Imports DAL
Imports System.Data

Public Class Form1
    Private bs As New BindingSource

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim authorDAL As New AuthorDAL
        Dim results = authorDAL.GetAll()

        bs.DataSource = results

        dgvAuthor.DataSource = bs
    End Sub
End Class
