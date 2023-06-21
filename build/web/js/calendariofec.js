
//Verifica campos vacios
function comprueba(){

if ( document.forms.form1.fecha.value == '') {
    alert("Usted debe seleccionar la fecha de reserva.");
    return false;
} 

///**************************
//if ( !document.forms.form1.fecha.value == '') {
	var fechaActual = new Date(); // Fecha actual
	//fecha solicitada
	var ja = new Array();
	//var fechafin = new Date(2006, 9, 23);
        //Recordar que enero es 0 así diciembre es 11
	var fechafin = new Date(2007, 10, 23);
        //alert(fechafin);
	var msfechafin = fechafin.getTime();
	var fech = document.form1.fecha.value;
	ja = fech.split("-");	
	//var mes =parseInt(ja[1]) - 1;		
	var mes = ja[1]-1;
	var fecha1 = new Date(ja[2], mes, ja[0]);
	var msegActual = fechaActual.getTime();
	var msegFecha1 = fecha1.getTime();
	//var Diferencia = msegActual - msegFecha1;
	var Diferencia =  msegFecha1 - msegActual;
	Diferencia /= 86400000;
	//Diferencia = Math.abs(Diferencia);
	Diferencia = parseInt(Diferencia);
	//alert("Diferencia: " + Diferencia);
	if (msegFecha1 <= msegActual) {
		alert("La fecha seleccionada es menor o igual a la actual");
		return false;	
	}
	if (Diferencia < 0) {
		alert("La fecha seleccionada es menor que la fecha actual");
		return false;										
	}
	
	else {
	if (Diferencia > 29) {
		alert("No puede hacer una reserva superior a un mes.");					
		return false;
	}else {
		if (msegFecha1 > msfechafin) {
			if((document.forms.form1.caracteris[0].checked) || (document.forms.form1.caracteris[1].checked) || (document.forms.form1.caracteris[2].checked) || (document.forms.form1.caracteris[3].checked)){
				alert("Debido a los procesos de finalización del periodo académico 2007-2, solo estarán activos los salones de Audiovisuales." );
				return false;
				}	
		}		
	}
}

//***************

if ( !document.forms.form1.hora[0].checked && !document.forms.form1.hora[1].checked && !document.forms.form1.hora[2].checked && !document.forms.form1.hora[3].checked
	 && !document.forms.form1.hora[4].checked && !document.forms.form1.hora[5].checked && !document.forms.form1.hora[6].checked && !document.forms.form1.hora[7].checked) {
		alert("Usted debe seleccionar la hora para la reserva");
		return false;
}

//comparar sesiones
if ( document.forms.form1.hora[0].checked ){
	if ( (document.forms.form1.horafin[1].checked) || (document.forms.form1.horafin[2].checked) || (document.forms.form1.horafin[3].checked) || (document.forms.form1.horafin[4].checked)
		|| (document.forms.form1.horafin[5].checked) || (document.forms.form1.horafin[6].checked)) {
			alert("No puede seleccionar mas de dos sesiones");
			return false;
		}
}
if ( document.forms.form1.hora[1].checked ){
	if ((document.forms.form1.horafin[2].checked) || (document.forms.form1.horafin[3].checked) || (document.forms.form1.horafin[4].checked)
		|| (document.forms.form1.horafin[5].checked) || (document.forms.form1.horafin[6].checked)) {
			alert("No puede seleccionar mas de dos sesiones");
			return false;
		}
}
if ( document.forms.form1.hora[2].checked ){
	if ((document.forms.form1.horafin[3].checked) || (document.forms.form1.horafin[4].checked)
		|| (document.forms.form1.horafin[5].checked) || (document.forms.form1.horafin[6].checked)) {
			alert("No puede seleccionar mas de dos sesiones");
			return false;
		}
}
if ( document.forms.form1.hora[3].checked ){
	if ((document.forms.form1.horafin[4].checked) || (document.forms.form1.horafin[5].checked) || (document.forms.form1.horafin[6].checked)) {
			alert("No puede seleccionar mas de dos sesiones");
			return false;
		}
}
if ( document.forms.form1.hora[4].checked ){
	if ((document.forms.form1.horafin[5].checked) || (document.forms.form1.horafin[6].checked)) {
			alert("No puede seleccionar mas de dos sesiones");
			return false;
		}
}
if ( document.forms.form1.hora[5].checked ){
	if ((document.forms.form1.horafin[6].checked)) {
			alert("No puede seleccionar mas de dos sesiones");
			return false;
		}
}
//Fin sesiones

//Valida que hora final no sea menor a la inicial
if ( document.forms.form1.hora[2].checked ){
	if ((document.forms.form1.horafin[0].checked)) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}

if ( document.forms.form1.hora[3].checked ){
	if ((document.forms.form1.horafin[0].checked) || (document.forms.form1.horafin[1].checked)) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}
if ( document.forms.form1.hora[4].checked ){
	if ((document.forms.form1.horafin[0].checked) || (document.forms.form1.horafin[1].checked) || (document.forms.form1.horafin[2].checked)) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}
if ( document.forms.form1.hora[5].checked ){
	if ((document.forms.form1.horafin[0].checked) || (document.forms.form1.horafin[1].checked) || (document.forms.form1.horafin[2].checked) || (document.forms.form1.horafin[3].checked)) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}
if ( document.forms.form1.hora[6].checked ){
	if ((document.forms.form1.horafin[0].checked) || (document.forms.form1.horafin[1].checked) || (document.forms.form1.horafin[2].checked) || (document.forms.form1.horafin[3].checked)
		|| (document.forms.form1.horafin[4].checked)) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}
if ( document.forms.form1.hora[7].checked ){
	if ((document.forms.form1.horafin[0].checked) || (document.forms.form1.horafin[1].checked) || (document.forms.form1.horafin[2].checked) || (document.forms.form1.horafin[3].checked)
		|| (document.forms.form1.horafin[4].checked) || (document.forms.form1.horafin[5].checked)) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}

//fin valida hora final

if ( !document.forms.form1.caracteris[0].checked && !document.forms.form1.caracteris[1].checked && !document.forms.form1.caracteris[2].checked && !document.forms.form1.caracteris[3].checked && !document.forms.form1.caracteris[4].checked) {
		alert("Usted debe seleccionar las características del salón");
		return false;
}  

if ( !document.forms.form1.tipo[0].checked && !document.forms.form1.tipo[1].checked && !document.forms.form1.tipo[2].checked && !document.forms.form1.tipo[3].checked) {
		alert("Usted debe seleccionar para que utilizará el salón.");
		return false;
}  
if (document.forms.form1.tipo[0].checked ){
	var indice = document.form1.idgrupo.selectedIndex;
	if ( document.forms.form1.idgrupo.options[indice].value == 'N') {
    alert("Usted debe seleccionar la asignatura ");
    return false;
} 

}

if ( document.forms.form1.capacidad.value == '') {
    alert("Usted debe digitar la capacidad del salón requerido." );
    return false;
} 
if ( document.forms.form1.observ.value == '') {
	if (document.forms.form1.val.value == '1') {
    	alert("Usted debe especificar en el campo de observaciones el uso que se le dará al salón." );
	}
	else {
		alert("Usted debe especificar en el campo de observaciones el nombre de la persona responsable del salón y que uso se le dará al mismo." );
	}
    return false;
} 

if ( document.form1.ndia.value == "6") {	
		if ((document.forms.form1.hora[4].checked) || (document.forms.form1.hora[5].checked) || 
			(document.forms.form1.hora[6].checked) || (document.forms.form1.hora[7].checked)) {
			alert("Si su solicitud es para el día sábado, no puede solicitar reserva para mas de la 1:00 p.m." );
			return false;
		}
		else
		if ((document.forms.form1.hora[0].checked) || (document.forms.form1.hora[1].checked) || 
			(document.forms.form1.hora[2].checked) || (document.forms.form1.hora[3].checked)) {
			 return true;
		}
}    

} //cierra función

function fecha(){
fecha = new Date()
mes = fecha.getMonth()
diaMes = fecha.getDate()
diaSemana = fecha.getDay()
anio = fecha.getFullYear()
dias = new Array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sábado')
meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
document.write('<span id="fecha">')
document.write (dias[diaSemana] + ", " + diaMes + " de " + meses[mes] + " de " + anio )
document.write ('</span>')
}

function dia1(){
certo_dia = new Date("May 15, 1998")
certo_dia.setDate(25)
document.write('<span id="fecha">')
document.write ("dia mes" + certo_dia.setDate(25) )
document.write ('</span>')
}

function dian(){
//new Date (año, mes, dia);
var fechaAux = new Date(2005, 9, 11);
document.write (Dia_semana(fechaAux.getDay()) )

}

function Dia_semana(dia){ 
			// dia es un entero que representa la día de la semana (0=domingo y 6=sábado)
			var aux="";
			switch (dia) {
				case 0: aux="Domingo"; break;
				case 1: aux="Lunes"; break;
				case 2: aux="Martes"; break;
				case 3: aux="Miércoles"; break;
				case 4: aux="Jueves"; break;
				case 5: aux="Viernes"; break;
				case 6: aux="Sábado"; break;
				default: aux="Error";
			}
			return aux;
		}

function SetDateDemo(newdate){
   var d, s;                  //Declare variables.
   d = new Date();            //Create date object.
   d.setDate(newdate);        //Set date to newdate.
   s = "Current setting is ";
   s += d.toLocaleString(); 
   document.write ("dia mes" + s )
   return(s);                                //Return newly set date.
}