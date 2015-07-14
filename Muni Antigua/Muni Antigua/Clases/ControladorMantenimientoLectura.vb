Imports System.Data.SqlClient
Imports System.Configuration
Public Class ControladorMantenimientoLectura
    Dim cmd As New SqlCommand

    Protected configuracion As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("cnn")
    Dim cnn As New SqlConnection(configuracion.ConnectionString)

#Region "Metodos Publicos"

    Public Function obtenerListadoLectura() As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prObternerListadoLecturas]")
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


    Public Function obtenerContador() As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prLlenarComboContadores]")
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

    Public Function obtenerDatosPersona(ByVal id_contador As Int16) As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prConsultarContador]")
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

    Public Function registrarLectura(ByVal fecha_inicio As Date,
                                       ByVal fecha_fin As Date,
                                       ByVal lectura_actual As Double,
                                       ByVal id_contador As Int32) As Integer
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prInsertarTablaLectura]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn

            cmd.Parameters.AddWithValue("@p_fecha_inicio", fecha_inicio)
            cmd.Parameters.AddWithValue("@p_fecha_fin", fecha_fin)
            cmd.Parameters.AddWithValue("@p_lectura_actual", lectura_actual)
            cmd.Parameters.AddWithValue("@p_id_usuario", clsComunes.llave.id_usuario)
            cmd.Parameters.AddWithValue("@p_id_contador", id_contador)
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
