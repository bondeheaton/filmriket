/**
 * Created by Mikael on 2015-09-07.
 */

$(document).on('ready page:load', function(){
    $("#new_movie_comment").submit(function(e){
        e.preventDefault();
        $.ajax({
            url: $(this).attr("action"),
            data: $(this).serialize(),
            method: "POST",
            success: function(){

            }
        })
    })
})


$(document).on('ready page:load', function(){
    return $("a[data-remote]").on("ajax:success", function(e, data, status, xhr) {
        $(this).parent().parent().hide();
    });
});