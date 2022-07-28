//= require jquery

document.addEventListener("DOMContentLoaded", function (e) {
  initcustomers();
  //initbuildings();

  $("client").on("change", "option", function () {});
  const choice = document.getElementById("client");
  choice.addEventListener("change", (e) => {
    if (e.target.value) {
        console.log(e);
      document.getElementById("buildings").style.display = "";
    }

    const select = document.getElementById("buildings");
    select.addEventListener("change", (e) => {
      if (e.target.value) {
        document.getElementById("batteries").style.display = "";
      }

      const grab = document.getElementById("batteries");
      grab.addEventListener("change", (e) => {
        if (e.target.value) {
          document.getElementById("columns").style.display = "";
        }

        const next = document.getElementById("columns");
        next.addEventListener("change", (e) => {
          if (e.target.value) {
            document.getElementById("elevators").style.display = "";
          }

          const choose = document.getElementById("elevators");
          choose.addEventListener("change", (e) => {
            if (e.target.value) {
              document.getElementById("employees").style.display = "";
            }
          });
        });
      });
    });
  });

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
});
