var ejecutarConsulta = function () {
    App.direct.llenarGridLecturas();
},


cerrarVentanaLectura = function () {
    ejecutarConsulta();
    App.WindowEdicionLectura.close();
},

AgregarNuevoLectura = function () {
    App.direct.crearVentanaEdicionLectura('nuevo', 0);
};