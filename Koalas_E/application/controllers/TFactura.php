<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TFactura extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model("TFactura_model");
		$this->load->model("Departamento_model");
		$this->load->model("Municipio_model");
		$this->load->model("tbprecios_model");
		$this->load->model("tbdetallefactura_model");
		$this->load->model("tbkardex_model");
		$this->load->model("Producto_model");
	}

	/*
	Load view function
	*/

	public function index()
	{

		$datos["listDepartamentos"] = $this->Departamento_model->select_tbdepartamentos_all();
		$datos["listPrecios"] = $this->tbprecios_model->select_tbprecios_all_join();

		$this->load->view("Format/header");
		$this->load->view('TFactura/CreateTFactura', $datos);
		$this->load->view("Format/footer");
	}

	public function Compra()
	{

		$datos["listDepartamentos"] = $this->Departamento_model->select_tbdepartamentos_all();
		$datos["listProductos"] = $this->Producto_model->select_tbproductos_all();

		$this->load->view("Format/header");
		$this->load->view('TFactura/CreateCompra', $datos);
		$this->load->view("Format/footer");
	}

	public function Kardex()
	{

		$datos["listFacturas"] = $this->TFactura_model->Read_All_Factura();


		$this->load->view("Format/headerCa");
		$this->load->view('TFactura/CreateTFactura', $datos);
		$this->load->view("Format/footerCa");
		$this->load->view("Format/scriptCa");
	}

	public function ReportVenta()
	{

		$datos["listFacturas"] = $this->TFactura_model->select_tbfacturas(array("tbfacturas.ID_TipoFactura" => 1));

		$this->load->view("Format/header");
		$this->load->view('TFactura/ReporteVentaView', $datos);
		$this->load->view("Format/footer");
	}

	public function ReportCompra()
	{

		$datos["listFacturas"] = $this->TFactura_model->select_tbfacturas(array("tbfacturas.ID_TipoFactura" => 6));


		$this->load->view("Format/header");
		$this->load->view('TFactura/ReporteCompraView', $datos);
		$this->load->view("Format/footer");
	}

	/*
	load data functions
	*/

	public function selectMunicipio(){

		$id_departamento = $_POST["id_departamento"];

		$listMunicipios = $this->Municipio_model->select_where(array("ID_Departamento" => $id_departamento));

		foreach ($listMunicipios as $key_municipio => $municipio) {
			echo "<option value='".$municipio->ID_Municipio."'>".$municipio->Municipio."</option>";
		}

	}

	public function DetalleFactura(){

		$id = $_POST["id"];
		$accion = $_POST["accion"];

		switch ($accion) {
			case 1:
				# Compra
				$listDetalles = $this->tbdetallefactura_model->select_tbdetallefactura_compra(array("tbdetallefactura.ID_Factura" => $id));
				break;
			case 2:
				# Venta
				$listDetalles = $this->tbdetallefactura_model->select_tbdetallefactura_venta(array("tbdetallefactura.ID_Factura" => $id));
				break;
			default:
				# code...
				break;
		}


		foreach ($listDetalles as $key => $value) {
			echo "<tr>";
			echo "<td>".$value->Nombre."</td>";
			echo "<td>".$value->Cantidad."</td>";
			echo "<td>".$value->Precio."</td>";
			echo "<td>".$value->Precio * $value->Cantidad."</td>";
			echo "</tr>";
		}

	}

	/*
	CRUD function
	*/

	public function NewFactura(){

		$Cliente = $_POST["txtCliente"];
		$CodigoIdentidad = $_POST["txtCodigoIdentidad"];
		$Fecha = $_POST["txtFecha"];
		$Direccion = $_POST["txtDireccion"];
		$Municipio = $_POST["slcMunicipio"];
		$Cantidad = $_POST["txtCantidad"];
		$Producto = $_POST["txtProducto"];
		$PrecioUnidad = $_POST["txtPrecioUnidad"];
		$Sumas = $_POST["txtSumas"];
		$VentasExentas = $_POST["txtVentasExentas"];
		$VentasSujetas = $_POST["txtVentasSujetas"];
		$Subtotal = $_POST["txtSubtotal"];
		$Iva = $_POST["txtIva"];
		$VentaTotal = $_POST["txtVentaTotal"];
		$NoFactura = $_POST["txtNoFactura"];

		$detalle_Cantidad = $_POST["input_Cantidad"];
		$detalle_Producto = $_POST["input_Producto"];
		$detalle_PrecioUnidad = $_POST["input_PrecioUnidad"];
		$detalle_VentasExentas = $_POST["input_VentasExentas"];
		$detalle_VentasGravadas = $_POST["input_VentasGravadas"];

		$resultInsertFactura = $this->TFactura_model->insert_tbdetallefactura(array("ID_Usuario" => $_SESSION["login"]["ID_Usuario"], "ID_TipoFactura" => 1, "Cliente" => $Cliente, "Fecha" => $Fecha, "NoFactura" => $NoFactura));

		$max_id_factura = $this->TFactura_model->max_factura();

		if(sizeof($max_id_factura) > 0){

			foreach ($detalle_Cantidad as $key_cantidad => $cantidad) {

				$this->tbdetallefactura_model->insert_tbdetallefactura(array("ID_Factura" => $max_id_factura[0]->ID_Factura, "ID_Precio" => $detalle_Producto[$key_cantidad], "Cantidad" => $cantidad, "Precio" => $detalle_VentasGravadas[$key_cantidad] / $cantidad));

				$precio_venta = $this->tbprecios_model->select_tbprecios(array("ID_Precio" => $detalle_Producto[$key_cantidad]));

				$producto_venta = $this->Producto_model->select_tbproductos(array("ID_Producto" => $precio_venta[0]->ID_Producto));

				$cantidad_final = $producto_venta[0]->Stock - $cantidad;

				if ($producto_venta[0]->Stock != 0) {
					
					$CostoPromedio = $producto_venta[0]->CostoPromedio + ($cantidad * $detalle_VentasGravadas[$key_cantidad]) / $cantidad_final;

				}else{
					
					$CostoPromedio = $detalle_VentasGravadas[$key_cantidad] / $cantidad;

				}

				$this->Producto_model->update_tbproductos(array("Stock" => $cantidad_final, "CostoPromedio" => $CostoPromedio), $producto_venta[0]->ID_Producto);

				$max_id_detalle_factura = $this->tbdetallefactura_model->select_tbdetallefactura_max();

				if(sizeof($max_id_detalle_factura) > 0){

					$this->tbkardex_model->insert_tbkardex(array("ID_DetalleFactura" => $max_id_detalle_factura[0]->ID_Factura, "ID_TipoMovimiento" => 2, "Cantidad" => $cantidad_final, "CostoPromedio" => $CostoPromedio));

				}

			}

		}

		return redirect(base_url()."index.php/TFactura");

	}

	public function NewCompra(){

		$Cliente = $_POST["txtCliente"];
		$Fecha = $_POST["txtFecha"];
		$Direccion = $_POST["txtDireccion"];
		$Municipio = $_POST["slcMunicipio"];
		$Cantidad = $_POST["txtCantidad"];
		$Producto = $_POST["txtProducto"];
		$PrecioUnidad = $_POST["txtPrecioUnidad"];
		$Sumas = $_POST["txtSumas"];
		$VentasExentas = $_POST["txtVentasExentas"];
		$VentasSujetas = $_POST["txtVentasSujetas"];
		$Subtotal = $_POST["txtSubtotal"];
		$Iva = $_POST["txtIva"];
		$VentaTotal = $_POST["txtVentaTotal"];
		$NoFactura = $_POST["txtNoFactura"];

		$detalle_Cantidad = $_POST["input_Cantidad"];
		$detalle_Producto = $_POST["input_Producto"];
		$detalle_PrecioUnidad = $_POST["input_PrecioUnidad"];
		$detalle_VentasExentas = $_POST["input_VentasExentas"];
		$detalle_VentasGravadas = $_POST["input_VentasGravadas"];

		$resultInsertFactura = $this->TFactura_model->insert_tbdetallefactura(array("ID_Usuario" => $_SESSION["login"]["ID_Usuario"], "ID_TipoFactura" => 6, "Cliente" => $Cliente, "Fecha" => $Fecha, "NoFactura" => $NoFactura));

		$max_id_factura = $this->TFactura_model->max_factura();

		if(sizeof($max_id_factura) > 0){

			foreach ($detalle_Cantidad as $key_cantidad => $cantidad) {

				$this->tbdetallefactura_model->insert_tbdetallefactura(array("ID_Factura" => $max_id_factura[0]->ID_Factura, "ID_Producto" => $detalle_Producto[$key_cantidad], "Cantidad" => $cantidad, "Precio" => $detalle_VentasGravadas[$key_cantidad] / $cantidad));

				$producto_venta = $this->Producto_model->select_tbproductos(array("ID_Producto" => $detalle_Producto[$key_cantidad]));

				$cantidad_final = $producto_venta[0]->Stock + $cantidad;

				if ($producto_venta[0]->Stock != 0) {
					
					$CostoPromedio = $producto_venta[0]->CostoPromedio + ($cantidad * $detalle_VentasGravadas[$key_cantidad]) / $cantidad_final;

				}else{
					
					$CostoPromedio = $detalle_VentasGravadas[$key_cantidad] / $cantidad;

				}


				$this->Producto_model->update_tbproductos(array("Stock" => $cantidad_final, "CostoPromedio" => $CostoPromedio), $producto_venta[0]->ID_Producto);

				$max_id_detalle_factura = $this->tbdetallefactura_model->select_tbdetallefactura_max();

				if(sizeof($max_id_detalle_factura) > 0){

					$this->tbkardex_model->insert_tbkardex(array("ID_DetalleFactura" => $max_id_detalle_factura[0]->ID_Factura, "ID_TipoMovimiento" => 1, "Cantidad" => $cantidad_final, "CostoPromedio" => $CostoPromedio));

				}

			}

		}

		return redirect(base_url()."index.php/TFactura/Compra");

	}
}
