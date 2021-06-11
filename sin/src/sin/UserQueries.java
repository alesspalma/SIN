package sin;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class UserQueries {
	
	public static void insertUpdate(String query)
	{
		Statement stmt = null;
		int result;

		try {
			stmt = GUI.myConn.createStatement();
			result = stmt.executeUpdate(query);
			GUI.textPane.setText("Query OK! "+result+" righe modificate.");


		} catch (SQLException ex) {
			
			GUI.textPane.setText("SQLException: " + ex.getMessage() + "\n" + "SQLState: " + ex.getSQLState() + "\n" + "VendorError: " + ex.getErrorCode());
		} 
	}
	
	public static void query(String query)
    {
        Statement stmt = null;
        ResultSet rs;
        try {
            stmt = GUI.myConn.createStatement();
            rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            StringBuilder sb = new StringBuilder();
            while (rs.next())
            {
                for (int i = 1; i <= columnsNumber; i++)
                {
                    if (i > 1) sb.append(", ");
                    String columnValue = rs.getString(i);
                    sb.append(" " + rsmd.getColumnName(i) + ": " + columnValue);
                }
                sb.append("\n");
            }
            GUI.textPane.setText(sb.toString());
        }
        catch (SQLException ex)
        {
        	GUI.textPane.setText("SQLException: " + ex.getMessage() + "\n" + "SQLState: " + ex.getSQLState() + "\n" + "VendorError: " + ex.getErrorCode());
        }
    }

}
