export default class Usuarios {
	DOCENTES = 1;
	DIRECTOR_PLANEAMIENTO = 2;
	COORDINADORES = 4;
	EVALUADOR = 8;
	ARMINISTRADOR = 16;
	async verificacionCredenciales(formData) {
		try {
			const consulta = await fetch("/", { method: "POST", body: formData });
			if (consulta.headers.get("Content-Type") !== "application/json")
				throw new Error("Error no esta resiviendo un JSON");
			const resultado = await consulta.json();
			return resultado;
		} catch (error) {
			console.error(error);
		}
	}

	 /**
	 * 
	 * @param {int|string} id_usuario es el id de un usurio por ejemplplo del coordinador,docente,etc.
	 * @param {string} id_docente es el id del docente 
	 * @returns {Promise} JSON
 	*/
	  static async getCarrerasPorUsuario(id_usuario,id_docente){
        try{
            const formData = new FormData();
            formData.append('id_usuarios',id_usuario);
            formData.append('id_docente',id_docente); 
            const headersPeticion = new Headers();
            if(localStorage.Tok_){
                headersPeticion.append('token_autorizacion',localStorage.Tok_);
            }

            const consulta = await fetch(
                '/datos/carreras/usuario',
                {
                    method:'POST',
                    headers:headersPeticion,
					body:formData
                }
                );
            const respuesta = await consulta.json();
            return respuesta;            
        }catch(e){
            console.error(e);
        }
    }
	/**
	 * 
	 * @param {int|string} permiso es el numero del permiso por ejemplo del coordinador,docente,etc.
	 * @param {string} carrera es el id del docente
	 * @returns {Promise} JSON
 	*/
	 static async sendOpciones(permiso,carrera){
        try{
            const formData = new FormData();
            formData.append('permiso',permiso);
            formData.append('carrera',carrera); 
            const headersPeticion = new Headers();
            if(localStorage.Tok_){
                headersPeticion.append('token_autorizacion',localStorage.Tok_);
            }
            const consulta = await fetch(
                '/datos/opciones',
                {
                    method:'POST',
                    headers:headersPeticion,
					body:formData
                }
                );
            const respuesta = await consulta.json();
            return respuesta;            
        }catch(e){
			const respuesta = {ident: 0,mensaje: e}
            return JSON.stringify(respuesta);
        }
    }
    /**
	 * 
	 * @param {int|string} id_docente es el numero de cedular.
	 * @param {string} claveNueva es la nueva clave
	 * @returns {Promise} JSON
 	*/
	 static async sendCambioClave(id_docente,claveNueva){
        try{
            const formData = new FormData();
            formData.append('id_docente',id_docente);
            formData.append('clave',claveNueva); 
            const headersPeticion = new Headers();
            if(localStorage.Tok_){
                headersPeticion.append('token_autorizacion',localStorage.Tok_);
            }
            const consulta = await fetch(
                '/datos/cambio/clave',
                {
                    method:'POST',
                    headers:headersPeticion,
					body:formData
                }
                );
            const respuesta = await consulta.json();
            return respuesta;            
        }catch(e){
			console.log(e)
        }
    }
     /**
	 * 
	 * @param {string} clave es la clave que se va a comprobar
	 * @returns {Promise} JSON
 	*/
	 static async comprobacionClave(clave){
        try{
            const formData = new FormData();
            formData.append('clave',clave); 
            const headersPeticion = new Headers();
            if(localStorage.Tok_){
                headersPeticion.append('token_autorizacion',localStorage.Tok_);
            }
            const consulta = await fetch(
                '/datos/comprobacion/clave',
                {
                    method:'POST',
                    headers:headersPeticion,
					body:formData
                }
                );
            const respuesta = await consulta.json();
            return respuesta;            
        }catch(e){
			console.log(e);
        }
    }
}
