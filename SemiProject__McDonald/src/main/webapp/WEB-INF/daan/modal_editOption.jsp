<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.container {
    	position: relative;
        background-color: #f3f3f3;
	}

        h4 {
        }

        /* @media only screen and (max-width: 600px) { */
        .li-wrap {
            overflow: scroll;
            white-space: nowrap;
            overflow-x: scroll;
            overflow-y: hidden;
            ;
        }

        ul {
            padding-inline-start: 0;
        }

        ul > li.editOption_li {
            display: inline-block;
            height: 100%;
            background-color: white;
            border-radius: 0.5rem;
            margin-right: 10px;
            box-shadow: 3px 3px 5px 0px #a6a6a6;
            padding: 0 0.4vw;
            
        }

        label {
            display: block;
        }

        li>div {
            text-align: center;
        }

        #buttons-wrap {
            text-align: end;
        }
        input.editOption_input {
			position: absolute;
		    opacity: 0;
		    cursor: pointer;
		    height: 0;
		    width: 0;
        }
</style>
<script>

	$(document).on('click', 'li.editOption_li.sides', function(e){
		const inputElement = e.target.parentNode.querySelector('input[name="side"]');
		inputElement.checked = true;
		$('li.editOption_li.sides').css('background-color', '');
		$('li.editOption_li.sides').css('color', '');
		e.target.parentNode.style.backgroundColor = '#ffbc0d';
		e.target.parentNode.style.color = 'white';
		$('div.li-wrap>ul').css('background-color', '');
		
	});
	
	$(document).on('click', 'li.editOption_li.drinks', function(e){
		const inputElement = e.target.parentNode.querySelector('input[name="drink"]');
		inputElement.checked = true;
		$('li.editOption_li.drinks').css('background-color', '');
		$('li.editOption_li.drinks').css('color', '');
		e.target.parentNode.style.backgroundColor = '#ffbc0d';
		e.target.parentNode.style.color = 'white';
		$('div.li-wrap>ul').css('background-color', '');
	});
</script>
    
<!-- Modal -->
<div class="modal fade" id="editOption" data-backdrop="static">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
		      
			<!-- Modal header -->
			<div class="modal-header">
				<h2 class="modal-title">구성변경</h2>
				<button type="button" class="close my_close" data-dismiss="modal" aria-label="Close">&times;</button> 
			</div>
		      
			<!-- Modal body -->
		    <div class="container">
		        <div id="modal_option" class="pt-3"></div>
		        <div class="pt-3">
		            <h4>사이드</h4>
		            <div class="modal_sides li-wrap"></div>
		        </div>
		        <div>
		            <h4>음료</h4>
		            <div class="modal_drinks li-wrap"></div>
		    	</div>
		    </div>
    		
    		<!-- Modal footer -->
		    <div class="modal-footer">
		        <button type="button" class="btn btn-danger my_close" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="completeEditOption()">변경 완료</button>
		    </div>
		    
		</div>
	</div>
</div>
