Imports Ext.Net
Imports System.IO
Public Class EdicionLectura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        obtenerValoresIniciales()
    End Sub

#Region "Metodos Privados"
    Public Sub obtenerValoresIniciales()
        llenarComboContador()
    End Sub

    Private Sub llenarComboContador()
        Try
            Dim accesoDatos As New ControladorMantenimientoLectura
            StoreContador.DataSource = accesoDatos.obtenerContador()
            StoreContador.DataBind()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
#End Region

#Region "Metodos Directos"
    <DirectMethod>
    Public Function llenarDatosPersona(ByVal id_contador As Int16) As Boolean
        Try
            Dim accesoDatos As New ControladorMantenimientoLectura
            Dim tabla As DataTable = accesoDatos.obtenerDatosPersona(id_contador)
            If tabla.Rows.Count <> 0 Then
                Dim fila = tabla.Rows(0)
                'lblNombres.Value = fila("nombre")
                'lblApellidos.Value = fila("apellido")
                txtFechaInicio.Value = fila("fecha_fin")
                txtLecturaAnterior.Value = fila("lectura_anterior")
            ElseIf tabla.Rows.Count = 0 Then
                'lblNombres.Clear()
                'lblApellidos.Clear()
                txtFechaInicio.Clear()
                txtLecturaAnterior.Clear()


            End If
            Return True
        Catch ex As Exception
            Throw ex
        End Try
        Return False
    End Function

    <DirectMethod>
    Public Function grabarLectura(ByVal fecha_inicio As Date,
                                        ByVal fecha_fin As Date,
                                        ByVal lectura_actual As Double,
                                        ByVal id_contador As Int32) As Integer

        Try
            Dim accesoDatos As New ControladorMantenimientoLectura
            Dim filas_afectadas As Integer
            filas_afectadas = accesoDatos.registrarLectura(fecha_inicio, fecha_fin, lectura_actual, id_contador)
            Return filas_afectadas
        Catch ex As Exception
            Throw ex
        End Try

    End Function


#End Region

End Class