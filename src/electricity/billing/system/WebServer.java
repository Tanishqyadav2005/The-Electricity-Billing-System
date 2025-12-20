package electricity.billing.system;

import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.StandardRoot;
import org.apache.catalina.webresources.DirResourceSet;
import java.io.File;

public class WebServer {
    
    public static void main(String[] args) throws Exception {
        String webappDirLocation = "webapp/";
        Tomcat tomcat = new Tomcat();
        
        String webPort = System.getenv("PORT");
        if (webPort == null || webPort.isEmpty()) {
            webPort = "8080";
        }
        
        tomcat.setPort(Integer.parseInt(webPort));
        tomcat.getConnector();
        
        // Add webapp
        File webappDir = new File(webappDirLocation);
        if (!webappDir.exists()) {
            System.err.println("ERROR: webapp directory not found at: " + webappDir.getAbsolutePath());
            System.exit(1);
        }
        
        Context ctx = tomcat.addWebapp("", webappDir.getAbsolutePath());
        ctx.setReloadable(false);
        
        // Add compiled classes to WEB-INF/classes
        File additionWebInfClasses = new File("target/classes");
        if (additionWebInfClasses.exists()) {
            StandardRoot resources = new StandardRoot(ctx);
            resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes",
                    additionWebInfClasses.getAbsolutePath(), "/"));
            ctx.setResources(resources);
        }
        
        System.out.println("Configuring app with basedir: " + webappDir.getAbsolutePath());
        System.out.println("Classes directory: " + additionWebInfClasses.getAbsolutePath());
        
        tomcat.start();
        System.out.println("==========================================");
        System.out.println("Web Application Started!");
        System.out.println("Open your browser and go to:");
        System.out.println("http://localhost:" + webPort + "/login.jsp");
        System.out.println("==========================================");
        tomcat.getServer().await();
    }
}

