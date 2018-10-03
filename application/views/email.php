<!DOCTYPE html>
<html>
<head>

</head>
<body>
 <div style="display: flex; align-items: center;">
  <div><img style="width: 300px;" src="http://dev.domoti.rocks/pain-backend/assets/images/Pain_Logo02-01.png"></div>
  <div ng-show="!recordar" style="width: 300px;">
   <h2 style="color: #292D96; font-family: 'Open Sans', sans-serif; font-size: 20px; font-weight: 120;">Tu perfil ha sido creado de forma exitosa</h2>
   <form name="form" action="http://dev.domoti.rocks/pain/#/home" role="form">
       <div style="text-align: -webkit-center;" align="-webkit-center">
           <label style="color: gray; font-family: 'Open Sans', sans-serif; font-size: 16px; font-weight: 100;">Usuario </label><br>
           <label style="color: #4AB3EE; font-family: 'Open Sans', sans-serif; font-size: 16px; font-weight: 100;"><?=$email?></label>
       </div>
       <div style="text-align: -webkit-center;" align="-webkit-center">
           <label style="color: gray; font-family: 'Open Sans', sans-serif; font-size: 16px; font-weight: 100;">Contrase&ntilde;a</label><br>
           <label style="color: #4AB3EE; font-family: 'Open Sans', sans-serif; font-size: 16px; font-weight: 100;"><?=$password?></label>
       </div>
       <div style="text-align: -webkit-center;" align="-webkit-center">
           <button type="submit" onclick="window.location.href='http://dev.domoti.rocks/pain/#/home'" style="color: white; font-family: 'Open Sans'; font-size: 30px; border-radius: 40px; width: 300px; height: 45px; background-color: #FFA144; border: none;">Login</button>
       </div>
   </form>
  </div>
 </div>
</body>
</html>
