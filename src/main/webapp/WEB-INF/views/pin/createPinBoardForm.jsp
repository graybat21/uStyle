<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<style>
#columns {
	column-width: 350px;
	column-gap: 10px;
	padding: 30px;
}

#columns figure {
	display: Inline-block;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin: 0px;
	margin-bottom: 10px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

div img {
	width: 100%;
}

#columns figure figcaption {
	border-top: 1px solid rgba(0, 0, 0, 0.2);
	padding: 10px;
	margin-top: 10px;
}
</style>
<div class="wrapper">
	<div class="page one-column" id="columns">
		<h1>Insert PinBoard</h1>
	</div>
	<!-- /.page -->
	<div class="container" style="height: auto; margin: 30px;">
		<div class="box-collateral box-reviews em-line-01" id="customer-reviews">
			<div class="form_review no_reviews">
			    <div class="form-add" id="customer_review_form">
			    	<form method="post" onsubmit="return verifyOK()">
			    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				        <div class="em-block-title">
				            <h2>Insert PinBoard Form</h2>
				        </div>
			            <fieldset>
			                <h3>PinBoard의 제목과 내용을 입력해주세요.</h3>
			                <ul class="form-list">
			                    <li>
			                        <label for="username_field" class="required"><em>*</em>Title</label>
			                        <div class="input-box">
			                            <input type="text" name="pinboardname" id="pinboard-name" class="input-text required-entry" value=""/>
			                        </div>
			                    </li>
			                    <li>
			                        <label for="contents_field" class="required"><em>*</em>Contents</label>
			                        <div class="input-box">
			                            <textarea name="content" id="pinboard-content" cols="5" rows="3" class="required-entry"></textarea>
			                        </div>
			                    </li>
			                </ul>
			            </fieldset>
					    <div class="buttons-set">
					        <button type="submit" title="Submit Pinboard" class="button"><span>Submit Pinboard</span>
					        </button>
					    </div>
			    	</form>
			    </div>
			</div><!-- /.form_review -->
		</div><!-- /.box-collateral -->
	</div>
	<!-- /.container -->
</div>
<!-- /.wrapper -->
<script type="text/javascript">
function verifyOK()
{
	if ( $("#pinboard-name").val() == '' ) {
		alert("제목을 입력하세요.");
		return false;
	}
	else if ( $("#pinboard-content").val() == '' ) {
		alert("내용을 입력하세요.");
		return false;
	}
	else	
		return true;
}
</script>








