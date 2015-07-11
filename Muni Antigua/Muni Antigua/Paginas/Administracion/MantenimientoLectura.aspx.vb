Imports Ext.Net
Imports System.IO
Public Class MantenimientoTarifa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

#Region "Metodos Directos"
    <DirectMethod>
    Public Sub crearVentanaEdicionLectura(ByVal accion As String, ByVal id_lectura As Int32)
        Dim titulo = "Lectura"
        Select Case accion
            Case "nuevo"
                titulo = "Nueva Lectura"
            Case "edicion"
                titulo = "Actualizar Datos Lectura"
        End Select
        Dim queryString = ""
        queryString &= ("accion=" & accion)
        queryString &= ("&idContador=" & id_lectura)
        Dim win = New Window With {.ID = "WindowEdicionLectura", _
                                    .Width = Unit.Pixel(450), _
                                    .Height = Unit.Pixel(390), _
                                    .Title = titulo, _
                                    .Modal = True, _
                                    .AutoRender = False, _
                                    .Collapsible = False, _
                                    .Maximizable = False}
        win.Loader = New ComponentLoader
        win.Loader.Url = "EdicionLectura.aspx?" & queryString
        win.Loader.Mode = LoadMode.Frame
        win.Loader.LoadMask.ShowMask = True
        win.Loader.LoadMask.Msg = "Espere un momento..."
        win.Render(True)
        win.Show()
    End Sub
#End Region

End Class