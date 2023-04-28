<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
        .container {
            position: relative;
        }

        h4 {
            background-color: red;
            color: white;
            width:30%;
        }

        /* @media only screen and (max-width: 600px) { */
        .li-wrap {
            overflow: scroll;
            white-space: nowrap;
            overflow-x: scroll;
            overflow-y: hidden;
            height: 24vh;
            ;
        }

        ul {
            padding-inline-start: 0;
        }

        li {
            display: inline-block;
            height: 100%;
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

</style>
    
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
