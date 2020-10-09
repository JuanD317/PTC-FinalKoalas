<?php
class tbkardex_model extends CI_Model{

	public function insert_tbkardex($data){
		foreach ($data as $campo => $valor) {
			$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
		}
		$this->db->insert('tbkardex');
	}

	public function update_tbkardex($data,$ID_Kardex){
		foreach ($data as $campo => $valor) {
			$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
		}
		$this->db->where('ID_Kardex', $ID_Kardex);
		$this->db->update('tbkardex');

	}

	public function delete_tbkardex($ID_Kardex){
		$this->db->where("ID_Kardex", $ID_Kardex);
		$this->db->delete("tbkardex");

		return true;

	}

	public function select_tbkardex($data){
		$this->db->select('*');
		$this->db->from("tbkardex");
		foreach ($data as $campo => $valor) {
			$this->db->where($campo, $valor);
		}
		$result = $this->db->get();

	    return $result->result();
	}

	public function select_tbkardex_all(){
		$this->db->select('*');
		$this->db->from("tbkardex");

		$result = $this->db->get();

	    return $result->result();
	}

	public function select_tbkardex_max(){
		$this->db->select('MAX(ID_Kardex) AS ID_Kardex');
		$this->db->from("tbkardex");

		$result = $this->db->get();

	    return $result->result();
	}

}