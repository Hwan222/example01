package example01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DTO {
	public  void deleteMemo(String id) {        
        
            try {
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                String DriverName = "oracle.jdbc.driver.OracleDriver";
                String url = "jdbc:oracle:thin:@localhost:1521:XE";
                String user = "example01";
                String pw = "1234";
                
                Class.forName(DriverName);
                
                con = DriverManager.getConnection(url, user, pw);
                System.out.println("로그인체크연결성공");
                
                String sql = "delete from memo where id= ?";
                pstmt = con.prepareStatement(sql);
                
                pstmt.setString(1,id);
                pstmt.executeUpdate();
                con.close();
        		pstmt.close();
            }catch (Exception e) {
            e.printStackTrace();
            }
            
	}
}
