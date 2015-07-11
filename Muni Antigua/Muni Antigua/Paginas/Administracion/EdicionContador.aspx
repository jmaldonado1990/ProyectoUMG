<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EdicionContador.aspx.vb" Inherits="Muni_Antigua.EdicionContador" %>

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
    <script src="Scripts/EdicionContador.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" InitScriptMode="Linked" DirectEventUrl="EdicionContador.aspx" />
        <ext:Panel ID="Panel1"
            runat="server"
            Layout="FormLayout">
            <Items>
                <ext:FormPanel ID="FormMantenimientoContador" runat="server" Title="Mantenimiento de Contadores" Frame="true" BodyPadding="8">
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

                                                <ext:TextField ID="txtMarca" runat="server"
                                                    Name="Marca"
                                                    FieldLabel="Marca"
                                                    Flex="1"
                                                    EmptyText="Marca" TabIndex="1"
                                                    AllowBlank="false" />


                                                <ext:TextField ID="txtModelo" runat="server"
                                                    Name="Modelo"
                                                    FieldLabel="Modelo"
                                                    Flex="1"
                                                    EmptyText="Modelo" TabIndex="2"
                                                    AllowBlank="false" />


                                                <ext:TextField ID="txtNumero" runat="server"
                                                    Name="Numero"
                                                    FieldLabel="Numero"
                                                    Flex="1"
                                                    EmptyText="Número" TabIndex="3"
                                                    AllowBlank="false" />

<%--                                                <ext:TextField ID="txtUbicacion" runat="server"
                                                    Name="Ubicacion"
                                                    FieldLabel="Ubicación"
                                                    Flex="1"
                                                    EmptyText="Ubicación" TabIndex="4"
                                                    AllowBlank="true" />--%>


                                                 <ext:ComboBox ID="cboEstadoContador" runat="server" 
                                                     FieldLabel="Estado" EmptyText="Seleccione Estado"
                                                    ForceSelection="true" ValueField="id_estado_contador" 
                                                     DisplayField="estado_contador" Editable="false" TabIndex="4" 
                                                     AllowBlank="false">
                                                    <Store>
                                                        <ext:Store runat="server" ID="StoreEstadoContador">
                                                            <Model>
                                                                <ext:Model runat="server" ID="ModeloEstadoContador" IDProperty="id_estado_contador">
                                                                    <Fields>
                                                                        <ext:ModelField Name="id_estado_contador" Type="Int" />
                                                                        <ext:ModelField Name="estado_contador" Type="String" />
                                                                    </Fields>
                                                                </ext:Model>
                                                            </Model>
                                                        </ext:Store>
                                                    </Store>

                                                </ext:ComboBox>

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
            </Items>
            <Buttons>
                <ext:Button ID="btnGuardar" runat="server" Text="Guardar" Disabled="true" FormBind="true" Icon="Disk" Width="110">
                    <Listeners>
                        <Click Handler="registrarContador(#{FormMantenimientoContador});" />
                    </Listeners>
                </ext:Button>
                <ext:Button ID="btnCancelar" runat="server" Text="Cancelar" Icon="Cancel" Width="110">
                    <Listeners>
                        <Click Handler="cerrarVentana();" />
                    </Listeners>
                </ext:Button>
            </Buttons>
        </ext:Panel>
    </form>
</body>
</html>
