<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Content Wrapper. Contains page content -->
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>매출내역</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">매출내역</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<form action="salesList.do"  onsubmit="return verifyOK()">
								<input type="hidden" name="startDate" id="startDate" value="" />
								<input type="hidden" name="endDate" id="endDate" value="" />
		              			<div class="form-group">
		                			<div class="input-group">
		                  				<button type="button" class="btn btn-default" id="daterange-btn">
			                   			<span>
			                   			<i class="fa fa-calendar"></i> 날짜 범위 선택
			                   			</span>
			                    		<i class="fa fa-caret-down"></i>
		                  				</button>&nbsp; &nbsp; &nbsp; &nbsp; 
		                  				<button type="submit" class="btn btn-default pull-right">매출내역 확인</button>	
				                	</div>
				              	</div>
				              	<!-- /.form group -->
			              	</form>
			              	<label>
				              	날짜 범위 :
				              	<c:if test="${not empty startDate and not empty endDate}"> 
				              		<fmt:formatDate type="date" value="${startDate}" /> ~ 
				              		<fmt:formatDate type="date" value="${endDate}" />
				              	</c:if>
			              	</label>
							<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 200px">구매일자</th>
										<th>구매자</th>
										<th>총 구매가격</th>
										<th>사용 포인트</th>
										<th>act</th>
									</tr>
								</thead>
								<tbody>
									
									<c:if test="${itemList.size() == 0 }">
										<tr><td colspan="9" style="text-align: center"><strong>자료가 없습니다.</strong></td></tr>
									</c:if>
									<c:if test="${itemList.size() != 0 }">
									
									<c:forEach var="list" items="${gradeList}" varStatus="status">
										<%-- <c:url var="deleteGrade" value="/admin/grade/deleteGrade.do">
											<c:param name="idx" value="${list.idx}" />
										</c:url> 
										<c:url var="modifyGrade" value="/admin/item/modifyGrade.do">
											<c:param name="itemid" value="${list.itemid }" />
										</c:url>--%>
										<form action="gradeUpdate.do" method="post">
										<!-- <input type="hidden" name="_method" value="put" /> -->
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<tr>
											<td><strong><input type="text" name="idx" value="${list.idx }" readonly></strong></td>
											<td><input type="text" name="grade" value="${list.grade }"></td>
											<td><input type="text" name="point_ratio" value="${list.point_ratio}"></td>
											<td><input type="text" name="buy_term" value="${list.buy_term}"></td>
											<td><input type="text" name="min" value="${list.min }"></td>
											<td><input type="text" name="max" value="${list.max }"></td>
											<td>
											<%-- <a href="${modifyGrade }"><input type="button"
													value="수정"></a> --%>
											<input type="submit" value="수정">
												<%-- <a href="${deleteGrade }"><input type="button"
													value="삭제" onclick="return deleteGrade()"></a> --%>
											</td>
										</tr>
										</form>
									</c:forEach>
									</c:if>
									<script>
										function deleteGrade() {
											return confirm("선택한 등급을 삭제하겠습니까?");
										}
									</script>
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

<script>
  function verifyOK() {
	  if ( $("#startDate").val() == '' && $("#endDate").val() == '' ) {
		  alert("날짜 범위를 지정하세요.");
		  return false;
	  }
	  
	  return true;
  }

  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
          $("#startDate").val(start.format('YYYYMMDD'));
          $("#endDate").val(end.format('YYYYMMDD'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
</script>
</body>