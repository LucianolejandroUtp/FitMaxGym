/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.gym.fitmax.config.JpaConfig;
import controlador.jpa.MembresiasJpaController;
import controlador.jpa.PaquetesJpaController;
import controlador.jpa.UsersJpaController;
import dto.Membresias;
import dto.Paquetes;
import dto.Users;
import jakarta.persistence.EntityManagerFactory;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "MembresiaListServlet", urlPatterns = {"/MembresiaListServlet"})
public class MembresiaListServlet extends HttpServlet {

    private EntityManagerFactory emf;
    private MembresiasJpaController jpacMembresia;
    private UsersJpaController jpacUsuario;
    private PaquetesJpaController jpacPaquete;

    @Override
    public void init() throws ServletException {
        System.out.println("Entrando a Servlet init");
        emf = JpaConfig.getEntityManagerFactory();
        jpacMembresia = new MembresiasJpaController(emf);
        jpacUsuario = new UsersJpaController(emf);
        jpacPaquete = new PaquetesJpaController(emf);
    }

    @Override
    public void destroy() {
        System.out.println("Entrando a Servlet destroy");
        JpaConfig.closeEntityManagerFactory();
    }

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
        System.out.println("Entrando a MembresiaListServlet processRequest");
//        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Users miUsuario = (Users) session.getAttribute("miPersonaObtenida");
        System.out.println("variable :" + session.getAttribute("miPersonaObtenida"));

        if (miUsuario == null) {
            System.out.println("Usuario vacío");
            response.sendRedirect("auth/login.jsp");
        } else {
            List<Membresias> membresias = jpacMembresia.findMembresiasEntities();
            List<Users> usuarios = jpacUsuario.findUsersEntities();
            List<Paquetes> paquetes = jpacPaquete.findPaquetesEntities();

            for (Membresias obj : membresias) {
                System.out.println(obj.getId() + " - " + obj.getPaquetesId().getNombre());
            }

            request.setAttribute("mi_lista_de_objetos", membresias);
            request.setAttribute("miListaDeUsuarios", usuarios);
            request.setAttribute("miListaDePaquetes", paquetes);
            request.getRequestDispatcher("Membresia.jsp").forward(request, response);
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
