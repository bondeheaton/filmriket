/**
 * Created by Mikael on 2015-09-04.
 */
$(document).ready(function() {
    $('.users_box .access').click(function(e) {
        e.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            method: 'PUT',
            success: function() {}
        });
    });
    $('#search_user').on('change keyup paste railsAutocomplete.select', function(e) {
        $.ajax({
            url: '/users/ajax_on_users',
            method: 'GET',
            data: 'term=' + $('#search_user').val(),
            success: function() {}
        });
    });
});