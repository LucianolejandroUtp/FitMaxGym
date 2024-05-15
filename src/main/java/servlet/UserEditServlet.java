/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controlador.jpa.DistritosJpaController;
import controlador.jpa.RolesJpaController;
import controlador.jpa.UsersJpaController;
import dto.Distritos;
import dto.Roles;
import dto.Users;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import org.jasypt.util.password.BasicPasswordEncryptor;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "UserEditServlet", urlPatterns = {"/UserEditServlet"})
public class UserEditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        System.out.println("--------------------Entrando a Users Edit Servlet--------------------");
        //Obteniendo todos los parámetros que recibimos de la vista; solo para saber con qué variables llegan
        System.out.println(request.getParameterMap());
        for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
            for (String s : e.getValue()) {
                System.out.println("Key: " + e.getKey() + " ForValue: " + s);
            }
        }
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");
        try {
//      Inicialización de objetos
            UsersJpaController jpacUser = new UsersJpaController(emf);
            RolesJpaController jpacRol = new RolesJpaController(emf);
            DistritosJpaController jpacDistrito = new DistritosJpaController(emf);
            Users oldUser;
            Roles rol;
            Distritos distrito;
            BasicPasswordEncryptor passEnc = new BasicPasswordEncryptor();

//      Lo relacionado a la fecha
//            Date dt = new Date();
//            Timestamp ts = new Timestamp(dt.getTime());
//            System.out.println(ts);
            
            SimpleDateFormat sdf_fecha = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = sdf_fecha.parse(String.valueOf(request.getParameter("editFecha")));

//      Obteniendo el objeto con foreign key en base al Id que nos da la vista
            rol = jpacRol.findRoles(Long.valueOf(request.getParameter("editRolId")));
            distrito = jpacDistrito.findDistritos(Long.valueOf(request.getParameter("editDistritoId")));

            //  Ahora necesitamos obtener el objeto a editar para chancar los nuevos valores encima
            oldUser = jpacUser.findUsers(Long.valueOf(request.getParameter("editId")));

            String test = request.getParameter("editPassword");
            System.out.println("La Persona obtenida es: " + oldUser);
            System.out.println("------------------------------Contrasenia de la vista: " + test);
            System.out.println("------------------------------Contrasenia de la vista encriptada: " + passEnc.encryptPassword(request.getParameter("editPassword")));
            System.out.println("------------------------------Contrasenia de la DB: " + oldUser.getPassword());
            System.out.println("Comprobación: " + passEnc.checkPassword(test, passEnc.encryptPassword(request.getParameter("editPassword"))));

//      Comparando y asignando nuevos valores al objeto
            if (oldUser.getNombres() == null || !oldUser.getNombres().equals(request.getParameter("editNombres"))) {
                oldUser.setNombres(request.getParameter("editNombres"));
            }
            if (oldUser.getApellidos() == null || !oldUser.getApellidos().equals(request.getParameter("editApellidos"))) {
                oldUser.setApellidos(request.getParameter("editApellidos"));
            }
            if (oldUser.getGenero() == null || !oldUser.getGenero().equals(request.getParameter("editGenero"))){
                oldUser.setGenero(request.getParameter("editGenero"));
            }
            if (oldUser.getDireccion() == null || !oldUser.getDireccion().equals(request.getParameter("editDireccion"))) {
                oldUser.setDireccion(request.getParameter("editDireccion"));
            }
            if (oldUser.getReferencia() == null || !oldUser.getReferencia().equals(request.getParameter("editReferencia"))) {
                oldUser.setReferencia(request.getParameter("editReferencia"));
            }
            if (oldUser.getDni() == null || !oldUser.getDni().equals(request.getParameter("editDni"))) {
                oldUser.setDni(request.getParameter("editDni"));
            }
            if (oldUser.getTelefono() == null || !oldUser.getTelefono().equals(request.getParameter("editTelefono"))) {
                oldUser.setTelefono(request.getParameter("editTelefono"));
            }
            if (oldUser.getTelefonoEmergencia()== null || !oldUser.getTelefonoEmergencia().equals(request.getParameter("editTelefonoEmergencia"))) {
                oldUser.setTelefonoEmergencia(request.getParameter("editTelefonoEmergencia"));
            }
            //Comparando fecha
            if (oldUser.getFechaNacimiento() == null || oldUser.getFechaNacimiento().compareTo(fecha) != 0) {
                oldUser.setFechaNacimiento(fecha);
            }
            
            if (oldUser.getEmail() == null || !oldUser.getEmail().equals(request.getParameter("editEmail"))) {
                oldUser.setEmail(request.getParameter("editEmail"));
            }
            if (oldUser.getPassword() == null) {
                oldUser.setPassword(passEnc.encryptPassword("123456"));
            } else {
                if (!request.getParameter("editPassword").equalsIgnoreCase("")) {
                    if (!passEnc.checkPassword(request.getParameter("editPassword"), oldUser.getPassword())) {
                        oldUser.setPassword(passEnc.encryptPassword(request.getParameter("editPassword")));
                    }
                }
            }
            if (oldUser.getEstado() == null || !oldUser.getEstado().equals(request.getParameter("editEstado"))) {
                oldUser.setEstado(request.getParameter("editEstado"));
            }

            if (!oldUser.getDistritosId().equals(distrito)) {
                oldUser.setDistritosId(distrito);
            }
            if (!oldUser.getRolesId().equals(rol)) {
                oldUser.setRolesId(rol);
            }

//            oldUser.setUpdatedAt(ts);

            System.out.println("La Persona actualizada es: "
                    + oldUser.getId() + ": " + oldUser.getNombres() + ": "
                    + oldUser.getEstado() + ": " + oldUser.getRolesId().getDescripcion() + ": "
                    + oldUser.getCreatedAt() + ": " + oldUser.getUpdatedAt());

            jpacUser.edit(oldUser);

            UserListServlet call = new UserListServlet();
            call.processRequest(request, response);

        } catch (Exception theException) {
            System.out.println(theException);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
