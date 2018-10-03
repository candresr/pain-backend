<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * <b>Class Service </b>
 * Controlador que facilita la implementacion de metodos
 * comunes para los servicios solicitados por las aplicaciones
 * web externas, eliminando la
 * reescritura de codigo redundante en cada sistema y facilitando
 * el mantenimiento de este codigo comun.
 * @package      Application
 * @subpackage   controllers
 * @author       Cesar Ramirez <candresramirez@gmail.com>
 * @copyright    Por definir
 * @license      Por definir
 * @version      v-1 Version 26/05/2016
 * */
class Service extends CI_Controller {
  public function __construct(){
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, application/x-www-form-urlencoded");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
		parent::__construct();

	}
  public function index(){}
  public function postData(){
    if($this->input->get()){
      $request_data = $this->input->get();
    }else{
      $handle = fopen("php://input", "rb");
      $raw_post_data = '';
      while (!feof($handle)) {
          $raw_post_data .= fread($handle, 8192);
      }
      fclose($handle);
      $request_data = json_decode($raw_post_data, true);

    }

    foreach ($request_data as $key => $value) {
      ($key == 'order')? $order = $value : '';
      ($key == 'join')? $join = $value : '';
      ($key == 'condition')?  $condition = $value : '';
      ($key == 'operation')?  $opert = $value : '';
      ($key == 'table')?  $table = $value : '';
      ($key == 'columns')?  $dataColumn = explode(',',$value) : '';
      ($key == 'values')?  $dataValues = explode(',',$value) : '';
    }
    //print_r($dataColumn);
    //print_r($dataValues);
    switch ($opert) {
      case 0:
        $this->login($dataColumn,$dataValues);
        break;
      case 1:
        $this->insertData($table,$dataColumn,$dataValues);
        break;
      case 2:
        $this->updateData($condition,$table,$dataColumn,$dataValues);
        break;
      case 3:
        $this->deleteData($condition,$table);
        break;
      case 4:
        $this->selectData($condition,$dataColumn,$table,$order='');
        break;
      case 5:
        $this->selectDoctorPatient($condition,$dataColumn);
        break;
      case 6:
        $this->selectDoctorAlert($condition,$dataColumn);
        break;
      case 7:
        $this->selectNotification($condition,$dataColumn);
        break;
      case 8:
        $this->sendNotification($dataValues);
        break;
      case 9:
        $this->selectPainPatient($condition,$dataColumn,$dataValues);
        break;
      case 10:
        $this->selectPainReport($condition,$dataColumn,$dataValues);// pacientes con Id nombre anonimo para estadista
        break;
      case 11:
        $this->adherenceGroup($condition);
        break;
      case 12:
        $this->selectReportDoctor($condition,$dataColumn,$dataValues); // pacientes con nombre
        break;
      case 13:
        $this->selectReportStatical($condition);
        break;
      case 14:
        $this->selectPatientAdmin($condition,$dataColumn);
        break;
      case 15:
        $this->getAdherence($condition);
        break;
      case 16:
        $this->statisticsReport($table);
        break;
      case 17:
        $this->selectProduct($condition);
        break;
      case 18:
      //TODO: Implement This
        $this->selectDoctorPatientFull($condition);
		break;
    }
  }

  public function insertData($table,$dataColumn,$dataValues){
    $dataFormat = array_combine($dataColumn,$dataValues);
    switch ($table) {
      case 'Patient':
      case 'Visitor':
      case 'Statistical':
      case 'Doctor':
        $pass = $this->generatePass();
        $dataFormat['password'] = sha1($pass);
        $insert = $this->service_model->insertData($table,$dataFormat);
        $dataEmail = array('email' => $dataFormat['email'], 'password' => $pass, 'failure' => $insert);
        if($insert == false){
          $this->emailRegister($dataEmail);
          $data = array('failure' => false);
          echo json_encode($data);
        }else{
          $data = array('failure' => true);
          echo json_encode($data);
        }
        break;
      default:
        $this->service_model->insertData($table,$dataFormat);
        break;
    }
  }

  public function updateData($condition,$table,$dataColumn,$dataValues){
    $dataFormat = array_combine($dataColumn,$dataValues);
    $this->service_model->updateData($condition,$table,$dataFormat);
  }

  public function deleteData($condition,$table){
    $this->service_model->deleteData($condition,$table);
  }

  public function selectData($condition,$dataColumn,$table){
    $this->service_model->selectData($condition,$dataColumn,$table);
  }

  public function selectDoctorPatientFull($condition){
    $this->service_model->selectDoctorPatientFull($condition);
  }

  public function selectDoctorPatient($condition,$dataColumn){
    $this->service_model->selectDoctorPatient($condition,$dataColumn);
  }

  public function selectDoctorAlert($condition,$dataColumn){
    $this->service_model->selectDoctorAlert($condition,$dataColumn);
  }

  public function selectNotification($condition,$dataColumn){
    $this->service_model->selectNotification($condition,$dataColumn);
  }
  public function sendNotification($dataValues){
    $rows = $this->service_model->getUser($dataValues);
    $data = array();
    foreach ($rows->result() as $value) {
      $insert = $this->service_model->setNotification($value->id);
      if($insert == true){
        $this->sendMessage($value->email,'false',$value->id);
        $data[] = array('failure' => false);
      }else{
        $data[] = array('failure' => true);
      }
    }
    echo json_encode($data);
  }

  public function selectPainPatient($condition,$dataColumn,$dataValues){
    if(in_array('id_diagnosis', $dataColumn) || in_array('id_institution', $dataColumn) || in_array('id_line', $dataColumn) || in_array('id_product', $dataColumn)){
      $dataOr = array_combine($dataColumn,$dataValues);
    }else{
      $dataOr = '';
    }
    $this->service_model->selectPainPatient($condition,$dataOr);
  }

  public function selectReportStatical($condition){
    $this->service_model->selectReportStatical($condition);
  }

  public function selectPatientAdmin($condition,$dataColumn){
    $this->service_model->selectPatientAdmin($condition,$dataColumn);
  }

  public function selectPainReport($condition,$dataColumn,$dataValues){
    if(in_array('id_diagnosis', $dataColumn) || in_array('id_institution', $dataColumn) || in_array('id_line', $dataColumn) || in_array('id_product', $dataColumn)){
      $dataOr = array_combine($dataColumn,$dataValues);
    }else{
      $dataOr = '';
    }
    $result = $this->service_model->selectPatientDay($condition,$dataOr);
    $days = $this->service_model->dayTreatment($condition);
    $average = $this->service_model->dayAverage();
    $treatment = $days->row()->day_treatment;
    foreach ($result->result_array() as $rows) {
      $id_user[] = $rows['id'];
    }
    $group_id = array_unique($id_user);
    $daydata = '';
    foreach ($group_id as  $id) {
      foreach ($result->result_array() as $value) {
        if($value['id'] == $id){
          $data[$id]['level'][] = $value['level'];
          $data[$id]['day'][] = $value['day'];
        }
      }
    }
    $out = '';
    $out .= '<table>';
    $out .= '<tr>';
    $out .= '<td>PACIENTES</td>';
    for ($i=1; $i <= $treatment; $i++) {
      $out .= '<td>Dia '.$i.'</td>';
    }
    $out .= '</tr>';
    $t = 0;
    foreach ($data as $name => $values) {
      $out .= '<tr>';
      $out .= '<td>'.$name.'</td>';
      foreach ($values as $key => $rows) {
        if($key == 'level'){
          $x = 0;
          $cont = 1;
            foreach ($rows as  $row) {
              $day = $values['day'][$x];
              $td = '';
              for ($i=$cont; $i <= $day - 1; $i++) {
                $td .= '<td></td>';
              }
              $out .= $td;
              $out .= '<td>'.$row.'</td>';
              $x++;
              $cont = $day + 1;
            }

        }
      }
      $out .= '</tr>';
      $t++;
    }
    $out .= '<tr>';
    $out .= '<td>Promedio</td>';
    $k = 0;
    $count = 1;
    foreach ($average->result() as  $value) {
      $daily[] = $value->day;
      $avcLevel[] = $value->level;
    }
    for ($i=1; $i < $treatment + 1; $i++) {
      if(in_array($i,$daily)){
        $key = array_search($i,$daily);
        $out .= '<td>'.$avcLevel[$key].'</td>';
        //echo 'avg '.$avcLevel[$key].'<br>';
      }else {
        $out .= '<td></td>';
        //echo 'no encontre'.$i.'<br>';
      }
    }
    $out .= '</tr>';
    $out .= '</table>';
    #echo $out;
    $this->exportExcel($out);
  }

  public function adherenceGroup($condition){
    $this->service_model->adherenceGroup($condition);
  }

  public function login($dataColumn,$dataValues){

    $dataFormat = array_combine($dataColumn,$dataValues);
    $email = $dataFormat['email'];
    $password = $dataFormat['password'];
    $query = $this->service_model->verify($email, $password);
    $verify = $query->row();
    if($query->num_rows() > 0){
      switch ($verify->id_group) {
        case 1:
          $data = array(
            'id' => $verify->id,
            'name' => $verify->name,
            'lastname' => $verify->lastname,
            'email' => $verify->email,
            'active' => $verify->active,
            'group' => $verify->group,
            'id_group' => $verify->id_group,
            'sex' => $verify->sex,
            'picture' => $verify->picture,
            'changePassword' => $verify->changePassword
          );
          break;
        case 2:
          $doctor = $this->service_model->getDoctor($verify->id);
          $data = array(
            'id' => $verify->id,
            'name' => $verify->name,
            'lastname' => $verify->lastname,
            'email' => $verify->email,
            'active' => $verify->active,
            'group' => $verify->group,
            'id_group' => $verify->id_group,
            'terms' => $verify->terms,
            'sex' => $verify->sex,
            'password' => $verify->password,
            'picture' => $verify->picture,
            'id_specialization' => $doctor->row()->id_specialization,
            'alert' => $doctor->row()->alert,
            'day_patch' => $doctor->row()->day_patch,
            'id_country' => $doctor->row()->id_country_doctor,
            'changePassword' => $verify->changePassword,
            'id_city' => $doctor->row()->id_city
          );
          break;
        case 3:
          $patient = $this->service_model->getPatientLogin($verify->id);
          $data = array(
            'id' => $verify->id,
            'name' => $verify->name,
            'lastname' => $verify->lastname,
            'email' => $verify->email,
            'active' => $verify->active,
            'group' => $verify->group,
            'id_group' => $verify->id_group,
            'terms' => $verify->terms,
            'sex' => $verify->sex,
            'password' => $verify->password,
            'picture' => $verify->picture,
            'id_institution' => $patient->row()->id_institution,
            'id_product' => $patient->row()->id_product,
            'frecuency' => $patient->row()->frecuency,
            'id_country' => $patient->row()->id_country_patient,
            'id_diagnosis' => $patient->row()->id_diagnosis,
            'changePassword' => $verify->changePassword,
            'id_city' => $patient->row()->id_city
          );
          break;
          case 4:
            $visitor = $this->service_model->getVisitor($verify->id);
            $data = array(
              'id' => $verify->id,
              'name' => $verify->name,
              'lastname' => $verify->lastname,
              'email' => $verify->email,
              'active' => $verify->active,
              'group' => $verify->group,
              'id_group' => $verify->id_group,
              'sex' => $verify->sex,
              'picture' => $verify->picture,
              'changePassword' => $verify->changePassword,
              'id_country' => $visitor->row()->id_country_visitor
            );
          break;
          case 5:
            $statistical = $this->service_model->getStatistical($verify->id);
            $data = array(
              'id' => $verify->id,
              'name' => $verify->name,
              'lastname' => $verify->lastname,
              'email' => $verify->email,
              'active' => $verify->active,
              'group' => $verify->group,
              'id_group' => $verify->id_group,
              'sex' => $verify->sex,
              'picture' => $verify->picture,
              'changePassword' => $verify->changePassword,
              'id_country' => $statistical->row()->id_country_statistical
            );
          break;
      }

      //$data = array('failure' => false);
      echo json_encode($data);
    }else{
      $data = array('failure' => true);
      echo json_encode($data);
    }
  }

  public function recoverPassword(){
    $email = $this->input->post('username');
    $query = $this->service_model->verifyEmail($email);
    //die($this->db->last_query());
    if($query->num_rows() > 0){
      $verify = $query->row();
      $pass = $this->generatePass();
      $data['password'] = sha1($pass);
      $conditional = array('email' => $verify->email );
      $update = $this->service_model->updateData($conditional,'User',$data);

      if($update == false){
        $value['password'] = $pass;
        $value['email'] = $verify->email;
        $body = $this->load->view('cambiopass',$value,true);
        $from = 'Administracion PAIN';
        $subject = 'Recuperacion de Contraseña PAIN';

        $this->sendEmail($verify->email,$from,$subject,$body,$update);
      }else{
        echo json_encode(array('failure' => true));
      }
    }else{
      echo json_encode(array('failure' => true));
    }
  }

  public function sendMessage($email,$insert,$id){
    $body = $this->load->view('agendarcita','',true);
    // $body = "<h2>Alerta Cita Medica</h2><hr>
    //          Saludos.<br>
    //          Te recomendamos agendar una cita con tu medico<br>";
    $from = 'Sistema PAIN';
    $subject = 'Alerta';
    $this->sendEmail($email,$from,$subject,$body,$insert,$id);
  }

  public function sendAutomatic($email,$suppose,$application){
    $value['suppose'] = $suppose;
    $value['application'] = $application;
    $body = $this->load->view('cambioparche',$value,true);
    // $body = "<h2>Alerta Cambio de Parche</h2><hr>
    //          Saludos.<br>
    //          Te recordamos que debes cambiar la ubicacion del parche<br>";
    $from = 'Sistema PAIN';
    $subject = 'Cambio de Parche';
    $this->sendEmail($email,$from,$subject,$body);
  }

  public function emailRegister($value){
    $email = $value['email'];
    $body = $this->load->view('email',$value,true);
    // $body = "<h2>Registro al sistema PAIN</h2><hr><br> Bienvenid@!<br>
    //          Usted ha sido registrado exitosamente en nuestro Sistema.
    //          Para procesar su trámite ingrese con el siguiente usuario y contraseña:<br>
    //          Usuario: $email<br>
    //          Clave: $pass<br>
    //          Por su seguridad se recomienda cambiar su contraseña para uso del sistema.";
    $from = 'Administracion PAIN';
    $subject = 'Bienvenido/a a Sistema PAIN';
    $this->sendEmail($email,$from,$subject,$body,$value['failure']);
  }

  public function sendEmail($email,$from,$subject,$body,$response = '',$id = ''){

    $config = array(
     'protocol' => 'smtp',
     'smtp_host' => 'ssl://smtp.gmail.com',
     'smtp_port' => 465,
     'smtp_user' => 'no-reply@domoti-sas.com',
     'smtp_pass' => 'E<mYm5<n',
     'mailtype' => 'html',
     'charset' => 'utf-8',
     'newline' => "\r\n"
     );
     $this->email->initialize($config);

     $this->email->from($from);
     $this->email->to($email);
     $this->email->subject($subject);
     $this->email->message($body);

     if($this->email->send()){
       //echo json_encode(array('sendEmail' => true, 'failure' => $response));
       return true;
     }else{
       //echo json_encode(array('sendEmail' => false, 'failure' => true));
       return false;
     }
  }

  function generatePass(){

    $cadena = "abcdefghijkmnopqrstuvwxyz1234567890";
    $longitudCadena=strlen($cadena);
    $pass = "";
    $longitudPass=8;

    for($i=1 ; $i<=$longitudPass ; $i++){
        $pos=rand(0,$longitudCadena-1);
        $pass .= substr($cadena,$pos,1);
    }
    //echo $pass;
    return $pass;
  }

  public function do_upload(){

    $temp = explode(".", $_FILES["file"]["name"]);
  	$newfilename = round(microtime(true)) . '.' . end($temp);
    $path = './uploads/';
    $config['upload_path'] = $path;
    $config['allowed_types'] = '*';
    $config['remove_spaces']= TRUE;
    //$config['max_size']    = '2048';
    $config['file_name']  = $newfilename;

    $this->load->library('upload', $config);
    if(!$this->upload->do_upload('file')){
      $data = array('failure' => $this->upload->display_errors());
      echo json_encode($data);
      return false;
    }else{
      $data = array('success' => true, 'file_name' => $newfilename);
      echo json_encode($data);
      return true;
    }
  }

  public function getToday(){
    $id_user =$this->input->get('id_user');
    $row = $this->service_model->getToday($id_user);
    $timezone = $row->row()->timezone;
    date_default_timezone_set($timezone);
    $date = date("d-m-Y H:i:s");
    echo "\"".$date."\"";
  }
  public function exportExcel($table){
    //$table = $this->selectPainReport($condition,$dataColumn,$dataValues);
    $this->excel->setActiveSheetIndex(0);
    $tmpfile = tempnam(sys_get_temp_dir(), 'html');
    file_put_contents($tmpfile, $table);

    $objPHPExcel     = new PHPExcel();
    $excelHTMLReader = PHPExcel_IOFactory::createReader('HTML');
    $excelHTMLReader->loadIntoExisting($tmpfile, $objPHPExcel);

    unlink($tmpfile); // delete temporary file because it isn't needed anymore
    $filename = 'reporte-'.date("m.d.y").'.xls';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'); // header for .xlxs file
    header('Content-Disposition: attachment;filename='.$filename); // specify the download file name
    header('Cache-Control: max-age=0');

    $writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $writer->save('php://output');
    exit;
  }

  public function selectReportDoctor($condition,$dataColumn,$dataValues){
    if(in_array('id_diagnosis', $dataColumn) || in_array('id_institution', $dataColumn) || in_array('id_line', $dataColumn) || in_array('id_product', $dataColumn)){
      $dataOr = array_combine($dataColumn,$dataValues);
    }else{
      $dataOr = '';
    }
    $result = $this->service_model->selectPatientDay($condition,$dataOr);
    $days = $this->service_model->dayTreatment($condition);
    $average = $this->service_model->dayAverage();
    $treatment = $days->row()->day_treatment;
    foreach ($result->result_array() as $rows) {
      $id_user[] = $rows['patient'];
    }
    $group_id = array_unique($id_user);
    $daydata = '';
    foreach ($group_id as  $id) {
      foreach ($result->result_array() as $value) {
        if($value['patient'] == $id){
          $data[$id]['level'][] = $value['level'];
          $data[$id]['day'][] = $value['day'];
        }
      }
    }
    $out = '';
    $out .= '<table>';
    $out .= '<tr>';
    $out .= '<td>PACIENTES</td>';
    for ($i=1; $i <= $treatment; $i++) {
      $out .= '<td>Dia '.$i.'</td>';
    }
    $out .= '</tr>';
    $t = 0;
    foreach ($data as $name => $values) {
      $out .= '<tr>';
      $out .= '<td>'.$name.'</td>';
      foreach ($values as $key => $rows) {
        if($key == 'level'){
          $x = 0;
          $cont = 1;
            foreach ($rows as  $row) {
              $day = $values['day'][$x];
              $td = '';
              for ($i=$cont; $i <= $day - 1; $i++) {
                $td .= '<td></td>';
              }
              $out .= $td;
              $out .= '<td>'.$row.'</td>';
              $x++;
              $cont = $day + 1;
            }

        }
      }
      $out .= '</tr>';
      $t++;
    }
    $out .= '<tr>';
    $out .= '<td>Promedio</td>';
    $k = 0;
    $count = 1;
    foreach ($average->result() as  $value) {
      $daily[] = $value->day;
      $avcLevel[] = $value->level;
    }
    for ($i=1; $i < $treatment + 1; $i++) {
      if(in_array($i,$daily)){
        $key = array_search($i,$daily);
        $out .= '<td>'.$avcLevel[$key].'</td>';
        //echo 'avg '.$avcLevel[$key].'<br>';
      }else {
        $out .= '<td></td>';
        //echo 'no encontre'.$i.'<br>';
      }
    }
    $out .= '</tr>';
    $out .= '</table>';
    #echo $out;
    $this->exportExcel($out);
  }

  public function automaticNotification(){
    $rows = $this->service_model->dayDiffAfter();
    foreach ($rows->result() as  $value) {
      $this->sendAutomatic($value->email,$value->suppose,$value->application);
    }
  }

  public function getAdherence($condition){
    echo $this->service_model->getAdherence($condition);
  }

  public function statisticsReport($table){
    switch ($table) {
      case 'paciente':
        $this->statisticsPatient();
        break;
      case 'doctor':
        $this->statisticsDoctor();
        break;
    }
  }

  public function statisticsPatient(){
    $query = $this->service_model->statisticsPatient();
    $this->table->set_heading(array('Paciente','Fecha de Inicio','Fecha desactivacion','Estatus','Pais','Ciudad','Diagnostico','Producto','Presentacion','Medico','Especialidad','Institucion','Sexo'));
    $table = $this->table->generate($query);
    $this->exportExcel($table);
  }

  public function statisticsDoctor(){
    $query = $this->service_model->statisticsDoctor();
    $this->table->set_heading(array('Medico','Fecha de Inicio','Fecha desactivacion','Estatus','Pais','Ciudad','Especialidad','Sexo'));
    $table = $this->table->generate($query);
    $this->exportExcel($table);
  }

  public function selectProduct($condition){
    $this->service_model->selectProduct($condition);
  }

  public function notificationPush(){
    $rows = $this->service_model->dayDiffAfter();

    foreach ($rows->result() as  $value) {
  		$url = "https://fcm.googleapis.com/fcm/send";
  		$content = json_encode(array(
  			"to" => "/topics/".$value->id,
  			"content_available" => true,
  			"priority" => "high",
  			"notification" => array(
  				"body" => "Recuerda cambiar tu parche",
  				"title" => "PAIN"
  			)
  		));

  		$curl = curl_init($url);
  		curl_setopt($curl, CURLOPT_HEADER, false);
      curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
      curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
  		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  		curl_setopt($curl, CURLOPT_HTTPHEADER,array(
  				"Content-type: application/json",
  				"Authorization: key=AIzaSyCnQTZPpNlBSz8MKROmegx1DfhyamzJCyw")
  		);
  		curl_setopt($curl, CURLOPT_POST, true);
  		curl_setopt($curl, CURLOPT_POSTFIELDS, $content);

  		$json_response = curl_exec($curl);

  		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);

  		if ( $status != 200 ) {
  			die("Error: call to URL $url failed with status $status, response $json_response, curl_error " . curl_error($curl) . ", curl_errno " . curl_errno($curl));
  		}


  		curl_close($curl);

  		echo json_decode($json_response, true);
    }
  }
}
