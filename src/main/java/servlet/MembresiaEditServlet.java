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

@WebServlet(name = "MembresiaEditServlet", urlPatterns = {"/MembresiaEditServlet"})
public class MembresiaEditServlet extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("Entrando a MembresiaEditServlet");

//Obteniendo todos los parámetros que recibimos de la vista; solo para saber con qué variables llegan
            System.out.println(request.getParameterMap());
            for (Map.Entry<String, String[]> e : request.getParameterMap().entrySet()) {
                for (String s : e.getValue()) {
                    System.out.println("Key: " + e.getKey() + " ForValue: " + s);
                }
            }

            SimpleDateFormat sdf_fecha = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicio = sdf_fecha.parse(String.valueOf(request.getParameter("editFechaInicio")));
            Date fechaFin = sdf_fecha.parse(String.valueOf(request.getParameter("editFechaFin")));

//      Obteniendo el objeto con foreign key en base al Id que nos da la vista
            Users usuario = jpacUsuario.findUsers(Long.valueOf(request.getParameter("editUsuarioId")));
            Paquetes paquete = jpacPaquete.findPaquetes(Long.valueOf(request.getParameter("editPaqueteId")));

//  Ahora necesitamos obtener el objeto a editar para chancar los nuevos valores encima
            Membresias oldMembresia = jpacMembresia.findMembresias(Long.valueOf(request.getParameter("editId")));

//      Comparando y asignando nuevos valores al objeto
            if (oldMembresia.getDescripcion() == null || !oldMembresia.getDescripcion().equals(request.getParameter("editDescripcion"))) {
                oldMembresia.setDescripcion(request.getParameter("editDescripcion"));
            }
            if (oldMembresia.getFormaPago() == null || !oldMembresia.getFormaPago().equals(request.getParameter("editFormaPago"))) {
                oldMembresia.setFormaPago(request.getParameter("editFormaPago"));
            }
            
            //Comparando fecha
            if (oldMembresia.getFechaInicio()== null || oldMembresia.getFechaInicio().compareTo(fechaInicio) != 0) {
                oldMembresia.setFechaInicio(fechaInicio);
            }
            if (oldMembresia.getFechaFin()== null || oldMembresia.getFechaFin().compareTo(fechaFin) != 0) {
                oldMembresia.setFechaFin(fechaFin);
            }
            if (!oldMembresia.getEstado().equals(request.getParameter("editEstado"))) {
                oldMembresia.setEstado(request.getParameter("editEstado"));
            }
            
            if (!oldMembresia.getUsersId().equals(usuario)) {
                oldMembresia.setUsersId(usuario);
            }
            if (!oldMembresia.getPaquetesId().equals(paquete)) {
                oldMembresia.setPaquetesId(paquete);
            }
            
            
            jpacMembresia.edit(oldMembresia);
            
            //Llamando al *ListServlet
            response.sendRedirect("MembresiaListServlet");
            
        } catch (ParseException ex) {
            Logger.getLogger(MembresiaEditServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MembresiaEditServlet.class.getName()).log(Level.SEVERE, null, ex);
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
