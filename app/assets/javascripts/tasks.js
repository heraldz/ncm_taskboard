$(function(){
	$('.dragme').draggable({
		snap: '.dragme',
		revert: 'invalid',
		stack: '.dragme'
	});
	$('td').droppable({
		
		drop: function(event, ui){
			var newstatusId = "";
			if (this.id == 'colRdy') {
				newstatusId = 1
			} else if(this.id =='colProg'){
				newstatusId = 2;
			} else if(this.id =='colCompl'){
				newstatusId = 3;
			} else if(this.id =='colTest'){
				newstatusId = 4 ;
			} else if(this.id == 'colDepl'){
				newstatusId = 5;
			}
      
      
			var droppedItemId = ui.draggable.attr('id');
			var updateUrl = '/task/'+droppedItemId+'/update/status';
			$.ajax({
				url: updateUrl,
				data: {id: droppedItemId,status:newstatusId},
				type: 'PUT',
				success: function(){
					console.log('Updated status');
				},
				error: function(){
					console.log('Error updating status');
				}
			});
      
      window.location.reload();
		},
		tolerance: 'intersect'
		
	});
});
