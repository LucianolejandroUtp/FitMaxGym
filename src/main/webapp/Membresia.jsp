<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<t:template title="Listar Membresías">
    <jsp:attribute name="head_area">
    </jsp:attribute>

    <jsp:attribute name="body_area">
        <!--        <c:set var="Dateee" value="<%=new java.util.Date()%>" />  -->

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title">Membresías</h4>
                        <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                            <i class="fa fa-plus"></i>
                            Añadir Membresía
                        </button>
                    </div>
                </div>
                <div class="card-body">

                    <!-- Modal Crear -->
                    <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header no-bd">
                                    <h5 class="modal-title">
                                        <span class="fw-mediumbold">
                                            Nuevo</span> 
                                        <span class="fw-light">
                                            Paquete
                                        </span>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form  action="MembresiaCreateServlet" method="post">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group form-group-default">
                                                    <label>Descripción</label>
                                                    <input required name="addDescripcion" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Paquete</label>
                                                    <select class="form-control" name="addPaqueteId" id="paquetesSelect">
                                                        <c:forEach var="tempP" items="${miListaDePaquetes}">
                                                            <option data-duracion="${tempP.duracion}" value="${tempP.id}">${tempP.nombre} - S/.${tempP.precio} - ${tempP.duracion} días</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Usuario</label>
                                                    <select class="form-control" name="addUsuarioId">
                                                        <c:forEach var="tempU" items="${miListaDeUsuarios}">
                                                            <option value="${tempU.id}">${tempU.apellidos},${tempU.nombres}:${tempU.dni}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Fecha de Inicio</label>
                                                    <input required name="addFechaInicio" type="date" class="form-control" id="addFechaInicio" onchange="handleDateChange(event)">
                                                </div>

                                                <!--<button onclick="sumarrr();">Sumar 5 días</button>-->
                                                <div class="form-group form-group-default">
                                                    <label>Fecha de Fin</label>
                                                    <input name="addFechaFin" type="text" class="form-control" id="addFechaFin">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Forma de pago</label>
                                                    <input required name="addFormaPago" type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <button type="submit" class="btn btn-primary">Guardar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Final Modal Crear -->

                    <div class="table-responsive">
                        <table id="add-row" class="display table table-striped table-hover" >
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Fecha inicio</th>
                                    <th>Fecha fin</th>
                                    <th>Usuario</th>
                                    <th>Paquete</th>
                                    <th>Forma de pago</th>
                                    <th style="width: 10%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tmpObj" items="${mi_lista_de_objetos}">
                                    <tr>
                                        <td>${tmpObj.descripcion}</td>
                                        <td>${tmpObj.fechaInicio}</td>
                                        <td>${tmpObj.fechaFin}</td>
                                        <td>${tmpObj.usersId.apellidos}, ${tmpObj.usersId.nombres}</td>
                                        <td>${tmpObj.paquetesId.nombre}</td>
                                        <td>${tmpObj.formaPago}</td>
                                        <!--                    <td>
                                        <fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${tmpObj.createdAt }"/>
                                      </td>
                                      <td>
                                        <fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${tmpObj.updatedAt }"/>
                                      </td>-->
                                        <td>
                                            <div class="form-button-action">
                                                <button type="button" data-toggle="modal" class="btn btn-link btn-primary btn-lg"
                                                        data-target="#${tmpObj.uniqueId}">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <button type="button" data-toggle="modal" class="btn btn-link btn-danger"
                                                        data-target="#${tmpObj.id}${tmpObj.uniqueId}">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>


                                    <!-- Modal Eliminar -->
                                <div class="modal fade" id="${tmpObj.id}${tmpObj.uniqueId}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header no-bd">
                                                <h5 class="modal-title">
                                                    <span class="fw-light">
                                                        ¿Está relamente seguro de querer 
                                                    </span>
                                                    <span class="fw-mediumbold">
                                                        eliminar</span> 
                                                    <span class="fw-light">
                                                        este paquete?
                                                    </span>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form  action="GenericDestroyServlet" method="post">
                                                    <input type="hidden" name="jpaController" value="Membresias">
                                                    <input type="hidden" name="servletName" value="Membresia">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group form-group-default">
                                                                <label>Id</label>
                                                                <input name="destroyId" id="destroyId" type="text" class="form-control" value="${tmpObj.id}" readonly>
                                                            </div>

                                                            <div class="form-group form-group-default">
                                                                <label>Descripción</label>
                                                                <input name="destroyAlgo" id="destroyAlgo" type="text" class="form-control" value="${tmpObj.descripcion}" readonly>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-danger">Borrar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal Editar -->
                                <div class="modal fade" id="${tmpObj.uniqueId}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header no-bd">
                                                <h5 class="modal-title">
                                                    <span class="fw-mediumbold">
                                                        Editar</span> 
                                                    <span class="fw-light">
                                                        Departamento
                                                    </span>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form  action="PaqueteEditServlet" method="post">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group form-group-default">
                                                                <label>Id</label>
                                                                <input name="editId" type="text" class="form-control" value="${tmpObj.id }" readonly>
                                                            </div>

                                                            <div class="form-group form-group-default">
                                                                <label>Descripción</label>
                                                                <input required name="editDescripcion" type="text" class="form-control" value="${tmpObj.descripcion }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Forma de Pago</label>
                                                                <input required name="editNombre" type="text" class="form-control" value="${tmpObj.formaPago }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Fecha inicio</label>
                                                                <fmt:formatDate type="date" dateStyle="medium" value="${tmpObj.fechaInicio }"/>
                                                                <input required name="editPrecio" type="date" class="form-control" value="${tmpObj.fechaInicio }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Fecha fin</label>
                                                                <fmt:formatDate  pattern = "yyyy-MM-dd" value="${tmpObj.fechaFin }"/>
                                                                <input required name="editDuracion" type="date" class="form-control" value="${tmpObj.fechaFin}">
                                                            </div>

                                                            <div class="form-group form-group-default">
                                                                <label>Select</label>
                                                                <select class="form-control" name="editEstado">
                                                                    <option value="activo">Activo</option>
                                                                    <option value="inactivo">Inactivo</option>
                                                                    <!--<option value="eliminado">Eliminado</option>-->
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery.3.2.1.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <script>
                                                        // Add Row
                                                        $('#add-row').DataTable({
                                                            "pageLength": 5,
                                                        });
                                                        function handleDateChange(event) {
                                                            const selectedDate = event.target.value;
                                                            const selectElement = document.getElementById('paquetesSelect');
                                                            const selectedOption = selectElement.options[selectElement.selectedIndex];
                                                            const duracion = parseInt(selectedOption.getAttribute('data-duracion'));
                                                            console.log('Fecha seleccionada:', selectedDate);
                                                            console.log("Duración: ", duracion)
                                                            // Obtener el valor de la fecha ingresada
                                                            var fechaInicio = document.getElementById('addFechaInicio').value;
                                                            // Comprobar si la fecha no está vacía
                                                            if (fechaInicio) {
                                                                // Crear un objeto Date a partir de la fecha ingresada
                                                                var fecha = new Date(fechaInicio);
                                                                // Sumar 5 días
                                                                fecha.setDate(fecha.getDate() + duracion);
                                                                // Formatear la nueva fecha en formato 'YYYY-MM-DD'
                                                                var anio = fecha.getFullYear();
                                                                var mes = (fecha.getMonth() + 1).toString().padStart(2, '0');
                                                                var dia = fecha.getDate().toString().padStart(2, '0');

                                                                var FechaFin = anio + "-" + mes + "-" + dia;
                                                                // Mostrar la nueva fecha en un campo de entrada
                                                                document.getElementById('addFechaFin').value = FechaFin;
                                                            } else {
                                                                alert('Por favor, ingrese una fecha de inicio.');
                                                            }
                                                        }
        </script>

    </jsp:attribute>
</t:template>
