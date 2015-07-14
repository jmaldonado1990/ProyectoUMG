var cerrarVentana = function (btn) {
    window.parent.cerrarVentanaLectura();
},

ObtenerPersona = function () {
    if (App.cboContador.value != null) {
        var id_contador = App.cboContador.getValue();
        App.direct.llenarDatosPersona(id_contador);
    }
},


registrarLectura = function (form) {
    if (form.isValid()) {
        var fecha_inicio = App.txtFechaInicio.value;
        var fecha_fin = App.txtFechaFin.value;
        var lectura_actual = App.txtLecturaActual.value;
        var id_contador = App.cboContador.value;
        App.direct.grabarLectura(fecha_inicio, fecha_fin, lectura_actual, id_contador,
            {
                success: function (result) {
                    if (result > 0) {
                        Ext.MessageBox.show({
                            title: 'Exitoso!',
                            msg: 'Registro Grabado Exitosamente..!',
                            width: 300,
                            buttons: Ext.MessageBox.OK,
                            fn: cerrarVentana,
                            icon: Ext.MessageBox.INFO
                        });
                    }
                    else {
                        Ext.MessageBox.show({
                            title: 'Cuidado!',
                            msg: 'El Registro No Se Grabó, Falló La Operación..!!',
                            width: 300,
                            buttons: Ext.MessageBox.OK,
                            icon: Ext.MessageBox.ERROR
                        });
                    };
                }
            });
    }
};