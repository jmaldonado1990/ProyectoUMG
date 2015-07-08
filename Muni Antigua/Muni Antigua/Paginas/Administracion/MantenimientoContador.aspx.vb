Imports Ext.Net
Imports System.IO
Public Class MantenimientoContador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

   

#Region "Metodos Directos"

    <DirectMethod>
    Public Sub crearVentanaEdicionContador(ByVal accion As String, ByVal id_contador As Int32)
        Dim titulo = "Contadores"
        Select Case accion
            Case "nuevo"
                titulo = "Nuevo Contador"
            Case "edicion"
                titulo = "Actualizar Datos Contador"
        End Select
        Dim queryString = ""
        queryString &= ("accion=" & accion)
        queryString &= ("&idContador=" & id_contador)
        Dim win = New Window With {.ID = "WindowEdicionContador", _
                                    .Width = Unit.Pixel(550), _
                                    .Height = Unit.Pixel(390), _
                                    .Title = titulo, _
                                    .Modal = True, _
                                    .AutoRender = False, _
                                    .Collapsible = False, _
                                    .Maximizable = False}
        win.Loader = New ComponentLoader
        win.Loader.Url = "EdicionContador.aspx?" & queryString
        win.Loader.Mode = LoadMode.Frame
        win.Loader.LoadMask.ShowMask = True
        win.Loader.LoadMask.Msg = "Espere un momento..."
        win.Render(True)
        win.Show()
    End Sub


#End Region

End Class