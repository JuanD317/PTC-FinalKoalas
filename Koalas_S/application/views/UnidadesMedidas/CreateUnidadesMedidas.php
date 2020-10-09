<div class="container-fluid text-light">
	<div class="row mb-3">
		<div class="col-12 text-center">
			<h1>Unit Measured</h1>
		</div>
	</div>
	<form action="<?= base_url() ?>index.php/UnidadesMedidas/NewUnidad" method="POST">
		<div class="row mb-3">
			<div class="col-12">
				<div class="form-group">
					<label for="txtUnidad">Unit</label>
					<input type="text" id="txtUnidad" name="txtUnidad" class="form-control">
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<div class="form-group">
					<button class="btn btn-outline-success btn-lg" type="submit">Create Invoice</button>
				</div>
			</div>
		</div>
	</form>

	<div class="row mb-3">
		<div class="col-12">
			<div class="table-responsive">
				<table class="table table-dark" id="tableUnidad">
					<thead>
						<tr>
							<th>ID_Unit Measure</th>
							<th>Unit</th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($listUnidades as $key => $value) {
							?>
							<tr>
								<td><?= $value->ID_UnidadMedida ?></td>
								<td><?= $value->Unidad ?></td>
							</tr>
							<?php
						}
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>