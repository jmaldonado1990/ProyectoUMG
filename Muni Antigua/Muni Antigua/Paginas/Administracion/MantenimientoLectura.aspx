<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MantenimientoLectura.aspx.vb" Inherits="Muni_Antigua.MantenimientoTarifa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   <script src="Scripts/MantenimientoLectura.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager" runat="server" InitScriptMode="Linked"
            DirectEventUrl="MantenimientoLectura.aspx" IDMode="Explicit" />

        <ext:Viewport ID="Viewport1" runat="server" Layout="AnchorLayout">

            <Items>

                <%--  <ext:Panel runat="server" ID="PanelSuperior" Layout="AbsoluteLayout"
                    AnchorHorizontal="100%" AnchorVertical="12%" AutoScroll="true">

                    <Items>

                        <ext:Button ID="Button1" runat="server" X="60" Y="15" Width="150" Text="Ejecutar Consulta" Icon="Reload" Flex="1" AnchorVertical="10%"
                            OnClientClick="EjecutarConsulta();" />
                    </Items>
                </ext:Panel>--%>

                <ext:GridPanel ID="gridListadoLectura" runat="server" Title="Tarifas Encontradas" AnchorHorizontal="100%"
                    AnchorVertical="100%" Scroll="Both" AutoScroll="true" StripeRows="true" Resizable="true">
                    <TopBar>
                        <ext:Toolbar ID="Toolbar1" runat="server">
                            <Items>
                                <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                                <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                                <ext:Button ID="Button1" runat="server" Width="150" Text="Ejecutar Consulta" Icon="Reload"
                                    OnClientClick="ejecutarConsulta();" />

                                <ext:ToolbarSeparator ID="ToolbarSeparator2" runat="server" />
                                <ext:Button ID="agregar" runat="server" Width="180" Text="Agregar Nueva Lectura"
                                    Icon="Add" OnClientClick="AgregarNuevoLectura();" />

                            </Items>
                        </ext:Toolbar>
                    </TopBar>
                    <Store>
                        <ext:Store ID="StoreLectura" runat="server" PageSize="20">
                            <Model>
                                <ext:Model ID="Model3" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="id_lectura" />
                                        <ext:ModelField Name="id_contador" />
                                        <ext:ModelField Name="numero" />
                                        <ext:ModelField Name="fecha_inicio" Type="String" />
                                        <ext:ModelField Name="fecha_fin" Type="String" />
                                        <ext:ModelField Name="lectura_actual" />
                                        <ext:ModelField Name="lectura_anterior" />
                                        <ext:ModelField Name="consumo" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>

                    <ColumnModel ID="ColumnModel3" runat="server">
                        <Columns>
                            <ext:RowNumbererColumn ID="numerar" runat="server" />
                            <ext:Column ID="Column1" runat="server" Text="Número Contador" DataIndex="numero" Flex="1" >
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
                            <ext:Column ID="Column2" runat="server" Text="Fecha Inicio" DataIndex="fecha_inicio" Flex="1" >
                            </ext:Column>
                            <ext:Column ID="Column3" runat="server" Text="Fecha Fin" DataIndex="fecha_fin" Flex="1" >
                                
                            </ext:Column>
                             <ext:Column ID="Column5" runat="server" Text="Lectura Actual" DataIndex="lectura_actual" Flex="1" >
                               
                            </ext:Column>
                            <ext:Column ID="Column4" runat="server" Text="Lectura Anterior" DataIndex="lectura_anterior" Flex="1" >
                            </ext:Column>
                            
                            <ext:Column ID="Column6" runat="server" Text="Consumo" DataIndex="consumo" Flex="1" >
                            </ext:Column>
                           
                            <ext:CommandColumn ID="CommandColumn1" runat="server" Width="90" Text="Operaciones">
                                <Commands>
                                    <ext:GridCommand Icon="PageWhiteEdit" CommandName="Editar" Text="" ToolTip-Text="Editar" />
                                  <%--  <ext:GridCommand Icon="ApplicationFormAdd" CommandName="Asignar" Text="" ToolTip-Text="Asignar" />--%>
                                </Commands>
                             <%--    <PrepareToolbar Fn="prepareToolbarContadores" />--%>
                                <Listeners>
                                   <%-- <Command Handler="ejecutarComandoContador(command, record.data.id_contador);" />--%>
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
