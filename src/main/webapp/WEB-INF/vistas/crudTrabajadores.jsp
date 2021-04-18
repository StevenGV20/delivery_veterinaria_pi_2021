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

    <title>Vendedor Admin - Servicios</title>
    
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
                <!--#include file="navbar.html"-->
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Lista del Personal de Trabajo</h1>
                    <p class="mb-4">En esta seccion podra registrar, ver y editar a los trabajadores de la Empresa.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Trabajadores</h6>
                        </div>
                        <div class="cont_mant ml-2">
							<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo">Nuevo <i class="fa fa-plus-circle" aria-hidden="true"></i></button>  
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                         <tr>
								            <th>ID</th>
								            <th>Nombre</th>
								            <th>Apellidos</th>
								            <th>Telefono</th>
								            <th>Dni</th>
								            <th>Correo</th>
								            <th>Cargo</th>
								            <th></th>
								            <th></th>
								            <th></th>
								        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
								            <th>Nombre</th>
								            <th>Apellidos</th>
								            <th>Telefono</th>
								            <th>Dni</th>
								            <th>Correo</th>
								            <th>Cargo</th>
								            <th></th>
								            <th></th>
								            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
								            <td class="">1</td>
								            <td class="">Alan</td>
								            <td class="">Smith</td>
								            <td class="">999555666</td>
								            <td class="">00552266</td>
								            <td class="">alan@gmail.com</td>
								            <td class="">Veterianrio</td>
								            <td class=""><a href="#" id="btnDetalles"  class="btn btn-info" data-toggle="modal" data-target="#nuevo">Detalles</a></td>
								            <td class=""><a href="#" id="btnEditar"  class="btn btn-success" data-toggle="modal" data-target="#nuevo">Editar</a></td>
								            <td class=""><a href="#" id="btnEliminar"  class="btn btn-danger" data-toggle="modal" data-target="#eliminar">Eliminar</a></td>
								        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

<div class="modal fade bd-example-modal-lg" id="nuevo"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Registrar Trabajador</h2>
                    </div>
                    <form  method="post" action="" id="idRegistrar" data-toggle="validator" class="mt-3 form-horizontal">
                      <div class="row">
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	
							<input type="text" class="input"  name="" id="idNombre" placeholder="Ingresar nombre">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	
							<input type="text" class="input"  name="" id="idApellido" placeholder="Ingresar apellidos">
                          </fieldset>
                        </div>
                        <div class="col-md-12">
                          <fieldset class="form-group">
                         	
							<input type="text" class="input"  name="" id="idDireccion" placeholder="Ingresar direccion">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset class="form-group">
                         	
							<input type="text" class="input"  name="" id="idTelefono" placeholder="Ingresar telefono">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset class="form-group">                         	
							<input type="text" class="input"  name="" id="idDni" placeholder="Ingresar dni">
                          </fieldset>
                        </div>
                        <div class="col-md-12">
                          <fieldset>                           	
							<input type="text" class="input"  name="" id="idCorreo" placeholder="Ingresar Correo">
                          </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>
							<select id="idDistrito"  class="input" name="distrito">	
								<option>[ Seleccione ]</option>
								<option value="0">Caninos</option>
								<option value="1">Felinos</option>
							</select>
						 </fieldset>
                        </div>
                        <div class="col-md-6">
                          <fieldset>
							<select id="idRol"  class="input" name="rol">	
								<option>[ Seleccione ]</option>
								<option value="0">Caninos</option>
								<option value="1">Felinos</option>
							</select>
						 </fieldset>
                        </div>
                       
                        <div class="col-md-12 mt-2">
                          <button type="submit" class="btn__submit" id="btnRegistrar">Registrar</button>  		
        				  <button type="button" class="btn__reset" id="btnCancelar" data-dismiss="modal">Cancelar</button>
                        </div>
                        
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </section>
      
    </div>
  </div>
</div>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Maqueta V.01 &copy; Pagina echa 2021</span>
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
    
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/transition.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/custom.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

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
   <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript">

$(document).on("click","#btnDetalles",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Detalles del Producto");
	$.getJSON("",{codigo:cod},function(data){
		
	})
	bloquear(true);
}));

$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Editar Area");
	$.getJSON("",{codigo:cod},function(data){
		
	})
	bloquear(false);
}));

$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));


function bloquear(b){
	$("#idRegistrar input").prop("disabled",b);
	$("#idRegistrar select").prop("disabled",b);
	$("#btnRegistrar").prop("disabled",b);
}

$(document).ready( function () {

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
    //alert("Hola");
    
    $("#btnCancelar").click(function(){
		//alert("hola");
		bloquear(false);
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		$("#idRegistrar select").val("[ Seleccione ]");
    });
    
} );
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#idRegistrar').bootstrapValidator({      
       	 fields:{
       		 
       		 Nombre: {
    	    	selector:'#idNombre',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese Nombre'    
                       },      
                       regexp: {    
                           regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                           message: 'Letras y números'    
                       },    
                   }    
               },
         Apellido: {
 	    	selector:'#idApellido',   
                validators: {    
                    notEmpty: {    
                        message: 'Ingrese Apellidos'    
                    },      
                    regexp: {    
                        regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                        message: 'Letras y números'    
                    },    
                }    
            },
           Direccion: {
	    	selector:'#idDireccion',   
               validators: {    
                   notEmpty: {    
                       message: 'Ingrese Direccion'    
                   },  
               }    
           },
           Telefono: {
   	    	selector:'#idTelefono',   
                  validators: {    
                      notEmpty: {    
                          message: 'Ingrese Telefono'    
                      },      
                      regexp: {    
                    	  regexp: /^[0-9]{7,15}$/,  
                          message: 'Ingresar un numero entre 7 y 9 digitos'    
                      },     
                  }    
          },
          Dni: {
     	    	selector:'#idDni',   
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese Dni'    
                        },      
                        regexp: {    
                            regexp: /^[0-9]{8}$/,    
                            message: 'Solo ingrese 8 digitos'    
                        },    
                    }    
            },
            Correo: {
     	    	selector:'#idCorreo',   
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese Correo'    
                        },      
                        emailAddress: {
                            message: 'Por favor introduce un correo válido'
                        },    
                    }    
            },
          Distrito: {
     	    	selector:'#idDistrito',   
                    validators: {    
                        notEmpty: {    
                            message: 'Elija un Distrito'    
                        },      
                        regexp: {    
                            regexp: /^[0-9]+$/,    
                            message: 'Elija un Distrito'    
                        },     
                    }    
            },
          Rol: {
     	    	selector:'#idRol',   
                    validators: {    
                        notEmpty: {    
                            message: 'Elija un Rol'    
                        },      
                        integer: {
                            message: 'Por favor elija un rol'
                        },    
                    }    
            }
       	 }
       }); 
    });
 </script>
</body>

</html>