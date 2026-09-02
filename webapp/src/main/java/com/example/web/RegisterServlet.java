package com.example.web;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
  private static final int SALT_BYTES = 16;
  private static final int HASH_BITS = 256;
  private static final int ITERATIONS = 120000;
  private final SecureRandom secureRandom = new SecureRandom();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String name = request.getParameter("Name");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String password = request.getParameter("psw");
    String repeatedPassword = request.getParameter("psw-repeat");

    if (isBlank(name) || isBlank(mobile) || isBlank(email) || isBlank(password)
        || !password.equals(repeatedPassword)) {
      sendError(response, HttpServletResponse.SC_BAD_REQUEST, "Please check the submitted fields.");
      return;
    }

    String databaseUrl = System.getenv("DB_URL");
    String databaseUser = System.getenv("DB_USER");
    String databasePassword = System.getenv("DB_PASSWORD");
    if (isBlank(databaseUrl) || isBlank(databaseUser) || databasePassword == null) {
      sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Registration service is not configured.");
      return;
    }

    try {
      String passwordHash = hashPassword(password.toCharArray());
      saveUser(databaseUrl, databaseUser, databasePassword, name.trim(), mobile.trim(),
          email.trim().toLowerCase(), passwordHash);
      response.sendRedirect(request.getContextPath() + "/index.jsp?registered=true#register");
    } catch (SQLException exception) {
      if ("23505".equals(exception.getSQLState())) {
        sendError(response, HttpServletResponse.SC_CONFLICT, "An account already exists for that email.");
      } else {
        log("Registration database failure", exception);
        sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Registration could not be completed.");
      }
    } catch (GeneralSecurityException exception) {
      log("Password hashing failure", exception);
      sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Registration could not be completed.");
    }
  }

  private void saveUser(String url, String user, String password, String name, String mobile,
      String email, String passwordHash) throws SQLException {
    String sql = "INSERT INTO users (name, mobile, email, password_hash) VALUES (?, ?, ?, ?)";
    try (Connection connection = DriverManager.getConnection(url, user, password);
        PreparedStatement statement = connection.prepareStatement(sql)) {
      statement.setString(1, name);
      statement.setString(2, mobile);
      statement.setString(3, email);
      statement.setString(4, passwordHash);
      statement.executeUpdate();
    }
  }

  private String hashPassword(char[] password) throws GeneralSecurityException {
    byte[] salt = new byte[SALT_BYTES];
    secureRandom.nextBytes(salt);
    KeySpec specification = new PBEKeySpec(password, salt, ITERATIONS, HASH_BITS);
    byte[] hash = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
        .generateSecret(specification).getEncoded();
    return ITERATIONS + "$" + Base64.getEncoder().encodeToString(salt) + "$"
        + Base64.getEncoder().encodeToString(hash);
  }

  private void sendError(HttpServletResponse response, int status, String message) {
    try {
      response.setStatus(status);
      response.setContentType("text/html;charset=UTF-8");
      response.getWriter().write("<p>" + escapeHtml(message) + "</p><p><a href=\"../index.jsp#register\">Return to registration</a></p>");
    } catch (IOException exception) {
      log("Unable to write registration error response", exception);
    }
  }

  private String escapeHtml(String value) {
    return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
        .replace("\"", "&quot;").replace("'", "&#39;");
  }

  private boolean isBlank(String value) {
    return value == null || value.trim().isEmpty();
  }
}
