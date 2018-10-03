<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="utf-8">
	<!-- Load opensans fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="loginRow" style="display: flex;align-items: center;">
		<div class="left"><img class="logo" style="width: 300px;" src="http://dev.domoti.rocks/pain-backend/assets/images/Pain_Logo02-01.png"></div>
		<div class="rigth" ng-show="!recordar" style="width: 300px;">
			<h2 class="purpleText" style="color: #292D96;font-family: 'Open Sans', sans-serif;font-size: 20px;font-weight: 120;">¡Recuerda tu próximo cambio de parche!</h2>
			<form name="form" action="http://dev.domoti.rocks/pain/#/home" role="form">
			    <div class="form-group centerText" style="text-align: -webkit-center;">
			        <label class="orangeText" style="color: #FFA144;font-family: 'Open Sans', sans-serif;font-size: 16px;font-weight: 100;">Próximo cambio del parche</label><br>
			        <label class="cyanText" style="color: #4AB3EE;font-family: 'Open Sans', sans-serif;font-size: 16px;font-weight: 100;"><?=$suppose?></label>
			    </div>
			    <div class="form-group centerText" style="text-align: -webkit-center;">
			        <label class="cyanText" style="color: #4AB3EE;font-family: 'Open Sans', sans-serif;font-size: 16px;font-weight: 100;">El último cambio del parche,</label><br>
			        <label class="cyanText" style="color: #4AB3EE;font-family: 'Open Sans', sans-serif;font-size: 16px;font-weight: 100;">fue el <b><?=$application?></b></label>
			    </div>
			    <div class="form-actions centerText" style="text-align: -webkit-center;">
	        		<button type="submit" class="btn btn-primary orangeButton whiteText" onclick="window.location.href='http://dev.domoti.rocks/pain/#/home'" style="color: white;font-family: &quot;Open Sans&quot;;font-size: 30px;background-color: #FFA144;border-radius: 40px;border: none;width: 300px;height: 45px;">CONFIRMAR CAMBIO</button>
	    		</div>
			</form>
		</div>
	</div>
	<div>
		<img class="logoFooter" style="content: url(img/iconos_01-112.png);width: 600px;">
	</div>
</body>
</html>
