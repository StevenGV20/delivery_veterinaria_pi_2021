<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Veterinaria Admin - Registro Consultas</title>
    
    <link rel="stylesheet" href="./css/reset.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
	<link rel="stylesheet" href="./css/main.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
	<link rel="stylesheet" href="css/estilos.css">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
    <!-- CSS only -->

	
 <style>
  	.forms input{
  		margin-bottom: 0px;
  	}
  	.forms select{
  		margin-bottom: 0px;
  	}
  	.forms fieldset{
  		margin-top: 10px;
  		display: flex;
  		flex-direction: column; 
  	}
  	section.forms{
  		margin-top:30px;
  		margin-bottom:10px;
  	}
  	.forms h2{
  		margin-bottom:0px;
  	}
  	small{
  		color:red;
  		margin-bottom: 10px;
  	}
  </style>
  
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
       <jsp:include page="slidebar.jsp"></jsp:include>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                	<jsp:include page="navbar.jsp"></jsp:include>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Historial de la Mascota</h1>
                    <p class="mb-4">En esta seccion podra ver el historial de diagnosticos y citas de la mascota.</p>

				<!--BEGIN DATOS DEL HISTORIAL -->
					<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Datos de la Mascota</h6>
                        </div>
                        
                        <div class="card-body">
                        	<button type='button' class='btn btn-primary' id='btnBuscar' data-toggle='modal' data-target='#buscaHistorial'>Busca Historial</button>
                        	<button type='button' class='btn btn-primary float-right mr-5' onclick="$('#nuevoDiagnostico').modal('show');bloquearForm(false);limpiarFormConsulta();" id='btnAgregar'><i class="fas fa-plus-circle"></i> Registrar Diagnostico</button>
                        	<div class="row col-md-10 mt-3">
                        		<div class="col-md-4 form-group">
		                         	<label class="col-md-12">Nombre::</label>
									<input type="text" class="input col-md-10" name="nombre" id="idMascotaNom" placeholder=" " readonly="readonly">
		                        </div>
		                        <div class="col-md-4 form-group">
		                         	<label class="col-md-12">Fecha de Registro:</label>
									<input type="text" class="input col-md-10"  name="fechaRegistro" id="idMascotaFecReg" placeholder=" " readonly="readonly">
		                        </div>
		                        <div class="col-md-4 form-group">
		                         	<label class="col-md-12">Edad:</label>
									<input type="text" class="input col-md-10"  name="edad" id="idMascotaEdad" placeholder=" " readonly="readonly">
		                        </div>
		                        <div class="col-md-4 form-group">
		                         	<label class="col-md-12">Fecha de Nacmiento:</label>
									<input type="text" class="input col-md-10"  name="fechaNacimiento" id="idMascotaFecNac" placeholder="" readonly="readonly">
		                        </div>
		                        <div class="col-md-4 form-group">
		                         	<label class="col-md-12">Cliente:</label>
									<input type="text" class="input col-md-10"  name="cliente" id="idMascotaCli" placeholder="" readonly="readonly">
		                        </div>
                        	</div>
                            
                        </div>
                    </div>
				<!--END DATOS DEL HISTORIAL -->
					
                  <!-- BEGIN LISTA DE DIAGNOSTICOS-->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Diagnosticos</h6>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tbDiagnosticos" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Fecha de Registro</th>
                                            <th>Asunto</th>
                                            <th>Descripcion</th>
                                             <th hidden=""></th>
                                            <th>Ver</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Fecha de Registro</th>
                                            <th>Asunto</th>
                                            <th>Descripcion</th>
                                             <th hidden=""></th>
                                            <th>Ver</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                   	 </div>
                  <!-- END LISTA DE DIAGNOSTICOS-->
                    
                  <!-- BEGIN LISTA DE CITAS-->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Citas</h6>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tbCitas" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Nombre</th>
                                            <th>Servicio</th>
                                            <th>Fecha de Consulta</th>
                                            <th>Ver</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>ID</th>
                                            <th>Nombre</th>
                                            <th>Consulta</th>
                                            <th>Fecha de Consulta</th>
                                            <th>Ver</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                   	 </div>
                    <!-- END LISTA DE CITAS-->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
<!-- BEGIN BUSCA HISTORIAL -->
<div class="modal fade bd-example-modal-lg" id="buscaHistorial"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Buscar Historial</h2>
                    </div>
                    <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="tbHistorial" width="100%" cellspacing="0">
                                    <thead>
                                         <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Edad (Meses)</th>
								            <th>Sexo</th>
								            <th>Fecha de Inscripción</th>
								            <th>Cliente</th>
								        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Edad (Meses)</th>
								            <th>Sexo</th>
								            <th>Fecha de Inscripción</th>
								            <th>Cliente</th>
                                        </tr>
                                    </tfoot>
                                    <tbody  data-dismiss="modal">
                                        
                                    </tbody>
                                </table>
        				  <button type="button" class="btn__reset float-right" id="btnCancelar" data-dismiss="modal">Cancelar</button>
                      </div>
                  </div>
                </div>
              </div>
            </section>
      
    </div>
  </div>
</div>
<!-- END BUSCA HISTORIAL -->

<!-- BEGIN REGISTRO DE DIAGNOSTICO -->
<div class="modal fade bd-example-modal-lg" id="nuevoDiagnostico"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Registrar Diagnostico</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
	        <form class="col-md-12" action="" method="post" id="formRegistro">
             	<div class="col-md-12">
	                <fieldset class="form-group">
	               	<label for="staticEmail">Asunto</label>
					<input type="text" class="input col-md-12"  name="asunto" id="idAsunto">
					<input type="text" class="input col-md-12" hidden="" id="idDiagnostico">
					<input type="text" class="input col-md-12"  hidden="" name="historial.idhistorial" id="id_historial">
				     </fieldset>
				</div>
	             <div class="col-md-12">
	               <fieldset class="form-group">	
	               <label for="staticEmail">Descripcion</label>
					<textarea class="input col-md-12"  name="descripcion" id="idDescripcion"></textarea>
	               </fieldset>
	             </div> 
	            <div class="modal-footer">   
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          		<button type="button" id="btnRegistrar" class="btn btn-primary">Registrar</button>
				</div>
	        </form>
      	</div>
    </div>
  </div>
</div>
<!-- END REGISTRO DE DIAGNOSTICO -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="popup.js"></script>
	<script src="js/global.js"></script>
   <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
    
<script type="text/javascript">  


$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Editar Area");
	$.getJSON("buscaConsulta2XID",{id:cod},function(data){
		$("#idCodigo").val(data.idconsulta);
		$("#idnombre").val(data.nombre);
		$("#idregConsulta").val(data.regConsulta);
		$("#idfechaConsulta").val(data.fechaConsulta);
	})
}));

$(document).on("click","#idVer",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	var asu=$(this).parents('tr').find("td")[2].innerHTML;
	var des=$(this).parents('tr').find("td")[3].innerHTML;
	$("#idAsunto").val(asu);
	$("#idDescripcion").val(des);
	bloquearForm(true);
}));


$("#tbHistorial").on("click","tbody tr",(function(){
	var cod=$(this).children("td:eq(0)").html();
	//alert(cod);
	$.getJSON("buscaHistorialById",{id:cod},function(data){
		console.log(data);
		$("#id_historial").val(data.idhistorial);
		$("#idMascotaNom").val(data.mascota.nombre);
		$("#idMascotaFecReg").val(data.fechaRegistro);
		$("#idMascotaEdad").val(data.mascota.edad);
		$("#idMascotaFecNac").val(data.mascota.fechaNacimiento);
		$("#idMascotaCli").val(data.mascota.cliente.nombreCompleto);
		listarCitas(cod);
		listarDiagnosticos(cod);
    })
    $("#btnAgregar").prop("disabled",false);	
}));

function bloquearForm(b){

	$("#idAsunto").prop("disabled",b);
	$("#idDescripcion").prop("disabled",b);
	$("#btnRegistrar").prop("disabled",b);
}


function limpiarFormConsulta(){
	//bloquear(false);
	$("#idAsunto").val("");
	$("#idDescripcion").val("");
	$("#idCodigo").val("0");
}

//LISTAR CLIENTES/USUARIOS
function listarCitas(cod){	
	 $('#tbCitas').DataTable().clear();
	 $('#tbCitas').DataTable().destroy();
	$.getJSON("listaCitaByHistorial",{cod:cod},function(listar, q, t){
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>RESPONDER</button>";

		$("#tbCitas tbody").empty();
		$.each(listar,function(index,item){
			
			$("#tbCitas tbody").append("<tr><td>"+item.idcita+"</td><td>"+item.fechaRegistro+"</td><td>"+item.fechaAtencion+"</td><td>"+item.estado+
					"</td><td>"+eliminar+"</td></tr>");
		})
		  $("#tbCitas").DataTable();
	})
	
}

function listarDiagnosticos(cod){
	$('#tbDiagnosticos').DataTable().clear();
	 $('#tbDiagnosticos').DataTable().destroy();
	$.getJSON("listaDiagnosticoByHistorial",{cod:cod},function(listar, q, t){
		console.log(listar);
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>RESPONDER</button>";
		$.each(listar,function(index,item){
			 var asu = item.descripcion;
			  var des = asu.substring(0, 50);
			$("#tbDiagnosticos tbody").append("<tr><td>"+item.idDiagnostico+"</td><td>"+item.fechaRegistro+"</td><td>"+item.asunto+"</td><td>"+des+
					"</td><td hidden=''>"+item.descripcion+"</td><td><a id='idVer' href='#' data-toggle='modal'  data-target='#nuevoDiagnostico' ><i class='fas fa-eye'></i></a></td></tr>");
		})
		$("#tbDiagnosticos").DataTable();
	})
}


function listaHistorial(){
	$("#tbHistorial tbody").empty();
	$.getJSON("listaHistorial",{},function(listar, q, t){
		console.log(listar);
		
		$.each(listar,function(index,item){
			$("#tbHistorial tbody").append("<tr><td>"+item.idhistorial+"</td><td>"+item.mascota.nombre+"</td><td>"+
					item.mascota.edad+"</td><td>"+item.mascota.sexo+"</td><td>"+item.fechaRegistro+
					"</td><td>"+item.mascota.cliente.nombreCompleto+"</td></tr>");
		})
		  $("#tbHistorial").DataTable();
    })
	
}


$(document).ready( function () {
	
	$("#btnAgregar").prop("disabled",true);

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
    //alert("Hola");
    listaHistorial();
    
    $("#btnCancelar").click(function(){
		//alert("hola");
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		$("#idRegistrar select").val("[ Seleccione ]");
    });
    
    $("#btnRegistrar").click(function(){
    	var validator = $('#formRegistro').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	    	$.ajax({
		          type: "POST",
		          url: "registraDiagnostico", 
		          data: $('#formRegistro').serialize(),
		          success: function(data){
		        	//listarTablas();
		        	mostrarMensaje(data.mensaje);
		        	//limpiarFormConsulta();
		        	$('#nuevoDiagnostico').modal('hide');
		        	listarCitas(data.historial.idhistorial);
		    		listarDiagnosticos(data.historial.idhistorial);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		     });
		}
		    
	  });
    
        
        $('#formRegistro').bootstrapValidator({      
       	 fields:{
       		asunto: {
    	    	selector:'#idAsunto',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese Asunto del Diagnostico'    
                       },      
                       stringLength: {    
                       	min: 5, 
                       	max: 250,
                           message: 'Ingrese entre 5 y 250 caracteres'    
                       },      
                   }    
               },
            descripcion: {
 	    	selector:'#idDescripcion',   
                validators: {    
                    notEmpty: {    
                        message: 'Ingrese Descripcion del Diagnostico'    
                    },      
                    stringLength: {    
                    	min: 5, 
                        message: 'Ingrese minimo 5 caracteres'    
                    },    
                }    
            }
       	 }
       }); 
    
} );
 </script> 
</body>

</html>