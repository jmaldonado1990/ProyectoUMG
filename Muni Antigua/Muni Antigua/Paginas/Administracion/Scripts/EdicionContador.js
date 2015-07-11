var cerrarVentana = function (btn) {
    window.parent.cerrarVentanaContador();
},


registrarContador = function (form) {
    if (form.isValid()) {
        var marca = App.txtMarca.value;
        var modelo = App.txtModelo.value;
        var numero = App.txtNumero.value;
        var estado = App.cboEstadoContador.value;
        App.direct.grabarContador(marca, modelo, numero, estado,
      {
          success: function (result) {
              if (result > 0) {
                  //alert(result);
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