$(document).ready(function () {
    /*EJECUTARSE TODO LO QUE AGREGAMOS EN ESTA PARTE*/

    $('#btnAbrirNCategoria').click(function () {
        $('#txtNombreCategoriaER').val("");
        $('.error-validation').fadeOut();
        $('#actionCategoria').val("addCategoria");
        $('#tituloModalManCategoria').html("REGISTRAR CATEGORÍA");
        $('#ventanaModalManCategoria').modal("show");
    });

    $('#FrmCategoria').submit(function () {
        $('#actionCategoria').val("paginarCategoria");
        $('#nameFormCategoria').val("FrmCategoria");
        $('#numberPageCategoria').val("1");
        $('#modalCargandoCategoria').modal("show");
        return false;
    });

    $('#FrmCategoriaModal').submit(function () {
        if (validarFormularioCategoria()) {
            $('#nameFormCategoria').val("FrmCategoriaModal");
            $('#modalCargandoCategoria').modal("show");
        }
        return false;
    });

    $('#modalCargandoCategoria').on('shown.bs.modal', function () {
        processAjaxCategoria();
    });

    addEventsCombosPaginar();
    addValidacionesFormularioCategoria();

    $('#modalCargandoCategoria').modal("show");

});

function processAjaxCategoria() {
    var datosSerializadosCompletos = $('#' + $('#nameFormCategoria').val()).serialize();
    if ($('#nameFormCategoria').val().toLowerCase() !== "frmcategoria") {
        datosSerializadosCompletos += "&txtNombreCategoria=" + $('#txtNombreCategoria').val();
    }
    datosSerializadosCompletos += "&numberPageCategoria=" + $('#numberPageCategoria').val();
    datosSerializadosCompletos += "&sizePageCategoria=" + $('#sizePageCategoria').val();
    datosSerializadosCompletos += "&action=" + $('#actionCategoria').val();
    $.ajax({
        url: 'categorias',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoCategoria').modal("hide");
            if ($('#actionCategoria').val().toLowerCase() === "paginarcategoria") {
                listarCategoria(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $('#ventanaModalManCategoria').modal("hide");
                    listarCategoria(jsonResponse.BEAN_PAGINATION);
                    viewAlert('Operación realizada con éxito', 'success');
                } else {
                    viewAlert(jsonResponse.MESSAGE_SERVER, 'warning');
                }
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#modalCargandoCategoria').modal("hide");
            console.log("Error de llamada ajax " + errorThrown);
            viewAlert('Error interno en el servidor', 'error');
        }

    });
}

function listarCategoria(BEAN_PAGINATION) {
    var $pagination = $('#paginationCategoria');
    $('#tbodyCategoria').empty();
    $pagination.twbsPagination('destroy');
    $('#nameCrudCategoria').html("[ " + BEAN_PAGINATION.COUNT_FILTER + " ] CATEGORIAS");
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var atributos;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            //console.log(value);
            fila = "<tr ";
            atributos = "idcategoria='" + value.idcategoria + "' ";
            atributos += "nombre='" + value.nombre + "' ";
            fila += atributos;
            fila += ">";
            fila += "<td>" + value.nombre + "</td>";
            fila += "<td class='text-center'><button class='btn btn-secondary btn-xs editar-categoria'><i class='fa fa-edit'></i></button></td>";
            fila += "<td class='text-center'><button class='btn btn-secondary btn-xs eliminar-categoria'><i class='fa fa-trash'></i></button></td>";
            fila += "</tr>";
            $('#tbodyCategoria').append(fila);
        });
        //AGREGAMOS LOS BOTONES DE LA PAGINACION
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageCategoria'),
                $('#numberPageCategoria'), $('#actionCategoria'), "paginarCategoria",
                $('#nameFormCategoria'), 'FrmCategoria', $('#modalCargandoCategoria'));
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        addEventsButtonsCategoria();
        $('#txtNombreCategoria').focus();
    } else {
        viewAlert('No se encontraron registros', 'warning');
    }
}

function addEventsButtonsCategoria() {
    $('.editar-categoria').each(function (index, value) {
        $(this).click(function () {
            $('#txtIdCategoriaER').val($(this.parentElement.parentElement).attr('idcategoria'));
            $('#txtNombreCategoriaER').val($(this.parentElement.parentElement).attr('nombre'));
            $('#tituloModalManCategoria').html("EDITAR CATEGORÍA");
            $('#actionCategoria').val("updateCategoria");
            $('#ventanaModalManCategoria').modal("show");
        });
    });

    $('.eliminar-categoria').each(function (index, value) {
        $(this).click(function () {
            $('#txtIdCategoriaER').val($(this.parentElement.parentElement).attr('idcategoria'));
            viewAlertDelete('Categoria');
        });
    });
}

function addValidacionesFormularioCategoria() {
    $('#txtNombreCategoriaER').on('change', function () {
        $(this).val() === "" ? $('#validarNombreCategoriaER').fadeIn('slow') : $('#validarNombreCategoriaER').fadeOut();
    });
}

function validarFormularioCategoria() {
    if ($('#txtNombreCategoriaER').val() === "") {
        $('#validarNombreCategoriaER').fadeIn('slow');
        return false;
    } else {
        $('#validarNombreCategoriaER').fadeOut();
    }
    return true;
}
