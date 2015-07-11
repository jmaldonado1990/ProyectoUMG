<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PanelPrincipal.aspx.vb" Inherits="Muni_Antigua.PanelPrincipal"%>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Municipalidad de Antigua Guatemala</title>
    <link rel="stylesheet" type="text/css" href="Css/generales.css" />

    <style type="text/css">
        .x-menu-body {
            background-color: white !important;
        }

        img.displayed {
            display: block;
            margin: 0 auto;
            clear: right;
        }
    </style>
    <link rel="shortcut icon" type="image/ico" href="Images/antigua1.ico" />
    <ext:ResourcePlaceHolder ID="ResourcePlaceHolder1" runat="server" Mode="ScriptFiles" />
</head>
<body>
    <script src="Scripts/panel-administracion.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" InitScriptMode="Linked"
            DirectEventUrl="PanelPrincipal.aspx" IDMode="Explicit" />
        <ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout">
            <Items>
                <ext:Panel ID="pnlToolbar" runat="server" Region="North" Height="70">
                    <Items>
                        <ext:Toolbar ID="Toolbar1" runat="server" Height="80">
                            <Items>
                                <ext:Panel ID="DisplayField12" runat="server">
                                    <Content>
                                        <div>
                                            <asp:Image runat="server" ImageUrl="~/Images/municipalidadantigua.jpg" ID="Image1" ImageAlign="AbsMiddle" />
                                        </div>
                                    </Content>
                                </ext:Panel>
                                <ext:ToolbarFill />

                                <ext:ToolbarSeparator />
                                <ext:Button ID="BtnSesionCnfg" runat="server" Icon="UserGray" Text="Sesión">
                                    <Menu>
                                        <ext:Menu ID="Menu1" runat="server">
                                            <Items>
                                                <ext:MenuItem runat="server" ID="mnuchangePass" Text="Cambiar Contraseña" Icon="UserKey">
                                                    <Listeners>
                                                        <Click Handler="#{WindowCambioPassword}.show()" />
                                                    </Listeners>
                                                </ext:MenuItem>
                                                <ext:MenuItem runat="server" ID="mnulogOut" Text="Salir del Sistema" Icon="UserGo">
                                                    <DirectEvents>
                                                        <%--<Click OnEvent="SalirSistema"></Click>--%>
                                                    </DirectEvents>
                                                </ext:MenuItem>
                                            </Items>
                                        </ext:Menu>
                                    </Menu>
                                </ext:Button>
                            </Items>
                        </ext:Toolbar>
                    </Items>
                </ext:Panel>
                <ext:TabPanel ID="tabPanelPrincipal"
                    runat="server"
                    Region="Center"
                    MarginSpec="5 5 5 0">
                    <Items>
                        <ext:Panel ID="PanelInfo" runat="server" Title="Municipalidad Antigua Guatemala" AutoRender="false">
                            <Loader ID="Loader1" runat="server" Url="Paginas/PaginaPrincipal/PaginaPrincipal.aspx" DisableCaching="true" Mode="Frame" AutoLoad="false">
                                <LoadMask ShowMask="true" Msg="Espere un momento..." />
                            </Loader>
                        </ext:Panel>
                    </Items>
                </ext:TabPanel>
                <ext:Panel ID="pnlOeste" runat="server" Region="West"
                    Width="200" Collapsible="true" Split="true"
                    MinWidth="175" MaxWidth="400" MarginSpec="5 0 5 5"
                    Layout="AccordionLayout">
                    <Items>
                        <ext:MenuPanel ID="menuPanel1" runat="server"
                            Title="Administración" Collapsed="true"
                            Icon="Images" AutoScroll="false" BodyPadding="5" Border="false">
                            <Menu ID="mnuAcreditaciones" runat="server">
                                <Items>
                                    <ext:MenuItem ID="MenuItem1" runat="server" Text="Registro de Noticias" Icon="TableSave">
                                        <Listeners>
                                            <Click Handler="addTab(#{tabPanelPrincipal}, 'id1', 'Paginas/Noticias/RegistrarNoticias.aspx','Registro de Noticias',  this);" />
                                        </Listeners>
                                    </ext:MenuItem>
                                    <ext:MenuItem ID="MenuItem2" runat="server" Text="Públicaciones" Icon="RssValid">
                                        <Listeners>
                                            <Click Handler="addTab(#{tabPanelPrincipal}, 'id2', 'Paginas/Noticias/AdministracionPublicaciones.aspx','Publicaciones',  this);" />
                                        </Listeners>
                                    </ext:MenuItem>
                                    <ext:MenuItem ID="MenuItem3" runat="server" Text="Registro de Vecinos" Icon="UserAdd">
                                        <Listeners>
                                            <Click Handler="addTab(#{tabPanelPrincipal}, 'id3', 'Paginas/Administracion/MantenimientoPersona.aspx','Registro de Vecinos',  this);" />
                                        </Listeners>
                                    </ext:MenuItem>
                                     <ext:MenuItem ID="MenuItem4" runat="server" Text="Registro de Contadores" Icon="ApplicationFormAdd">
                                        <Listeners>
                                            <Click Handler="addTab(#{tabPanelPrincipal}, 'id4', 'Paginas/Administracion/MantenimientoContador.aspx','Registro de Contadores',  this);" />
                                        </Listeners>
                                    </ext:MenuItem>
                                    <ext:MenuItem ID="MenuItem5" runat="server" Text="Registro de Lectura" Icon="ApplicationFormAdd">
                                        <Listeners>
                                            <Click Handler="addTab(#{tabPanelPrincipal}, 'id5', 'Paginas/Administracion/MantenimientoLectura.aspx','Registro de Lectura',  this);" />
                                        </Listeners>
                                    </ext:MenuItem>
                                </Items>
                                <Listeners>
                                </Listeners>
                            </Menu>
                        </ext:MenuPanel>
                        <ext:MenuPanel ID="menuPanel" runat="server"
                            Title="Servicios" Collapsed="true"
                            Icon="ApplicationForm" AutoScroll="false" BodyPadding="5" Border="false">
                            <Menu ID="Menu2" runat="server">
                                <Items>
                                </Items>
                                <Listeners>
                                </Listeners>
                            </Menu>
                        </ext:MenuPanel>
                    </Items>
                </ext:Panel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>