var ejecutarConsulta = function () {
    App.direct.llenarGridVecinos();
},

cerrarVentanaVecinos = function () {
    ejecutarConsulta();
    App.WindowEdicionVecino.close();
},

AgregarNuevoContador = function () {
    App.direct.crearVentanaEdicionContador('nuevo', 0);
},

Filtrar = function (columna) {
    var store = App.gridListadoVecinos.getStore();
    store.filterBy(ObtenerFiltro(columna));

},
ObtenerFiltro = function (columna) {
    var f = [];
    f.push({
        filter: function (record) {
            if (columna == 'dpi')
                return filtrarCadena(App.txtFiltroDPI.value || "", columna, record);
            if (columna == 'nombre')
                return filtrarCadena(App.txtFiltroNombre.value || "", columna, record);
            if (columna == 'apellido')
                return filtrarCadena(App.txtFiltroApellido.value || "", columna, record);
            if (columna == 'telefono')
                return filtrarCadena(App.txtFiltroTelefono.value || "", columna, record);
            if (columna == 'email')
                return filtrarCadena(App.txtFiltroCorreo.value || "", columna, record);

        }


    });
    var len = f.length;

    return function (record) {
        for (var i = 0; i < len; i++) {
            if (!f[i].filter(record)) {
                return false;
            }
        }
        return true;
    };
},

filtrarCadena = function (value, dataIndex, record) {
    var val = record.get(dataIndex);

    if (typeof val != "string") {
        return value.length == 0;
    }

    return val.toLowerCase().indexOf(value.toLowerCase()) > -1;
};


