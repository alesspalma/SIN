#operazione3
SELECT *
FROM settore
WHERE settore.ambito not in (
		SELECT istanza_settore.ambito
		FROM istanza_settore
		WHERE data_costruzione < '2010-01-01');

#operazione6        
SELECT criminale
FROM criminali_indagini JOIN reati_indagini ON criminali_indagini.nome_in_codice = reati_indagini.nome_in_codice
GROUP BY criminale
HAVING ( COUNT(DISTINCT criminali_indagini.nome_in_codice) > 3 
AND
COUNT(DISTINCT reati_indagini.reato) > 2 );

#operazione7
SELECT MAX(stipendi)
FROM (
SELECT MAX(unione.stipendio) AS stipendi
FROM ( SELECT cf,stipendio,anni_lavoro,codice_contratto,sede 
		FROM operatore_logistico AS op1 JOIN contratto_op_uff_attuale ON op1.codice_contratto=contratto_op_uff_attuale.codice
		WHERE anni_lavoro >= 10
		UNION
		SELECT op2.cf,stipendio,anni_lavoro,codice AS codice_contratto,sede
		FROM operatore_logistico AS op2 JOIN contratto_op_log_scaduto ON op2.codice_contratto=contratto_op_log_scaduto.codice
		WHERE anni_lavoro >= 10) AS unione
GROUP BY unione.cf
HAVING COUNT(DISTINCT unione.sede > 2)) AS risultati;

#operazione8
SELECT DISTINCT numero_distintivo
FROM comp_indagini
WHERE nome_in_codice IN (SELECT indagine.nome_in_codice
FROM ((indagine JOIN criminali_indagini ON indagine.nome_in_codice = criminali_indagini.nome_in_codice) JOIN criminale ON criminale=cf) JOIN detenzione ON cf = detenzione.criminale
WHERE data_fine IS NOT NULL AND durata_condanna = 'ergastolo' and org_criminale IS NOT NULL);

#operazione11
SELECT sede.indirizzo,AVG(stipendio)
FROM (sede JOIN contratto_op_uff_attuale ON indirizzo=sede) JOIN operatore_logistico ON contratto_op_uff_attuale.codice=operatore_logistico.codice_contratto 
WHERE sede.città IN (SELECT città
FROM sede AS sede2
GROUP BY città
HAVING COUNT(*) > 1)
GROUP BY sede.indirizzo;

#operazione13
SELECT org2 AS org
FROM conflitto_territoriale AS tab1
WHERE org1 IN (SELECT org_criminale
FROM criminale
WHERE tipo='latitante')
UNION
SELECT org1
FROM conflitto_territoriale AS tab2
WHERE org2 IN (SELECT org_criminale
FROM criminale
WHERE tipo='latitante');

#operazione14
SELECT indagine.nome_in_codice, criminali_indagini.criminale
FROM indagine JOIN criminali_indagini ON indagine.nome_in_codice = criminali_indagini.nome_in_codice
WHERE YEAR(data_inizio) = YEAR(CURDATE()) AND data_fine IS NOT NULL;

#operazione15
SELECT *
FROM sospettato
WHERE cf in (SELECT cf
FROM sospettati_indagini JOIN indagine ON sospettati_indagini.nome_in_codice = indagine.nome_in_codice
WHERE YEAR(data_inizio) >= YEAR(CURDATE()) - 5
GROUP BY cf
HAVING COUNT(*) > 2 );

#operazione16
SELECT numero_telefono_direttore.numero
FROM (numero_telefono_direttore JOIN sede ON cf=sede.direttore) 
WHERE indirizzo IN (SELECT sede
FROM istanza_settore
GROUP BY sede
HAVING COUNT(*) > 9);

#operazione17
SELECT nome
FROM org_criminale
WHERE nome NOT IN (
  			SELECT org1
FROM conflitto_territoriale
UNION
SELECT org2
FROM conflitto_territoriale )
AND comp_stimati >= 200;









