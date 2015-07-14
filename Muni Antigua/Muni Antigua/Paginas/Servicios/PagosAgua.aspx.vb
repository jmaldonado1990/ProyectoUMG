Imports Ext.Net
Imports System.IO
Public Class PagosAgua
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

#Region "Metodos Directos"
    <DirectMethod>
    Public Function llenarGridPagosAgua(ByVal numero As String) As Boolean
        Try
            Dim accesoDatos As New ControladorMantenimientoPagoAgua
            StorePagos.DataSource = accesoDatos.obtenerListadoPagos(numero)
            StorePagos.DataBind()
            Return True
        Catch ex As Exception
            Throw ex
        End Try
        Return False
    End Function
#End Region

End Class