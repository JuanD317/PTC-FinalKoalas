<div class="container-fluid">
	<div class="row mt-4 mb-4">
		<div class="col-md-12">
			<div class="form-group text-center">
				<h2 class="text-light">Detalle Compra</h2>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive bg-light">
				<table class="table nowrap">
					<thead>
						<tr>
							<th>No. Factura</th>
							<th>Tipo Factura</th>
							<th>Cliente</th>
							<th>Fecha</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($listFacturas as $key => $value): ?>
							<?php 
							$valores = array(
								"ID_Factura" => $value->ID_Factura,
								"NoFactura" => $value->NoFactura,
								"TipoFactura" => $value->TipoFactura,
								"Cliente" => $value->Cliente,
								"Fecha" => $value->Fecha
							);
							?>
							<tr>
								<td><?= $value->NoFactura ?></td>
								<td><?= $value->TipoFactura ?></td>
								<td><?= $value->Cliente ?></td>
								<td><?= $value->Fecha ?></td>
								<td>
									<button class="btn btn-info" type="button" data-toggle="modal" data-target="#modal-detalles" onclick="ChargeModal('<?php echo implode("|", $valores) ?>')">Detalles</button>
								</td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal-detalles" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Detalle de Factura</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group text-center">
							<b>
								<p>Correlativo</p>
							</b>
							<label for="" id="lblCorrelativo"></label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group text-center">
							<b>
								<p>Tipo Factura</p>
							</b>
							<label for="" id="lblTipo"></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group text-center">
							<b>
								<p>Cliente</p>
							</b>
							<label for="" id="lblCliente"></label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group text-center">
							<b>
								<p>Fecha</p>
							</b>
							<label for="" id="lblFecha"></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table nowrap">
								<thead>
									<tr>
										<th>Cantidad</th>
										<th>Descripcion</th>
										<th>Precio</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody id="bodyDetalle">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	function ChargeModal(value){

		var v = value.split("|");

		$("#lblCorrelativo").html(v[1]);
		$("#lblTipo").html(v[2]);
		$("#lblCliente").html(v[3]);
		$("#lblFecha").html(v[4]);

		$.ajax({
			type: "POST",
			url: "<?= base_url() ?>index.php/TFactura/DetalleFactura",
			data: {id: v[0], accion: 1},
			success: function(html){
				$("#bodyDetalle").html(html);
			}
		})

	}
</script>