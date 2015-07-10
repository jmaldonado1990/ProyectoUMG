Imports Ext.Net
Imports System.IO
Public Class MantenimientoContador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        obtenerValoresIniciales()
    End Sub


#Region "Metodos Directos"
    Private Sub obtenerValoresIniciales()
        llenarGridContadores()
    End Sub
#End Region

#Region "Metodos Directos"

    <DirectMethod>
    Public Function llenarGridContadores() As Boolean
        Try
            Dim accesoDatos As New ControladorMantenimientoContador
            StoreContadores.DataSource = accesoDatos.obtenerListadoContadores()
            StoreContadores.DataBind()
        Catch ex As Exception
            Throw ex
        End Try
        Return True
    End Function


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


    <DirectMethod>
    Public Sub crearVentanaAsignacionContador(ByVal accion As String, ByVal id_contador As Int32)
        Dim titulo = "Contadores"
        Select Case accion
            Case "asignar"
                titulo = "Nueva Asignación"
            Case "edicion"
                titulo = "Actualizar Asignacioón"
        End Select
        Dim queryString = ""
        queryString &= ("accion=" & accion)
        queryString &= ("&idContador=" & id_contador)
        Dim win = New Window With {.ID = "WindowEdicionAsignacion", _
                                    .Width = Unit.Pixel(450), _
                                    .Height = Unit.Pixel(300), _
                                    .Title = titulo, _
                                    .Modal = True, _
                                    .AutoRender = False, _
                                    .Collapsible = False, _
                                    .Maximizable = False}
        win.Loader = New ComponentLoader
        win.Loader.Url = "AsignacionContador.aspx?" & queryString
        win.Loader.Mode = LoadMode.Frame
        win.Loader.LoadMask.ShowMask = True
        win.Loader.LoadMask.Msg = "Espere un momento..."
        win.Render(True)
        win.Show()
    End Sub


#End Region

End Class