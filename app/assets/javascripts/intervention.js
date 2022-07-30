//= require jquery

document.addEventListener("DOMContentLoaded", function (e) {
  initcustomers();
  
  
 
  
  initemployees();

  employees();

//   $("client").on("input", function () {
   
//   });
//   $("building").on("change", "option", function () {});
//   $("battery").on("change", "option", function () {});
//   $("column").on("change", "option", function () {});
  $("elevator").on("change", "option", function () {});
  $("employees").on("change", "option", function () {});
  const choice = document.getElementById("client");
  choice.addEventListener("change", (e) => {
    if (e.target.value) {
        initbuildings();
      document.getElementById("buildings").style.display = "";
    }

    const select = document.getElementById("buildings");
    select.addEventListener("change", (e) => {
      if (e.target.value) {
        initbatteries();
        document.getElementById("batteries").style.display = "";
      }

      const grab = document.getElementById("batteries");
      grab.addEventListener("change", (e) => {
        if (e.target.value) {
            initcolumns();
          document.getElementById("columns").style.display = "";
        }

        const next = document.getElementById("columns");
        next.addEventListener("change", (e) => {
          if (e.target.value) {
            initelevators();
            document.getElementById("elevators").style.display = "";
          }
        });
      });
    });
  });

    function employees(){
     document.getElementById("employees").style.display = "";
    };

    function initcustomers() {
        $.ajax({
        type: "GET",
        url: "/customers/search",
        dataType: "json",
        success: function (result) {
            for (customers in result) {
            $("#client").append(
                `<option value="${result[customers].id}"> ${result[customers].email} </option>`
            );
            }
        },
        });
    }

    function initbuildings() {
        var buildings = $('#client').val();
        $.ajax({
        type: "GET",
        url: "/buildings/search",
        dataType: "json",
        data: {'buildings': buildings},
        success: function(result) {
            for (building in result) {
            $('#building').append(
                `<option value="${result[building].id}"> ${result[building].address} </option>`
                
            );
            }
        },
        });
    }

    function initbatteries() {
        var batteries = $('#building').val();
        $.ajax({
        type: "GET",
        url: "/batteries/search",
        dataType: "json",
        data: {'batteries': batteries},
        success: function (result) {
            for (battery in result) {
            $("#battery").append(
                `<option value="${result[battery].id}"> ${result[battery].id} </option>`
            );
            }
        },
        });
    }

    function initcolumns() {
        var columns = $('#battery').val();
        $.ajax({
        type: "GET",
        url: "/columns/search",
        dataType: "json",
        data: {'columns': columns},
        success: function (result) {
            for (column in result) {
            $("#column").append(
                `<option value="${result[column].id}"> ${result[column].id} </option>`
            );
            }
        },
        });
    }

    function initelevators() {
        var elevators = $('#column').val();
        $.ajax({
        type: "GET",
        url: "/elevators/search",
        dataType: "json",
        data: {'elevators': elevators},
        success: function (result) {
            for (elevator in result) {
            $("#elevator").append(
                `<option value="${result[elevator].id}"> ${result[elevator].id} </option>`
            );
            }
        },
        });
    }

    function initemployees() {
        $.ajax({
        type: "GET",
        url: "/employee/search",
        dataType: "json",
        success: function (result) {
            for (employees in result) {
            $("#employee").append(
                `<option value="${result[employees].id}"> ${result[employees].first_name} ${result[employees].last_name} </option>`
            );
            }
        },
        });
    }
});
