<h3 class="text-center">Actualizar Datos de los Docentes</h3>
<p>
Esta sección le permitirá modificar la información de los docentes ya existentes en la base de datos,
mediante un archivo csv extraido desde la base del SI@NET, una vez dentro de la base de datos
puede utilizar el siguiente comando para generar el archivo <pre class="terminal tipografia-times-1">
copy public.docente (ci_doc, nombres_doc, apellidos_doc, celular, nick) TO '/ruta/nombre_archivo.csv' DELIMITER ',' CSV HEADER QUOTE '\' ESCAPE '''';</pre>
Una vez que se haya seleccionado el archivo csv que contendra los datos de los docentes, se podrá hacer click en el
botón para guardar los cambios y actualizar la información de los docente en la base de datos..
</p>
<div class="desborde-auto barra-personalizada padding-all-1">
    <form>
    <table class="table table-striped-columns w-100 sombra m-0">
            <thead>
                <tr class="titulo-tablas">
                    <th colspan="4">
                        <div class="d-flex align-items-center gap-1">
                        <span class="material-icons">&#xe7fe;</span>
                        <strong>Formulario para actualizar los datos</strong>
                        </div>
                    </th>
                </tr>
            </thead>
        </table>
            <div class="w-100 sombra m-0 pt-2 pb-4">
                <div class="text-center mb-3">
                        <label for=""><strong>Selecione el archivo csv</strong></label>
                </div>
                <div class="w-75 d-flex justify-content-center m-auto">
                    <div class="w-50 contenedor-nombre-archivo mb-4">
                    <span id="nombre-archivo"></span>
                    <button type="button" class="boton boton-enviar is-hover-boton-enviar d-flex aling-items-center justify-content-center m-auto gap-flex-1 w-50">
                        <label for="file" class="d-flex aling-items-center justify-content-center">
                        <span class="material-icons text-white">&#xe2c7;</span>
                            Examinar ... 
                        </label>
                    </button>
                    <input type="file" accept=".csv" id="file" name="file" class="d-none">
                    </div>
                </div>
                <button type="submit" class="mt-4 d-block boton boton-enviar is-hover-boton-enviar p-2 d-flex aling-items-center justify-content-center m-auto gap-flex-1 w-25">
                    <span class="material-icons text-white">&#xe161;</span>
                    Guardar 
                    </button>
            </div>
            </form>
</div>
<div class="desborde-auto barra-personalizada padding-all-1">

    <table class="table table-striped-columns w-100 sombra m-0">
            <thead>
                <tr class="titulo-tablas">
                    <th colspan="4">
                        <div class="d-flex align-items-center gap-1">
                        <span class="material-icons">&#xe7fe;</span>
                        <strong>Lista de Errores</strong>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody id="errores">
                
            </tbody>
        </table>
</div>