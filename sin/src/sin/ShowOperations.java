package sin;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextPane;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.Color;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class ShowOperations extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ShowOperations frame = new ShowOperations();
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
	public ShowOperations() {
		getContentPane().setPreferredSize(Toolkit.getDefaultToolkit().getScreenSize());
        pack();
		setBackground(Color.WHITE);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		//setBounds(100, 100, 1500, 900);
		contentPane = new JPanel();
		//contentPane.setBackground(Color.WHITE);
		contentPane.setBackground(new Color(255,254,234));
		contentPane.setForeground(Color.BLACK);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblOperazione = new JLabel("Operazione 1:");
		lblOperazione.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione.setBounds(27, 26, 118, 27);
		contentPane.add(lblOperazione);
		
		JTextPane txtpnAssegnaUnAgente = new JTextPane();
		txtpnAssegnaUnAgente.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnAssegnaUnAgente.setEditable(false);
		txtpnAssegnaUnAgente.setText("Assegna un agente a un'indagine");
		txtpnAssegnaUnAgente.setBounds(137, 26, 157, 54);
		contentPane.add(txtpnAssegnaUnAgente);
		
		JLabel lblOperazione_1 = new JLabel("Operazione 2:");
		lblOperazione_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_1.setBounds(27, 96, 101, 27);
		contentPane.add(lblOperazione_1);
		
		JTextPane txtpnAssegnaUnaSpia = new JTextPane();
		txtpnAssegnaUnaSpia.setBackground(new Color(255,254,234));
		txtpnAssegnaUnaSpia.setEditable(false);
		txtpnAssegnaUnaSpia.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnAssegnaUnaSpia.setText("Assegna una spia a un'operazione di spionaggio.");
		txtpnAssegnaUnaSpia.setBounds(137, 96, 176, 68);
		contentPane.add(txtpnAssegnaUnaSpia);
		
		JLabel lblOperazione_2 = new JLabel("Operazione 3:");
		lblOperazione_2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_2.setBounds(27, 181, 101, 27);
		contentPane.add(lblOperazione_2);
		
		JTextPane txtpnTrovareGliAmbiti = new JTextPane();
		txtpnTrovareGliAmbiti.setBackground(new Color(255,254,234));
		txtpnTrovareGliAmbiti.setEditable(false);
		txtpnTrovareGliAmbiti.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareGliAmbiti.setText("Trovare gli ambiti e i finanziamenti di settori che non sono mai stati costruiti prima del 2010.");
		txtpnTrovareGliAmbiti.setBounds(137, 182, 157, 101);
		contentPane.add(txtpnTrovareGliAmbiti);
		
		JLabel lblOperazione_3 = new JLabel("Operazione 4:");
		lblOperazione_3.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_3.setBounds(27, 301, 108, 27);
		contentPane.add(lblOperazione_3);
		
		JTextPane txtpnTrovareIDati = new JTextPane();
		txtpnTrovareIDati.setBackground(new Color(255,254,234));
		txtpnTrovareIDati.setEditable(false);
		txtpnTrovareIDati.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIDati.setText("Trovare i dati di una spia e di tutte le operazioni di spionaggio a cui essa ha partecipato o sta partecipando.");
		txtpnTrovareIDati.setBounds(137, 302, 166, 130);
		contentPane.add(txtpnTrovareIDati);
		
		JLabel lblOperazione_4 = new JLabel("Operazione 5:");
		lblOperazione_4.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_4.setBounds(27, 435, 101, 34);
		contentPane.add(lblOperazione_4);
		
		JTextPane txtpnTrovareIlNumero = new JTextPane();
		txtpnTrovareIlNumero.setBackground(new Color(255,254,234));
		txtpnTrovareIlNumero.setEditable(false);
		txtpnTrovareIlNumero.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIlNumero.setText("Trovare il numero dei detenuti in tutte le carceri di citt\u00E0 in una determinata provincia ");
		txtpnTrovareIlNumero.setBounds(137, 439, 157, 89);
		contentPane.add(txtpnTrovareIlNumero);
		
		JLabel lblOperazione_5 = new JLabel("Operazione 6:");
		lblOperazione_5.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_5.setBounds(27, 536, 101, 34);
		contentPane.add(lblOperazione_5);
		
		JTextPane txtpnTrovareTuttiI = new JTextPane();
		txtpnTrovareTuttiI.setBackground(new Color(255,254,234));
		txtpnTrovareTuttiI.setEditable(false);
		txtpnTrovareTuttiI.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareTuttiI.setText("Trovare tutti i CF dei criminali che sono stati indagati pi\u00F9 di 3 volte e\r\nper almeno 3 reati diversi.\r");
		txtpnTrovareTuttiI.setBounds(137, 538, 156, 121);
		contentPane.add(txtpnTrovareTuttiI);
		
		JLabel lblOperazione_6 = new JLabel("Operazione 7:");
		lblOperazione_6.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_6.setBounds(27, 660, 101, 27);
		contentPane.add(lblOperazione_6);
		
		JTextPane txtpnTrovareLoStipendio = new JTextPane();
		txtpnTrovareLoStipendio.setBackground(new Color(255,254,234));
		txtpnTrovareLoStipendio.setEditable(false);
		txtpnTrovareLoStipendio.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareLoStipendio.setText("Trovare lo stipendio massimo degli operatori logistici che hanno\r\nlavorato in almeno 3 sedi diverse ed attualmente hanno almeno 10\r\nanni di lavoro.\r");
		txtpnTrovareLoStipendio.setBounds(137, 662, 196, 142);
		contentPane.add(txtpnTrovareLoStipendio);
		
		JLabel lblOperazione_7 = new JLabel("Operazione 8:");
		lblOperazione_7.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_7.setBounds(333, 17, 108, 45);
		contentPane.add(lblOperazione_7);
		
		JTextPane txtpnTrovareIlNumero_1 = new JTextPane();
		txtpnTrovareIlNumero_1.setBackground(new Color(255,254,234));
		txtpnTrovareIlNumero_1.setEditable(false);
		txtpnTrovareIlNumero_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIlNumero_1.setText("Trovare il numero di distintivo degli agenti che hanno preso parte ad\r\nindagini concluse le quali hanno coinvolto criminali appartenenti ad\r\nun\u2019organizzazione criminale e che sono attualmente detenuti in un\r\npenitenziario, aventi come pena l\u2019ergastolo.\r");
		txtpnTrovareIlNumero_1.setBounds(438, 26, 264, 177);
		contentPane.add(txtpnTrovareIlNumero_1);
		
		JLabel lblOperazione_8 = new JLabel("Operazione 9:");
		lblOperazione_8.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_8.setBounds(333, 205, 94, 13);
		contentPane.add(lblOperazione_8);
		
		JTextPane txtpnTrovareTuttiI_1 = new JTextPane();
		txtpnTrovareTuttiI_1.setBackground(new Color(255,254,234));
		txtpnTrovareTuttiI_1.setEditable(false);
		txtpnTrovareTuttiI_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareTuttiI_1.setText("Trovare tutti i codici delle operazioni di controspionaggio che hanno\r\nbloccato almeno una spia di un determinato stato.\r");
		txtpnTrovareTuttiI_1.setBounds(438, 199, 217, 114);
		contentPane.add(txtpnTrovareTuttiI_1);
		
		JLabel lblOperazione_9 = new JLabel("Operazione 10:");
		lblOperazione_9.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_9.setBounds(333, 312, 108, 27);
		contentPane.add(lblOperazione_9);
		
		JTextPane txtpnTrovareIlCodice = new JTextPane();
		txtpnTrovareIlCodice.setBackground(new Color(255,254,234));
		txtpnTrovareIlCodice.setEditable(false);
		txtpnTrovareIlCodice.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIlCodice.setText("Trovare il codice e la descrizione dei reati per cui sono state mosse\r\nalmeno 5 indagini a partire da una certa data.\r");
		txtpnTrovareIlCodice.setBounds(438, 311, 217, 121);
		contentPane.add(txtpnTrovareIlCodice);
		
		JLabel lblOperazione_10 = new JLabel("Operazione 11:");
		lblOperazione_10.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_10.setBounds(333, 424, 108, 34);
		contentPane.add(lblOperazione_10);
		
		JTextPane txtpnPerOgniCitt = new JTextPane();
		txtpnPerOgniCitt.setBackground(new Color(255,254,234));
		txtpnPerOgniCitt.setEditable(false);
		txtpnPerOgniCitt.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnPerOgniCitt.setText("Per ogni citt\u00E0 che ha pi\u00F9 di una sede, per ogni sede trovare lo\r\nstipendio medio degli operatori logistici che vi lavorano.");
		txtpnPerOgniCitt.setBounds(438, 428, 190, 130);
		contentPane.add(txtpnPerOgniCitt);
		
		JLabel lblOperazione_11 = new JLabel("Operazione 12:");
		lblOperazione_11.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_11.setBounds(333, 563, 108, 34);
		contentPane.add(lblOperazione_11);
		
		JTextPane txtpnTrovareIDati_1 = new JTextPane();
		txtpnTrovareIDati_1.setBackground(new Color(255,254,234));
		txtpnTrovareIDati_1.setEditable(false);
		txtpnTrovareIDati_1.setText("Trovare i dati di un agente e di tutte le indagini a cui sta\r\npartecipando.\r");
		txtpnTrovareIDati_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIDati_1.setBounds(438, 568, 217, 68);
		contentPane.add(txtpnTrovareIDati_1);
		
		JLabel lblOperazione_12 = new JLabel("Operazione 13:");
		lblOperazione_12.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_12.setBounds(333, 660, 108, 27);
		contentPane.add(lblOperazione_12);
		
		JTextPane txtpnTrovareINomi = new JTextPane();
		txtpnTrovareINomi.setBackground(new Color(255,254,234));
		txtpnTrovareINomi.setEditable(false);
		txtpnTrovareINomi.setText("Trovare i nomi delle organizzazioni criminali che sono in conflitto\r\ncon organizzazioni criminali che hanno almeno un latitante.\r");
		txtpnTrovareINomi.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareINomi.setBounds(438, 660, 177, 116);
		contentPane.add(txtpnTrovareINomi);
		
		JLabel lblOperazione_13 = new JLabel("Operazione 14:");
		lblOperazione_13.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_13.setBounds(743, 30, 118, 18);
		contentPane.add(lblOperazione_13);
		
		JTextPane txtpnTrovareIlNome = new JTextPane();
		txtpnTrovareIlNome.setBackground(new Color(255,254,234));
		txtpnTrovareIlNome.setEditable(false);
		txtpnTrovareIlNome.setText("Trovare il nome in codice di tutte le indagini terminate che sono\r\nstate avviate nell\u2019anno corrente, con i codici fiscali dei criminali\r\ncoinvolti.\r");
		txtpnTrovareIlNome.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIlNome.setBounds(860, 26, 264, 114);
		contentPane.add(txtpnTrovareIlNome);
		
		JLabel lblOperazione_14 = new JLabel("Operazione 15:");
		lblOperazione_14.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_14.setBounds(743, 151, 118, 27);
		contentPane.add(lblOperazione_14);
		
		JTextPane txtpnTrovareIDati_2 = new JTextPane();
		txtpnTrovareIDati_2.setBackground(new Color(255,254,234));
		txtpnTrovareIDati_2.setEditable(false);
		txtpnTrovareIDati_2.setText("Trovare i dati dei sospettati che sono stati indagati per pi\u00F9 di 2 volte\r\nnegli ultimi 5 anni.");
		txtpnTrovareIDati_2.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareIDati_2.setBounds(860, 150, 237, 89);
		contentPane.add(txtpnTrovareIDati_2);
		
		JLabel lblOperazione_15 = new JLabel("Operazione 16:");
		lblOperazione_15.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_15.setBounds(743, 255, 118, 28);
		contentPane.add(lblOperazione_15);
		
		JTextPane txtpnTrovareINumeri = new JTextPane();
		txtpnTrovareINumeri.setBackground(new Color(255,254,234));
		txtpnTrovareINumeri.setEditable(false);
		txtpnTrovareINumeri.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareINumeri.setText("Trovare i numeri di telefono dei direttori che dirigono sedi composte\r\nda almeno 10 settori (anche di ambiti uguali).\r");
		txtpnTrovareINumeri.setBounds(860, 257, 204, 114);
		contentPane.add(txtpnTrovareINumeri);
		
		JLabel lblOperazione_16 = new JLabel("Operazione 17:");
		lblOperazione_16.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblOperazione_16.setBounds(743, 403, 118, 29);
		contentPane.add(lblOperazione_16);
		
		JTextPane txtpnTrovareINomi_1 = new JTextPane();
		txtpnTrovareINomi_1.setBackground(new Color(255,254,234));
		txtpnTrovareINomi_1.setEditable(false);
		txtpnTrovareINomi_1.setText("Trovare i nomi delle organizzazioni criminali che non sono in\r\nconflitto con nessuna e che hanno almeno 200 componenti stimati.");
		txtpnTrovareINomi_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		txtpnTrovareINomi_1.setBounds(860, 403, 190, 128);
		contentPane.add(txtpnTrovareINomi_1);
		
		JButton btnOk = new JButton("Ok");
		btnOk.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		btnOk.setBounds(889, 601, 85, 21);
		contentPane.add(btnOk);
	}
}
