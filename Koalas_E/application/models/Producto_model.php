<?php 

	class Producto_model extends CI_model{
		
		function Create_Producto($data){
				
			$this->db->insert("tbproductos", $data);

		}

		function Read_All_Producto(){
			$this->db->select("*");
			$this->db->from("tbproductos");
			$result = $this->db->get();

			return $result->result();


		}

		public function insert_tbproductos($data){
			foreach ($data as $campo => $valor) {
				$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
			}
			$this->db->insert('tbproductos');
		}

		public function update_tbproductos($data,$ID_Producto){
			foreach ($data as $campo => $valor) {
				$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
			}
			$this->db->where('ID_Producto', $ID_Producto);
			$this->db->update('tbproductos');

		}

		public function delete_tbproductos($ID_Producto){
			$this->db->where("ID_Producto", $ID_Producto);
			$this->db->delete("tbproductos");

			return true;

		}

		public function select_tbproductos($data){
			$this->db->select('*');
			$this->db->from("tbproductos");
			foreach ($data as $campo => $valor) {
				$this->db->where($campo, $valor);
			}
			$result = $this->db->get();

		    return $result->result();
		}

		public function select_tbproductos_all(){
			$this->db->select('*');
			$this->db->from("tbproductos");

			$result = $this->db->get();

		    return $result->result();
		}

		public function select_tbproductos_max(){
			$this->db->select('MAX(ID_Producto) AS ID_Producto');
			$this->db->from("tbproductos");

			$result = $this->db->get();

		    return $result->result();
		}

	}

?>