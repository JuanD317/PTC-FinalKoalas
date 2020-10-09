<?php 

	class TFactura_model extends CI_model {
	
		public function insert_tbdetallefactura($data){
			foreach ($data as $campo => $valor) {
				$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
			}
			$this->db->insert('tbfacturas');
		}

		function Read_All_Factura(){
			$this->db->select("*");
			$this->db->from("tbfacturas");
			$result = $this->db->get();

			return $result->result();	
		}

		function max_factura(){
			$this->db->select("MAX(ID_Factura) AS ID_Factura");
			$this->db->from("tbfacturas");
			$result = $this->db->get();

			return $result->result();	
		}

		public function insert_tbfacturas($data){
			foreach ($data as $campo => $valor) {
				$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
			}
			$this->db->insert('tbfacturas');
		}

		public function update_tbfacturas($data,$ID_Factura){
			foreach ($data as $campo => $valor) {
				$this->db->set($campo, htmlspecialchars($valor, ENT_QUOTES, 'UTF-8'));
			}
			$this->db->where('ID_Factura', $ID_Factura);
			$this->db->update('tbfacturas');

		}

		public function delete_tbfacturas($ID_Factura){
			$this->db->where("ID_Factura", $ID_Factura);
			$this->db->delete("tbfacturas");

			return true;

		}

		public function select_tbfacturas($data){
			$this->db->select('*');
			$this->db->from("tbfacturas");
			$this->db->join("tbtiposfacturas", "tbfacturas.ID_TipoFactura = tbtiposfacturas.ID_TipoFactura");
			foreach ($data as $campo => $valor) {
				$this->db->where($campo, $valor);
			}
			$result = $this->db->get();

		    return $result->result();
		}

		public function select_tbfacturas_all(){
			$this->db->select('*');
			$this->db->from("tbfacturas");
			$this->db->join("tbtiposfacturas", "tbfacturas.ID_TipoFactura = tbtiposfacturas.ID_TipoFactura");
			$result = $this->db->get();

		    return $result->result();
		}

	}

?>