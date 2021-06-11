package sin;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.swing.JFrame;


public class Queries {
	
	public static void op1(String agente, String indagine)
	{
        CallableStatement stmt = null;
        int result;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione1(?,?) }");
            stmt.setString(1,agente);
            stmt.setString(2,indagine);
            result=stmt.executeUpdate();
            //System.out.println("Query OK! "+result+" righe modificate.");
            GUI.textPane.setText("Query OK! "+result+" righe modificate.");

		} catch (SQLException ex) {
			GUI.textPane.setText("SQLException: " + ex.getMessage() + "\n" + "SQLState: " + ex.getSQLState() + "\n" + "VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op2(String spia, int codice_op)
	{
        CallableStatement stmt = null;
        int result;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione2(?,?) }");
            stmt.setString(1,spia);
            stmt.setInt(2,codice_op);
            result=stmt.executeUpdate();
            //System.out.println("Query OK! "+result+" righe modificate.");
            GUI.textPane.setText("Query OK! "+result+" righe modificate.");

		} catch (SQLException ex) {
			GUI.textPane.setText("SQLException: " + ex.getMessage() + "\n" + "SQLState: " + ex.getSQLState() + "\n" + "VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op3()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM settore WHERE settore.ambito NOT IN (SELECT istanza_settore.ambito FROM istanza_settore WHERE data_costruzione < '2010-01-01')";

		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();

				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String ambito = rs.getString("ambito");
					int finanziamento = rs.getInt("finanziamento");
					
					sb.append("ambito: " + ambito);
					sb.append(", finanziamento: " + finanziamento);
					sb.append("\n");
					//System.out.println("ambito: " + ambito + ", finanziamento: " + finanziamento);
					GUI.textPane.setText(sb.toString());
					
				}
				
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
	}
	
	public static void op4(String spia)
	{
        CallableStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione4(?) }");
            stmt.setString(1,spia);
            rs = stmt.executeQuery();
            StringBuilder sb = new StringBuilder();
			while (rs.next()) 
			{
				String n_distintivo = rs.getString("n_distintivo");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String nome_in_codice = rs.getString("nome_in_codice");
				Date data_nascita = rs.getDate("data_nascita");
				String n_cercapersone = rs.getString("n_cercapersone");
				int codice_contratto = rs.getInt("codice_contratto");
				int codice_op_spionaggio = rs.getInt("codice");
				Date data_inizio = rs.getDate("data_inizio");
				Date data_fine = rs.getDate("data_fine");
				String tipo = rs.getString("tipo");
				String stato = rs.getString("stato");
				
				sb.append("n_distintivo: " + n_distintivo + ", nome: " + nome + ", cognome: " + cognome +
						 ", nome_in_codice: " + nome_in_codice + ", data_nascita: " + data_nascita +
						 ", n_cercapersone: " + n_cercapersone + ", codice_contratto: " + codice_contratto +
						 ", codice_op_spionaggio: " + codice_op_spionaggio + ", data_inizio: " + data_inizio +
						 ", data_fine: " + data_fine +  ", tipo: " + tipo + ", stato: " + stato);
				sb.append("\n");
				GUI.textPane.setText(sb.toString());
						 
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op5(String prov)
	{
        CallableStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione5(?) }");
            stmt.setString(1,prov);
            rs = stmt.executeQuery();
			while (rs.next()) 
			{
				int n_detenuti = rs.getInt("SUM(n_detenuti)");
				GUI.textPane.setText("n_detenuti: " + n_detenuti);
				//System.out.println("n_detenuti: " + n_detenuti);
						 
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op6()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT criminale FROM criminali_indagini JOIN reati_indagini ON criminali_indagini.nome_in_codice = reati_indagini.nome_in_codice "
				+ "GROUP BY criminale HAVING ( COUNT(DISTINCT criminali_indagini.nome_in_codice) > 3 AND COUNT(DISTINCT reati_indagini.reato) > 2 )";
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();

				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String criminale = rs.getString("criminale");
					
					//System.out.println("criminale: " + criminale);
					sb.append("criminale: " + criminale);
					sb.append("\n");
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op7()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT MAX(stipendi) FROM (SELECT MAX(unione.stipendio) AS stipendi FROM ( SELECT cf,stipendio,anni_lavoro,codice_contratto,sede " + 
				"FROM operatore_logistico AS op1 JOIN contratto_op_uff_attuale ON op1.codice_contratto=contratto_op_uff_attuale.codice " + 
				"WHERE anni_lavoro >= 10 UNION SELECT op2.cf,stipendio,anni_lavoro,codice AS codice_contratto,sede " + 
				"FROM operatore_logistico AS op2 JOIN contratto_op_log_scaduto ON op2.codice_contratto=contratto_op_log_scaduto.codice " + 
				"WHERE anni_lavoro >= 10) AS unione GROUP BY unione.cf HAVING COUNT(DISTINCT unione.sede > 2)) AS risultati";
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();

				while (rs.next()) 
				{
					int stipendio = rs.getInt("MAX(stipendi)");
					GUI.textPane.setText("stipendio: " + stipendio);
					//System.out.println("stipendio: " + stipendio);
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op8()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT DISTINCT numero_distintivo " + 
				"FROM comp_indagini " + 
				"WHERE comp_indagini.nome_in_codice IN (SELECT indagine.nome_in_codice " + 
				"FROM ((indagine JOIN criminali_indagini ON indagine.nome_in_codice = criminali_indagini.nome_in_codice) " + 
				"JOIN criminale ON criminale=cf) JOIN detenzione ON cf = detenzione.criminale " + 
				"WHERE data_fine IS NOT NULL AND durata_condanna = 'ergastolo' and org_criminale IS NOT NULL)";
				
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();
				
				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String numero_distintivo = rs.getString("numero_distintivo");
					sb.append("numero_distintivo: " + numero_distintivo);
					sb.append("\n");
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op9(String stato)
	{
        CallableStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione9(?) }");
            stmt.setString(1,stato);
            rs = stmt.executeQuery();
            StringBuilder sb = new StringBuilder();
			while (rs.next()) 
			{
				int codice_operazione = rs.getInt("codice_operazione");
				sb.append("codice_operazione: " + codice_operazione);
				sb.append("\n");
				GUI.textPane.setText(sb.toString());
						 
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op10(String data)
	{
		java.util.Date myDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try { myDate = sdf.parse(data); }
		catch(ParseException e) { e.printStackTrace(); }
        CallableStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione10(?) }");
            stmt.setDate(1, new java.sql.Date(myDate.getTime()));
            rs = stmt.executeQuery();
            StringBuilder sb = new StringBuilder();
			while (rs.next()) 
			{
				int codice = rs.getInt("codice");
				String descrizione = rs.getString("descrizione");
				sb.append("codice: " + codice + ", descrizione: " + descrizione);
				sb.append("\n");
				//System.out.println("codice: " + codice + ", descrizione: " + descrizione);
				GUI.textPane.setText(sb.toString());
						 
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op11()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT sede.indirizzo,AVG(stipendio) " + 
				"FROM (sede JOIN contratto_op_uff_attuale ON indirizzo=sede) JOIN operatore_logistico ON contratto_op_uff_attuale.codice=operatore_logistico.codice_contratto " + 
				"WHERE sede.città IN (SELECT città " + 
				"FROM sede AS sede2 " + 
				"GROUP BY città " + 
				"HAVING COUNT(*) > 1) " + 
				"GROUP BY sede.indirizzo"; 
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();
				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String indirizzo = rs.getString("indirizzo");
					double stipendio_medio = rs.getDouble("AVG(stipendio)");
					sb.append("indirizzo: " + indirizzo + ", stipendio_medio: " + stipendio_medio);
					sb.append("\n");
					//System.out.println("indirizzo: " + indirizzo + ", stipendio_medio: " + stipendio_medio );
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op12(String distintivo)
	{
        CallableStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = GUI.myConn.prepareCall("{ CALL operazione12(?) }");
            stmt.setString(1,distintivo);
            rs = stmt.executeQuery();
            StringBuilder sb = new StringBuilder();
            while (rs.next()) 
            {
                String nDistintivo = rs.getString("n_distintivo");
                String nome = rs.getString("nome");
                String cognome = rs.getString("cognome");
                String agenteNomeinCodice = rs.getString("agente.nome_in_codice");
                Date dataNascita = rs.getDate("data_nascita");
                String nCercapersone = rs.getString("n_cercapersone");
                int codiceContratto = rs.getInt("codice_contratto");
                String indagineNomeinCodice = rs.getString("indagine.nome_in_codice");
                Date dataInizio = rs.getDate("data_inizio");
                
                sb.append("N. Distintivo: " + nDistintivo + ", nome: " + nome + ", cognome: " +
                        cognome + ", nome in cod. agente: " + agenteNomeinCodice + ", data di nascita: " + dataNascita + 
                        ", n. cercapersone: " + nCercapersone + ", cod. contratto: " + codiceContratto +
                        ", nome in cod. indagine: " + indagineNomeinCodice + ", data inizio: " + dataInizio);
                sb.append("\n");
                GUI.textPane.setText(sb.toString());
            }

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op13()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT org2 AS organizzazione " + 
				"FROM conflitto_territoriale AS tab1 " + 
				"WHERE org1 IN (SELECT org_criminale " + 
				"FROM criminale " + 
				"WHERE tipo='latitante') " + 
				"UNION " + 
				"SELECT org1 " + 
				"FROM conflitto_territoriale AS tab2 " + 
				"WHERE org2 IN (SELECT org_criminale " + 
				"FROM criminale " + 
				"WHERE tipo= 'latitante')"; 
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();
				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String org = rs.getString("organizzazione");
					//System.out.println("organizzazione: " + org);
					sb.append("organizzazione: " + org);
					sb.append("\n");
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op14()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT indagine.nome_in_codice, criminali_indagini.criminale " + 
				"FROM indagine JOIN criminali_indagini ON indagine.nome_in_codice = criminali_indagini.nome_in_codice " + 
				"WHERE YEAR(data_inizio) = YEAR(CURDATE()) AND data_fine IS NOT NULL"; 
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();
				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String nome_in_codice = rs.getString("nome_in_codice");
					String criminale = rs.getString("criminale");
					sb.append("nome_in_codice: " + nome_in_codice + ", criminale: " + criminale);
					sb.append("\n");
					//System.out.println("nome_in_codice: " + nome_in_codice + ", criminale: " + criminale);
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op15()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * " + 
				"FROM sospettato " + 
				"WHERE cf IN (SELECT cf " + 
				"FROM sospettati_indagini JOIN indagine ON sospettati_indagini.nome_in_codice = indagine.nome_in_codice " + 
				"WHERE YEAR(data_inizio) >= YEAR(CURDATE()) - 5 " + 
				"GROUP BY cf " + 
				"HAVING COUNT(*) > 2)";
				
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();
				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String cf = rs.getString("cf");
					String nome = rs.getString("nome"); 
					String cognome = rs.getString("cognome");
					Date data_nascita = rs.getDate("data_nascita");
	
					//System.out.println("cf: " + cf + ", nome: " + nome + ", cognome: " + cognome + ", data_nascita: " + data_nascita);
					sb.append("cf: " + cf + ", nome: " + nome + ", cognome: " + cognome + ", data_nascita: " + data_nascita);
					sb.append("\n");
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}

	public static void op16()
	{
		Statement stmt = null;
		ResultSet rs = null;
		String query = "SELECT numero_telefono_direttore.numero " + 
				"FROM (numero_telefono_direttore JOIN sede ON cf=sede.direttore) " + 
				"WHERE indirizzo IN (SELECT sede " + 
				"FROM istanza_settore " + 
				"GROUP BY sede " + 
				"HAVING COUNT(*) > 9)"; 
				
		try {
			stmt = GUI.myConn.createStatement();

			if (stmt.execute(query)) 
			{
				rs = stmt.getResultSet();
				StringBuilder sb = new StringBuilder();
				while (rs.next()) 
				{
					String numero = rs.getString("numero");
					//System.out.println("numero: " + numero);
					sb.append("numero: " + numero);
					sb.append("\n");
					GUI.textPane.setText(sb.toString());
				}
		
			}

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			System.err.println("SQLState: " + ex.getSQLState());
			System.err.println("VendorError: " + ex.getErrorCode());
		} 
		
	}
	
	public static void op17()
    {
        Statement stmt = null;
        ResultSet rs = null;
        String query = "SELECT nome " + 
                "FROM org_criminale " + 
                "WHERE nome NOT IN (SELECT org1 " + 
                "FROM conflitto_territoriale " + 
                "UNION " + 
                "SELECT org2 " + 
                "FROM conflitto_territoriale) " + 
                "AND comp_stimati >= 200;";
        try
        {
            stmt = GUI.myConn.createStatement();

            if (stmt.execute(query)) 
            {
                rs = stmt.getResultSet();
                StringBuilder sb = new StringBuilder();
                while (rs.next()) 
                {
                    String nome = rs.getString("nome");
                    sb.append("Nome: " + nome);
                    sb.append("\n");
                    //System.out.println("Nome: " + nome);
                    GUI.textPane.setText(sb.toString());
                }
            }
        } catch (SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage());
            System.err.println("SQLState: " + ex.getSQLState());
            System.err.println("VendorError: " + ex.getErrorCode());
        } 
    }

	

}



