/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import controlador.jpa.PaquetesJpaController;
import dto.Paquetes;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "PaqueteCreateServlet", urlPatterns = {"/PaqueteCreateServlet"})
public class PaqueteCreateServlet extends HttpServlet {

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
        
        System.out.println("--------------------Entrando a PaqueteCreateServlet--------------------");
        //Obteniendo todos los parámetros que recibimos de la vista; solo para saber con qué variables llegan
        System.out.println(request.getParameterMap());
        for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
            for (String s : e.getValue()) {
                System.out.println("Key: " + e.getKey() + " ForValue: " + s);
            }
        }
        
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");
        
        PaquetesJpaController jpa_paquete = new PaquetesJpaController(emf);
        Paquetes mi_paquete = new Paquetes();

        mi_paquete.setUniqueId(String.valueOf(java.util.UUID.randomUUID()));
        mi_paquete.setNombre(request.getParameter("addNombre"));
        mi_paquete.setDescripcion(request.getParameter("addDescripcion"));
        mi_paquete.setPrecio(Integer.parseInt(request.getParameter("addPrecio")));
        mi_paquete.setDuracion(Integer.parseInt(request.getParameter("addDuracion")));
        mi_paquete.setEstado("ACTIVO");

        jpa_paquete.create(mi_paquete);

//      Llamando al listALGO.jsp
        PaqueteListServlet call = new PaqueteListServlet();
        call.processRequest(request, response);
        
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
