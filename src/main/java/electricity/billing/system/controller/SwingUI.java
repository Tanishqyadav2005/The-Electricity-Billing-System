package view;

import java.net.HttpURLConnection;
import java.net.URL;

public class SwingUI {

    public static void main(String[] args) throws Exception {

        URL url = new URL("http://localhost:8080/EBS/CustomerServlet");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();

        con.setRequestMethod("POST");
        con.setDoOutput(true);

        String data = "action=add&name=Ramesh&units=120";
        con.getOutputStream().write(data.getBytes());

        System.out.println("Request Sent to Servlet");
    }
}
