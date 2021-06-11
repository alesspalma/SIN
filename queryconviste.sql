
#operazione3
SELECT *
FROM settore
WHERE settore.ambito NOT IN (SELECT * FROM view_op_3);

#operazione6
SELECT criminale
FROM view_op_6
GROUP BY criminale
HAVING ( COUNT(DISTINCT nome_in_codice) > 3 
		AND
		COUNT(DISTINCT reato) > 2 );
        
#operazione8
SELECT DISTINCT numero_distintivo
FROM comp_indagini
WHERE nome_in_codice IN (SELECT * FROM view_op_8);

#operazione11
SELECT sede.indirizzo,AVG(stipendio)
FROM (sede JOIN contratto_op_uff_attuale ON indirizzo=sede) JOIN operatore_logistico ON contratto_op_uff_attuale.codice=operatore_logistico.codice_contratto 
WHERE sede.città IN (SELECT * FROM view_op_11)
GROUP BY sede.indirizzo;

#operazione13
SELECT org2 AS organizzazione
FROM conflitto_territoriale AS tab1
WHERE org1 IN (SELECT * FROM view_op_13)
UNION
SELECT org1
FROM conflitto_territoriale AS tab2
WHERE org2 IN (SELECT * FROM view_op_13);

#operazione15
SELECT *
FROM sospettato
WHERE cf IN (SELECT * FROM view_op_15);

#operazione16
SELECT numero_telefono_direttore.numero
FROM (numero_telefono_direttore JOIN sede ON cf=sede.direttore) 
WHERE indirizzo IN (SELECT * FROM view_op_16);

#operazione17
SELECT nome
FROM org_criminale
WHERE nome NOT IN (SELECT * FROM view_op_17) AND comp_stimati >= 200;







