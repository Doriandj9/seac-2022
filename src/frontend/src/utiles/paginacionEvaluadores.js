/**
 * 
 * @param {*} datos Son los datos como array
 * @param {*} divicionDatos Es el numero de elementos que desean que se presente
 * @param {*} numeroActual Es el numero que se encuentran los datos
 * @param {*} tbody Es el contenedor de las filas del cuerpo de la tabla
 * @param {*} contNumeros Es el contenedor de los numeros para la selecion de paginacion
 * @param {CallableFunction} funcionRefrescar Sirve para refrescar los botonos del tbody
 * @param {string} columnaBusqueda Es la columna que va servir para buscar las coindencias dentro de los datos
 * @param {string} valor Es el coincidencia que a buscar en la columna
 * 
 * @return {*} void
 */
export function paginacionEvaluadores(datos,divicionDatos,numeroActual,tbody,contNumeros,funcionRefrescar = null,columnaBusqueda = null,valor=null){
    const total  = datos.length;
    const fracion = divicionDatos;
    const totalNumeros = Math.ceil((total / fracion));
    let comparacion = numeroActual; // Toma el numero que esta selecionado al momento de darle click
    let numerosUI = []; // Son los numeros en botones para darles click y realize la paginacion
    let inicio = (numeroActual - 1) * divicionDatos; 
    let fin = inicio + divicionDatos;
    let datosPaginados = datos.slice(inicio,fin);
    let html = '';
    if(columnaBusqueda && valor){
        if(!Object.keys(datos[0]).includes(columnaBusqueda)) throw new Error('El objeto no contiene la columna: ' + columnaBusqueda + ' en el objeto');
        datosPaginados = datosPaginados.filter(dato => dato[columnaBusqueda].toLowerCase().includes(valor.toLowerCase()));
    }

    datosPaginados.forEach((dato,i) => {
        const nombre = [...new Set(dato.nombre_docente?.split('---'))];
        const carrera_perteneciente = [...new Set(dato.carrera_perteneciente?.split('---'))];
        const apellido = [...new Set(dato.apellido?.split('---'))];
        const correo = [...new Set(dato.correo?.split('---'))];
        const fecha_inicial = [...new Set(dato.fecha_inicial?.split('---'))];
        const fecha_final = [...new Set(dato.fecha_final?.split('---'))];
        const carrera = [...new Set(dato.nombre_carrera?.split('---'))].filter(carr => carr.trim() !== carrera_perteneciente.toLocaleString().trim())
        html += `
        <tr>
        <td>${dato.id_docente}</td>
        <td>${nombre.toString().split(' ')[0] + ' ' + apellido.toString().split(' ')[0]}</td>
        <td>${correo.toString()}</td>
        <td>${fecha_inicial.toString()}</td>
        <td>${fecha_final.toString()}</td>
        <td>${carrera.toString()}</td>
      </tr>
        `;;
    })
    
    for(let i = 1 ; i <= totalNumeros ; i++){
        const button = document.createElement('button');
        button.textContent = i;
        if(i === comparacion) button.classList.add('active'); // Si el numero actual es igual que el del boton ese
        button.addEventListener('click',() => { // boton esta selecionado 
                 paginacionEvaluadores(datos,divicionDatos,i,tbody,contNumeros,funcionRefrescar);
                 if(funcionRefrescar) funcionRefrescar();
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
}


/**
 * 
 * @param {*} datos Son los datos como array
 * @param {*} divicionDatos Es el numero de elementos que desean que se presente
 * @param {*} numeroActual Es el numero que se encuentran los datos
 * @param {*} tbody Es el contenedor de las filas del cuerpo de la tabla
 * @param {*} contNumeros Es el contenedor de los numeros para la selecion de paginacion
 * @param {CallableFunction} funcionRefrescar Sirve para refrescar los botonos del tbody
 * @param {string} columnaBusqueda Es la columna que va servir para buscar las coindencias dentro de los datos
 * @param {string} valor Es el coincidencia que a buscar en la columna
 * 
 * @return {*} void
 */
export function paginacionEvaluadoresInsertar(datos,divicionDatos,numeroActual,tbody,contNumeros,funcionRefrescar = null,columnaBusqueda = null,valor=null){
    const total  = datos.length;
    const fracion = divicionDatos;
    const totalNumeros = Math.ceil((total / fracion));
    let comparacion = numeroActual; // Toma el numero que esta selecionado al momento de darle click
    let numerosUI = []; // Son los numeros en botones para darles click y realize la paginacion
    let inicio = (numeroActual - 1) * divicionDatos; 
    let fin = inicio + divicionDatos;
    let datosPaginados = datos.slice(inicio,fin);
    let html = '';
    if(columnaBusqueda && valor){
        if(!Object.keys(datos[0]).includes(columnaBusqueda)) throw new Error('El objeto no contiene la columna: ' + columnaBusqueda + ' en el objeto');
        datosPaginados = datosPaginados.filter(dato => dato[columnaBusqueda].toLowerCase().includes(valor.toLowerCase()));
    }

    datosPaginados.forEach((dato,i) => {
        const nombre = [...new Set(dato.nombre_docente?.split('---'))];
        const carrera_perteneciente = [...new Set(dato.carrera_perteneciente?.split('---'))];
        const apellido = [...new Set(dato.apellido?.split('---'))];
        const correo = [...new Set(dato.correo?.split('---'))];
        const fecha_inicial = [...new Set(dato.fecha_inicial?.split('---'))];
        const fecha_final = [...new Set(dato.fecha_final?.split('---'))];
        const carrera = [...new Set(dato.nombre_carrera?.split('---'))].filter(carr => carr.trim() !== carrera_perteneciente.toLocaleString().trim())
        html += `
        <tr>
        <td>${dato.id_docente}</td>
        <td>${nombre.toString().split(' ')[0] + ' ' + apellido.toString().split(' ')[0]}</td>
        <td>${correo.toString()}</td>
        <td>${carrera_perteneciente.toString()}</td>
        <td class="text-center"><input type="checkbox" name="docente" value="${dato.id_docente}"></td>
      </tr>
        `;;
    })
    
    for(let i = 1 ; i <= totalNumeros ; i++){
        const button = document.createElement('button');
        button.textContent = i;
        if(i === comparacion) button.classList.add('active'); // Si el numero actual es igual que el del boton ese
        button.addEventListener('click',() => { // boton esta selecionado 
                 paginacionEvaluadoresInsertar(datos,divicionDatos,i,tbody,contNumeros,funcionRefrescar);
                 if(funcionRefrescar) funcionRefrescar();
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
}