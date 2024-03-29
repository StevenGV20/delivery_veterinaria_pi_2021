<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <c:if test="${sessionScope.objUsuario.idrol.idrol==null}">
    	<c:redirect url="/"/>
    </c:if>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Vendedor Admin - Atencion Pedidos</title>
    
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
  	.modal-lg{
  		width: 80%;
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
                <div class="container-fluid text-center ">

                    <!-- Page Heading -->
                    <h1 class="h3 text-gray-800">Mis Pedidos</h1>
                    <p class="">En esta seccion podras ver todos tus pedidos realizados y consultar el estado en que se encuentran.</p>
					<input value="${sessionScope.objUsuario.idrol.idrol}" id="txtIdRol" hidden=""/>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4 col-md-9" style="margin-left: 12%;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Lista de Pedidos</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="tbPedido" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>ID</th>
                                        	<th hidden=""></th>
                                            <th>Fecha de Registro</th>
                                            <th>Estado</th>
                                            <c:if test="${(sessionScope.objUsuario.idrol.idrol==2) or (sessionScope.objUsuario.idrol.idrol==3)}">
                                            	<th>Cliente</th>
                                            	<th></th>
                                            </c:if>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>ID</th>
                                        	<th hidden=""></th>
                                            <th>Nombre del cliente</th>
                                            <th>Estado</th>
                                            <c:if test="${(sessionScope.objUsuario.idrol.idrol==2) or (sessionScope.objUsuario.idrol.idrol==3)}">
                                            	<th>Cliente</th>
                                            	<th></th>
                                            </c:if>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${requestScope.pedidos}" var="item">
                                    		<tr>
	                                        	<td>${item.pedido.idpedido}</td>
	                                        	<td hidden="">${item.idtracking}</td>
	                                            <td>${item.pedido.fechaRegistro}</td>
	                                            <td>${item.estado}</td>
	                                            <c:if test="${sessionScope.objUsuario.idrol.idrol==2 || sessionScope.objUsuario.idrol.idrol==3}">
	                                            	<td>${item.pedido.cliente.nombre} ${item.pedido.cliente.apellido}</td>
	                                            	<c:if test="${item.estado=='ENTREGADO'}">
	                                            		<td><button data-toggle='modal' disabled="disabled"  data-target='#asignar' class="btn btn-warning" id="btnAsignar">Asignar <i class="fas fa-user-check"></i></button></td>
	                                            	</c:if>
	                                            	<c:if test="${item.estado!='ENTREGADO'}">
	                                            		<td><button data-toggle='modal'  data-target='#asignar' class="btn btn-warning" id="btnAsignar">Asignar <i class="fas fa-user-check"></i></button></td>
	                                            	</c:if>
	                                            </c:if>
	                                            <td><a data-toggle='modal'  data-target='#nuevo' class="btn btn-danger" id="verPedido">Ver Boleta <i class="fas fa-money-check"></i></a></td>
	                                        </tr>
                                    	</c:forEach>
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
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
 		 <section class="forms ml-4 mr-4 m-4">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-12">
                    <div class="section-heading">
                      <h2>Detalle del Pedido</h2>
                    </div>
                    <form  method="post" action="consultarTracking" id="idRegistrar" data-toggle="validator" class="mt-3 form-horizontal">
                    	<label>Nro de Pedido:  </label><input hidden="" id="idCodigoPedido" name="cod" class="form-input"/><label id="lblCodigo">###</label>
                      	 <div class="cart-page">
					            <div class="container-fluid">
					                <div class="row">
					                    <div class="col-lg-8">
					                        <table class="table table-bordered table-striped"  id="detallePedido">
					                                    <thead class="thead-dark">
					                                        <tr>
					                                            <th>Producto</th>
					                                            <th>Precio</th>
					                                            <th>Cantidad</th>
					                                            <th>Total</th>
					                                        </tr>
					                                    </thead>
					                                    <tbody class="align-middle"">
					                                       
					                                    </tbody>
					                                </table>
					                    </div>
					                    <div class="col-lg-4">
					                        <div class="cart-page-inner">
					                            <div class="row">
					                                <div class="col-md-12">
					                                    <div class="cart-summary">
					                                    	<table class="table">
					                                    		<thead><tr><td><h2>Totales</h2></td><td></td></tr></thead>
						                                    	<tbody class="text-right">
						                                    		<tr><td class="text-left"><p>Importe:</p></td><td>S/. <span id="idImporte"></span></td></tr>
						                                    		<tr><td class="text-left"><p>Descuento:</p></td><td>S/. <span id="idDescuento"></span></td></tr>
						                                    		<tr><td class="text-left"><p>IGV:</p></td><td>S/. <span id="idIGV"></span></td></tr>
						                                    		<tr><td class="text-left"><h5>Monto Total:</h5></td><td><h5>S/. <span id="idTotal"></span></h5></td></tr>
						                                    	</tbody>
					                                    	</table>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
                      	
                      	
                       <br>
                        <div class="col-md-12 mt-2">
                          <button type="button" class="btn__submit" id="btnCancelar" data-dismiss="modal">Cancelar</button>  		
        				  <button type="submit" class="btn__reset" id="btnTracking" >Ver Tracking</button>
                        </div>
                        
                    </form>
                  </div>
                </div>
              </div>
            </section>
      
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="asignar"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sl modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Asignar Repartidor</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
	        <div class="col-md-12">
	        	<div class="row">
	        		<form action="asignaTrabajador" method="post" name="" data-toggle="validator" id="formAsignar" class="col-md-12">	
		        		<input id="idCodigoTracking" name="idtracking" hidden=""/>
		        		<input id="idTrackPedido" name="pedido.idpedido" hidden=""/>
		                  <div class="">
		                    <fieldset class="form-group">
		                   		<label for="staticEmail">Repartidor</label>
								<select id="idRepartidor" class="input col-md-12" name="trabajador.idusuario">
									<option>[ Seleccione ]</option>
								</select>
		                    </fieldset>
		                  </div>  
		                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				          <button type="submit" id="btnAsignarRep" class="btn btn-primary">Asignar</button>
	           		 </form> 
	              </div>
	          </div>
	    </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        </div>
        
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
    	<script src="js/global.js"></script>
    <script src="popup.js"></script>
   <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
    
    <script type="text/javascript">  


$(document).on("click","#verPedido",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#lblCodigo").text(cod);
	$("#idCodigoPedido").val(cod);
	//alert(cod);
	limpiarDetalle();
	$('#detallePedido tbody').append('<tr><td class="loading text-center mb-5" colspan="10"><img src="img/cargando.gif" width="10%" alt="loading" /><br/>Un momento, por favor...</td> </tr>');
	$.getJSON("detallePedidoById",{id:cod},function(listar, q, t){
		$("#detallePedido tbody").empty();
		console.log(listar);
		$.each(listar,function(index,item){
			$("#detallePedido tbody").append("<tr><td>"+item.producto.idproducto+"</td><td>"+item.producto.nombre+"</td><td>"+item.cantidad+"</td><td>"+item.precioTotal+"</td></tr>");
			if(item.montoTotal>0){
				//alert(item.montoTotal);
				$("#idImporte").text(parseFloat(item.importe).toFixed(2));
				$("#idIGV").text((item.igv).toFixed(2));
				$("#idDescuento").text((item.descuento).toFixed(2));
				$("#idTotal").text((item.montoTotal).toFixed(2));
			}
		})
	})
	
	//bloquear(false);
}));

function limpiarDetalle(){
	$("#idImporte").text("");
	$("#idIGV").text("");
	$("#idDescuento").text("");
	$("#idTotal").text("");
	$("#detallePedido tbody").empty();
}

$(document).on("click","#btnAsignar",(function(){
	var ped=$(this).parents('tr').find("td")[0].innerHTML;
	var tr=$(this).parents('tr').find("td")[1].innerHTML;
	$("#idCodigoTracking").val(tr);
	$("#idTrackPedido").val(ped);
	
}));

function limpiarFormConsulta(){
	//bloquear(false);
	$("#idRegistrar").trigger("reset");
	$("#idRegistrar").data("bootstrapValidator").resetForm(true);
	$("#idCodigo").val("0");
}

//LISTAR CLIENTES/USUARIOS
function listarTablas(lista){
	$('#tbPedido tbody').append('<tr><td class="loading text-center mb-5" colspan="10"><img src="img/cargando.gif" width="10%" alt="loading" /><br/>Un momento, por favor...</td> </tr>');
	$.getJSON("listaPedido",{},function(listar, q, t){
		console.log(listar);
		
		var editar="<button type='button' class='btn btn-success' id='btnEditar' data-toggle='modal'  data-target='#nuevo'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#eliminar' id='btnEliminar'>RESPONDER</button>";

		$("#tbPedido tbody").empty();
		$.each(listar,function(index,item){
			$("#tbPedido tbody").append("<tr><td>"+item.idpedido+"</td><td>"+item.nombre+"</td><td>"+item.regPedido+"</td><td>"+item.fechaPedido+
					"</td><td>"+eliminar+"</td></tr>");
		})
		  $("#tbPedido").DataTable();
    })
	
}

function listaRepartidor(){
	//alert("hola");
	$.getJSON("listaUsuarioByRol",{cod:4},function(listar, q, t){
		console.log(listar);
		$.each(listar,function(index,item){
			$("#idRepartidor").append("<option value='"+item.idusuario+"'>"+item.nombre+" "+item.apellido+"</option>");
		})
	})
}


$(document).ready( function () {

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
    
    //alert("Hola");
    //listarTablas();
    listaRepartidor();
    $("#tbPedido").DataTable();
    
    //if($("#txtIdRol")==4)
   		
    /*$("#btnCancelar").click(function(){
		//alert("hola");
		//bloquear(false);
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		$("#idRegistrar select").val("[ Seleccione ]");
    });
    */
    /*
    $("#btnAsignarRep").click(function(){
    	//alert("hola");
    	var validator = $('#formAsignar').data('bootstrapValidator');
	    validator.validate();
	    if (validator.isValid()) {
	    	$.ajax({
		          type: "POST",
		          url: "asignaTrabajador", 
		          data: $('#formAsignar').serialize(),
		          success: function(data){
		        	listarTablas(lista);
		        	mostrarMensaje(data.mensaje);
		        	//limpiarFormCliente();
		          },
		          error: function(){
			          //listarTablas();
		        	  mostrarMensaje(MSG_ERROR);
		          }
		     });
		}
		    
	  });
    */
    
    
    $('#formAsignar').bootstrapValidator({      
      	 fields:{
      		Repartidor: {
   	    	selector:'#idRepartidor',   
                  validators: {    
                      notEmpty: {    
                          message: ''    
                      },      
                      integer: {    
                          message: 'Elegir Repartidor'    
                      },    
                  }    
              }
      	 }
      }); 
		    
});
    
    
   
 </script> 


</body>

</html>