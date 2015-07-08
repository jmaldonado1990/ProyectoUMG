registrarVecino = function (form) {
    if (form.isValid()) {
        var dpi = App.txtDPI.value;
        var nombres = App.txtNombres.value;
        var apellidos = App.txtApellidos.value;
        var direccion = App.txtDireccion.value;
        var telefono = App.txtTelefono.value;
        var email = App.txtEmail.value;
        var genero= App.cboGenero.value;
        var fech_nac = App.dtFechaNac.value;
        App.direct.grabarVecino(dpi, nombres, apellidos, direccion, telefono, email, genero, fech_nac,
            {
                success: function (result) {
                    if (result > 0) {
                        Ext.MessageBox.show({
                            title: 'Exitoso!',
                            msg: 'Registro Grabado Exitosamente',
                            width: 300,
                            buttons: Ext.MessageBox.OK,
                            fn: cerrarVentana,
                            icon: Ext.MessageBox.QUESTION
                        });
                    }
                    else {
                        Ext.MessageBox.show({
                            title: 'Cuidado!',
                            msg: 'El registro no se grabó, falló la operación',
                            width: 300,
                            buttons: Ext.MessageBox.OK,
                            icon: Ext.MessageBox.QUESTION
                        });
                    };
                }
            });
    }
};