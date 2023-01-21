$(document).ready(function(){
	$(document).click(function(){
		var user_id= $(this).attr("id");
		alert(user_id);

		/*if(user_id!==''){
			var dados= {
				user_id:user_id
			};

			$.post('visualizar.php', dados, function(retorna){

			});
		}*/

	})
})