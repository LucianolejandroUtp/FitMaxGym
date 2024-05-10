/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controlador.jpa.UsersJpaController;
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
import org.jasypt.util.password.BasicPasswordEncryptor;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "UserLoginServlet", urlPatterns = {"/UserLoginServlet"})
public class UserLoginServlet extends HttpServlet {

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

        System.out.println("Entrando a Persona Login Servlet");
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");
            UsersJpaController jpacPersona = new UsersJpaController(emf);
//      TipoUsersJpaController jpacTdPer = new TipoUsersJpaController(emf);
            List<Users> miListaDePersonas = new ArrayList<>();
            Users miPersonaObtenida = new Users();
//      List<TipoPersona> miListaDeTdPer = new ArrayList<>();
            int banderaLogin = 0;
            BasicPasswordEncryptor passEnc = new BasicPasswordEncryptor();
            HttpSession sesion = request.getSession();

//      System.out.println(jpacontroller_object.findDistritoEntities());
            miListaDePersonas = jpacPersona.findUsersEntities();
//      miListaDeTdPer = jpacTdPer.findTipoPersonaEntities();
            for (Users per : miListaDePersonas) {
//                System.out.println(per.getId() + ": " + per.getNombres() + ": " + per.getEmail() + ": " + per.getPassword() + ": " + per.getRolesId().getDescripcion());
                System.out.println(per.getId() + ": " + per.getNombres() + ": " + per.getEmail() + ": " + per.getPassword());
                if (per.getEmail().equals(request.getParameter("loginEmail")) && passEnc.checkPassword(request.getParameter("loginPassword"), per.getPassword())) {
                    miPersonaObtenida = per;
                    banderaLogin = 1;
                }
            }
            if (banderaLogin == 1) {

//        request.setAttribute("miPersonaObtenida", miPersonaObtenida);
                sesion.setAttribute("miPersonaObtenida", miPersonaObtenida);
                request.getRequestDispatcher("index.jsp").forward(request, response);

//        request.getRequestDispatcher("/NivelUsuarioServlet").include(request, response);
            } else {
                response.sendRedirect("auth/login.jsp");
            }
        } catch (IOException theException) {
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
