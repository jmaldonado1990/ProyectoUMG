<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EdicionPersona.aspx.vb" Inherits="Muni_Antigua.EdicionPersona" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="Scripts/edicion-bancos-material.js"></script>
        <link href="../../Css/generales.css" rel="stylesheet" />
        <title></title>
</head>
<body>
   <script src="Scripts/EdicionPersona.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:Panel ID="Panel1" runat="server" Layout="FormLayout">
            <Items>
                <ext:FormPanel ID="panelMantenimientoPersona" runat="server" Title="" Frame="true" BodyPadding="8">
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
                                                    AllowBlank="true">
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
                                                    FieldLabel="Número Teléfonico"
                                                    Name="phone"
                                                    Flex="1" TabIndex="5"
                                                    EmptyText="Télefono"
                                                    MaskRe="[\d\-]"
                                                    Regex="^\d{8}$" MaxLengthText="8" MaxLength="8" EnforceMaxLength="true"
                                                    AllowBlank="true">
                                                </ext:TextField>
                                                <ext:TextField ID="txtEmail"
                                                    runat="server"
                                                    FieldLabel="Correo Electrónico"
                                                    Name="email"
                                                    Vtype="email"
                                                    Flex="1" TabIndex="6"
                                                    AllowBlank="true">
                                                </ext:TextField>
                                                <ext:ComboBox ID="cboGenero" runat="server"
                                                    FieldLabel="Género:"
                                                    EmptyText="Seleccione..."
                                                    Resizable="false"
                                                    MultiSelect="false"
                                                    Editable="false"
                                                    TabIndex="7">
                                                    <Items>
                                                        <ext:ListItem Index="0" Value="0" Text="Femenino" Mode="Raw" />
                                                        <ext:ListItem Index="1" Value="1" Text="Masculino" Mode="Raw" />
                                                    </Items>
                                                </ext:ComboBox>
                                                <ext:DateField ID="dtFechaNac" runat="server"
                                                    X="400" Y="130" Width="275"
                                                    LabelWidth="170"
                                                    Vtype="daterange"
                                                    FieldLabel="Fecha Nacimiento"
                                                    AllowBlank="true"
                                                    EnableKeyEvents="true"
                                                    TabIndex="8">
                                                </ext:DateField>
                                            </Items>
                                        </ext:Container>
                                    </Items>
                                </ext:FieldContainer>
                            </Items>
                        </ext:FieldSet>

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
                <ext:Button ID="btnGuardar" runat="server" Text="Guardar" Disabled="false" FormBind="true" Icon="Disk" Width="110" AutoLoadingState="true">
                    <Listeners>
                         <Click Handler="registrarVecino(#{panelMantenimientoPersona});" />
                    </Listeners>
                </ext:Button>
                <ext:Button ID="btnCancelar" runat="server" Text="Cancelar" Icon="Cancel" Width="110">
                    <Listeners>
                        <%-- <Click Handler="(#{panelMantenimientoPersona}.reset())" />--%>
                    </Listeners>
                </ext:Button>
            </Buttons>
        </ext:Panel>
    </form>
</body>
</html>
