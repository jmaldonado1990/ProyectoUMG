var EjecutarConsulta = function () {
    if (App.txtNumero.value != null)
    {
        var numero = App.txtNumero.value;
        App.direct.llenarGridPagosAgua(numero);
    }
    
};