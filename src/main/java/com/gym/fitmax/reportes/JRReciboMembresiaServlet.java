/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym.fitmax.reportes;

import controlador.jpa.MembresiasJpaController;
import dto.Membresias;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "JRReciboMembresiaServlet", urlPatterns = {"/JRReciboMembresiaServlet"})
public class JRReciboMembresiaServlet extends HttpServlet {

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

        System.out.println("------------------------------Ejemplo ReporteDistritosServlet------------------------------");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");
//        EntityManager em = emf.createEntityManager();
//        em.getTransaction().begin();
//        Connection conexion = em.unwrap(Connection.class);

        MembresiasJpaController membresias = new MembresiasJpaController(emf);
        Membresias miMembresia = membresias.findMembresias(Long.valueOf(request.getParameter("id")));

        String nombresCompletos = miMembresia.getUsersId().getApellidos() +", "+ miMembresia.getUsersId().getNombres();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // Especificar el formato de salida
        Date fechaInicio = miMembresia.getFechaInicio();
        Date fechaFin = miMembresia.getFechaFin();
        
        String fechaInicioString = sdf.format(fechaInicio);
        String fechaFinString = sdf.format(fechaFin);

        try {
            ServletContext context = request.getServletContext();
            File jasperFile = new File(context.getRealPath("reportes/Simple_Blue_1.jasper"));

            System.out.println("Ruta: " + jasperFile);
//            System.out.println("---Conexion: " + conexion.getCatalog());

            Map parametro = new HashMap();
//            parametro.put("nn", "nn");
            parametro.put("Parameter1", "3334");
            parametro.put("Nombre", "Lucy");
            parametro.put("NombresCompletos", nombresCompletos);
            parametro.put("Membresia", miMembresia.getPaquetesId().getNombre());
            parametro.put("FechaInicio",fechaInicioString);
            parametro.put("FechaFin", fechaFinString);
            parametro.put("FormaPago", miMembresia.getFormaPago());

            byte[] bytess = JasperRunManager.runReportToPdf(jasperFile.getPath(), parametro, new JREmptyDataSource());

            response.setContentType("application/pdf");

            response.setContentLength(bytess.length);
            ServletOutputStream output = response.getOutputStream();
            response.getOutputStream();
            output.write(bytess, 0, bytess.length);
            output.flush();
            output.close();
        } catch (JRException e) {
            System.out.println(e);
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
