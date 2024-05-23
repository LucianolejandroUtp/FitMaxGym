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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "UserListServlet", urlPatterns = {"/UserListServlet"})
public class UserListServlet extends HttpServlet {

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

        System.out.println("Entrando a Persona List Servlet");
        try {
            HttpSession session = request.getSession();
            Users miUsuario = (Users) session.getAttribute("miPersonaObtenida");
            System.out.println("variable :" + session.getAttribute("miPersonaObtenida"));

            if (miUsuario == null) {
                System.out.println("Usuario vacío");
                response.sendRedirect("auth/login.jsp");
            } else {

                EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");

                UsersJpaController jpacUsuario = new UsersJpaController(emf);
                RolesJpaController jpacRol = new RolesJpaController(emf);
                DistritosJpaController jpacDistrito = new DistritosJpaController(emf);

                List<Users> usuarios = new ArrayList<>();
                List<Roles> roles = new ArrayList<>();
                List<Distritos> distritos = new ArrayList<>();
//      List<Telefono> telefonos = new ArrayList<>();

//      System.out.println(jpacontroller_object.findDistritoEntities());
                usuarios = jpacUsuario.findUsersEntities();
                roles = jpacRol.findRolesEntities();
                distritos = jpacDistrito.findDistritosEntities();

                usuarios.forEach(p -> System.out.println("Data: " + p.getId() + " - " + p.getNombres()));
                //Expresion lambda reemplazando foreach
//            for (Persona per : usuarios) {
//                System.out.print(per.getId() + ": " + per.getNombres() + ": " + per.getEmail());
//            }
//      for (TipoPersona tipoPer : roles) {
//        System.out.println(tipoPer.getId() + ": " + tipoPer.getDescripcion());
//      }
                for (Users usr : usuarios) {
                    usr.getMembresiasList().forEach(d -> System.out.println(d.getDescripcion()));
                }

                roles.forEach(p -> System.out.println(p.getId() + " - " + p.getDescripcion()));

                request.setAttribute("mi_lista_de_usuarios", usuarios);
                request.setAttribute("mi_lista_de_roles", roles);
                request.setAttribute("miListaDeDistritos", distritos);
                request.getRequestDispatcher("User.jsp").forward(request, response);
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
