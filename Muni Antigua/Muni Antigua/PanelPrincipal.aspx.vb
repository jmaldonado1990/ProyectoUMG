Imports System
Imports System.Web
Imports Ext.Net
Imports System.Data
Public Class PanelPrincipal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack And Not Ext.Net.X.IsAjaxRequest Then

        End If
    End Sub

End Class