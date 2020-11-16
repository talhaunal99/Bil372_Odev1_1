< ? php 
     $cnx = mysql_connect('localhost','root',''); 
     mysql_select_db('Odev1'); 
     $result= mysql_query("SELECT A.BRAND_BARCODE AS barcode1, B.BRAND_BARCODE AS barcode2
		      FROM alternative_brands AS A
		      INNER JOIN table AS B
    		      	ON A.ALTERNATIVE_BRAND_BARCODE = B.BRAND_BARCODE
		      WHERE A.M_SYSCODE = B.M_SYSCODE 
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
