Imports Ext.Net
Imports System.IO
Public Class EdicionPersona
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        obtenerParametros()
    End Sub

#Region "Variables"
    Private _accion As String = ""
    Private _idPersona As Int32 = 0
#End Region

#Region "Metodos Directos"
    <DirectMethod>
    Public Function grabarVecino(ByVal nombre As String,
                                        ByVal apellido As String,
                                        ByVal direccion As String,
                                        ByVal telefono As String,
                                        ByVal email As String,
                                        ByVal dpi As String,
                                        ByVal sexo As Int16,
                                        ByVal fecha_nac As String) As Integer

        Try
            Dim accesoDatos As New ControladorMantenimientoPersona
            Dim filas_afectadas As Integer
            Dim accion As String = ""
            If _accion = "nuevo" Then
                accion = "I"
                filas_afectadas = accesoDatos.registrarVecinos(accion, nombre, apellido, direccion, telefono, email, dpi, sexo, fecha_nac)
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
        parametro = Request.QueryString.Get("idPersona")
        If Not String.IsNullOrEmpty(parametro) Then _idPersona = parametro
      
    End Sub
#End Region


End Class