<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MantenimientoPersona.aspx.vb" Inherits="Muni_Antigua.MantenimientoPersona" %>

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

                <ext:GridPanel ID="PanelListadoVecinos" runat="server" Flex="1" Title="Vecinos Encontrados">
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                                <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                                <ext:Button ID="Button1" runat="server" Width="150" Text="Ejecutar Consulta" Icon="Reload" 
                                    OnClientClick="EjecutarConsulta();" />
                                <ext:ToolbarSeparator ID="ToolbarSeparator2" runat="server" />
                                <ext:Button ID="agregar" runat="server" Width="180" Text="Agregar Nuevo Vecino"
                                    Icon="Add" OnClientClick="AgregarNuevoVecino();" />
                                
                                
                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <Store>
                        <ext:Store ID="StoreVecinos" runat="server">
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
                            <ext:Column ID="Column1" runat="server" Text="DPI" DataIndex="dpi" Flex="1" />
                            <ext:Column ID="Column2" runat="server" Text="Nombres" DataIndex="nombre" Flex="1" />
                            <ext:Column ID="Column3" runat="server" Text="Apellidos" DataIndex="apellido" Flex="1" />
                            <ext:Column ID="Column4" runat="server" Text="Teléfono" DataIndex="telefono" Flex="1" />
                            <ext:Column ID="Column5" runat="server" Text="Correo" DataIndex="email" Flex="1" />
                            <ext:CommandColumn ID="CommandColumn1" runat="server" Width="150">
                                <Commands>
                                    <ext:GridCommand Icon="PageWhiteEdit" CommandName="Editar" Text="Editar" />
                                    <ext:GridCommand Icon="Delete" CommandName="Eliminar" Text="Eliminar" />
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
