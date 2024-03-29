export default class Evidencias {

    /**
     * 
     * @param {string} periodo 
     * @returns {Promise}JSON
     */
    static async obtenerEvidencias(periodo,ruta='coordinador') {
        try {
			const consulta = await fetch(`/${ruta}/datos/evidencias?periodo=${periodo}`);
			const resultado = await consulta.json();
			return resultado;
		} catch (error) {
			console.error(error);
		}
    }
     /**
     * 
     * @param {string} periodo 
     * @returns {Promise}JSON
     */
      static async obtenerEvidenciasResposabilidades(periodo) {
        try {
			const consulta = await fetch(`/docente/datos/evidencias?periodo=${periodo}`);
			const resultado = await consulta.json();
			return resultado;
		} catch (error) {
			console.error(error);
		}
    }
    /**
     * 
     * @param {FormData} formData 
     * @returns {Promise}JSON
     */
     static async subirEvidencias(formData) {
        try {
			const consulta = await fetch(`/coordinador/subir/evidencias`,{
                method: 'POST',
                body: formData
            });
			const resultado = await consulta.json();
			return resultado;
		} catch (error) {
			console.error(error);
		}
    }
     /**
     * 
     * @param {FormData} formData 
     * @returns {Promise}JSON
     */
      static async subirEvidenciasDocente(formData) {
        try {
			const consulta = await fetch(`/docente/subir/evidencias`,{
                method: 'POST',
                body: formData
            });
			const resultado = await consulta.json();
			return resultado;
		} catch (error) {
			console.error(error);
		}
    }
     /**
     * 
     * @param {String} periodo 
     * @param {String} idEvidencia
     * 
     * @returns {Promise} Blob
     */
      static async obtenerEvidenciaIndvidual(periodo,idEvidencia,ruta = 'coordinador') {
        const archivos = ['pdf'];
        let files = [];
      try {
      for(let file of archivos){
        const consulta = await fetch(`/${ruta}/listar/${file}/evidencias?periodo=${periodo}&evidencia=${idEvidencia}`);
        const resultado = await consulta.blob();
        files.push(resultado);
      }
			return files;
		} catch (error) {
			console.error(error);
		}
    }
  /**
     * 
     * @param {String} id_evidencias 
     * @returns {Promise}JSON
     */
   static async obtenerEvidenciaDetalle(id_evidencias) {
    try {
    const consulta = await fetch(`/coordinador/detalle/evidencias?id=${id_evidencias}`);
    const resultado = await consulta.json();
    return resultado;
  } catch (error) {
    console.error(error);
  }
  }


/**
     * 
     * @param {string} periodo 
     * @returns {Promise}JSON
     */
 static async obtenerEvidenciasVerificar(periodo) {
  try {
  const consulta = await fetch(`/coordinador/listar/verificacion/evidencias?periodo=${periodo}`);
  const resultado = await consulta.json();
  return resultado;
  } catch (error) {
  console.error(error);
  }
}

  /**
       * 
       * @param {String} id Es el id de la evidencia a buscar 
       * @returns {Promise}JSON
       */
  static async obtenerEvidenciaVerificarDetalle(id) {
    try {
    const consulta = await fetch(`/coordinador/verficar/detalle/evidencias?id=${id}`);
    const resultado = await consulta.json();
    return resultado;
  } catch (error) {
    console.error(error);
  }
  }
   /**
     * 
     * @param {String} periodo Es el id del periodo academico
     * @param {String} id Es id de la evidencia
     * @returns {Promise}JSON
     */
 static async obtenerCalificacionEvidencia(periodo,id) {
    try {
    const consulta = await fetch(`/evaluador/obtener/calificacion?id=${id}&periodo=${periodo}`);
    const resultado = await consulta.json();
    return resultado;
  } catch (error) {
    console.error(error);
  }
  }
  /**
     * 
     * @param {String} periodo Es el id del periodo academico
     * @param {String} id Es id de la evidencia
     * @returns {Promise}JSON
     */
 static async estaCalificadaEvidencia(periodo,id) {
  try {
  const consulta = await fetch(`/evaluador/ver/calificacion?id=${id}&periodo=${periodo}`);
  const resultado = await consulta.json();
  return resultado;
  } catch (error) {
    console.error(error);
  }
  }
}
