Public Class SampleValidation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cvKode_ServerValidate(source As Object, args As ServerValidateEventArgs)
        If Not args.Value.StartsWith("AAA") Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
End Class