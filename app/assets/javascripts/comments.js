/**
 * Created by Mikael on 2015-09-07.
 */

$(document).ready(function(){
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