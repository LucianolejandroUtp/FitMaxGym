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
import java.util.Date;

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
        response.setContentType("text/html;charset=UTF-8");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");

        UsersJpaController jpa_users = new UsersJpaController(emf);
        RolesJpaController jpa_roles = new RolesJpaController(emf);
        DistritosJpaController jpa_distritos = new DistritosJpaController(emf);

        Users mi_usuario = new Users();
        
        Roles mi_rol = jpa_roles.findRoles(Long.valueOf(1));
        Distritos mi_distrito = jpa_distritos.findDistritos(Long.valueOf(9));
        
        System.out.println(mi_rol.getDescripcion());
        System.out.println(mi_distrito.getDescripcion());;
        

        Date dt = new Date();
        Timestamp ts = new Timestamp(dt.getTime());
        System.out.println(ts);

//        mi_usuario.setId(Long.valueOf(100));
        mi_usuario.setNombres("Nombre de prueba");
        mi_usuario.setApellidos("Apellido de prueba");
        mi_usuario.setDni("34567893");
        mi_usuario.setEmail("email@prueba.com3");
        mi_usuario.setPassword("123456");
        mi_usuario.setEstado("ACTIVO");
        mi_usuario.setCreatedAt(ts);
        mi_usuario.setUpdatedAt(ts);
        
        mi_usuario.setRolesId(mi_rol);
        mi_usuario.setDistritosId(mi_distrito);

        jpa_users.create(mi_usuario);

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
