package servlet;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "GenericDestroyServlet", urlPatterns = {"/GenericDestroyServlet"})
public class GenericDestroyServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            System.out.println("Entrando al eliminador genérico");

//Recibiendo y concatenando nombres de controlador y servlet de la vista junto con el id 
            String jpaController = "controlador.jpa." + request.getParameter("jpaController") + "JpaController";
            String servletName = request.getParameter("servletName") + "ListServlet";
            String destroyId = request.getParameter("destroyId");

            System.out.println("Datos de la vista: " + jpaController + " - " + servletName);

            EntityManagerFactory emf = Persistence.createEntityManagerFactory("fitmax_gym_pu");

            Class<?> obj_jpa;
            obj_jpa = Class.forName(jpaController);

            Constructor<?> constructorJpa = obj_jpa.getDeclaredConstructor(EntityManagerFactory.class);

            Object instanciaJpa = constructorJpa.newInstance(emf);

//            for(Method m :obj_jpa.getDeclaredMethods()){
//                System.out.println(m.getName());
//            }
            Method miMetodoJpaDestroy = obj_jpa.getDeclaredMethod("destroy", Long.class);

            miMetodoJpaDestroy.invoke(instanciaJpa, Long.valueOf(destroyId));

            response.sendRedirect(servletName);

        } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException ex) {
            Logger.getLogger(GenericDestroyServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GenericDestroyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GenericDestroyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
