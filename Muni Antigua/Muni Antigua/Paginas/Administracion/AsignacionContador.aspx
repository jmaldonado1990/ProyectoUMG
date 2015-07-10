<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AsignacionContador.aspx.vb" Inherits="Muni_Antigua.AsignacionContador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript">
        var onBefore = function () {
            Ext.net.Mask.show();
            Ext.net.Mask.hide.defer(500);
        };
    </script>
    <style>
        #fi-button-msg {
            border: 2px solid #ccc;
            padding: 5px 10px;
            background: #eee;
            margin: 5px;
            float: left;
        }
    </style>
</head>
<body>
    <script src="Scripts/AsignacionContador.js" type="text/javascript"></script>
    <%-- <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" InitScriptMode="Linked" DirectEventUrl="AsignacionContador.aspx" />
            <ext:Panel ID="Panel1"
                runat="server"
                Layout="FormLayout">

                <items>
                <ext:FormPanel ID="FormMantenimientoAsignacion" runat="server" Title="Asignación de Contadores" Frame="true" BodyPadding="8">
                    <Defaults>
                        <ext:Parameter Name="MsgTarget" Value="side" />
                    </Defaults>
                    <FieldDefaults LabelAlign="Right" LabelWidth="90" MsgTarget="Qtip" />
                    <Items>
                        <ext:FieldSet ID="FieldSet1" runat="server" Title="Datos Generales" Layout="AnchorLayout" DefaultAnchor="100%">
                            <Items>
                                <ext:FieldContainer ID="FieldContainer1" runat="server" Layout="ColumnLayout" AnchorVertical="100%">
                                    <Items>
                                        <ext:Container ID="ContainerDatos" runat="server" Layout="FormLayout" ColumnWidth=".85" Padding="5">

                                            <Items>


                                                <ext:TextField ID="lblNumero" runat="server"
                                                    Name="Numero" X="15" Y="20"
                                                    FieldLabel="Número Contador" LabelWidth="85"
                                                    Flex="1" Width="360"
                                                    TabIndex="1" Disabled="true" />


                                                <ext:TextField ID="txtDPI" runat="server"
                                                    Name="DPI" X="25" Y="40"
                                                    FieldLabel="DPI" LabelWidth="85"
                                                    Flex="1" Width="360"
                                                    EmptyText="DPI" TabIndex="2"
                                                    AllowBlank="false" />
                                                

                                               


                                                <ext:Label ID="lblNombres" runat="server"
                                                    Name="Nombres"
                                                    FieldLabel="Nombres"
                                                    Flex="1"
                                                    TabIndex="3" />

                                                <ext:Label ID="lblApellidos" runat="server"
                                                    Name="Apellidos"
                                                    FieldLabel="Apellidos"
                                                    Flex="1"
                                                    TabIndex="4" />


                                            </Items>
                                        </ext:Container>
                                    </Items>
                                </ext:FieldContainer>
                            </Items>
                        </ext:FieldSet>
                        <ext:Label runat="server" ID="lblCerrarW" />
                    </Items>
                    <BottomBar>
                        <ext:StatusBar ID="StatusBar1" runat="server" />
                    </BottomBar>
                    <Listeners>
                        <ValidityChange Handler="this.dockedItems.get(1).setStatus({
                                                     text : valid ? 'Formulario Completado' : 'Formulario No Válido', 
                                                     iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                 });
                                                 #{btnGuardar}.setDisabled(!valid);" />
                    </Listeners>
                </ext:FormPanel>
            </items>
                <buttons>
                <ext:Button ID="btnGuardar" runat="server" Text="Guardar" Disabled="true" FormBind="true" Icon="Disk" Width="110">
                    <Listeners>
                        <Click Handler="registrarAsignacion(#{FormMantenimientoAsignacion});" />
                    </Listeners>
                </ext:Button>
                <ext:Button ID="btnCancelar" runat="server" Text="Cancelar" Icon="Cancel" Width="110">
                    <Listeners>
                        <Click Handler="cerrarVentana();" />
                    </Listeners>
                </ext:Button>
            </buttons>
                 
            </ext:Panel>
     
    </form>--%>
    <form id="form1" runat="server">
        <div>
            <ext:ResourceManager ID="ResourceManager1" runat="server" InitScriptMode="Linked" DirectEventUrl="AsignacionContador.aspx" />
            <ext:Viewport ID="ViewPort" runat="server" Layout="FitLayout">
                <Items>

                   <ext:FormPanel ID="FormMantenimientoAsignacion" runat="server" Title="" Frame="true" BodyPadding="8">
                        <Defaults>
                            <%--<ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />--%>
                            <ext:Parameter Name="MsgTarget" Value="side" />
                        </Defaults>

                        <Items>
                            <ext:TextField ID="lblNumero" runat="server" X="30" Y="50" FieldLabel="Número:" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Disabled="true" />

                            <ext:TextField ID="txtDPI" runat="server" X="30" Y="80" FieldLabel="DPI" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="false" Name="DPI" EmptyText="Consultar persona" />

                            <ext:Button ID="btnEjecutarConsulta" runat="server" X="310" Y="-30" Width="80" Text=""
                            Icon="Reload" OnClientClick="ejecutarConsulta();" />   

                              <ext:TextField ID="lblNombres" runat="server" X="30" Y="-30" FieldLabel="Nombres:" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Disabled="true"/>

                            <ext:TextField ID="lblApellidos" runat="server" X="30" Y="140" FieldLabel="Apellidos:" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Disabled="true" />

                              <ext:TextField ID="txtDireccion" runat="server" X="30" Y="170" FieldLabel="Ubicación:" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="false" Disabled="false" />

                             <ext:TextField ID="lblIdPersona" runat="server" X="30" Y="200" FieldLabel="Id_Persona" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Visible="true" />

                            <ext:TextField ID="lblIdContador" runat="server" X="30" Y="230" FieldLabel="Id_Contador" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Visible="true" />




                            <%-- <ext:NumberField ID="Latitud" runat="server" X="15" Y="100" FieldLabel="Latitud" LabelWidth="85" Width="360" LabelAlign="Right" 
                            MinValue="0" MaxValue="1000000" AllowDecimals="true" DecimalPrecision="3" Step="0.1" AllowBlank="true" />
                     

                        <ext:NumberField ID="Longitud" runat="server" X="15" Y="140" FieldLabel="Longitud" LabelWidth="85" Width="360" LabelAlign="Right" 
                            MinValue="0" MaxValue="1000000" AllowDecimals="true" DecimalPrecision="3" Step="0.1" AllowBlank="true"  />
                            --%>

                           <%-- <ext:TextField ID="txtLatitud" runat="server" X="15" Y="100" FieldLabel="Latitud" LabelWidth="85" Width="360" LabelAlign="Right"
                                AllowBlank="true" Regex="/^[0-9]+(\.[0-9]{1,8})?$/" />

                            <ext:TextField ID="txtLongitud" runat="server" X="15" Y="140" FieldLabel="Latitud" LabelWidth="85" Width="360" LabelAlign="Right"
                                AllowBlank="true" Regex="/^[0-9]+(\.[0-9]{1,8})?$/" />


                            <ext:ComboBox ID="cboEstado" runat="server" X="15" Y="180" FieldLabel="Estado" LabelWidth="85" Width="250" LabelAlign="Right"
                                Resizable="false" MultiSelect="false" Editable="false" StoreID="StoreEstados"
                                ValueField="id_estado_estacion" DisplayField="descripcion" AllowBlank="false" />--%>

                        </Items>
                        <Listeners>
                            <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                    text: valid? 'Formulario Completado': 'Formulario no Completado',
                                                    iconCls: valid? 'icon-accept' : 'icon-exclamation'
                                                    });
                                                    #{btnGuardar}.setDisabled(!valid);" />

                        </Listeners>
                        <Buttons>
                            <ext:Button ID="btnGuardar" runat="server" Text="Guardar" Disabled="true" FormBind="true" Icon="Disk" Width="110">
                                <Listeners>
                                    <Click Handler="registrarAsignacion(#{FormMantenimientoAsignacion});" />
                                </Listeners>
                            </ext:Button>
                            <ext:Button ID="btnCancelar" runat="server" Text="Cancelar" Icon="Cancel" Width="110">
                                <Listeners>
                                    <Click Handler="cerrarVentana();" />
                                </Listeners>
                            </ext:Button>
                        </Buttons>

                    </ext:FormPanel>

                </Items>
            </ext:Viewport>
        </div>
    </form>
</body>
</html>
