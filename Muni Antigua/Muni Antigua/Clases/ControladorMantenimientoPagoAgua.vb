Imports System.Data.SqlClient
Imports System.Configuration
Public Class ControladorMantenimientoPagoAgua

    Dim cmd As New SqlCommand

    Protected configuracion As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("cnn")
    Dim cnn As New SqlConnection(configuracion.ConnectionString)

#Region "Funciones Publicas"
    Public Function obtenerListadoPagos(ByVal numero As String) As DataTable
        Try
            cnn.Open()
            cmd = New SqlCommand("[pagua].[prObtenerListadoPagosAgua]")
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@p_numero", numero)

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
#End Region
End Class
