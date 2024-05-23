/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controlador.jpa.RolesJpaController;
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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "RolListServlet", urlPatterns = {"/RolListServlet"})
public class RolListServlet extends HttpServlet {

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

        System.out.println("Entrando a Roles List Servlet");
        try {
            HttpSession session = request.getSession();
            Users miUsuario = (Users) session.getAttribute("miPersonaObtenida");
            System.out.println("variable :" + session.getAttribute("miPersonaObtenida"));

            if (miUsuario == null) {
                System.out.println("Usuario vacío");
                response.sendRedirect("auth/login.jsp");
            } else {

                EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");

                RolesJpaController jpacRoles = new RolesJpaController(emf);
                List<Roles> roles = new ArrayList<>();

//      System.out.println(listD.findDistritoEntities());
                roles = jpacRoles.findRolesEntities();

                for (Roles elemento : roles) {
                    System.out.println(elemento.getId() + " - " + elemento.getDescripcion());
                }

                request.setAttribute("mi_lista_de_objetos", roles);
                request.getRequestDispatcher("Rol.jsp").forward(request, response);
            }

        } catch (IOException | ServletException theException) {
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
