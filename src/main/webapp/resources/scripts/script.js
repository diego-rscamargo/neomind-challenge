(function () { {}
	"use strict";

	angular.module("challenge", ["ngMaterial", "ui.mask"]).controller("Index", function ($scope, $http, $mdDialog) {
		$scope.formClass = "display-none";
		$scope.activeRow = 0;
		$scope.buttons = {};
		$scope.supplier = {disable: false};
		
		var buttons = angular.element("button");
		for (var i = 0; i < buttons.length; i++) {
			$scope.buttons[buttons[i].getAttribute("name")] = {disabled: false};
		}
		
		$scope.initialize = function() {
			$http.get("/challenge/rest/findAll").then(function (response) {
				$scope.suppliers = response.data;
			});
		};
		
		$scope.initialize();
		
		$scope.toggleView = function() {
			if ($scope.viewClass == "display-none") {
				$scope.viewClass = "";
				$scope.formClass = "display-none";
			} else {
				$scope.viewClass = "display-none";
				$scope.formClass = "";
			}
		};
		
		$scope.create = function() {
			$scope.toggleView();
			$scope.disableInputs(false);
			
			$scope.disableButton("save", false);
			
			$scope.supplier = {
				name: "",
				email: "",
				federalCode: "",
				comment: ""
			};
		};
		
		$scope.read = function() {
			$http({
			    url: "/challenge/rest/find",
			    method: "GET",
			    params: {id: $scope.activeRow}
			}).then(function (response) {
				$scope.toggleView();
				
				$scope.disableButton("save", true);
				
				$scope.supplier = {
					id: response.data.id,
					name: response.data.name,
					email: response.data.email,
					federalCode: response.data.federalCode,
					comment: response.data.comment
				};
				
				$scope.disableInputs(true);
			});
		};
		
		$scope.update = function() {
			$http({
			    url: "/challenge/rest/find",
			    method: "GET",
			    params: {id: $scope.activeRow}
			}).then(function (response) {
				$scope.toggleView();
				
				$scope.disableButton("save", false);
				
				$scope.supplier = {
					id: response.data.id,
					name: response.data.name,
					email: response.data.email,
					federalCode: response.data.federalCode,
					comment: response.data.comment
				};
				
				$scope.disableInputs(false);
			});
		};
		
		$scope.remove = function() {
			$scope.supplier = {
				type: "supplier",
				id: $scope.activeRow
			};
			
			$http.post("/challenge/rest/remove", $scope.supplier).then(function (response) {
				$scope.initialize();
			});
		};
		
		$scope.openDialog = function(event) {
			var confirm = $mdDialog.confirm()
				.title("Alerta")
				.textContent("Tem certeza que deseja excluir o registro?")
				.targetEvent(event)
				.ok("Remover")
				.cancel("Cancelar");

			$mdDialog.show(confirm).then(function() {
				$scope.remove();
			});
		};
		
		$scope.save = function(event) {
			if ($scope.supplier.name != "" && $scope.supplier.email != "" && $scope.supplier.federalCode != "") {
				$http.post("/challenge/rest/save", $scope.supplier).then(function (response) {
					$scope.disableButton("save", true);
					
					$scope.initialize();
					$scope.toggleView();
				});
			} else {
				$mdDialog.show(
					$mdDialog.alert()
					.clickOutsideToClose(true)
					.title("Alerta")
					.textContent(angular.element("#error-message").html())
					.ok("Ok")
					.targetEvent(event)
				);
			}
		};
		
		$scope.cancel = function() {
			$scope.toggleView();
		};
		
		$scope.disableButton = function(id, disable) {
			$scope.buttons[id].disable = disable;
		};
		
		$scope.disableInputs = function(disable) {
			$scope.supplier.disable = disable;
		}
		
		$scope.selectRow = function(index) {
			if ($scope.activeRow != index) {
				$scope.activeRow = index;
			} else {
				$scope.activeRow = 0;
			}
		};
		
		$scope.isSelected = function(index) {
			return $scope.activeRow === index;
		};
	});
})();