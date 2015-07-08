Imports Ext.Net
Imports System.IO
Public Class MantenimientoPersona
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        mostrarValoresIniciales()
    End Sub

#Region "Metodos Privados"
    Private Sub mostrarValoresIniciales()
        llenarGridVecinos()
    End Sub
#End Region

#Region "Metodos Directos"
    <DirectMethod>
    Public Function llenarGridVecinos() As Boolean
        Try
            Dim accesoDatos As New ControladorMantenimientoPersona
            StoreVecinos.DataSource = accesoDatos.obtenerListadoVecinos()
            StoreVecinos.DataBind()
        Catch ex As Exception
            Throw ex
        End Try
        Return True
    End Function

    <DirectMethod>
    Public Sub crearVentanaEdicionVecino(ByVal accion As String, ByVal id_persona As Int32)
        Dim titulo = "Vecinos"
        Select Case accion
            Case "nuevo"
                titulo = "Nuevo Vecino"
            Case "edicion"
                titulo = "Actualizar Datos Vecino"
        End Select
        Dim queryString = ""
        queryString &= ("accion=" & accion)
        queryString &= ("&idPersona=" & id_persona)
        Dim win = New Window With {.ID = "WindowEdicionVecino", _
                                    .Width = Unit.Pixel(550), _
                                    .Height = Unit.Pixel(480), _
                                    .Title = titulo, _
                                    .Modal = True, _
                                    .AutoRender = False, _
                                    .Collapsible = False, _
                                    .Maximizable = False}
        win.Loader = New ComponentLoader
        win.Loader.Url = "EdicionPersona.aspx?" & queryString
        win.Loader.Mode = LoadMode.Frame
        win.Loader.LoadMask.ShowMask = True
        win.Loader.LoadMask.Msg = "Espere un momento..."
        win.Render(True)
        win.Show()
    End Sub
#End Region


End Class