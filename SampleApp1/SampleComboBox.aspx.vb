﻿Imports BO
Imports DAL
Public Class SampleComboBox
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function cmbCategory_GetData() As IEnumerable(Of BO.Category)
        Dim categoryDAL As New CategoryDAL
        Return categoryDAL.GetAll()
    End Function

    Protected Sub btnPilih_Click(sender As Object, e As EventArgs) Handles btnPilih.Click
        lblData.Text = "Valuenya :" & cmbCategory.SelectedValue.ToString
        cmbCategory.SelectedIndex = 0
    End Sub
End Class