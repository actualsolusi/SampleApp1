Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

Imports BO
Imports DAL
Imports System.Web.Script.Services

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class MyWebService
    Inherits System.Web.Services.WebService

    <WebMethod()>
    <ScriptMethod()>
    Public Function GetSuggestCategory(prefixText As String, count As Integer) As String()
        Dim categoryDAL As New CategoryDAL
        'Dim results = categoryDAL.GetAllByName
    End Function

End Class