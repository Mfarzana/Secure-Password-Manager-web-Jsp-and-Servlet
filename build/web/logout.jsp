<%-- 
    Document   : logout
    Created on : Jan 17, 2018, 10:25:33 PM
    Author     : farzana
--%>
<%  
   
    request.getSession(false).invalidate();  
    
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setDateHeader("Expires",-1);
  
    HttpServletResponse httpResponse = (HttpServletResponse) response;
    httpResponse.setDateHeader("Expires", 0); // Proxies.    
    response.sendRedirect("index.jsp");


  %> 
  
  