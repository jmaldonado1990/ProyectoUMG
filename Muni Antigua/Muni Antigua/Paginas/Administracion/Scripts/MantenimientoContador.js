var ejecutarConsulta = function () {
    App.direct.llenarGridContadores();
},

cerrarVentanaContador = function () {
    ejecutarConsulta();
    App.WindowEdicionContador.close();
},

cerrarVentanaAsignacion = function () {
    ejecutarConsulta();
    App.WindowEdicionAsignacion.close();
},

AgregarNuevoContador = function () {
    App.direct.crearVentanaEdicionContador('nuevo', 0);
},

ejecutarComandoContador = function (command, record) {
    switch (command) {
        case 'Asignar':
            App.direct.crearVentanaAsignacionContador('asignar', record);
            break;
    }
},

Filtrar = function (columna) {
    var store = App.gridListadoContadores.getStore();
    store.filterBy(ObtenerFiltro(columna));

},

ObtenerFiltro = function (columna) {
    var f = [];
    f.push({
        filter: function (record) {
            if (columna == 'marca')
                return filtrarCadena(App.txtFiltroMarca.value || "", columna, record);
            if (columna == 'modelo')
                return filtrarCadena(App.txtFiltroModelo.value || "", columna, record);
            if (columna == 'numero')
                return filtrarCadena(App.txtFiltroNumero.value || "", columna, record);
            if (columna == 'direccion')
                return filtrarCadena(App.txtFiltroDireccion.value || "", columna, record);
            if (columna == 'estado')
                return filtrarCadena(App.txtFiltroEstado.value || "", columna, record);

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
},

//prepareToolbarContadores = function (grid, toolbar, rowIndex, record) {
//    var button = toolbar.items.get(1);
//    if (record.data.permite_acreditar > 0) {
//        button.hide();
//    }
//};

prepareToolbarContadores = function (grid, toolbar, rowIndex, record) {
    var button = toolbar.items.get(1);
    if (record.data.estado == "Asignado") {
        button.hide();
    }
};


