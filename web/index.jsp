<%-- 
    Document   : index.html
    Created on : 29 sept 2022, 10:36:02
    Author     : Carlos Alfonso
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Estudiante" %>
<%@page import="modelo.tipos_sangre" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

     <title>Estudiantes</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">


     <link rel="stylesheet" href="Recursos/css/estilos.css">


    </head>
    <body>

        <header>

            <a href="#inicio" class="logo"> 
                <span>Form</span> estudiantes
            </a>

            <input type="checkbox" id="menu-bar">
            <label for="menu-bar" class="fa fa-bars"></label>

            <nav class="navbar">
                <a href="#Estudiante">Forumulario</a>
                <a href="#Sangre">Banco sangre</a>
            </nav>

        </header>

        <section class="inicio" id="inicio">
            <div class="content">
                <h3>ESTUDIANTES <span>salud</span></h3>
                <p>Formulario control de los estudiantes activos a la institución. Objetivo: brindar el mejor control a los estudiantes y monitorear flexiblemente los atributos de los agentes activos.</p>
                <a href="#Estudiante" class="boton">COMENZAR</a>
            </div>

            <div class="image">
                <img src="Recursos/imagenes/Multiple sclerosis-bro.svg" alt="">
            </div>

        </section>

        <section class="Estudiante" id="Estudiante">

            <div class="image">
                <img src="Recursos/imagenes/img2.svg" alt="">
                
      
            </div>
            
           
            <div class="contendor">

                <h1 class="heading">ESTUDIANTES</h1>
                <button type="button" name="btn_nuevo" id="btn_nuevo" class="boton" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">AGREGAR ESTUDIANTE</button>
                

            
            
    <div class="container">
         
    <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            
            <form action="sr_estudiante" method= "post" class="form-group">
                
                <label for="lbl_id_estudiante" ><b>ID</b></label>
                <input type="text" name="txt_id_estudiante" id="txt_id_estudiante" class="form-control" value="0"  readonly> 
                
                <label for="lbl_carne" ><b>Carne</b></label>
                <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo: E003" pattern="[E]{1}[0-9]{3}" required>
                
                <label for="lbl_nombres" ><b>Nombres</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
                
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
                
                <label for="lbl_direccion" ><b>Direccion</b></label>
                <input type="text"  name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa calle zona ciudad" required>
               
                <label for="lbl_telefono" ><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>

                <label for="lbl_correo" ><b>Correo Electronico</b></label>
                <input type="email" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo:@gmail.com" required>
                
                <label for="lbl_id_sangre" ><b>ID sangre</b></label>
                <select name="drop_id_sangre" id="drop_id_sangre" class="form-control">
                    <% 
                       
                        tipos_sangre sangre = new tipos_sangre();
                        HashMap<String,String> drop = sangre.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                       
                    %>
                    
                </select>

                <label for="lbl_fn" ><b>Nacimiento</b></label>
                <input type="date"  name="txt_fn" id="txt_fn" class="form-control" required>

                
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-dark">Agregar</button>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-dark">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-dark" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                <button type="button" class="btn btn-dark" data-dismiss="modal">Cerrar</button>
               
                
            </form>
       </div>
      </div>
    </div>
  </div>

<br>
<br>
                    
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Carne</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>correo_electronico</th>
        <th>SANGRE</th>
        <th>Nacimiento</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiantes">
          <% 
        Estudiante estudiante = new Estudiante();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = estudiante.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_s=" + tabla.getValueAt(t,8) + ">");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,9) + "</td>");
            out.println("</tr>");
        
        }
        %>

    </tbody>
  </table>          
               
    </div>
   </div>              
                    
       
                    
 </section>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

         
    <script type="text/javascript">
    function limpiar(){
        $("#txt_id_estudiante").val(0);
       $("#txt_carne").val('');
       $("#txt_nombres").val('');
       $("#txt_apellidos").val('');
       $("#txt_direccion").val('');
       $("#txt_telefono").val('');
       $("#txt_correo").val('');
       $("#drop_id_sangre").val(1);
       $("#txt_fn").val('');

    }
   
    $('#tbl_estudiantes').on('click','tr td',function(evt){
       var target,id,id_s,carne,nombres,apellidos,direccion,telefono,correo_electronico,fecha_nacimiento; 
       target = $(event.target);
       id = target.parent().data('id');
       carne = target.parent("tr").find("td").eq(0).html();
       nombres= target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       direccion = target.parent("tr").find("td").eq(3).html();
       telefono = target.parent("tr").find("td").eq(4).html();
       
       correo_electronico = target.parent("tr").find("td").eq(5).html();
       
       id_s = target.parent().data('id_s'); 
       fecha_nacimiento = target.parent("tr").find("td").eq(7).html();
       
       $("#txt_id_estudiante").val(id);
       $("#txt_carne").val(carne);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_direccion").val(direccion);
       $("#txt_telefono").val(telefono);
       $("#txt_correo").val(correo_electronico);
       $("#drop_id_sangre").val(id_s);
       $("#txt_fn").val(fecha_nacimiento);
       
       $("#modal_empleado").modal('show');
    });
    
</script>
         
         
         
         
         
         
         
    </body>
</html>
