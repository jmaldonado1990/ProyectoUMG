﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MantenimientoPersona.aspx.vb" Inherits="Muni_Antigua.MantenimientoPersona" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <script src="Scripts/MantenimientoPersona.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager" runat="server" InitScriptMode="Linked"
            DirectEventUrl="MantenimientoPersona.aspx" IDMode="Explicit" />

        <ext:Viewport ID="Viewport1" runat="server" Layout="AnchorLayout">

            <Items>

                <%--  <ext:Panel runat="server" ID="PanelSuperior" Layout="AbsoluteLayout"
                    AnchorHorizontal="100%" AnchorVertical="12%" AutoScroll="true">

                    <Items>

                        <ext:Button ID="Button1" runat="server" X="60" Y="15" Width="150" Text="Ejecutar Consulta" Icon="Reload" Flex="1" AnchorVertical="10%"
                            OnClientClick="EjecutarConsulta();" />
                    </Items>
                </ext:Panel>--%>

                <ext:GridPanel ID="gridListadoVecinos" runat="server" Title="Vecinos Encontrados" AnchorHorizontal="100%"
                    AnchorVertical="100%" Scroll="Both" AutoScroll="true" StripeRows="true" Resizable="true">
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                                <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                                <ext:Button ID="Button1" runat="server" Width="150" Text="Ejecutar Consulta" Icon="Reload"
                                    OnClientClick="ejecutarConsulta();" />

                                <ext:ToolbarSeparator ID="ToolbarSeparator2" runat="server" />
                                <ext:Button ID="agregar" runat="server" Width="180" Text="Agregar Nuevo Vecino"
                                    Icon="Add" OnClientClick="AgregarNuevoVecino();" />


                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <Store>
                        <ext:Store ID="StoreVecinos" runat="server" PageSize="20">
                            <Model>
                                <ext:Model ID="Model3" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="id_persona" />
                                        <ext:ModelField Name="nombre" />
                                        <ext:ModelField Name="apellido" />
                                        <ext:ModelField Name="telefono" />
                                        <ext:ModelField Name="email" />
                                        <ext:ModelField Name="dpi" />
                                        <ext:ModelField Name="permite_eliminar" Type="Boolean" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>

                    <ColumnModel ID="ColumnModel3" runat="server">
                        <Columns>
                            <ext:RowNumbererColumn ID="numerar" runat="server" />
                            <ext:Column ID="Column1" runat="server" Text="DPI" DataIndex="dpi" Flex="1" >
                                    <Items>
                                        <ext:TextField ID="txtFiltroDPI" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('dpi');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarDPI" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                    </Items>
                            </ext:Column>
                            <ext:Column ID="Column2" runat="server" Text="Nombres" DataIndex="nombre" Flex="1" >
                                <Items>
                                    <ext:TextField ID="txtFiltroNombre" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('nombre');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarNombre" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                            <ext:Column ID="Column3" runat="server" Text="Apellidos" DataIndex="apellido" Flex="1" >
                                <Items>
                                     <ext:TextField ID="txtFiltroApellido" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('apellido');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarApellido" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                            <ext:Column ID="Column4" runat="server" Text="Teléfono" DataIndex="telefono" Flex="1" >
                                <Items>
                                     <ext:TextField ID="txtFiltroTelefono" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('telefono');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarTelefono" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                            <ext:Column ID="Column5" runat="server" Text="Correo" DataIndex="email" Flex="1" >
                                <Items>
                                     <ext:TextField ID="txtFiltroCorreo" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('email');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarCorreo" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                            <ext:CommandColumn ID="CommandColumn1" runat="server" Width="90" Text="Operaciones">
                                <Commands>
                                    <ext:GridCommand Icon="PageWhiteEdit" CommandName="Editar" Text="" ToolTip-Text="Editar" />
                                    <ext:GridCommand Icon="Delete" CommandName="Eliminar" Text="" ToolTip-Text="Eliminar" />
                                </Commands>
                                <%-- <PrepareToolbar Fn="prepareToolbarBancos" />--%>
                                <Listeners>
                                    <%--<Command Handler="ejecutarComandoVecinos(command, record.data.id_persona);" />--%>
                                </Listeners>
                            </ext:CommandColumn>

                        </Columns>
                    </ColumnModel>


                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" StoreID="StoreVecinos" DisplayInfo="true" DisplayMsg="Mostrando {0} - {1} of {2}"
                            EmptyMsg="No hay datos que mostrar" />
                    </BottomBar>

                </ext:GridPanel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>
