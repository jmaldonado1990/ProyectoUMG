var cerrarVentana = function (btn) {
    window.parent.cerrarVentanaVecinos();
},


registrarVecino = function (form) {
    if (form.isValid()) {
        var dpi = App.txtDPI.value;
        var nombres = App.txtNombres.value;
        var apellidos = App.txtApellidos.value;
        var direccion = App.txtDireccion.value;
        var telefono = App.txtTelefono.value;
        var email = App.txtEmail.value;
        var genero = App.cboGenero.value;
        var fecha_nacimiento = App.dtFecha.value;
        App.direct.grabarVecino(nombres, apellidos, direccion, telefono, email, dpi, genero, fecha_nacimiento,
            {
                success: function (result) {
                    if (result > 0) {
                        alert(result);
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