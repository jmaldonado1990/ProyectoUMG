<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EdicionLectura.aspx.vb" Inherits="Muni_Antigua.EdicionLectura" %>

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
     <script src="Scripts/EdicionLectura.js" type="text/javascript"></script>
   <form id="form1" runat="server">
        <div>
            <ext:ResourceManager ID="ResourceManager1" runat="server" InitScriptMode="Linked" DirectEventUrl="EdicionLectura.aspx" />
            <ext:Viewport ID="ViewPort" runat="server" Layout="FitLayout">
                <Items>

                   <ext:FormPanel ID="FormMantenimientoLectura" runat="server" Title="" Frame="true" BodyPadding="8">
                        <Defaults>
                            <%--<ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />--%>
                            <ext:Parameter Name="MsgTarget" Value="side" />
                        </Defaults>

                        <Items>

                            <ext:TextField ID="txtNumero" runat="server" X="50" Y="80" FieldLabel="DPI" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="false" Name="DPI" EmptyText="Numero Contador" TabIndex="1" Flex="1" />

                            <ext:Button ID="btnEjecutarConsulta" runat="server" X="330" Y="-30" Width="80" Text="" TabIndex="2"
                            Icon="Reload" OnClientClick="ejecutarConsulta();" Flex="1" />   

                              <ext:TextField ID="lblNombres" runat="server" X="50" Y="-30" FieldLabel="Nombres:" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Disabled="true" TabIndex="3" Flex="1"/>

                            <ext:TextField ID="lblApellidos" runat="server" X="50" Y="140" FieldLabel="Apellidos:" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Disabled="true" TabIndex="4" Flex="1" />

                            <ext:DateField ID="dtFechaInicio" runat="server" FieldLabel="Fecha Inicio" Name="fecha_inicio" Flex="1" TabIndex="5" Vtype="daterange"
                             AllowBlank="false" EmptyText="Fecha Inicio" X="50" Y="140" LabelAlign="Right" LabelWidth="85" />

                           <ext:DateField ID="dtFechaFin" runat="server" FieldLabel="Fecha Fin" Name="fecha_fin" Flex="1" TabIndex="6" Vtype="daterange"
                             AllowBlank="false" EmptyText="Fecha Inicio" X="50" Y="140" LabelAlign="Right" LabelWidth="85" />


                              <ext:TextField ID="txtLecturaActual" runat="server" X="30" Y="170" FieldLabel="Lec Actual" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="false" Disabled="false" Flex="1" TabIndex="7" />

                             <ext:TextField ID="txtLecturaAnterior" runat="server" X="30" Y="170" FieldLabel="Lec Anterior" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="false" Disabled="false" Flex="1" TabIndex="7" Enabled="false" />

                            <ext:TextField ID="txtIdContador" runat="server" X="30" Y="500" FieldLabel="Id_Contador" LabelWidth="85"
                                Width="300" LabelAlign="Right" AllowBlank="true" Hidden="true" />




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
                                    <Click Handler="registrarLectura(#{FormMantenimientoLectura});" />
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
