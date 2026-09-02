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
public class AdminUsersServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String databaseUrl = System.getenv("DB_URL");
    String databaseUser = System.getenv("DB_USER");
    String databasePassword = System.getenv("DB_PASSWORD");
    if (isBlank(databaseUrl) || isBlank(databaseUser) || databasePassword == null) {
      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database is not configured.");
      return;
    }

    response.setContentType("text/html;charset=UTF-8");
    response.getWriter().write("<!doctype html><html><head><meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"><title>Fashion Signup App | Customer Register</title><style>body{margin:0;background:#f2efeb;color:#171717;font-family:Georgia,serif}main{max-width:1100px;margin:0 auto;padding:60px 24px}header{display:flex;justify-content:space-between;align-items:end;border-bottom:1px solid #bbb;padding-bottom:20px;margin-bottom:30px}h1{font-size:42px;font-weight:400;letter-spacing:4px;margin:0}a{color:#171717}table{width:100%;border-collapse:collapse;background:#fff}th,td{text-align:left;padding:18px;border-bottom:1px solid #ddd}th{font-size:11px;letter-spacing:2px;text-transform:uppercase}td{font-size:14px}p{color:#666}@media(max-width:700px){main{padding:35px 14px}h1{font-size:28px}table{display:block;overflow-x:auto;white-space:nowrap}}</style></head><body><main><header><div><p>XIVO / PRIVATE STUDIO</p><h1>Customer Register</h1></div><a href=\"../index.jsp#home\">Back to site</a></header><p>Registered customers</p><table><tr><th>ID</th><th>Name</th><th>Mobile</th><th>Email</th><th>Created</th></tr>");
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
    response.getWriter().write("</table><p>Password values are intentionally hidden.</p></main></body></html>");
  }

  private String escapeHtml(String value) {
    return value == null ? "" : value.replace("&", "&amp;").replace("<", "&lt;")
        .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
  }

  private boolean isBlank(String value) {
    return value == null || value.trim().isEmpty();
  }
}
