<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/bootstrap.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/bootstrap-grid.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/bootstrap-reboot.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css" />">
	</head>
	<body ng-app="challenge">
		<div id="main" ng-controller="Index">
			<div id="view">
				<div id="header">
					<button id="btn-create" type="button" ng-click="create()" class="btn btn-outline-primary">Inserir</button>
					<button id="btn-read" type="button" ng-click="read()" class="btn btn-outline-info">Visualizar</button>
					<button id="btn-update" type="button" ng-click="update()" class="btn btn-outline-dark">Editar</button>
					<button id="btn-delete" type="button" ng-click="openDialog()" class="btn btn-outline-danger">Excluir</button>
				</div>
				<div id="content">
					<div class="container">
						<div class="row grid-header">
							<div class="col-1"></div>
							<div class="col">Nome</div>
							<div class="col">Email</div>
							<div class="col">CNPJ</div>
							<div class="col">Comentário</div>
						</div>
						<div class="row" ng-repeat="supplier in suppliers">
							<div class="col-1">
								<input type="checkbox">
							</div>
							<input type="hidden" class="row-id" value="{{supplier.id}}">
							<div class="col">{{supplier.name}}</div>
							<div class="col">{{supplier.email}}</div>
							<div class="col">{{supplier.federalCode}}</div>
							<div class="col">{{supplier.comment}}</div>
						</div>
					</div>
				</div>
			</div>
			<div id="form" class="display-none">
				<input type="hidden" id="form-id" value="" />
				<div class="input-group mb-3">
					<label>Nome<span class="required">*</span></label>
					<input type="text" id="form-name" class="form-control" aria-describedby="basic-addon1">
				</div>
				<div class="input-group mb-3">
					<label>Email<span class="required">*</span></label>
					<input type="email" id="form-email" class="form-control" aria-describedby="basic-addon1">
				</div>
				<div class="input-group mb-3">
					<label>CNPJ<span class="required">*</span></label>
					<input type="text" id="form-federalcode" class="form-control" aria-describedby="basic-addon1">
				</div>
				<div class="input-group">
					<label>Comentário</label>
					<textarea id="form-comment" class="form-control"></textarea>
				</div>
				<div id="form-footer">
					<button id="btn-save" ng-click="save()" type="button" class="btn btn-outline-info">Salvar</button>
					<button id="btn-cancel" ng-click="cancel()" type="button" class="btn btn-outline-dark">Cancelar</button>
				</div>
			</div>

			<div class="modal fade" id="confirm-remove-dialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Alerta</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Tem certeza que deseja excluir o registro?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-info" ng-click="remove()">Sim</button>
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Não</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="create-validation-dialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Alerta</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">Preencha os campos obrigatórios!</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Fechar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="<c:url value="/resources/scripts/lib/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/bootstrap.bundle.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/script.js" />"></script>
</html>