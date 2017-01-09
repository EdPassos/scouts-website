// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', function() {
  if($("#person_section_id")){
    populate_teams();
    $("#person_section_id").change(function() {
      populate_teams();
    });
  };
});

function populate_teams() {
  $teams_select = $("select#person_team_id");
  $teams_select.attr("disabled", "disabled");
  section_id = $("select#person_section_id").val();

  if(section_id == "") {
    $teams_select.html("<option value=\"\">(Selecionar Secção)</option>");
  } else {
    $teams_select.html("<option value=\"\">(Carregar Patrulhas)</option>");
    data = {
      section_id: section_id,
      "window._auth_token_name": window._auth_token
    };
    $.ajax("/load_teams",
        { type: "post",
          dataType: "json",
          data: data,
          success: function(teams) {
            _html = "<option value=\"\">Escolher Patrulha</option>";
            console.log(teams);
            for(var team in teams) {
            console.log(team);
              _html += '<option value="' + teams[team].id + '">' + teams[team].name + '</option>';
            }
            $teams_select.html(_html);
            $teams_select.removeAttr("disabled");
          },
          error: function() {
            $teams_select.html("<option value=\"\">(erro)</option>");
          }
        }
      );
  }
};
