Imports Ext.Net
Imports System.IO
Public Class AsignacionContador
    Inherits System.Web.UI.Page

#Region "Variables"
    Private accion As String = ""
    Private id_contador As Int32 = 0
    Public id_persona As Int32
    Public id_conta As Int32
#End Region


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        obtenerParametros()
        If Not Page.IsPostBack And Not Ext.Net.X.IsAjaxRequest Then
            obtenerValoresIniciales()
            OperarPagina(accion, id_contador)
        End If
    End Sub

#Region "Metodos Privados"
    Public Sub obtenerValoresIniciales()
        llenarComboVecinos()
    End Sub

    Private Sub llenarComboVecinos()
        Try
            Dim accesoDatos As New ControladorAsignacionContador
            StoreVecinos.DataSource = accesoDatos.obtenerVecinos()
            StoreVecinos.DataBind()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
#End Region

#Region "Metodo Directos"

    <DirectMethod>
    Public Function grabarAsignacionContador(ByVal accion As String,
                                             ByVal id_contador As Int32,
                                             ByVal direccion As String,
                                             ByVal id_persona As Int32) As Integer

        Try
            Dim accesoDatos As New ControladorAsignacionContador
            Dim filas_afectadas As Integer
            filas_afectadas = accesoDatos.registrarAsignacionContador(accion, id_contador, direccion, id_persona)
            Return filas_afectadas
        Catch ex As Exception
            Throw ex
        End Try
    End Function
#End Region

#Region "Metodos Privados"
    Private Sub OperarPagina(ByVal operacion As String, Optional ByVal id_contador As Integer = 0)
        Try
            If operacion = "asignar" Then
                Dim accesoDatos As New ControladorAsignacionContador
                Dim tabla As DataTable = accesoDatos.obtenerRegistroContador(id_contador)
                If tabla.Rows.Count <> 0 Then
                    Dim fila = tabla.Rows(0)
                    lblNumero.Value = fila("numero")
                    txtIdContador.Value = fila("id_contador")



                End If
            End If
        Catch ex As Exception
            Throw ex
        End Try

    End Sub


#End Region


#Region "Obtener Parametros"
    Private Sub obtenerParametros()
        Dim parametro = String.Empty
        parametro = Request.QueryString.Get("accion")
        If Not String.IsNullOrEmpty(parametro) Then accion = parametro
        parametro = Request.QueryString.Get("idContador")
        If Not String.IsNullOrEmpty(parametro) Then id_contador = parametro

    End Sub
#End Region
End Class