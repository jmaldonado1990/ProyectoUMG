<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EdicionPersona.aspx.vb" Inherits="Muni_Antigua.EdicionPersona" %>

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
    <script src="Scripts/EdicionPersona.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" InitScriptMode="Linked" DirectEventUrl="EdicionPersona.aspx" />
        <ext:Panel ID="Panel1"
            runat="server"
            Layout="FormLayout">
            <Items>
                <ext:FormPanel ID="FormMantenimientoPersona" runat="server" Title="Mantenimiento Vecinos" Frame="true" BodyPadding="8">
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
                                                <ext:TextField ID="txtDPI"
                                                    runat="server"
                                                    FieldLabel="DPI"
                                                    Name="dpi"
                                                    Flex="1"
                                                    MaskRe="[\d\-]" TabIndex="1"
                                                    Regex="^\d{13}$" MaxLength="13" EnforceMaxLength="true"
                                                    AllowBlank="true" EmptyText="DPI">
                                                </ext:TextField>


                                                <ext:TextField ID="txtNombres" runat="server"
                                                    Name="Nombres"
                                                    FieldLabel="Nombres"
                                                    Flex="1"
                                                    EmptyText="Nombres" TabIndex="2"
                                                    AllowBlank="false" />


                                                <ext:TextField ID="txtApellidos" runat="server"
                                                    Name="Apellidos"
                                                    FieldLabel="Apellidos"
                                                    Flex="1"
                                                    EmptyText="Apellidos" TabIndex="3"
                                                    AllowBlank="false" />


                                                <ext:TextField ID="txtDireccion" runat="server"
                                                    Name="Direccion"
                                                    FieldLabel="Dirección"
                                                    Flex="1"
                                                    EmptyText="Dirección" TabIndex="4"
                                                    AllowBlank="false" />


                                                <ext:TextField ID="txtTelefono"
                                                    runat="server"
                                                    FieldLabel="Teléfono"
                                                    Name="telefono"
                                                    Flex="1"
                                                    MaskRe="[\d\-]" TabIndex="5"
                                                    Regex="^\d{8}$" MaxLength="8" EnforceMaxLength="true"
                                                    AllowBlank="true" EmptyText="Teléfono" />


                                                <ext:TextField ID="txtEmail"
                                                    runat="server"
                                                    FieldLabel="Correo Electrónico"
                                                    EmptyText="Email"
                                                    Flex="1"
                                                    AllowBlank="true" TabIndex="6"
                                                    Regex="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" />


                                                <ext:ComboBox ID="cboGenero" runat="server"
                                                    FieldLabel="Activo:"
                                                    Resizable="false" MultiSelect="false"
                                                    Editable="false" EmptyText="Genero" TabIndex="7">
                                                    <Items>
                                                        <ext:ListItem Index="0" Value="0" Text="Femenino" Mode="Raw" />
                                                        <ext:ListItem Index="1" Value="1" Text="Masculino" Mode="Raw" />
                                                    </Items>
                                                </ext:ComboBox>

                                                <%-- <ext:DateField runat="server" ID="dtFecha" Text="Fecha Nacimiento" 
                                                    Vtype="daterange" FieldLabel="Fecha Nacimiento" EnableKeyEvents="true">
                                                    <CustomConfig>
                                                        <ext:ConfigItem Name="endDateField" Value="dtFecha" Mode="Value" />
                                                    </CustomConfig>
                                                </ext:DateField>--%>

                                                <ext:DateField ID="dtFecha" runat="server"
                                                    FieldLabel="Fecha Nacimiento" Name="fecha"
                                                    Flex="1" TabIndex="8" Vtype="daterange"
                                                    AllowBlank="false" EmptyText="Fecha Nacimiento" />
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
                        <Click Handler="registrarVecino (#{FormMantenimientoPersona});" />
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
