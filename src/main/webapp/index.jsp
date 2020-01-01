<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/bootstrap.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/bootstrap-grid.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/bootstrap-reboot.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/lib/angular-material.min.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/style.css" />">
	</head>
	<body ng-app="challenge">
		<div id="main" ng-controller="Index">
			<div id="view" class="" ng-class="viewClass">
				<div id="header">
					<button id="btn-create" type="button" ng-click="create()" class="btn btn-outline-primary" name="create">Inserir</button>
					<button id="btn-read" type="button" ng-click="read()" ng-disabled="activeRow === 0" class="btn btn-outline-info" name="read">Visualizar</button>
					<button id="btn-update" type="button" ng-click="update()" ng-disabled="activeRow === 0" class="btn btn-outline-dark" name="update">Editar</button>
					<button id="btn-delete" type="button" ng-click="openDialog()" ng-disabled="activeRow === 0" class="btn btn-outline-danger" name="remove">Excluir</button>
				</div>
				<div id="content">
					<div class="container">
						<div class="row grid-header">
							<div class="col">Nome</div>
							<div class="col">Email</div>
							<div class="col">CNPJ</div>
							<div class="col">Comentário</div>
						</div>
						<div class="row" ng-repeat="supplier in suppliers" ng-click="selectRow(supplier.id)" ng-class="{'selected-row': isSelected(supplier.id)}">
							<input type="hidden" class="row-id" value="{{supplier.id}}">
							<div class="col">{{supplier.name}}</div>
							<div class="col">{{supplier.email}}</div>
							<div class="col">{{supplier.federalCode}}</div>
							<div class="col">{{supplier.comment}}</div>
						</div>
					</div>
				</div>
			</div>
			<div id="form" class="display-none" ng-class="formClass">
				<input type="hidden" id="form-id" ng-model="supplier.id" ng-value="name" name="id" value="" />
				<div class="input-group mb-3">
					<label>Nome<span class="required">*</span></label>
					<input type="text" id="form-name" ng-model="supplier.name" ng-value="name" name="name" class="form-control" aria-describedby="basic-addon1" ng-disabled="supplier.disable === true">
				</div>
				<div class="input-group mb-3">
					<label>Email<span class="required">*</span></label>
					<input type="email" id="form-email" ng-model="supplier.email" ng-value="name" name="email" class="form-control" aria-describedby="basic-addon1" ng-disabled="supplier.disable === true">
				</div>
				<div class="input-group mb-3">
					<label>CNPJ<span class="required">*</span></label>
					<input type="text" id="form-federalcode" ui-mask="99.999.999/9999-99" ui-mask-placeholder ui-mask-placeholder="_" ng-model="supplier.federalCode" ng-value="name" name="federalCode" class="form-control" aria-describedby="basic-addon1" ng-disabled="supplier.disable === true">
				</div>
				<div class="input-group">
					<label>Comentário</label>
					<textarea id="form-comment" ng-model="supplier.comment" ng-value="name" name="comment" class="form-control" ng-disabled="supplier.disable === true"></textarea>
				</div>
				<div id="form-footer">
					<button id="btn-save" ng-click="save($event)" type="button" class="btn btn-outline-info" name="save" ng-disabled="buttons.save.disable === true">Salvar</button>
					<button id="btn-cancel" ng-click="cancel()" type="button" class="btn btn-outline-dark" name="cancel">Cancelar</button>
				</div>
			</div>
		</div>
		<span id="error-message" class="display-none">Preencha todos os campos obrigatórios!</span>
	</body>
	<script src="<c:url value="/resources/scripts/lib/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular-material.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular-animate.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular-aria.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular-messages.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/angular-mask.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/lib/bootstrap.bundle.min.js" />"></script>
	<script src="<c:url value="/resources/scripts/script.js" />"></script>
</html>