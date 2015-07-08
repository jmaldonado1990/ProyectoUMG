Imports System.Data.SqlClient
Imports System.Configuration
Public Class ControladorMantenimientoPersona
    Dim cmd As New SqlCommand

    Protected configuracion As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("cnn")
    Dim cnn As New SqlConnection(configuracion.ConnectionString)

#Region "Variables"
    Private vComunes As New clsComunes
#End Region

#Region "Metodos Públicos"
    Public Function obtenerListadoVecinos() As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[comun].[prObtenerListadoPersonas]")
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

    Public Function registrarVecinos(ByVal accion As Char,
                                ByVal nombre As String,
                                        ByVal apellido As String,
                                        ByVal direccion As String,
                                        ByVal telefono As String,
                                        ByVal email As String,
                                        ByVal dpi As String,
                                        ByVal sexo As Int16,
                                        ByVal fecha_nac As String) As Integer
        Try
            cnn.Open()
            cmd = New SqlCommand("[comun].[prActualizarTablaPersona]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@p_accion", accion)
            cmd.Parameters.AddWithValue("@p_nombre", nombre)
            cmd.Parameters.AddWithValue("@p_apellido", apellido)
            cmd.Parameters.AddWithValue("@p_direccion", direccion)
            cmd.Parameters.AddWithValue("@p_telefono", telefono)
            cmd.Parameters.AddWithValue("@p_email", email)
            cmd.Parameters.AddWithValue("@p_dpi", dpi)
            cmd.Parameters.AddWithValue("@p_sexo", sexo)
            cmd.Parameters.AddWithValue("@p_fecha_nac", fecha_nac)
            cmd.Parameters.AddWithValue("@p_id_usuario", clsComunes.llave.id_usuario)

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
