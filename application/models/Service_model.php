<?php
/**
 * <b>App Model Service </b>
 *
 *
 * @package    	pain-backeng
 * @author     	Cesar Ramirez <candresramirez@gmail.com>
 * @version    	1.0
 */
class Service_model  extends CI_Model  {
    function __construct(){
        parent::__construct();
    }
    public function insertData($table,$data){
      switch ($table) {
        case 'Patient':
          $id_institution = $data['id_institution'];
          $id_doctor = $data['id_doctor'];
          $id_product = $data['id_product'];
          $id_country = $data['id_country'];
          $id_diagnosis = $data['id_diagnosis'];
          $id_city = $data['id_city'];
          $intensity = $data['intensity'];
          unset($data['id_institution']);
          unset($data['id_doctor']);
          unset($data['id_product']);
          unset($data['id_country']);
          unset($data['id_diagnosis']);
          unset($data['id_city']);
          unset($data['intensity']);
          $this->db->insert('User',$data);
          $id = $this->db->insert_id();
          $data_group = array('id_user' => $id, 'id_group' => '3');
          $this->db->insert('Group_user',$data_group);
          $data_patient = array('id_user' => $id, 'id_doctor' => $id_doctor, 'id_institution' => $id_institution, 'id_country' => $id_country, 'id_diagnosis' => $id_diagnosis, 'id_city' => $id_city, 'intensity' => $intensity);
          $this->db->insert('Patient',$data_patient);
          $data_recipe = array('id_patient' => $id, 'id_doctor' => $id_doctor);
          $this->db->insert('Recipe',$data_recipe);
          $id_recipe = $this->db->insert_id();
          $frecuency = $this->getProduct($id_product);
          $data_dose = array('id_recipe' => $id_recipe, 'id_product' => $id_product, 'frecuency' => $frecuency->row()->frecuency);
          $this->db->insert('Dose',$data_dose);

          if (!empty($id)) {
            return false;
          }else{
            return true;
          }
          break;
        case 'Doctor':
          $id_specialization = $data['id_specialization'];
          (!empty($data['profile']))? $profile = $data['profile'] : $profile = "" ;
          $id_country = $data['id_country'];
          $alert = $data['alert'];
          $day_patch = $data['day_patch'];
          $id_city = $data['id_city'];
          unset($data['id_city']);
          unset($data['id_specialization']);
          unset($data['profile']);
          unset($data['id_country']);
          unset($data['alert']);
          unset($data['day_patch']);
          $this->db->insert('User',$data);
          $id = $this->db->insert_id();
          $data_group = array('id_user' => $id, 'id_group' => '2');
          $this->db->insert('Group_user',$data_group);
          $data_doctor = array('id_user' => $id,'id_specialization' => $id_specialization,'profile' => $profile,'id_country' => $id_country,'alert' => $alert,'day_patch' => $day_patch ,'id_city' => $id_city);
          $this->db->insert('Doctor',$data_doctor);
          if (!empty($id)) {
            return false;
          }else{
            return true;
          }
          break;
        case 'Pain_report':
          $alert = $this->alertDoctor($data['id_patient']);
          if($data['level'] >= $alert){
            $this->db->update('Patient',array('alert' => true), array('id_user' => $data['id_patient']));
          }
          $day = $this->dayDiff($data['id_patient']);
          ($day == 0)? $day = 1 : $day;
          $data['treatment'] = $day;
          if ($this->db->insert('Pain_report',$data)) {
            echo json_encode(array('failure' => false));
          }else{
            echo json_encode(array('failure' => true));
          }
        break;
        case 'Application':
          $id_dose = $data['id_dose'];
          $this->db->insert('Application',$data);
          $id = $this->db->insert_id();
          $data = $this->getSuppose($id);
          $this->db->update('Application',array('suppose' => $data['suppose']),array('id' => $id));
          $effective = $this->getEffective($id_dose);
          $this->db->update('Application',array('effective' => $effective),array('id' => $id));
          if (!empty($data['application'])) {
            echo json_encode($data['application']);
          }else{
            echo json_encode(array('failure' => true));
          }
        break;
        case 'Statistical':
          $id_country = $data['id_country'];
          unset($data['id_country']);
          $this->db->insert('User',$data);
          $id = $this->db->insert_id();
          $data_group = array('id_user' => $id, 'id_group' => '5');
          $this->db->insert('Group_user',$data_group);
          $data_visitor = array('id_user' => $id, 'id_country' => $id_country);
          $this->db->insert('Statistical',$data_visitor);
          if (!empty($id)) {
            return false;
          }else{
            return true;
          }
        break;
        case 'Visitor':
          $id_country = $data['id_country'];
          unset($data['id_country']);
          $this->db->insert('User',$data);
          $id = $this->db->insert_id();
          $data_group = array('id_user' => $id, 'id_group' => '4');
          $this->db->insert('Group_user',$data_group);
          $data_visitor = array('id_user' => $id, 'id_country' => $id_country);
          $this->db->insert('Visitor',$data_visitor);
          if (!empty($id)) {
            return false;
          }else{
            return true;
          }
        break;
        default:
          $this->db->insert($table,$data);
          if ($this->db->insert_id()) {
            echo json_encode(array('failure' => false));
          }else{
            echo json_encode(array('failure' => true));
          }
          break;
      }
    }

    public function updateData($conditional,$table,$data){
      switch ($table) {
        case 'Doctor':
          $id = explode('=',$conditional);
          if(isset($data['id_specialization'])){
            $data_doctor = array('id_specialization' => $data['id_specialization'], 'id_country' => $data['id_country'], 'alert' => $data['alert'], 'day_patch' => $data['day_patch'],'id_city' => $data['id_city']);
            unset($data['id_specialization']);
            unset($data['alert']);
            unset($data['id_country']);
            unset($data['day_patch']);
            unset($data['id_city']);
            $this->db->update('Doctor',$data_doctor, array('id_user' => $id[1]));
            $countD = $this->db->affected_rows();
            $this->db->update('User',$data,array('id' => $id[1]));
            $countU = $this->db->affected_rows();
            if ($countD > 0 || $countU > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }else{
            $this->db->where('id',$id[1]);
            $this->db->update('User',$data);
            if ($this->db->affected_rows() > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }
          break;
        case 'Patient':
          $id = explode('=',$conditional);
          if(isset($data['id_city'])){
            $data_patient = array('id_city' => $data['id_city']);
            unset($data['id_city']);
            $this->db->update('Patient',$data_patient,array('id_user' => $id[1]));
            $countP = $this->db->affected_rows();
            $this->db->update('User',$data,array('id' => $id[1]));
            $countD = $this->db->affected_rows();
            if ($countP > 0 || $countD > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          } elseif (isset($data['alert'])) {
            $data_patient = array('alert' => $data['alert']);
            unset($data['alert']);
            $this->db->update('Patient',$data_patient,array('id_user' => $id[1]));
            $countP = $this->db->affected_rows();
            // $this->db->update('User',$data,array('id' => $id[1]));
            // $countD = $this->db->affected_rows();
            if ($countP > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }

          }else {
            $this->db->update('User',$data,array('id' => $id[1]));
            if ($this->db->affected_rows() > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }

          break;
        case 'Visitor':
          $id = explode('=',$conditional);
          if(isset($data['id_country'])){
            $id_country = $data['id_country'];
            unset($data['id_country']);
            $this->db->update('User',$data, array('id' => $id[1]));
            $countU = $this->db->affected_rows();
            $this->db->update('Visitor',array('id_country' => $id_country), array('id_user' => $id[1]));
            $countV = $this->db->affected_rows();
            if ($countU > 0 || $countV > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }else {
            $this->db->update('User',$data, array('id' => $id[1]));
            if ($this->db->affected_rows() > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }
          break;
        case 'Statistical':
          $id = explode('=',$conditional);
          if(isset($data['id_country'])){
            $id_country = $data['id_country'];
            unset($data['id_country']);
            $this->db->update('User',$data, array('id' => $id[1]));
            $countU = $this->db->affected_rows();
            $this->db->update('Statistical',array('id_country' => $id_country), array('id_user' => $id[1]));
            $countS = $this->db->affected_rows();
            if ($countU > 0 || $countS > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }else {
            $this->db->update('User',$data, array('id' => $id[1]));
            if ($this->db->affected_rows() > 0) {
              echo json_encode(array('failure' => false));
            }else{
              echo json_encode(array('failure' => true));
            }
          }
        break;
        default:
          $this->db->where($conditional);
          $this->db->update($table,$data);

          if ($this->db->affected_rows() > 0) {
            echo json_encode(array('failure' => false));
          }else{
            echo json_encode(array('failure' => true));
          }
          break;
      }
    }

    public function deleteData($conditional,$table){
      $this->db->where($conditional);
      $this->db->delete($table);
      if ($this->db->affected_rows() > 0) {
        echo json_encode(array('failure' => false));
      }else{
        echo json_encode(array('failure' => true));
      }
    }

    function selectData($condition,$dataColumn,$table,$order=''){

      switch ($table) {
        case 'Doctor':
          $this->db->select($dataColumn);
          $this->db->join('Doctor','Doctor.id_user = User.id');
          $this->db->join('Specialization','Doctor.id_specialization = Specialization.id');
          $this->db->join('Group_user','Group_user.id_user = User.id');
          $this->db->where('id_group',2);
          (!empty($condition))? $this->db->where($condition) : '' ;
          $query = $this->db->get('User');
          $data = array();
          break;
        case 'Patient':
          $dataColumn['doctor_name'] = "CONCAT(User.name,' ',User.lastname) as doctor_name";
          $dataColumn['description'] = "Product.description as description";
          $dataColumn['country_name'] = "Country.name as country_name";
          $this->db->select($dataColumn);
          $this->db->join('Group_user','Group_user.id_user = User.id');
          $this->db->join('Patient','Patient.id_user = User.id');
          $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
          $this->db->join('Dose','Dose.id_recipe = Recipe.id');
          $this->db->join('Product','Product.id = Dose.id_product');
          $this->db->join('Country','Country.id = Patient.id_country');
          (!empty($condition))? $this->db->where($condition) : '' ;
          $this->db->where('id_group',3);
          $query = $this->db->get('User');
          $data = array();
          break;
        case 'Visitor':
          $this->db->select('User.id as id, User.name as name, lastname, email, id_country,Country.name as country');
          $this->db->join('Group_user','Group_user.id_user = User.id');
          $this->db->join('Visitor','Visitor.id_user = User.id');
          $this->db->join('Country','Country.id = Visitor.id_country');
          (!empty($condition))? $this->db->where($condition) : '' ;
          $this->db->where('id_group',4);
          $query = $this->db->get('User');
          $data = array();
          break;
        case 'Statistical':
          $this->db->select('User.id as id, User.name as name, lastname, email, id_country, Country.name as country');
          $this->db->join('Group_user','Group_user.id_user = User.id');
          $this->db->join('Statistical','Statistical.id_user = User.id');
          $this->db->join('Country','Country.id = Statistical.id_country');
          (!empty($condition))? $this->db->where($condition) : '' ;
          $this->db->where('id_group',5);
          $query = $this->db->get('User');
          $data = array();
          break;
        case 'Product':
          $dataColumn['line'] = 'Line.name as line_name';
          $dataColumn['id_line'] = 'Line.id as id_line';
          $this->db->select($dataColumn);
          $this->db->join('Line','Line.id = Product.id_line');
          (!empty($condition))? $this->db->where($condition) : '' ;
          (!empty($order))? $this->db->order_by($order) : '' ;
          $query = $this->db->get($table);
          $data = array();
          break;
        case 'Line':
        case 'Diagnostic':
          $dataColumn['country'] = 'Country.name as country_name';
          $dataColumn['id_country'] = 'Country.id as id_country';
          $this->db->select($dataColumn);
          ($table == 'Line')? $this->db->join('Country','Country.id = Line.id_country') : '';
          ($table == 'Diagnostic')? $this->db->join('Country','Country.id = Diagnostic.id_country') : '';
          (!empty($condition))? $this->db->where($condition) : '' ;
          (!empty($order))? $this->db->order_by($order) : '' ;
          $query = $this->db->get($table);
          $data = array();
          break;
        case 'Institution':
          $dataColumn['country'] = 'Country.name as country_name';
          $dataColumn['id_country'] = 'Country.id as id_country';
          $this->db->select($dataColumn);
          $this->db->join('Country','Country.id = Institution.id_country');
          (!empty($condition))? $this->db->where($condition) : '' ;
          $query = $this->db->get($table);
          $data = array();
          break;
        default:
          $this->db->select($dataColumn);
          (!empty($condition))? $this->db->where($condition) : '' ;
          (!empty($order))? $this->db->order_by($order) : '' ;
          $query = $this->db->get($table);
          $data = array();
          break;
      }

      if($query->num_rows() > 0){
        foreach ($query->result() as $key => $value) {
          $data[$key] = $value;
        }
        echo json_encode($data);
      }else{
        echo json_encode($data);
      }
    }

    function selectPatientAdmin($condition,$dataColumn){
      $dataColumn['doctor_name'] = "CONCAT(User.name,' ',User.lastname) as doctor_name";
      $dataColumn['description'] = "Product.description as description";
      $dataColumn['country_name'] = "Country.name as country_name";
      $this->db->select($dataColumn);
      $this->db->join('User','Patient.id_doctor = User.id');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Product','Product.id = Dose.id_product');
      $this->db->join('Country','Country.id = Patient.id_country');
      (!empty($condition))? $this->db->where($condition) : '' ;
      $query = $this->db->get('Patient');
      $data = array();
      if($query->num_rows() > 0){
        foreach ($query->result() as $key => $value) {
          $data[$key] = $value;
        }
        echo json_encode($data);
      }else{
        echo json_encode($data);
      }
    }

	function selectDoctorPatientFull($id_doctor){
	  $this->db->select("*");
      $this->db->join('User U','U.id = P.id_user','left');
	  $this->db->join('Recipe R','R.id_patient = P.id_user','left');
	  $this->db->join('Dose D','D.id_recipe = R.id','left');
	  $this->db->join('Application A','A.id_dose = D.id','left');
	  $this->db->join('(SELECT id_patient,AVG(level) avg FROM Pain_report group by id_patient) Pain','Pain.id_patient = U.id','left');
	  //$this->db->join('Pain_report','Pain_report.id_patient = Patient.id_user','left');
      $this->db->where('P.id_doctor',$id_doctor);
      $this->db->order_by('A.id','asc');
	  $query = $this->db->get('Patient P');
      $data = array();
	  $users = array();
      if($query->num_rows() > 0){
		foreach ($query->result() as $key => $value) {
			if(!isset($users[$value->id_user])){
				$users[$value->id_user] = $value;
				$value->min_date = new DateTime($value->application);
				$value->max_date = new DateTime($value->suppose);
			}
			$min = new DateTime($value->application);
			$max = new DateTime($value->suppose);
			if($min < $users[$value->id_user]->min_date){
				$users[$value->id_user]->min_date = $min;
			}
			if($max > $users[$value->id_user]->max_date){
				$users[$value->id_user]->max_date = $max;
				$users[$value->id_user]->frecuency = $value->frecuency;
				$users[$value->id_user]->effective = $value->effective;
				$users[$value->id_user]->suppose = $value->suppose;
			}
        }
	  }

	  foreach($users as $user){
		  $interval = $user->min_date->diff($user->max_date);
		  $daysTotal = $interval->format('%a');
		  if($daysTotal == $user->frecuency){
			  $days = $user->frecuency;
		  }else{
			  $days = $daysTotal + 1;
		  }
		  $user->adherence = ($user->effective/$days)*100;
		  unset($user->min_date);
		  unset($user->max_date);
		  unset($user->suppose);
		  unset($user->application);
		  unset($user->suppose);
		  if($user->avg == null){
			  $user->avg = 0;
		  }
		  $data[] = $user;
		}
        echo json_encode($data);
    }

    function selectDoctorPatient($condition,$dataColumn){
      $this->db->select($dataColumn);
      $this->db->join('User','User.id = Patient.id_user');
      //$this->db->join('Pain_report','Pain_report.id_patient = Patient.id_user','left');
      $this->db->where($condition);
      $query = $this->db->get('Patient');
      $data = array();
      $data_post = array();
      if($query->num_rows() > 0){
        foreach ($query->result() as $key => $value) {
          $data[$key] = $value;
        }
        echo json_encode($data);
      }else{
        echo json_encode($data);
      }
    }

    function selectPainPatient($condition,$dataOr){
      $this->db->select('treatment');
      $this->db->select_avg('level');
      $this->db->join('Patient','Patient.id_user = Pain_report.id_patient');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Product','Product.id = Dose.id_product');
      if(empty($dataOr)){
        (!empty($condition))? $this->db->where('Patient.'.$condition) : '' ;
      }else{
        $this->db->where($dataOr);
        (!empty($condition))? $this->db->where('Patient.'.$condition) : '' ;
      }
      $this->db->group_by('treatment');
      $query = $this->db->get('Pain_report');
      $data = array();
      foreach ($query->result() as  $key => $value) {
          $data[$key] = $value;
      }
      echo json_encode($data);
    }

    function selectReportStatical($condition){
      $this->db->join('Patient','Patient.id_user = User.id');
      $this->db->where($condition);
      echo $this->db->count_all_results('User');
    }

    function selectPatientDay($condition,$dataOr){
      $this->db->select("CONCAT(User.name,' ',User.lastname) as patient,id_user as id, level, treatment as day");
      $this->db->join('User','User.id = Pain_report.id_patient');
      $this->db->join('Patient','Patient.id_user = Pain_report.id_patient');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Product','Product.id = Dose.id_product');
      if(empty($dataOr)){
        (!empty($condition))? $this->db->where('Patient.'.$condition) : '' ;
      }else{
        $this->db->or_where($dataOr);
        (!empty($condition))? $this->db->where('Patient.'.$condition) : '' ;
      }
      $this->db->order_by('treatment', 'ASC');
      return $this->db->get('Pain_report');
    }

    function dayTreatment($condition){
      $this->db->select('MAX(`treatment`) as day_treatment');
      $this->db->join('Patient','Patient.id_user = Pain_report.id_patient');
      //$this->db->where($condition);
      return $this->db->get('Pain_report');
    }

    function dayAverage($value=''){
      $this->db->select('treatment as day');
      $this->db->select_avg('level');
      $this->db->join('Patient','Patient.id_user = Pain_report.id_patient');
      $this->db->group_by('treatment');
      return $this->db->get('Pain_report');
    }

    function selectDoctorAlert($conditional,$dataColumn){
      //$dataColumn[] = '( count(Application.id_dose) * 100 )/ round( hour (timediff(max(`end`), min(`start`))) / frecuency) as adherence';
      $dataColumn[] = 'Dose.id as id_dose';
      $dataColumn[] = 'frecuency';
      $this->db->select($dataColumn);
      $this->db->select_avg('level');
      $this->db->join('Pain_report','Pain_report.id_patient = User.id');
      $this->db->join('Recipe','Recipe.id_patient = User.id');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Application','Application.id_dose = Dose.id');
      $this->db->join('Doctor','Doctor.id_user = Recipe.id_doctor');
      $this->db->where('Doctor.'.$conditional);
      $this->db->where('Pain_report.level >= Doctor.alert');
      $this->db->where("DATE_FORMAT(Pain_report.created,'%Y-%m-%d') BETWEEN  DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d'), INTERVAL 7 DAY) AND DATE_FORMAT(now(),'%Y-%m-%d')");
      $this->db->group_by('User.id');
      $query = $this->db->get('User');

      $data = array();
      if($query->num_rows() > 0){
        $i = 0;
        foreach ($query->result_array() as  $value) {
          $data[] = $value;
          $data[$i]['adherence'] = $this->getAdherence($value['id_dose']);
          $i++;
        }
        echo json_encode($data);
      }else{
        echo json_encode(array('result' => $data));
      }
    }

    function selectNotification($conditional,$dataColumn){
      $dataColumn[] = 'Dose.id as id_dose';
      $dataColumn[] = 'frecuency';
      $this->db->select($dataColumn);
      $this->db->join('Recipe','Recipe.id_patient = User.id');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Application','Application.id_dose = Dose.id');
      $this->db->join('Notification','Notification.id_application = Application.id');
      $this->db->join('Doctor','Doctor.id_user = Recipe.id_doctor');
      $this->db->where('Doctor.'.$conditional);
      $query = $this->db->get('User');
      $data = array();
      if($query->num_rows() > 0){
        foreach ($query->result() as $key => $value) {
          $data[$key] = $value;
          $data[$key]->adherence = $this->getAdherence($value->id_dose);
        }
        echo json_encode($data);
      }else{
        echo json_encode($data);
      }
    }

    public function getUser($value){
      $this->db->where_in('id',$value);
      $query = $this->db->get('User');
      return $query;
    }

    public function setNotification($id){
      $row = $this->getPatient($id);
      $application = $this->getApplication($row->row()->id_dose);
      $data['id_user'] = $id;
      $data['read'] = '0';
      $data['id_dose'] = $row->row()->id_dose;
      $data['id_application'] = $application->id;
      $this->db->insert('Notification',$data);
      if ($this->db->insert_id()) {
        return true;
      }else{
        return false;
      }
    }

    function dayDiff($id){
      $this->db->select('start');
      $this->db->where('id_patient', $id);
      $this->db->join('Recipe','Recipe.id = Dose.id_recipe');
      $query = $this->db->get('Dose');
      $row = $query->row();

      $datetime1 = new DateTime($row->start);
      $datetime2 = new DateTime('NOW');
      $interval = $datetime1->diff($datetime2);
		  $days = $interval->format('%a');

      return $days;
    }

    function dayDiffAfter(){
      $this->db->select('User.id,email,suppose, application');
      $this->db->join('Dose','Dose.id = Application.id_dose');
      $this->db->join('Recipe','Recipe.id = Dose.id_recipe');
      $this->db->join('User','User.id = Recipe.id_patient');
      $this->db->where("DATE_FORMAT(suppose,'%Y-%m-%d') = DATE_SUB(DATE_FORMAT(now(),'%Y-%m-%d'), INTERVAL 1 DAY)");
      return $this->db->get('Application');
    }

    public function getAdherence($id_dose){
      $this->db->select('application');
      $this->db->where('id_dose', $id_dose);
      $this->db->order_by('id','asc');
      $query = $this->db->get('Application');
      $value = $query->row();
      if($query->num_rows() > 0){
        $date = new DateTime($value->application);
        $this->db->select('effective,suppose,frecuency');
        $this->db->join('Dose','Dose.id = Application.id_dose');
        $this->db->where('id_dose', $id_dose);
        $this->db->order_by('Application.id','desc');
        $query1 = $this->db->get('Application');
        $value1 = $query1->row();

        $date1 = new DateTime($value1->suppose);
        $interval = $date->diff($date1);
       	$daysTotal = $interval->format('%a');

        if($daysTotal == $value1->frecuency){
          $days = $value1->frecuency;
        }else{
          $days = $daysTotal + 1;
        }
        $adherence = ($value1->effective/$days)*100;
      }else {
        $adherence = 0;
      }
      return $adherence;
    }

    function verify($email, $password){
      $where = array('email' => $email, 'password' => $password);
      $this->db->select(' User.id,
                          User.name,
                          User.lastname,
                          User.email,
                          User.terms,
                          User.active,
                          User.sex,
                          User.picture,
                          User.password,
                          User.changePassword,
                          Group.name as group,
                          Group.id as id_group');
      $this->db->join('Group_user','Group_user.id_user = User.id');
      $this->db->join('Group','Group.id = Group_user.id_group');
      $this->db->where($where);
      $query = $this->db->get('User');
      return $query;
    }

    function getDoctor($id){
      $where = array('id_user' => $id);
      $this->db->select('*,Doctor.id_country as id_country_doctor');
      $this->db->where($where);
      $this->db->join('Specialization','Doctor.id_specialization = Specialization.id');
      $query = $this->db->get('Doctor');
      return $query;
    }

    function getVisitor($id){
      $where = array('id_user' => $id);
      $this->db->select('*,Visitor.id_country as id_country_visitor');
      $this->db->where($where);
      //$this->db->join('Specialization','Doctor.id_specialization = Specialization.id');
      $query = $this->db->get('Visitor');
      return $query;
    }

    function getStatistical($id){
      $where = array('id_user' => $id);
      $this->db->select('*,Statistical.id_country as id_country_statistical');
      $this->db->where($where);
      //$this->db->join('Statistical','Statistical.id_user = Specialization.id');
      $query = $this->db->get('Statistical');
      return $query;
    }
    function getPatient($id){
      $this->db->select('*,Dose.id as id_dose, Patient.id_country as id_country_patient');
      $this->db->where(array('User.id' => $id));
      $this->db->join('Patient','Patient.id_user = User.id');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Application','Application.id_dose = Dose.id');
      $query = $this->db->get('User');

      return $query;
    }

    function getPatientLogin($id){
      $this->db->select('*,Dose.id as id_dose, Patient.id_country as id_country_patient');
      $this->db->where(array('User.id' => $id));
      $this->db->join('Patient','Patient.id_user = User.id');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $query = $this->db->get('User');
      return $query;
    }

    public function getSuppose($id){
      $this->db->select('application,frecuency');
      $this->db->join('Dose','Dose.id = Application.id_dose');
      $this->db->where('Application.id', $id);
      $query = $this->db->get('Application');
      $application = $query->row()->application;
      $frecuency = $query->row()->frecuency;

      $hour = $frecuency * 24;
      $hourNetx = strtotime ( "+$hour hour" , strtotime ( $application ) ) ;
      $suppose = date ( 'Y-m-d H:i:s' , $hourNetx );
      $data = array('suppose' => $suppose, 'application' => $application);
      return $data;
    }

    function getEffective($id_dose){
      $this->db->select_max('effective');
      $this->db->select_max('suppose');
      $this->db->select_max('application');
      $this->db->select('COUNT(Application.id) as id,frecuency');
      $this->db->join('Dose','Dose.id = Application.id_dose');
      $this->db->where('Application.id_dose',$id_dose);
      $query = $this->db->get('Application');
      $value = $query->row();
      $cont = 0;

      $dateNow = strtotime(date("Y-m-d H:i:00",time()));
      $dateSuppose = strtotime($value->suppose);

      if($value->id > 1){
        if($dateNow >= $dateSuppose){
          $application = new DateTime($value->application);
          $suppose = new DateTime($value->suppose);
          $interval = $application->diff($suppose);
         	$days = $interval->format('%a');
          $cont = $value->effective + $days;
        }elseif ($dateNow < $dateSuppose) {
          $date = new DateTime($value->suppose);
          $date1 = new DateTime('NOW');
          $interval = $date1->diff($date);
         	$days = $interval->format('%a');
          $cont = ($value->effective + $value->frecuency) - $days;
        }else{
          $cont = $value->frecuency;
        }
      }else{
        $cont = $value->frecuency;
      }
      return $cont;
    }

    // function getEffective($id_dose){
    //   $this->db->select_max('effective');
    //   $this->db->select('suppose, application');
    //   $this->db->where('id_dose',$id_dose);
    //   $query = $this->db->get('Application');
    //   $value = $query->row();
    //   $cont = 0;
    //   $application = new DateTime($value->application);
    //   $suppose = new DateTime($value->suppose);
    //     //$application = new DateTime('2016-08-29 17:40:22');
    //     //$suppose = new DateTime('2016-09-02 17:40:22');
    //   $interval = $application->diff($suppose);
    //   $days = $interval->format('%a');
    //   $cont = $value->effective + $days;
    //   return $cont;
    // }

    public function applicationGroup($where){
      $this->db->where($where);
      $this->db->join('Dose',' Dose.id = Application.id_dose');
      $this->db->join('Recipe','Recipe.id = Dose.id_recipe');
      return $this->db->count_all_results('Application');
    }

    public function effectivePatient($id_dose){
      $this->db->select_max('effective');
      $this->db->where('id_dose',$id_dose);
      $this->db->limit(1);
      $query = $this->db->get('Application');
      return $query->row()->effective;
    }
    public function getProduct($id){
      $where = array('id' => $id);
      $this->db->where($where);
      $query = $this->db->get('Product');
      return $query;
    }

    public function getDate(){
       echo $this->setDate()."<br>";
       date_default_timezone_set("America/Bogota");
       echo date("d-m-Y H:i:s");

    }

      public function setDate(){
        date_default_timezone_set('Europe/London');
        return date('Y-m-d H:i:s');
      }

      function getToday($id){
        $this->db->select("timezone");
        $this->db->join('Country','Country.id = Patient.id_country');
        $this->db->from("Patient");
        $this->db->where("id_user",$id);
        $query1 = $this->db->get_compiled_select(); // It resets the query just like a get()

        $this->db->select("timezone");
        $this->db->join('Country','Country.id = Doctor.id_country');
        $this->db->from("Doctor");
        $this->db->where("id_user",$id);
        $query2 = $this->db->get_compiled_select();

        $query = $this->db->query($query1." UNION ".$query2);

        return $query;
    }

    function adherenceGroup($condition){
      $this->db->where($condition);
      $this->db->select_min('application');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Application','Application.id_dose = Dose.id');
      $this->db->group_by('Dose.id');
      $query = $this->db->get('Recipe');
      $value = $query->row();
      if($query->num_rows() > 0){
        $date = new DateTime($value->application);
        $this->db->where($condition);
        $this->db->select_max('application');
        $this->db->join('Dose','Dose.id_recipe = Recipe.id');
        $this->db->join('Application','Application.id_dose = Dose.id');
        $this->db->group_by('Dose.id');
        $query1 = $this->db->get('Recipe');
        $value1 = $query1->row();
        $date1 = new DateTime($value1->application);

        $interval = $date->diff($date1);
        $daysTotal = $interval->format('%a');
        $days = $daysTotal + 2;

        $this->db->where($condition);
        $this->db->select('id_dose');
        $this->db->join('Dose','Dose.id_recipe = Recipe.id');
        $this->db->join('Application','Application.id_dose = Dose.id');
        $this->db->group_by('Dose.id');
        $query2 = $this->db->get('Recipe');

        $applicationDetail = 0;
        $applications = 0;
        foreach ($query2->result() as $value2) {
          $applicationDetail += $this->getAdherence($value2->id_dose);
          $applications += 1;
        }
        $adherenceGroup = round(($applicationDetail/$applications),2);
      }else {
        $adherenceGroup = 0;
      }
      echo $adherenceGroup;
    }

    public function verifyEmail($email){
      $this->db->where('email',$email);
      $query = $this->db->get('User');
      return $query;
    }

    public function getApplication($id){
      $this->db->where("id_dose",$id);
      $this->db->order_by('id', 'DESC');
      $this->db->limit(1);
      $query = $this->db->get('Application');
      return $query->row();
    }

    function alertDoctor($id){
      $this->db->select('Doctor.alert as alert');
      $this->db->join('Doctor','Doctor.id_user = Patient.id_doctor');
      $this->db->where('Patient.id_user',$id);
      $query = $this->db->get('Patient');
      return $query->row()->alert;
    }

    function statisticsPatient(){
      //$columns = array('Paciente','Fecha de Inicio','Fecha desactivación','Estatus','País','Ciudad','Diagnóstico','Producto','Presentación','Médico','Especialidad','Institución','Sexo');
      $dataColumn[] = "User.id as patient";
      $dataColumn[] = "User.created as created";
      $dataColumn[] = "low";
      $dataColumn[] = "User.active as active";
      $dataColumn[] = "Country.name as country";
      $dataColumn[] = "City.name as city";
      $dataColumn[] = "Diagnostic.name as diagnostic";
      $dataColumn[] = "Product.name as product";
      $dataColumn[] = "Product.description as description";
      $dataColumn[] = "(select CONCAT(User.name,' ',User.lastname) from User Where User.id = Patient.id_doctor) as doctor";
      $dataColumn[] = "Specialization.name as specialization";
      $dataColumn[] = "Institution.name as institution";
      $dataColumn[] = "sex";

      $this->db->select($dataColumn);
      $this->db->join('User','User.id = Patient.id_user');
      $this->db->join('Country','Country.id = Patient.id_country');
      $this->db->join('Diagnostic','Diagnostic.id = Patient.id_diagnosis');
      $this->db->join('City','City.id = Patient.id_city');
      $this->db->join('Institution','Institution.id = Patient.id_institution');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Product','Product.id = Dose.id_product');
      $this->db->join('Doctor','Doctor.id_user = Patient.id_doctor');
      $this->db->join('Specialization','Specialization.id = Doctor.id_specialization');
      return $this->db->get('Patient');

    }

    function statisticsDoctor(){
      //$columns = array('Paciente','Fecha de Inicio','Fecha desactivación','Estatus','País','Ciudad','Diagnóstico','Producto','Presentación','Médico','Especialidad','Institución','Sexo');
      $dataColumn[] = "CONCAT(User.name,' ',User.lastname) as doctor";
      $dataColumn[] = "User.created as created";
      $dataColumn[] = "low";
      $dataColumn[] = "User.active as active";
      $dataColumn[] = "Country.name as country";
      $dataColumn[] = "City.name as city";
      $dataColumn[] = "Specialization.name as specialization";
      $dataColumn[] = "sex";

      $this->db->select($dataColumn);
      $this->db->join('User','User.id = Doctor.id_user');
      $this->db->join('Country','Country.id = Doctor.id_country');
      $this->db->join('City','City.id = Doctor.id_city');
      $this->db->join('Specialization','Specialization.id = Doctor.id_specialization');
      return $this->db->get('Doctor');

    }


    function selectProduct($conditional){
      $this->db->select('User.id as id,User.name,lastname,picture,Product.name as product_name');
      $this->db->join('User','User.id = Patient.id_user');
      $this->db->join('Recipe','Recipe.id_patient = Patient.id_user');
      $this->db->join('Dose','Dose.id_recipe = Recipe.id');
      $this->db->join('Product','Product.id = Dose.id_product');
      $this->db->where('Patient.id_doctor',$conditional);
      $query = $this->db->get('Patient');
      $data = array();
      foreach ($query->result() as $key => $value) {
        $data[$key] = $value;
      }
      echo json_encode($data);
    }

  }
