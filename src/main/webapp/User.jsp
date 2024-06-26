<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<t:template title="Listar Personas">
    <jsp:attribute name="head_area">
    </jsp:attribute>
    <jsp:attribute name="body_area">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title">Personas</h4>

                        <c:choose>
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('administrador')}">
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                    <i class="fa fa-plus"></i>
                                    Añadir Usuario
                                </button>
                            </c:when>
                            
                            <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('empleado')}">
                                <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                                    <i class="fa fa-plus"></i>
                                    Añadir Usuario
                                </button>
                            </c:when>
                        </c:choose>

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
                                            Usuario
                                        </span>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form  action="UserCreateServlet" method="post">
                                        <div class="row">
                                            <div class="col-sm-6">

                                                <div class="form-group form-group-default">
                                                    <label>Nombres</label>
                                                    <input required name="addNombres" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Apellidos</label>
                                                    <input required name="addApellidos" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Género</label>
                                                    <select class="form-control" name="addGenero">
                                                        <option value="1">MASCULINO</option>
                                                        <option value="2">FEMENINO</option>
                                                    </select>
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Dirección</label>
                                                    <input required name="addDireccion" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Referencia</label>
                                                    <input name="addReferencia" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Distrito</label>
                                                    <select class="form-control" name="addDistritoId">
                                                        <c:forEach var="tempD" items="${miListaDeDistritos}">
                                                            <option value="${tempD.id}">${tempD.descripcion}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Rol</label>
                                                    <select class="form-control" name="addRolId">
                                                        <c:forEach var="temp" items="${mi_lista_de_roles}">
                                                            <c:choose>
                                                                <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('administrador')}">
                                                                    <option value="${temp.id}">${temp.descripcion }</option>
                                                                </c:when>
                                                                <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('empleado')}">
                                                                    <c:if test="${temp.descripcion.equalsIgnoreCase('cliente')}">
                                                                        <option value="${temp.id }">${temp.descripcion }</option>
                                                                    </c:if>
                                                                </c:when>
                                                            </c:choose>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group form-group-default">
                                                    <label>DNI</label>
                                                    <input required name="addDni" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Teléfono</label>
                                                    <input required name="addTelefono" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Teléfono de emergencia</label>
                                                    <input name="addTelefonoEmergencia" type="text" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Fecha de nacimiento</label>
                                                    <input required name="addFecha" type="date" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Email</label>
                                                    <input required name="addEmail" type="email" class="form-control">
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Password</label>
                                                    <input required name="addPassword" type="password" class="form-control" id="addPassword" onkeyup='check();'>
                                                </div>
                                                <div class="form-group form-group-default">
                                                    <label>Repita el Password</label>
                                                    <input required name="addPassword2" type="password" class="form-control" id="addPassword2" onkeyup='check();'>
                                                    <span id='message'></span>
                                                </div>
                                                <!--                                                <div class="form-group form-group-default">
                                                                                                    <label>Turno</label>
                                                                                                    <select class="form-control" name="addTurno">
                                                                                                        <option value="1">Mañana</option>
                                                                                                        <option value="2">Tarde</option>
                                                                                                        <option value="3">Noche</option>
                                                                                                    </select>
                                                                                                </div>
                                                -->
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

                    <div class="table-responsive">
                        <table id="add-row" class="display table table-striped table-hover" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th style="width: 10%">Acción</th>
                                    <th>Apellidos y Nombres</th>
                                    <th>DNI</th>
                                    <th>Teléfono</th>
                                    <th>Dirección</th>
                                    <th>Referencia</th>
                                    <th>Distrito</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Estado</th>
                                    <th>Creado</th>
                                    <th>Modificado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="temp" items="${mi_lista_de_usuarios }">
                                    <c:choose>
                                        <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('administrador')}">
                                            <tr>
                                                <td>
                                                    <div class="form-button-action">
                                                        <button type="button" data-toggle="modal" class="btn btn-link btn-primary btn-xs"
                                                                data-target="#${temp.uniqueId}">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <button type="button" data-toggle="modal" class="btn btn-link btn-danger btn-xs"
                                                                data-target="#${temp.id}${temp.uniqueId}">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                                <td>${temp.apellidos}, ${temp.nombres}</td>
                                                <td>${temp.dni}</td>
                                                <td>${temp.telefono}</td>
                                                <td>${temp.direccion}</td>
                                                <td>${temp.referencia}</td>
                                                <td>${temp.distritosId.descripcion}</td>
                                                <td>${temp.email}</td>
                                                <td>${temp.rolesId.descripcion}</td>
                                                <td>${temp.estado}</td>
                                                <td>
                                                    <fmt:formatDate value="${temp.createdAt }" type="both" dateStyle="medium" timeStyle="short"/>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${temp.updatedAt }" type="both" dateStyle="medium" timeStyle="short"/>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('empleado')}">
                                            <c:if test="${temp.rolesId.descripcion.equalsIgnoreCase('cliente')}">
                                                <tr>
                                                    <td>
                                                        <div class="form-button-action">
                                                            <button type="button" data-toggle="modal" class="btn btn-link btn-primary btn-lg"
                                                                    data-target="#${temp.uniqueId}">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                            <button type="button" data-toggle="modal" class="btn btn-link btn-danger"
                                                                    data-target="#${temp.id}${temp.uniqueId}">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td>${temp.apellidos}, ${temp.nombres }</td>
                                                    <td>${temp.dni}</td>
                                                    <td>${temp.telefono}</td>
                                                    <td>${temp.direccion}</td>
                                                    <td>${temp.referencia}</td>
                                                    <td>${temp.distritosId.descripcion}</td>
                                                    <td>${temp.email}</td>
                                                    <td>${temp.rolesId.descripcion}</td>
                                                    <td>${temp.estado}</td>
                                                    <td>
                                                        <fmt:formatDate value="${temp.createdAt }" type="both" dateStyle="medium" timeStyle="short"/>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${temp.updatedAt }" type="both" dateStyle="medium" timeStyle="short"/>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:when>
                                <%--        <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('empleado')}">
                                            <c:if test="${temp.email.equalsIgnoreCase(miPersonaObtenida.email)}">
                                                <tr>
                                                    <td>
                                                        <div class="form-button-action">
                                                            <button type="button" data-toggle="modal" class="btn btn-link btn-primary btn-lg"
                                                                    data-target="#${temp.uniqueId}">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                            <button type="button" data-toggle="modal" class="btn btn-link btn-danger"
                                                                    data-target="#${temp.id}${temp.uniqueId}">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td>${temp.apellidos}, ${temp.nombres }</td>
                                                    <td>${temp.dni}</td>
                                                    <td>${temp.telefono}</td>
                                                    <td>${temp.direccion}</td>
                                                    <td>${temp.referencia}</td>
                                                    <td>${temp.distritosId.descripcion}</td>
                                                    <td>${temp.email}</td>
                                                    <td>${temp.rolesId.descripcion}</td>
                                                    <td>${temp.estado}</td>
                                                    <td>
                                                        <fmt:formatDate value="${temp.createdAt }" type="both" dateStyle="medium" timeStyle="short"/>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${temp.updatedAt }" type="both" dateStyle="medium" timeStyle="short"/>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:when>--%>
                                    </c:choose>



                                    <!-- Modal Eliminar -->
                                <div class="modal fade" id="${temp.id}${temp.uniqueId}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header no-bd">
                                                <h5 class="modal-title">
                                                    <span class="fw-light">¿Está relamente seguro de querer</span>
                                                    <span class="fw-mediumbold"> eliminar </span>
                                                    <span class="fw-light">esta Persona?</span>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form  action="GenericDestroyServlet" method="post">
                                                    <input type="hidden" name="jpaController" value="Users">
                                                    <input type="hidden" name="servletName" value="User">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group form-group-default">
                                                                <label>Id</label>
                                                                <input name="destroyId" type="text" class="form-control" value="${temp.id }" readonly>
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Nombres</label>
                                                                <input type="text" class="form-control" value="${temp.nombres }" readonly>
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Apellidos</label>
                                                                <input type="text" class="form-control" value="${temp.apellidos }" readonly>
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
                                <div class="modal fade" id="${temp.uniqueId}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header no-bd">
                                                <h5 class="modal-title">
                                                    <span class="fw-mediumbold">Editar</span>
                                                    <span class="fw-light">Persona</span>
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form  action="UserEditServlet" method="post">
                                                    <div class="row ">
                                                        <div class="col-sm-6">
                                                            <div class="form-group form-group-default">
                                                                <label>Id</label>
                                                                <input name="editId" type="text" class="form-control" value="${temp.id }" readonly>
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Nombres</label>
                                                                <input required name="editNombres" type="text" class="form-control" value="${temp.nombres }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Apellidos</label>
                                                                <input required name="editApellidos" type="text" class="form-control" value="${temp.apellidos }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Género</label>
                                                                <select class="form-control" name="editGenero">
                                                                    <option value="1">MASCULINO</option>
                                                                    <option value="2">FEMENINO</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Dirección</label>
                                                                <input required name="editDireccion" type="text" class="form-control" value="${temp.direccion}">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Referencia</label>
                                                                <input required name="editReferencia" type="text" class="form-control" value="${temp.referencia}">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Distrito</label>
                                                                <select class="form-control" name="editDistritoId">
                                                                    <c:forEach var="tempD" items="${miListaDeDistritos}">
                                                                        <option value="${tempD.id}">${tempD.descripcion}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Rol</label>
                                                                <c:choose>
                                                                    <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('administrador')}">
                                                                        <select class="form-control" name="editRolId">
                                                                            <c:forEach var="tempEdit" items="${mi_lista_de_roles }">
                                                                                <option value="${tempEdit.id }">${tempEdit.descripcion }</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('empleado')}">
                                                                        <select class="form-control" name="editRolId">
                                                                            <c:forEach var="tempEdit" items="${mi_lista_de_roles }">
                                                                                <c:if test="${tempEdit.descripcion.equalsIgnoreCase('cliente')}">
                                                                                    <option value="${tempEdit.id }">${tempEdit.descripcion }</option>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${miPersonaObtenida.rolesId.descripcion.equalsIgnoreCase('cliente')}">
                                                                        <input name="editRolId" type="text" class="form-control" value="${temp.rolesId.id}" readonly>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group form-group-default">
                                                                <label>DNI</label>
                                                                <input required name="editDni" type="text" class="form-control" value="${temp.dni }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Teléfono</label>
                                                                <input required name="editTelefono" type="text" class="form-control" value="${temp.telefono }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Teléfono de emergencia</label>
                                                                <input name="editTelefonoEmergencia" type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Fecha de nacimiento</label>
                                                                <input required name="editFecha" type="date" class="form-control">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Email</label>
                                                                <input required name="editEmail" type="text" class="form-control" value="${temp.email }">
                                                            </div>
                                                            <div class="form-group form-group-default">
                                                                <label>Password</label>
                                                                <input name="editPassword" type="password" class="form-control" id="editPassword">
                                                            </div>
<!--                                                            <div class="form-group form-group-default">
                                                                <label>Repita el Password</label>
                                                                <input name="editPassword2${temp.id}" type="password" class="form-control" id="editPassword2" onkeyup='check2();'>
                                                                <span id='messageEdit'></span>
                                                            </div>-->

                                                            <!--                                                            <div class="form-group form-group-default">
                                                                                                                            <label>Turno</label>
                                                                                                                            <select class="form-control" name="editTurno">
                                                                                                                                <option value="1">Mañana</option>
                                                                                                                                <option value="2">Tarde</option>
                                                                                                                                <option value="3">Noche</option>
                                                                                                                            </select>
                                                                                                                        </div>
                                                            -->
                                                            <div class="form-group form-group-default">
                                                                <label>Estado</label>
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
                                                                    var check = function () {
                                                                        if (document.getElementById('addPassword').value === document.getElementById('addPassword2').value) {
                                                                            document.getElementById('message').style.color = 'green';
                                                                            document.getElementById('message').innerHTML = 'Coincide';
                                                                        } else {
                                                                            document.getElementById('message').style.color = 'red';
                                                                            document.getElementById('message').innerHTML = 'No coincide';
                                                                        }
                                                                    };
        </script>

    </jsp:attribute>
</t:template>