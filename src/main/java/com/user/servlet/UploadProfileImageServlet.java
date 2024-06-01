package com.user.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.UUID;

import org.apache.commons.io.IOUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.entity.User;
@WebServlet("/upload_profile_image")
@MultipartConfig
public class UploadProfileImageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("userobj");
        if (loggedInUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Part filePart = request.getPart("profileImage");

        // Process the uploaded image and save it to the server
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Generate a unique filename for the uploaded image based on the user's ID
        String fileName = "profile_picture_" + loggedInUser.getId() + "_" + UUID.randomUUID().toString() + "_"
                + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = uploadPath + File.separator + fileName;

        try (InputStream inputStream = filePart.getInputStream();
                OutputStream outputStream = new FileOutputStream(filePath)) {
            IOUtils.copy(inputStream, outputStream);
        }

        // Update the logged-in user's profile image path
        String relativePath = "uploads/" + fileName; // Relative path to the image
        loggedInUser.setProfileImageFileName(fileName); // Set the filename as well
        loggedInUser.setProfileImagePath(relativePath); // Use the relative path
        session.setAttribute("userobj", loggedInUser); // Set the updated user object in the session

        // Redirect to profile page with success message
        session.setAttribute("succMsg", "Profile Picture Updated Successfully");
        response.sendRedirect("profile.jsp");
    }
}
