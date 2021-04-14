<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%@page  import="com.emergentes.modelo.GestorProductos"%>
<%
   if (session.getAttribute("agenda")== null)
   {
       GestorProductos objeto1 = new GestorProductos();
       objeto1.insertarProducto(new Producto(1, "BRUNITO DIAZ",25,"1.40","SI"));
       objeto1.insertarProducto(new Producto(2, "JUANCITO PINTO",30,"1.52","NO"));
       
       session.setAttribute("agenda", objeto1);
   }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - PRODUCTOS </title>
    </head>
    <body aling="center">
    
        <table  border="1" >
            <tr>
                <th aling="left">PRIMER PARCIAL TEM-742
                    <br>
                    nombre: RUDY YERK MAURICIO MOTAÑO
                    <br> 
                    CI:8377021
                </th>
            </tr>
            
        </table>
  
         <h1>REGISTRO DE VACUNAS </h1>
        <a href="Controller?op=nuevo">NUEVO</a>
        <table border="2">
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>PESO</th>
                <th>TALLA</th>
                <th>VACUNA</th>
                <th> </th>
                <th> </th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">MODIFICAR</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">ELIMINAR</a></td>
                </tr>                
            </c:forEach>
        </table>
    </body>
</html>
