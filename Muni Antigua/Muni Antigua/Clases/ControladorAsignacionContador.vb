Imports System.Data.SqlClient
Imports System.Configuration
Public Class ControladorAsignacionContador
    Dim cmd As New SqlCommand

    Protected configuracion As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("cnn")
    Dim cnn As New SqlConnection(configuracion.ConnectionString)


#Region "Metodos Públicos"
    Public Function obtenerRegistroContador(ByVal id_contador As Int32) As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prObtenerRegistroContador]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@p_id_contador", id_contador)

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

    Public Function obtenerRegistroPersona(ByVal dpi As String) As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[comun].[prObtenerRegistroPersona]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@p_dpi", dpi)

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

    Public Function registrarAsignacionContador(ByVal accion As Char,
                               ByVal id_contador As Int32,
                               ByVal direccion As String,
                                       ByVal id_persona As String) As Integer
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prActualizarTablaContador]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@p_accion", accion)
            cmd.Parameters.AddWithValue("@p_id_contador", id_contador)
            cmd.Parameters.AddWithValue("@p_id_persona", id_persona)
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
