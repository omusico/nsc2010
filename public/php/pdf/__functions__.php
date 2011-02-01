<?

function create_pdf_package($array,$template = 0){

       	include_once "/php/forge_fdf.php";

	if(method_exists("Zend_Registry", "get"))
		$options = Zend_Registry::get("options");
	else 
		$options["NSC_REPRESENTATIVE"] = "Lizz Moss";

	if($array["driver_name1"])
		$driver_name = explode(" ", $array["driver_name1"]);
	else if($array["name"])
		$driver_name = explode(" ", $array["name"]);

       	$params = array("CONAME" => $array["company_name"], 
       	"COPHONE" => $array["phone"],
       	"COFAX" => $array["fax"],
       	"COADDRESS" => $array["address"],
       	"COREP" => $array["der_first_name"]." ".$array["der_last_name"],
       	"CITY" => $array["city"],
       	"STATE" => $array["state"],
       	"ZIP" => $array["zip"],
       	"COEMAIL" => $array["email"], 
       	"NSCREP" => $options["NSC_REPRESENTATIVE"],
       	"ENROLLEXP" => "December 31, ".date("Y",$array["expiration_date"]),
       	"DRIVER1" => $array["driver_name1"], 
       	"CDL1" => $array["driver_cdl1"], 
       	"SSN1" => substr($array["driver_ssn1"],-3), 
       	"DRIVER2" => $array["driver_name2"],
       	"CDL2" => $array["driver_cdl2"], 
       	"SSN2" => substr($array["driver_ssn2"],-3), 
       	"DRIVER3" => $array["driver_name3"],
       	"CDL3" => $array["driver_cdl3"], 
       	"SSN3" => substr($array["driver_ssn3"],-3),
       	"DRIVER4" => $array["driver_name4"],
       	"CDL4" => $array["driver_cdl4"], 
       	"SSN4" => substr($array["driver_ssn4"],-3), 
       	"DRIVERFIRSTNAME" => $driver_name[0], 
       	"DRIVERLASTNAME" => $driver_name[1]." ".$driver_name[2], 
       	"OWNOP" => ($array["owner_operator"] == 1)?"Yes":"Off",
       	"PUC" => ($array["ctype"] == "puc")?"Yes":"Off",
       	"TAXI" => ($array["ctype"] == "taxi")?"Yes":"Off",
       	"DRIVERADD" => ($array["add"] == 1)?"Yes":"Off",
       	"DRIVERTERMINATE" => ($array["terminate"] == 1)?"Yes":"Off",
       	"mydate" => date("l d, F Y"),
	);

       	$one = array();
       	$two = array();
       	$three = array();

       	$fdf = forge_fdf("localhost", $params, $one, $two, $three);

       	$file = fopen(APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf","a+");

       	fwrite($file,$fdf);

       	fclose($file);

       	if($template == 1){

		$pfile = "Consortium_Enrollment_Renew_{$array["consortium_users_id"]}_".date("Y",$array["expiration_date"]).".pdf";

	       	@unlink(APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile");

			# for Linux:
	       	$cmd = "/usr/local/bin/pdftk ".APPLICATION_PATH."/../public_html/pdf_templates/Enrollment_Package_Renewal.pdf fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";

            # for Windows:
            #$cmd = "/php/pdftk/bin/pdftk.exe ".APPLICATION_PATH."/../public_html/pdf_templates/Enrollment_Package_Renewal.pdf fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";

        	shell_exec($cmd);

	}elseif($template == 2){

		$pfile = "Consortium_Enrollment_AddDelete_{$array["consortium_users_id"]}_{$array["driver_id"]}.pdf";

	       	@unlink(APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile");

			# for Linux7
	       	$cmd = "/usr/local/bin/pdftk ".APPLICATION_PATH."/../public_html/pdf_templates/Enrollment_Add_Delete_Driver.pdf fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";

            # for Windows:
            #$cmd = "/usr/local/bin/pdftk ".APPLICATION_PATH."/../public_html/pdf_templates/Enrollment_Add_Delete_Driver.pdf fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";
		
        	shell_exec($cmd);

	}else{

		$pfile = "Consortium_Enrollment_{$array["consortium_users_id"]}.pdf";
		
	       	@unlink(APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile");

		if($array["drivers"] == 1 && $array["ctype"] == "fmcsa")
			$template = "Enrollment_Package_FMCSA.pdf";
		elseif($array["drivers"] > 1 && $array["ctype"] == "fmcsa")
			$template = "Enrollment_Package_FMCSA_2+.pdf";
		elseif($array["drivers"] == 1 && $array["ctype"] == "puc")
			$template = "Enrollment_Package_PUC.pdf";
		elseif($array["drivers"] > 1 && $array["ctype"] == "puc")
			$template = "Enrollment_Package_PUC_2+.pdf";
		else
			$template = "Enrollment_Package_TAXI.pdf";

		
		# for Linux
		$cmd = "/usr/local/bin/pdftk ".APPLICATION_PATH."/../public_html/pdf_templates/$template fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";

        # for Windows:
        #$cmd = "/usr/local/bin/pdftk ".APPLICATION_PATH."/../public_html/pdf_templates/$template fill_form ".APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf output ".APPLICATION_PATH."/../consortium_enrollment_pdf/$pfile";
	
		shell_exec($cmd);

	}

       	unlink(APPLICATION_PATH."/../consortium_enrollment_pdf/data_{$array["consortium_users_id"]}.fdf");

	return $pfile;

}
