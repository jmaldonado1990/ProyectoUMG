Imports Ext.Net
Imports System.IO
Public Class EdicionContador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        obtenerParametros()
        mostrarValoresInciales()
    End Sub

#Region "Variables"
    Private _accion As String = ""
    Private _idContador As Int32 = 0
#End Region

#Region "Metodos Privados"
    Public Sub mostrarValoresInciales()
        llenarComboEstadoContador()
    End Sub
#End Region

#Region "Funciones Publicos"
    Public Function llenarComboEstadoContador() As Boolean
        Try
            Dim accesoDatos As New ControladorMantenimientoContador
            StoreEstadoContador.DataSource = accesoDatos.llenarComboEstadoContador()
            StoreEstadoContador.DataBind()
        Catch ex As Exception
            Throw ex
        End Try
        Return True
    End Function
#End Region

#Region "Metodos Directos"
    <DirectMethod>
    Public Function grabarContador(ByVal marca As String,
                                        ByVal modelo As String,
                                        ByVal numero As String,
                                        ByVal direccion As String,
                                        ByVal estado As Int32) As Integer

        Try
            Dim accesoDatos As New ControladorMantenimientoContador
            Dim filas_afectadas As Integer
            Dim accion As String = ""
            If _accion = "nuevo" Then
                accion = "I"
                filas_afectadas = accesoDatos.registrarContador(accion, marca, modelo, numero, direccion, estado)
            End If
            Return filas_afectadas
        Catch ex As Exception
            Throw ex
        End Try

    End Function
#End Region


#Region "Obtener Parametros"
    Private Sub obtenerParametros()
        Dim parametro = String.Empty
        parametro = Request.QueryString.Get("accion")
        If Not String.IsNullOrEmpty(parametro) Then _accion = parametro
        parametro = Request.QueryString.Get("idContador")
        If Not String.IsNullOrEmpty(parametro) Then _idContador = parametro

    End Sub
#End Region

End Class