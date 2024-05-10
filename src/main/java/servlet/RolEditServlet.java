/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controlador.jpa.DistritosJpaController;
import controlador.jpa.RolesJpaController;
import dto.Distritos;
import dto.Roles;
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
@WebServlet(name = "RolEditServlet", urlPatterns = {"/RolEditServlet"})
public class RolEditServlet extends HttpServlet {

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

        System.out.println("Entrando a Rol Edit Servlet");
        System.out.println(request.getParameter("editId"));
        System.out.println(request.getParameter("editDescripcion"));
        System.out.println(request.getParameter("editEstado"));
//        System.out.println(request.getParameter("editDepaId"));
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");
//      Inicialización de objetos
            RolesJpaController jpaRol = new RolesJpaController(emf);
            Roles oldObject;

//      Lo relacionado a la fecha
            Date dt = new Date();
            Timestamp ts = new Timestamp(dt.getTime());
            System.out.println(ts);

            //  Ahora necesitamos obtener el objeto a editar para chancar los nuevos valores encima
            oldObject = jpaRol.findRoles(Long.valueOf(request.getParameter("editId")));
            System.out.println("El rol obtenido es: " + oldObject);

//      Comparando y asignando nuevos valores al Distrito
            if (!oldObject.getDescripcion().equals(request.getParameter("editDescripcion"))) {
                oldObject.setDescripcion(request.getParameter("editDescripcion"));
            }
            if (!oldObject.getEstado().equals(request.getParameter("editEstado"))) {
                oldObject.setEstado(request.getParameter("editEstado"));
            }

            oldObject.setUpdatedAt(ts);
//      oldObject_distrito.setDireccionCollection(mi_lista_de_Direcciones);

            System.out.println("El Rol actualizado es: "
                    + oldObject.getId() + " - " + oldObject.getDescripcion() + " - "
                    + oldObject.getEstado() + " - "
                    + oldObject.getCreatedAt() + " - " + oldObject.getUpdatedAt());

            jpaRol.edit(oldObject);

            RolListServlet call = new RolListServlet();
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
