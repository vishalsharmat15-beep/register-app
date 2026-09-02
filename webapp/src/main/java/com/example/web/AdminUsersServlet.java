package com.example.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminUsersServlet extends HttpServlet {
  private static final String ADMIN_AUTHENTICATED = "adminAuthenticated";

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String expectedToken = System.getenv("ADMIN_TOKEN");
    String submittedToken = request.getParameter("token");
    if (expectedToken == null || expectedToken.trim().isEmpty()
        || !expectedToken.equals(submittedToken)) {
      response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid admin token.");
      return;
    }

    request.getSession(true).setAttribute(ADMIN_AUTHENTICATED, Boolean.TRUE);
    response.sendRedirect(request.getContextPath() + "/admin/users");
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session == null || !Boolean.TRUE.equals(session.getAttribute(ADMIN_AUTHENTICATED))) {
      response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Admin authentication required.");
      return;
    }

    String databaseUrl = System.getenv("DB_URL");
    String databaseUser = System.getenv("DB_USER");
    String databasePassword = System.getenv("DB_PASSWORD");
    if (isBlank(databaseUrl) || isBlank(databaseUser) || databasePassword == null) {
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database is not configured.");
      return;
    }

    response.setContentType("text/html;charset=UTF-8");
    response.getWriter().write("<h1>Registered users</h1><table><tr><th>ID</th><th>Name</th><th>Mobile</th><th>Email</th><th>Created</th></tr>");
    String sql = "SELECT id, name, mobile, email, created_at FROM users ORDER BY created_at DESC";
    try (Connection connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet results = statement.executeQuery()) {
      while (results.next()) {
        response.getWriter().write("<tr><td>" + results.getLong("id") + "</td><td>"
            + escapeHtml(results.getString("name")) + "</td><td>"
            + escapeHtml(results.getString("mobile")) + "</td><td>"
            + escapeHtml(results.getString("email")) + "</td><td>"
            + escapeHtml(results.getString("created_at")) + "</td></tr>");
      }
    } catch (SQLException exception) {
      log("Unable to load registered users", exception);
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Users could not be loaded.");
      return;
    }
    response.getWriter().write("</table><p>Password values are intentionally hidden.</p>");
  }

  private String escapeHtml(String value) {
    return value == null ? "" : value.replace("&", "&amp;").replace("<", "&lt;")
        .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
  }

  private boolean isBlank(String value) {
    return value == null || value.trim().isEmpty();
  }
}
