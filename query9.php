<!DOCTYPE html>
<html lang = "en-US">
 <head>
 <meta charset = "UTF-8">
 <title>contact.php</title>
 <style type = "text/css">
  table, th, td {border: 1px solid black};
 </style>
 </head>
 <body>
 <p>
 < ? php 
     $cnx = mysql_connect('localhost','root',''); 
     mysql_select_db('Odev1'); 
     $result= mysql_query("SELECT 
    				m.BRAND_BARCODE AS barcode1,
    				e.BRAND_BARCODE AS barcode2
			   FROM
    				alternative_brands e
			   INNER JOIN alternative_brands m ON 
    			   m.ALTERNATIVE_BRAND_BARCODE = e.BRAND_BARCODE 
                     ");
     if (!$result) 
     { 
       die('Error retrieving employees from database!'. 
       'Error: ' . mysql_error() ); 
     } 
     while ($alternative_brands_x = mysql_fetch_array($result)) 
     { 
       $brand_barcode = htmlspecialchars($alternative_brands_x['BRAND_BARCODE']); 
       $m_syscode = htmlspecialchars($alternative_brands_x['M_SYSCODE']); 
       $alternative_brand_barcode = htmlspecialchars($alternative_brands_x['ALTERNATIVE_BRAND_BARCODE']);
       $alternative_m_syscode = htmlspecialchars($alternative_brands_x['ALTERNATIVE_BRAND_BARCODE']);
       echo("$brand_barcode ");
       echo("$m_syscode "); 
       echo("$alternative_brand_barcode");
       echo("$alternative_m_syscode"); 
     } 
 ? >
 </p>
 </body>
</html>