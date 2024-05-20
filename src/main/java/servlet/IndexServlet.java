/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.gym.fitmax.config.JpaConfig;
import controlador.jpa.PaquetesJpaController;
import dto.Paquetes;
import jakarta.persistence.EntityManagerFactory;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {

    private EntityManagerFactory emf;
    private PaquetesJpaController jpacPaquete;
//    private UsersJpaController jpacUsuario;
//    private PaquetesJpaController jpacPaquete;

    @Override
    public void init() throws ServletException {
        System.out.println("Entrando a Servlet init");
        emf = JpaConfig.getEntityManagerFactory();
        jpacPaquete = new PaquetesJpaController(emf);
//        jpacUsuario = new UsersJpaController(emf);
//        jpacPaquete = new PaquetesJpaController(emf);
    }

    @Override
    public void destroy() {
        System.out.println("Entrando a Servlet destroy");
        JpaConfig.closeEntityManagerFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Entrando al IndexServlet");
        
        List<Paquetes> paquetes = jpacPaquete.findPaquetesEntities();
        HttpSession sesion = request.getSession();

        sesion.setAttribute("listaDePaquetes", paquetes);
        request.getRequestDispatcher("index.jsp").forward(request, response);

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
