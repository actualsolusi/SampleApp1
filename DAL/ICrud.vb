Public Interface ICrud(Of T)

    Function GetAll() As IEnumerable(Of T)
    Function GetByID(id As String) As T
    Sub Create(model As T)
    Sub Update(model As T)
    Sub Delete(id As String)

End Interface
