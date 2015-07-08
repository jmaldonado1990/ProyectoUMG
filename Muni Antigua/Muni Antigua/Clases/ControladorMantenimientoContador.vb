Imports System.Data.SqlClient
Imports System.Configuration
Public Class ControladorMantenimientoContador
    Dim cmd As New SqlCommand

    Protected configuracion As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("cnn")
    Dim cnn As New SqlConnection(configuracion.ConnectionString)

#Region "Variables"
    Private vComunes As New clsComunes
#End Region

#Region "Metodos Públicos"
    Public Function llenarComboEstadoContador() As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prLlenarComboEstadoContador]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn

            If cmd.ExecuteNonQuery Then
                Dim dt As New DataTable
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                Return dt
            Else
                Return Nothing
            End If
        Catch ex As Exception
            Throw ex
            Return Nothing
        Finally
            cnn.Close()
        End Try
    End Function

    Public Function registrarContador(ByVal accion As Char,
                                ByVal marca As String,
                                        ByVal modelo As String,
                                        ByVal numero As String,
                                        ByVal direccion As String,
                                        ByVal estado As Int32) As Integer
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prActualizarTablaContador]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@p_accion", accion)
            cmd.Parameters.AddWithValue("@p_marca", marca)
            cmd.Parameters.AddWithValue("@p_modelo", modelo)
            cmd.Parameters.AddWithValue("@p_numero", numero)
            cmd.Parameters.AddWithValue("@p_direccion", direccion)
            cmd.Parameters.AddWithValue("@p_id_usuario", clsComunes.llave.id_usuario)
            cmd.Parameters.AddWithValue("@p_id_estado_contador", estado)

            If cmd.ExecuteNonQuery Then
                Return 1
            Else
                Return 0

            End If

        Catch ex As Exception
            Throw ex
            Return 0
        Finally
            cnn.Close()
        End Try
    End Function
#End Region

End Class
