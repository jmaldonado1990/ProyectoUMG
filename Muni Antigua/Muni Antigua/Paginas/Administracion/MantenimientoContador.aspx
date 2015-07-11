<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MantenimientoContador.aspx.vb" Inherits="Muni_Antigua.MantenimientoContador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
   <script src="Scripts/MantenimientoContador.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager" runat="server" InitScriptMode="Linked"
            DirectEventUrl="MantenimientoContador.aspx" IDMode="Explicit" />

        <ext:Viewport ID="Viewport1" runat="server" Layout="AnchorLayout">

            <Items>

                <%--  <ext:Panel runat="server" ID="PanelSuperior" Layout="AbsoluteLayout"
                    AnchorHorizontal="100%" AnchorVertical="12%" AutoScroll="true">

                    <Items>

                        <ext:Button ID="Button1" runat="server" X="60" Y="15" Width="150" Text="Ejecutar Consulta" Icon="Reload" Flex="1" AnchorVertical="10%"
                            OnClientClick="EjecutarConsulta();" />
                    </Items>
                </ext:Panel>--%>

                <ext:GridPanel ID="gridListadoContadores" runat="server" Title="Contadores Encontrados" AnchorHorizontal="100%"
                    AnchorVertical="100%" Scroll="Both" AutoScroll="true" StripeRows="true" Resizable="true">
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                                <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                                <ext:Button ID="Button1" runat="server" Width="150" Text="Ejecutar Consulta" Icon="Reload"
                                    OnClientClick="ejecutarConsulta();" />

                                <ext:ToolbarSeparator ID="ToolbarSeparator2" runat="server" />
                                <ext:Button ID="agregar" runat="server" Width="180" Text="Agregar Nuevo Contador"
                                    Icon="Add" OnClientClick="AgregarNuevoContador();" />


                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <Store>
                        <ext:Store ID="StoreContadores" runat="server" PageSize="20">
                            <Model>
                                <ext:Model ID="Model3" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="id_contador" />
                                        <ext:ModelField Name="marca" />
                                        <ext:ModelField Name="modelo" />
                                        <ext:ModelField Name="numero" />
                                        <ext:ModelField Name="direccion" />
                                        <ext:ModelField Name="estado" />
                                        <ext:ModelField Name="permite_acreditar" Type="Int"/>
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>

                    <ColumnModel ID="ColumnModel3" runat="server">
                        <Columns>
                            <ext:RowNumbererColumn ID="numerar" runat="server" />
                            <ext:Column ID="Column1" runat="server" Text="Marca" DataIndex="marca" Flex="1" >
                                    <Items>
                                        <ext:TextField ID="txtFiltroMarca" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('marca');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarMarca" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                    </Items>
                            </ext:Column>
                            <ext:Column ID="Column2" runat="server" Text="Modelo" DataIndex="modelo" Flex="1" >
                                <Items>
                                    <ext:TextField ID="txtFiltroModelo" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('modelo');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarModelo" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                            <ext:Column ID="Column3" runat="server" Text="Numero" DataIndex="numero" Flex="1" >
                                <Items>
                                     <ext:TextField ID="txtFiltroNumero" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('numero');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarNumero" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                             <ext:Column ID="Column5" runat="server" Text="Ubicación" DataIndex="direccion" Flex="1" >
                                <Items>
                                     <ext:TextField ID="txtFiltroDireccion" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('direccion');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarDireccion" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                            <ext:Column ID="Column4" runat="server" Text="Estado" DataIndex="estado" Flex="1" >
                                <Items>
                                     <ext:TextField ID="txtFiltroEstado" runat="server">
                                        <Listeners>
                                            <Change Handler="Filtrar('estado');" Buffer="250" />
                                        </Listeners>
                                        <Plugins>
                                            <ext:ClearButton ID="txtLimpiarEstado" runat="server" />
                                        </Plugins>
                                    </ext:TextField>
                                </Items>
                            </ext:Column>
                           
                            <ext:CommandColumn ID="CommandColumn1" runat="server" Width="90" Text="Operaciones">
                                <Commands>
                                    <ext:GridCommand Icon="PageWhiteEdit" CommandName="Editar" Text="" ToolTip-Text="Editar" />
                                    <ext:GridCommand Icon="ApplicationFormAdd" CommandName="Asignar" Text="" ToolTip-Text="Asignar" />
                                </Commands>
                                 <PrepareToolbar Fn="prepareToolbarContadores" />
                                <Listeners>
                                    <Command Handler="ejecutarComandoContador(command, record.data.id_contador);" />
                                </Listeners>
                            </ext:CommandColumn>

                        </Columns>
                    </ColumnModel>


                    <BottomBar>
                        <ext:PagingToolbar ID="PagingToolbar1" runat="server" StoreID="StoreContadores" DisplayInfo="true" DisplayMsg="Mostrando {0} - {1} of {2}"
                            EmptyMsg="No hay datos que mostrar" />
                    </BottomBar>

                </ext:GridPanel>
            </Items>
        </ext:Viewport>
    </form>
</body>
</html>
