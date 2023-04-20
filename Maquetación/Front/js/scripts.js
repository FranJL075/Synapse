const email=document.getElementById("email")
const contraseña=document.getElementById("contraseña")

const form=document.getElementById('form')
const parrafo=document.getElementById('warnings')

form.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings=''
    let ingresar=false
    let validarEmail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    parrafo.innerHTML=''
    if(contraseña.value.length<6){
        warnings+='-La contraseña debe contener al menos seis carácteres <br>'
        ingresar=true
    }
    if(!validarEmail.test(email.value)){
        warnings+='-Introduce un email válido <br>'
        ingresar=true
    }
    if(ingresar)
    {
        parrafo.innerHTML=warnings
    }
    else{
        parrafo.innerHTML="Ingreso válido"
    }
    
})


form2.addEventListener("submit", e=>{
    e.preventDefault()
    let warnings=''
    let ingresar=false
    let validarEmail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    parrafo.innerHTML=''
    if(nombre.value.length<2){
        warnings+='-El nombre debe contener al menos dos carácteres <br>'
        ingresar=true
    }
    if(apellido.value.length<2){
        warnings+='-El apellido debe contener al menos dos carácteres <br>'
        ingresar=true
    }
    if(usuario.value.length<4){
        warnings+='-El usuario debe contener al menos cuatro carácteres <br>'
        ingresar=true
    }
    if(ciudad.value.length<4){
        warnings+='-La ciudad debe contener al menos 3 carácteres <br>'
        ingresar=true
    }
    if(contraseña.value.length<6){
        warnings+='-La contraseña debe contener al menos seis carácteres <br>'
        ingresar=true
    }
    if(repetirContraseña.value!=contraseña.value){
        warnings+='-Las contraseñas no coinciden<br>'
        ingresar=true
    }
    if(!validarEmail.test(email.value)){
        warnings+='-Introduce un email válido <br>'
        ingresar=true
    }
    if(ingresar)
    {
        parrafo.innerHTML=warnings
    }
    else{
        parrafo.innerHTML="Ingreso válido"
    }
    
  })
  
    //Funcion para que en el input de Nombre, apellido y  ciudad no deje teclear numeros
    function soloLetras(e) {
      var key = e.keyCode || e.which,
        tecla = String.fromCharCode(key).toLowerCase(),
        letras = " áéíóúabcdefghijklmnñopqrstuvwxyz",
        especiales = [8, 37, 39, 46],
        tecla_especial = false;
  
      for (var i in especiales) {
        if (key == especiales[i]) {
          tecla_especial = true;
          break;
        }
      }
  
      if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
      }
    }