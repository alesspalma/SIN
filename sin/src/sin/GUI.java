package sin;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;


import javax.swing.JRadioButton;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JComboBox;
import javax.swing.JDialog;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JTextPane;
import java.awt.Color;
import java.awt.Font;
import java.awt.Image;

import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.JScrollPane;

public class GUI extends JFrame {

	private JPanel contentPane;
	static Connection myConn = null;
	public static JTextPane textPane; 
	private JTextField textField;
	private JTextField textField_1;
	private JTextField text1;
	private JTextField text2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try 
		{
			String DB_NAME = "sin";

			myConn = DriverManager.getConnection("jdbc:mysql://localhost/" + DB_NAME + "?user=" + Utils.USER
					+ "&password=" + Utils.PASS
					+ "&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Europe/Rome");

			//Queries.op1("app","iena");
			//Queries.op2("111",1);
			//Queries.op3();
			//Queries.op4("111");
			//Queriesop5("roma");
			//Queriesop6();
			//Queriesop7();
			//Queriesop8();
			//Queriesop9("svizzera");
			//Queriesop10("2000-01-01");
			//Queriesop11();
			//Queriesop12("app");
			//Queriesop13();
			//UserQueriesop14();
			//Queries.op15();
			//Queries.op16();
			//Queries.op17();
			//UserQueries.insertUpdate("UPDATE citta SET n_abitanti = 62000 WHERE nome = 'Pomezia'");
			
			//myConn.close();

		}
		catch (SQLException ex) 
		{
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI frame = new GUI();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public GUI() {
		setBackground(Color.WHITE);
		getContentPane().setPreferredSize(Toolkit.getDefaultToolkit().getScreenSize());
        pack();
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				try {
					myConn.close();
				}

				catch (SQLException ex) 
				{
					// handle any errors
					System.out.println("SQLException: " + ex.getMessage());
					System.out.println("SQLState: " + ex.getSQLState());
					System.out.println("VendorError: " + ex.getErrorCode());
				}
			}
		});
		setTitle("SIN");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//setBounds(100, 100, 611, 420);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255,254,234));
		//contentPane.setBackground(Color.WHITE);
		contentPane.setBorder(null);
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblSelezionaLaQuery = new JLabel("Seleziona l'operazione:");
		lblSelezionaLaQuery.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblSelezionaLaQuery.setBounds(699, 115, 152, 29);
		contentPane.add(lblSelezionaLaQuery);
		
		JPanel nestedPanel = new JPanel();
		nestedPanel.setBorder(null);
		nestedPanel.setBounds(620, 228, 357, 163);
		nestedPanel.setBackground(new Color(255,254,234));
		contentPane.add(nestedPanel);
		nestedPanel.setLayout(null);
		
		JComboBox comboBox = new JComboBox();
		comboBox.addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.DESELECTED)
	               {
	                   String selection=(String) comboBox.getSelectedItem();
	                   switch(selection) {
	                   default:
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
	                	    break;
	                   case "operazione 1":
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
	                	    JLabel label1 = new JLabel("Inserisci il numero di distintivo dell'agente:");
	                	    label1.setBounds(35, 10, 300, 20);
	                	    label1.setFont(new Font("Tahoma", Font.PLAIN, 15));
	                	    nestedPanel.add(label1);
		            		
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 300, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
		            		
		            		JLabel label2 = new JLabel("Inserisci il nome dell'indagine:");
		            		label2.setBounds(34, 82, 300, 20);
		            		label2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label2);
		            		
		            		text2 = new JTextField();
		            		text2.setBounds(35, 105, 300, 30);
		            		text2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text2);
		            		text2.setColumns(10);
	                	    break;
	                   case "operazione 2":
	                	   	textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
		               	    JLabel label3 = new JLabel("Inserisci il numero di distintivo della spia:");
		            	    label3.setBounds(35, 10, 300, 20);
		            	    label3.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            	    nestedPanel.add(label3);
		            		
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 315, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
		            		
		               		JLabel label4 = new JLabel("Inserisci il codice dell'operazione di spionaggio:");
		            		label4.setBounds(34, 82, 330, 20);
		            		label4.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label4);
		            		
		            		text2 = new JTextField();
		            		text2.setBounds(35, 105, 315, 30);
		            		text2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text2);
		            		text2.setColumns(10);
		            		break;
	                   case "operazione 4":
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
		               		JLabel label5 = new JLabel("Inserisci il numero di distintivo della spia:");
		            		label5.setBounds(35, 10, 300, 20);
		            		label5.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label5);
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 300, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
	                	    break;
	                   case "operazione 5":
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
		               		JLabel label6 = new JLabel("Inserisci il nome della provincia:");
		            		label6.setBounds(35, 10, 300, 20);
		            		label6.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label6);
		            		
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 300, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
	                	    break;
	                   case "operazione 9":
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
		               		JLabel label7 = new JLabel("Inserisci il nome dello stato:");
		            		label7.setBounds(35, 10, 300, 20);
		            		label7.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label7);
		            		
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 300, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
	                	    break;
	                   case "operazione 10":
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
		               		JLabel label8 = new JLabel("Inserisci la data di inizio dell'indagine:");
		            		label8.setBounds(35, 10, 300, 20);
		            		label8.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label8);
		            		
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 300, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
	                	    break;
	                   case "operazione 12":
	                	    textPane.setText("");
	                	    nestedPanel.removeAll();
	                	    nestedPanel.repaint();
		               		JLabel label9 = new JLabel("Inserisci il numero di distintivo dell'agente:");
		            		label9.setBounds(35, 10, 300, 20);
		            		label9.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(label9);
		            		
		            		text1 = new JTextField();
		            		text1.setBounds(35, 35, 300, 30);
		            		text1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		            		nestedPanel.add(text1);
		            		text1.setColumns(10);
	                	    break;
	                   }

	               }
			}
		});
		comboBox.setFont(new Font("Tahoma", Font.PLAIN, 15));
		comboBox.setBounds(699, 156, 152, 29);
		contentPane.add(comboBox);
		comboBox.addItem("...");
		comboBox.addItem("operazione 1");
		comboBox.addItem("operazione 2");
		comboBox.addItem("operazione 3");
		comboBox.addItem("operazione 4");
		comboBox.addItem("operazione 5");
		comboBox.addItem("operazione 6");
		comboBox.addItem("operazione 7");
		comboBox.addItem("operazione 8");
		comboBox.addItem("operazione 9");
		comboBox.addItem("operazione 10");
		comboBox.addItem("operazione 11");
		comboBox.addItem("operazione 12");
		comboBox.addItem("operazione 13");
		comboBox.addItem("operazione 14");
		comboBox.addItem("operazione 15");
		comboBox.addItem("operazione 16");
		comboBox.addItem("operazione 17");
		
		
		JButton btnRun = new JButton("Run");
		btnRun.setBounds(729, 421, 85, 29);
		btnRun.setFocusPainted(false);
		btnRun.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String whichQuery = (String) comboBox.getSelectedItem();
				int numOp = 0;
				if (!whichQuery.equals("...")) numOp = Integer.parseInt(whichQuery.substring(11));
				
				switch (numOp) {
				case Utils.OP1:
					if(!text1.getText().equals("") && !text2.getText().contentEquals(""))
						Queries.op1(text1.getText(),text2.getText());
					break;
				case Utils.OP2:
					if(!text1.getText().equals("") && !text2.getText().contentEquals(""))
					{
						int num;
						try {
							num = Integer.parseInt(text2.getText());
							Queries.op2(text1.getText(),num);
						}
						catch(NumberFormatException n) {
							GUI.textPane.setText("Il codice deve essere un numero");
						}
					}
					break;
				case Utils.OP3:
					Queries.op3();
					break;
				case Utils.OP4:
					if(!text1.getText().equals(""))
						Queries.op4(text1.getText());
					break;
				case Utils.OP5:
					if(!text1.getText().equals(""))
						Queries.op5(text1.getText());
					break;
				case Utils.OP6:
					Queries.op6();
					break;
				case Utils.OP7:
					Queries.op7();
					break;
				case Utils.OP8:
					Queries.op8();
					break;
				case Utils.OP9:
					if(!text1.getText().equals(""))
						Queries.op9(text1.getText());
					break;
				case Utils.OP10:
					if(!text1.getText().equals(""))
						Queries.op10(text1.getText());
					break;
				case Utils.OP11:
					Queries.op11();
					break;
				case Utils.OP12:
					if(!text1.getText().equals(""))
						Queries.op12(text1.getText());
					break;
				case Utils.OP13:
					Queries.op13();
					break;
				case Utils.OP14:
					Queries.op14();
					break;
				case Utils.OP15:
					Queries.op15();
					break;
				case Utils.OP16:
					Queries.op16();
					break;
				case Utils.OP17:
					Queries.op17();
					break;
				default:
					textPane.setText("Non è stata selezionara nessuna query");
					break;
				}

			}
		});
		contentPane.add(btnRun);
		textPane = new JTextPane();
		textPane.setFont(new Font("Tahoma", Font.PLAIN, 15));
		textPane.setEditable(false);
		textPane.setBounds(334, 561, 881, 182);
		contentPane.add(textPane);
		
		JLabel lblResults = new JLabel("Risultati:");
		lblResults.setForeground(Color.RED);
		lblResults.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblResults.setBounds(334, 538, 58, 13);
		contentPane.add(lblResults);
		
		JButton btnMostraOperazioni = new JButton("Mostra le operazioni disponibili");
		btnMostraOperazioni.setFocusPainted(false);
		btnMostraOperazioni.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ShowOperations so = new ShowOperations();
				so.setVisible(true);
			}
		});
		btnMostraOperazioni.setBounds(644, 45, 246, 29);
		contentPane.add(btnMostraOperazioni);
		
		JScrollPane scrollPane = new JScrollPane(textPane);
		scrollPane.setBounds(334, 561, 881, 182);
		contentPane.add(scrollPane);
		
		JLabel lblNewLabel = new JLabel("Scrivi qui la tua operazione di insert o di update:");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblNewLabel.setBounds(189, 171, 349, 47);
		contentPane.add(lblNewLabel);
		
		JTextPane textPane_1 = new JTextPane();
		textPane_1.setBounds(189, 212, 327, 189);
		contentPane.add(textPane_1);
		
		JScrollPane scrollPane_1 = new JScrollPane(textPane_1);
		scrollPane_1.setBounds(189, 212, 327, 189);
		contentPane.add(scrollPane_1);
		
		JButton btnRun_1 = new JButton("Run");
		btnRun_1.setFocusPainted(false);
		btnRun_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String query = textPane_1.getText();
				UserQueries.insertUpdate(query);
			}
		});
		btnRun_1.setBounds(302, 421, 85, 29);
		contentPane.add(btnRun_1);
		
		JTextPane textPane_2 = new JTextPane();
		textPane_2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		textPane_2.setBounds(1057, 212, 349, 187);
		contentPane.add(textPane_2);
		
		JLabel lblNewLabel_1 = new JLabel("Inserisci qui la tua query:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblNewLabel_1.setBounds(1057, 184, 309, 19);
		contentPane.add(lblNewLabel_1);
		
		JScrollPane scrollPane_2 = new JScrollPane(textPane_2);
		scrollPane_2.setBounds(1057, 212, 349, 187);
		contentPane.add(scrollPane_2);
		
		JButton btnRun_2 = new JButton("Run");
		btnRun_2.setFocusPainted(false);
		btnRun_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String query = textPane_2.getText();
				UserQueries.query(query);
			}
		});
		btnRun_2.setBounds(1197, 421, 91, 29);
		contentPane.add(btnRun_2);
		
		JLabel lblNewLabel_2 = new JLabel("");
		lblNewLabel_2.setBounds(170, 20, 389, 167);
		contentPane.add(lblNewLabel_2);
		
		Image img = new ImageIcon(this.getClass().getResource("/logo.png")).getImage();
		lblNewLabel_2.setIcon(new ImageIcon(img));
		

	}
	
}
