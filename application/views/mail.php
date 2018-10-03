<!DOCTYPE html>
<html>
<head>
	<!-- Load opensans fonts -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300' rel='stylesheet' type='text/css'>

	<style type="text/css">
		.loginRow {
		  display: flex;
		  align-items: center;
		}
		.logo{
			width: 300px;
		}
		.purpleText{
			color: #292D96;
			font-family: 'Open Sans', sans-serif;
			font-size: 20px;
			font-weight: 120;
		}
		.cyanText{
			color: #4AB3EE;
			font-family: 'Open Sans', sans-serif;
			font-size: 16px;
			font-weight: 100;
		}
		.grayText{
			color: gray;
			font-family: 'Open Sans', sans-serif;
			font-size: 16px;
			font-weight: 100;
		}
		.whiteText{
			color: white;
			font-family: "Open Sans";
			font-size: 30px;
		}
		.orangeButton{
			background-color: #FFA144;
			border-radius: 40px;
			border: none;
			width: 300px;
			height: 45px;
		}
		.centerText{
			text-align: -webkit-center;
		}
	</style>
</head>
<body>
	<div class="loginRow">
		<div class="left"><img class="logo" src="http://dev.domoti.rocks/pain-backend/assets/images/Pain_Logo02-01.png"></div>
		<div class="rigth" ng-show="!recordar" style="width: 300px;">
			<h2 class="purpleText">Tu perfil ha sido creado de forma exitosa</h2>
			<form name="form" action="http://dev.domoti.rocks/pain/#/home" role="form">
			    <div class="form-group centerText">
			        <label class="grayText">Usuario </label><br/>
			        <label class="cyanText"><?=$email?></label>
			    </div>
			    <div class="form-group centerText">
			        <label class="grayText">Contraseña*</label><br/>
			        <label class="cyanText"><?=$password?></label>
			    </div>
			    <div class="form-actions centerText">
	        		<button type="submit" class="btn btn-primary orangeButton whiteText"  onclick="window.location.href='http://dev.domoti.rocks/pain/#/home'">Login</button>
	    		</div>
			</form>
		</div>
	</div>
</body>
</html>
