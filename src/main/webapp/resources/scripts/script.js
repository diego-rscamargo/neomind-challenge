(function () {
	"use strict";

	angular.module("challenge", []).controller("Index", function ($scope, $http) {
		$scope.list = $("#container > div:not(.grid-header)").html();
		
		$scope.initialize = function() {
			$http.get("/challenge/rest/findAll").then(function (response) {
				$("#container > div:not(.grid-header)").html("");
				$("#container").html($scope.list);
				$scope.suppliers = response.data;
			});
		};
		
		$scope.initialize();
		
		$scope.create = function() {
			$("#view").addClass("display-none");
			$("#form").removeClass("display-none");
			$("#btn-save").prop("disabled", false);
			
			$("#form-id").val("");
			$("#form-name").val("");
			$("#form-email").val("");
			$("#form-federalcode").val("");
			$("#form-comment").val("");
		};
		
		$scope.read = function() {
			var id = $(".row.selected-row").find(".row-id").val();
			$http({
			    url: "/challenge/rest/find",
			    method: "GET",
			    params: {id: id}
			}).then(function (response) {
				$("#view").addClass("display-none");
				$("#form").removeClass("display-none");
				
				$("#btn-save").prop("disabled", true);
				
				$("#form-id").val(response.data.id);
				$("#form-name").val(response.data.name);
				$("#form-email").val(response.data.email);
				$("#form-federalcode").val(response.data.federalCode);
				$("#form-comment").val(response.data.comment);
				
				disableInputs(true);
			});
		};
		
		$scope.update = function() {
			var id = $(".row.selected-row").find(".row-id").val();
			$http({
			    url: "/challenge/rest/find",
			    method: "GET",
			    params: {id: id}
			}).then(function (response) {
				$("#view").addClass("display-none");
				$("#form").removeClass("display-none");
				
				$("#btn-save").prop("disabled", false);
				$("#form").find("input, textarea").val("");
				
				$("#form-id").val(response.data.id);
				$("#form-name").val(response.data.name);
				$("#form-email").val(response.data.email);
				$("#form-federalcode").val(response.data.federalCode);
				$("#form-comment").val(response.data.comment);
				
				disableInputs(false);
			});
		};
		
		$scope.remove = function() {
			$scope.supplier = {
				type: "supplier",
				id: $(".row.selected-row").find(".row-id").val()
			};
			
			$http.post("/challenge/rest/remove", $scope.supplier).then(function (response) {
				$scope.initialize();
				$("#confirm-remove-dialog").modal("hide");
			});
		};
		
		$scope.openDialog = function() {
			$("#confirm-remove-dialog").modal("show");
		};
		
		$scope.save = function() {
			$scope.supplier = {
				type: "supplier",
				id: $("#form-id").val(),
				name: $("#form-name").val(),
				email: $("#form-email").val(),
				federalCode: $("#form-federalcode").val(),
				comment: $("#form-comment").val()
			};
			
			if ($scope.supplier.name != "" && $scope.supplier.email != "" && $scope.supplier.federalCode != "") {
				$http.post("/challenge/rest/save", $scope.supplier).then(function (response) {
					$("#form").addClass("display-none");
					$("#view").removeClass("display-none");
					
					$("#btn-save").prop("disabled", true);
					
					$("#form-id").val(response.data.id);
					$("#form-name").val(response.data.name);
					$("#form-email").val(response.data.email);
					$("#form-federalcode").val(response.data.federalCode);
					$("#form-comment").val(response.data.comment);
					
					$scope.initialize();
				});
			} else {
				$("#create-validation-dialog").modal("show");
			}
		};
		
		$scope.cancel = function() {
			$("#form").addClass("display-none");
			$("#view").removeClass("display-none");
		};
		
		function disableInputs(disable) {
			$("#form > div.input-group").find("input, textarea").prop("disabled", disable);
		};
		
		$("div.container").on("change", "input[type='checkbox']", function() {
			$("div.container > div.row > div.col-1 > input").prop("checked", false);
			$(this).prop("checked", true);
			
			$("div.container > div.row").removeClass("selected-row");
			$(this).parent().parent().addClass("selected-row");
		});
	});
})();