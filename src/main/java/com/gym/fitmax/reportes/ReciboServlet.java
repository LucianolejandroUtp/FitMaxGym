/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym.fitmax.reportes;

import jakarta.persistence.EntityManager;
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
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Lucy
 */
@WebServlet(name = "ReciboServlet", urlPatterns = {"/ReciboServlet"})
public class ReciboServlet extends HttpServlet {

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
            System.out.println("------------------------------Ejemplo ReporteCitasServlet------------------------------");
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");
            EntityManager em = emf.createEntityManager();
            em.getTransaction().begin();
            Connection conexion = em.unwrap(Connection.class);

            ServletContext context = request.getServletContext();
            File jasperFile = new File(context.getRealPath("reportes/Citas3.jasper"));
//      File jasperFile = new File(request.getContextPath(""));
            System.out.println("Ruta: " + jasperFile);
            Map parametro = new HashMap();
            parametro.put("nn", "nn");

            System.out.println("---Conexion: " + conexion.getCatalog());
//      byte[] bytess = JasperRunManager.runReportToPdf("D:\\report1.jasper", parametro, con);
            byte[] bytess = JasperRunManager.runReportToPdf(jasperFile.getPath(), null, conexion);

            response.setContentType("application/pdf");

            response.setContentLength(bytess.length);
            ServletOutputStream output = response.getOutputStream();
            response.getOutputStream();
            output.write(bytess, 0, bytess.length);
            output.flush();
            output.close();
        } catch (SQLException ex) {
            Logger.getLogger(ReciboServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(ReciboServlet.class.getName()).log(Level.SEVERE, null, ex);
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
