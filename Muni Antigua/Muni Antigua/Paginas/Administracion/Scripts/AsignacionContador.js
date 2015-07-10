var cerrarVentana = function (btn) {
    window.parent.cerrarVentanaAsignacion();
};


ejecutarConsulta = function () {
    var dpi = App.txtDPI.value;
    App.direct.obtenerRegistroPersona(dpi);
};

registrarAsignacion = function (form) {
    alert(1);
    if (form.isValid()) {
        var accion = 'U';
        var id_contador = App.lblIdContador.value;
        var direccion = App.txtDireccion.value;
        var id_persona = App.lblIdPersona.value;
        alert(id_contador);
        App.direct.grabarAsignacionContador(accion, id_contador, direccion, id_persona,
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
