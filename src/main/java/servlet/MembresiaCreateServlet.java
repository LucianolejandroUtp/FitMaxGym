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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "MembresiaCreateServlet", urlPatterns = {"/MembresiaCreateServlet"})
public class MembresiaCreateServlet extends HttpServlet {

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
        try {
            System.out.println("Entrando a MembresiaCreateServlet processRequest");
//Obteniendo todos los parámetros que recibimos de la vista; solo para saber con qué variables llegan
            System.out.println(request.getParameterMap());
            for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
                for (String s : e.getValue()) {
                    System.out.println("Key: " + e.getKey() + " ForValue: " + s);
                }
            }
            Membresias membresia = new Membresias();
            Users mi_usuario = jpacUsuario.findUsers(Long.valueOf(request.getParameter("addUsuarioId")));
            Paquetes mi_paquete = jpacPaquete.findPaquetes(Long.valueOf(request.getParameter("addPaqueteId")));

            SimpleDateFormat sdf_fecha = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicio = sdf_fecha.parse(request.getParameter("addFechaInicio"));
            Date fechaFin = sdf_fecha.parse(request.getParameter("addFechaFin"));

            membresia.setUniqueId(String.valueOf(java.util.UUID.randomUUID()));
            membresia.setDescripcion(request.getParameter("addDescripcion"));
            membresia.setFormaPago(request.getParameter("addFormaPago"));
            membresia.setFechaInicio(fechaInicio);
            membresia.setFechaFin(fechaFin);
            membresia.setEstado("ACTIVO");

            membresia.setUsersId(mi_usuario);
            membresia.setPaquetesId(mi_paquete);

            jpacMembresia.create(membresia);
            response.sendRedirect("MembresiaListServlet");

//      Llamando al listALGO.jsp
//            MembresiaListServlet call = new MembresiaListServlet();
//            call.processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(MembresiaCreateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
