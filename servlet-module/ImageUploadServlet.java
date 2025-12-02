import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.*;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // 10MB
public class ImageUploadServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String meterNo = (String) session.getAttribute("meterNo");

        if (meterNo == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Part filePart = request.getPart("photo");
        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("error", "No file selected");
            request.getRequestDispatcher("uploadImage.jsp").forward(request, response);
            return;
        }

        String fileName = meterNo + "_" + filePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        Path filePath = Paths.get(uploadPath, fileName);
        try {
            Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            request.setAttribute("error", "File upload failed");
            request.getRequestDispatcher("uploadImage.jsp").forward(request, response);
            return;
        }

        request.setAttribute("imgPath", "uploads/" + fileName);
        request.getRequestDispatcher("viewImage.jsp").forward(request, response);
    }
}
