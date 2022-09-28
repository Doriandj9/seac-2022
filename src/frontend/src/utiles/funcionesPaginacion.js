import { scriptEditarPeriodoAcademico } from "../pages/admin/cicloAcademico.js";

/**
 * 
 * @param {*} datos Son los datos como array
 * @param {*} divicionDatos Es el numero de elementos que desean que se presente
 * @param {*} numeroActual Es el numero que se encuentran los datos
 * @param {*} tbody Es el contenedor de las filas del cuerpo de la tabla
 * @param {*} contNumeros Es el contenedor de los numeros para la selecion de paginacion
 * 
 * @return {*} void
 */
export function paginacionCicloAcademico(datos,divicionDatos,numeroActual,tbody,contNumeros){
    const total  = datos.length;
    const fracion = divicionDatos;
    const totalNumeros = Math.ceil((total / fracion));
    let comparacion = numeroActual; // Toma el numero que esta selecionado al momento de darle click
    let numerosUI = []; // Son los numeros en botones para darles click y realize la paginacion
    let inicio = (numeroActual - 1) * divicionDatos; 
    let fin = inicio + divicionDatos;
    const datosPaginados = datos.slice(inicio,fin);
    let html = '';
    datosPaginados.forEach((dato,i) => {
        html += `<tr>
            <td>
            ${dato.id}
            </td>
            <td>
            ${dato.fecha_inicial}
            </td>
            <td>
                ${dato.fecha_final}
            </td>
            <td class="d-flex justify-content-center">
                <button type="button" class="boton boton-enviar is-hover-boton-enviar p-2 d-flex aling-items-center gap-flex-1"
                data-bs-toggle="modal" data-bs-target="#modalCiclo${i}">
                <span class="material-icons text-white">&#xe3c9;</span>
                Editar 
                </button>
                ${obtenerModal(i,dato)}
            </td>
        </tr>`;
    })
    
    for(let i = 1 ; i <= totalNumeros ; i++){
        const button = document.createElement('button');
        button.textContent = i;
        if(i === comparacion) button.classList.add('active'); // Si el numero actual es igual que el del boton ese
        button.addEventListener('click',() => { // boton esta selecionado 
                 paginacionCicloAcademico(datos,divicionDatos,i,tbody,contNumeros);
                 scriptEditarPeriodoAcademico();
            }
        );
        numerosUI.push(button);
    }
    tbody.innerHTML = '';
    contNumeros.innerHTML = '';
    tbody.innerHTML = html;
    if(totalNumeros <= 1 ) return; // Esto retorna sin rendirazar el numero uno de paginacion si solo contiene 1 num
    numerosUI.forEach(numero => {
                contNumeros.append(numero);
            });
    

    /**
     * Es una funcion local que regresa un modal para cada periodo academico
     * y se rendiriza de manera oculta en el DOOM
     * 
     * @param {Number} id Es el id que va tener el modal para poder motrarse una vez que se da click al boton
     * @param {JSON} dato Son los datos del periodo academico que luego se podra editar en el modal
     * @returns {string} modal
     */
    function obtenerModal(id,dato){
        const modal = `
        <!-- Modal Bootstrap -->
        <form>
        <div class="modal fade" id="modalCiclo${id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Periodo Académico ${dato.id}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
        <!-- Formulario -->
        
              <div class="mb-3 row">
              <label for="staticEmail" class="col-sm-2 col-form-label">Periodo Académico</label>
              <div class="col-sm-10">
                <input type="hidden" name="id" value="${dato.id}">
                <input type="text" name="id_editado" class="form-control-plaintext" id="staticEmail" value="${dato.id}">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="fecha_inicial" class="col-sm-2 col-form-label">Fecha Inicial</label>
              <div class="col-sm-10">
                <input type="date" name="fecha_inicial" class="form-control" value="${dato.fecha_inicial}" id="fecha_inicial">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="fecha_final" class="col-sm-2 col-form-label">Fecha Final</label>
              <div class="col-sm-10">
                <input type="date" name="fecha_final" value="${dato.fecha_final}" class="form-control" id="fecha_final">
              </div>
            </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary text-white">Guardar Cambios</button>
              </div>
            
            </div>
          </div>
        </div>
        </form>
        `;
        return modal;
    }
}

