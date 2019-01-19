/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.licvhn.myapp.api;

import com.google.gson.Gson;
import com.licvhn.myapp.dao.CategoriaDAO;
import com.licvhn.myapp.impl.CategoriaDAOImpl;
import com.licvhn.myapp.model.Categoria;
import com.licvhn.myapp.utilities.BEAN_CRUD;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Lizet
 */
@WebServlet(name = "CategoriaAPI", urlPatterns = {"/categorias"})
public class CategoriaAPI extends HttpServlet {

    private static final java.util.logging.Logger LOG = java.util.logging.Logger.getLogger(CategoriaAPI.class.getName());
    @Resource(name = "jdbc/dbmyapp")
    private DataSource pool;
    private Gson jsonParse;
    private HashMap<String, Object> parameters;
    private String jsonResponse;
    private String action;
    private CategoriaDAO categoriaDAO;

    @Override
    public void init() throws ServletException {
        this.jsonParse = new Gson();
        this.parameters = new HashMap<>();
        this.categoriaDAO = new CategoriaDAOImpl(this.pool);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
            switch (this.action) {
                case "paginarCategoria":
                    processCategoria(new BEAN_CRUD(this.categoriaDAO.getPagination(getParameters(request))), response);
                    break;
                case "addCategoria":
                    processCategoria(this.categoriaDAO.add(getCategoria(request), getParameters(request)), response);
                    break;
                case "updateCategoria":
                    processCategoria(this.categoriaDAO.update(getCategoria(request), getParameters(request)), response);
                    break;
                case "deleteCategoria":
                    processCategoria(this.categoriaDAO.delete(Integer.parseInt(request.getParameter("txtIdCategoriaER")), getParameters(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp_app/mantenimiento/categoria.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    private void processCategoria(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.jsonParse.toJson(beanCrud);
            LOG.info(this.jsonResponse);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(CategoriaAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParameters(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtNombreCategoria"));
        this.parameters.put("SQL_ORDER_BY", "NOMBRE ASC");
        // LIMIT 20 OFFSET 0
        this.parameters.put("SQL_LIMIT", " LIMIT " + request.getParameter("sizePageCategoria") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageCategoria")) - 1) * Integer.parseInt(request.getParameter("sizePageCategoria")));
        return this.parameters;
    }

    private Categoria getCategoria(HttpServletRequest request) {
        Categoria categoria = new Categoria();
        if (request.getParameter("action").equals("updateCategoria")) {
            categoria.setIdcategoria(Integer.parseInt(request.getParameter("txtIdCategoriaER")));
        }
        categoria.setNombre(request.getParameter("txtNombreCategoriaER"));
        return categoria;
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
