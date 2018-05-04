/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletController;

import Model_Class.DB_Connection;
import Model_Class.Decrept_Password;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author farzana
 */
public class Get_PasswordQuestion_Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sid=request.getParameter("sid");
        String selectedUrl=request.getParameter("url");
       
        String question="";
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null; 
        
        connection=DB_Connection.creatConnection();
        try {
            statement=connection.createStatement();
            resultSet=statement.executeQuery("select sQuestion from save_account where basicInfoId='"+sid+"' and url='"+selectedUrl+"'");
            if(resultSet.next()){
                
                question=resultSet.getString("sQuestion");
                PrintWriter writer = response.getWriter();

                // build HTML code
                String htmlRespone = "<html>";
                htmlRespone += "<p> <b>Question :</b> " + question + "<br/>"
                        + " <form method=\"post\" action=\"Show_Save_Password_Controlller\" >                                             \n" +
"                        \n" +
"                        \n" +
"                        <input type=\"text\" class=\"form-control hide\" name=\"sid\" value=" +sid+ " >\n" +
"                        <div>\n" +
"                            <label class=\"control-label \" for=\"password\">Answer : </label>\n" +
"                            <input type=\"text\" class=\"form-control\" name=\"sAns\" required=\"\">\n" +
"                        </div>\n" +
"                        <div class=\"well-sm\">\n" +
"                            <button type=\"submit\" class=\"btn btn-default\">Submit</button>\n" +
"                        </div>                        \n" +
"                    </form>  ";      
                htmlRespone += "</html>";

                // return response
                writer.println(htmlRespone);               
                
            }           
                
        } catch (SQLException ex) {
            Logger.getLogger(Login_Controller.class.getName()).log(Level.SEVERE, null, ex);
        } 
 
    }
  }
