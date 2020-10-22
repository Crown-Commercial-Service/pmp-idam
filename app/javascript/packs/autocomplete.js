import accessibleAutocomplete from 'accessible-autocomplete';

var pmp_auto_complete = {
  query: function(query, populateResults) {
    console.log(query);
    if (query.length > 3) {
      jQuery.ajax({
        url: '/api/v1/organisation-search',
        type: 'post',
        data: {
          search: query,
        },
        success: function (response) {
          populateResults(response);
        },
        error: function (xhr) {},
      });
    }
  },

  initiante_auto_complete: function() {
    var organisation_input = jQuery('#organisation');
    organisation_input.attr('type', 'hidden');
    var autoComplete = accessibleAutocomplete({
      element: document.querySelector('#my-autocomplete-container'),
      id: 'my-autocomplete',
      source: pmp_auto_complete.query,
      name: 'anything[organisation]',
      minLength: 3,
      defaultValue: organisation_input.attr('value'),
      onConfirm: function (query) {
        organisation_input.attr('value', query);
      },
    });
  }
}

window.onload = function () {
  if($('#my-autocomplete-container').length > 0) {
    pmp_auto_complete.initiante_auto_complete();
  }
}
