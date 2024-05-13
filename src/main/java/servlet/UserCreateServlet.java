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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jasypt.util.password.BasicPasswordEncryptor;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "UserCreateServlet", urlPatterns = {"/UserCreateServlet"})
public class UserCreateServlet extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            System.out.println("Bandera UserCreateServlet");

            System.out.println(request.getParameter("addNombres"));
            System.out.println(request.getParameter("addApellidos"));
            System.out.println(request.getParameter("addGenero"));
            System.out.println(request.getParameter("addDireccion"));
            System.out.println(request.getParameter("addReferencia"));
            System.out.println(request.getParameter("addTelefono"));
            System.out.println(request.getParameter("addTelefonoEmergencia"));
            System.out.println(request.getParameter("addDni"));
            System.out.println(request.getParameter("addFecha"));
            System.out.println(request.getParameter("addEmail"));
            System.out.println(request.getParameter("addPassword"));
            System.out.println(request.getParameter("addPassword2"));
            System.out.println(request.getParameter("addDistritoId"));
            System.out.println(request.getParameter("addRolId"));

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");

            UsersJpaController jpa_user = new UsersJpaController(emf);
            RolesJpaController jpa_rol = new RolesJpaController(emf);
            DistritosJpaController jpa_distrito = new DistritosJpaController(emf);

            Users mi_usuario = new Users();

            Distritos mi_distrito = jpa_distrito.findDistritos(Long.valueOf(request.getParameter("addDistritoId")));
//            Roles mi_rol = jpa_rol.findRoles(Long.valueOf(request.getParameter("addRolId")));
            Roles mi_rol = new Roles();

            String contrasenia, contrasenia2, contraseniaok = null;
            BasicPasswordEncryptor bpe = new BasicPasswordEncryptor();

//            System.out.println(mi_rol.getDescripcion());
            System.out.println(mi_distrito.getDescripcion());

            SimpleDateFormat sdf_fecha = new SimpleDateFormat("yyyy-MM-dd");
            Date date_fecha = sdf_fecha.parse(request.getParameter("addFecha"));
            Date dt = new Date();
            Timestamp ts = new Timestamp(dt.getTime());
            System.out.println(ts);

            contrasenia = String.valueOf(request.getParameter("addPassword"));
            contrasenia2 = String.valueOf(request.getParameter("addPassword2"));

            if (request.getParameter("addRolId") == null) {
                System.out.println("Tipo de persona vacío, viene del register");
                mi_rol = jpa_rol.findRoles(Long.valueOf(2));
                System.out.println("El Tipo de Persona obtenido fue: " + mi_rol.getDescripcion() + " - " + mi_rol.getId());

            } else {//Llenando datos  que únicamente se reciben desde Persona.jsp
//      Obteniendo el Tipo dePpersona en base al Id obtenido de la vista
                mi_rol = jpa_rol.findRoles(Long.valueOf(request.getParameter("addRolId")));
                System.out.println("El Tipo de Persona obtenido fue: " + mi_rol.getDescripcion() + " - " + mi_rol.getId());
            }
            if (contrasenia.equalsIgnoreCase(contrasenia2)) {
                System.out.println("Bandera: Password SI coinciden");
                contraseniaok = contrasenia;
                mi_usuario.setPassword(bpe.encryptPassword(String.valueOf(contraseniaok)));
            }
            if (request.getParameter("addReferencia").equalsIgnoreCase("")) {
                mi_usuario.setReferencia("Ninguna");
            } else {
                mi_usuario.setReferencia(request.getParameter("addReferencia"));
            }
            if (request.getParameter("addTelefonoEmergencia").equalsIgnoreCase("")) {
                mi_usuario.setTelefonoEmergencia("Ninguna");
            } else {
                mi_usuario.setTelefonoEmergencia(request.getParameter("addTelefonoEmergencia"));
            }
            if (request.getParameter("addFecha").equalsIgnoreCase("")) {
                mi_usuario.setReferencia("Ninguna");
            } else {
                mi_usuario.setReferencia(request.getParameter("addReferencia"));
                mi_usuario.setFechaNacimiento(date_fecha);
            }

//        mi_usuario.setId(Long.valueOf(100));
            mi_usuario.setUniqueId(String.valueOf(java.util.UUID.randomUUID()));
            mi_usuario.setNombres(request.getParameter("addNombres"));
            mi_usuario.setApellidos(request.getParameter("addApellidos"));
            mi_usuario.setGenero(request.getParameter("addGenero"));
            mi_usuario.setDireccion(request.getParameter("addDireccion"));
//            mi_usuario.setReferencia(request.getParameter("addReferencia"));
            mi_usuario.setTelefono(request.getParameter("addTelefono"));
//            mi_usuario.setTelefonoEmergencia(request.getParameter("addTelefonoEmergencia"));
            mi_usuario.setDni(request.getParameter("addDni"));
            mi_usuario.setEmail(request.getParameter("addEmail"));
//            mi_usuario.setPassword(request.getParameter("addPassword"));
            mi_usuario.setEstado("ACTIVO");
//            mi_usuario.setCreatedAt(ts);
//            mi_usuario.setUpdatedAt(ts);

            mi_usuario.setDistritosId(mi_distrito);
            mi_usuario.setRolesId(mi_rol);

            jpa_user.create(mi_usuario);

            if (request.getParameter("addRolId") == null) {
//                    request.getRequestDispatcher("/EmailRegistroPersonaServlet").include(request, response);
                response.sendRedirect("auth/login.jsp");
            } else {
                //      Llamando al listALGO.jsp
                UserListServlet call = new UserListServlet();
                call.processRequest(request, response);
            }

        } catch (ParseException ex) {
            Logger.getLogger(UserCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
