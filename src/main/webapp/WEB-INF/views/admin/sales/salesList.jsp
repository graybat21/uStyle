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
				              		<fmt:parseDate value="${startDate}" var="startParsedDate" pattern="yyyyMMdd" scope="page" />
				              		<fmt:parseDate value="${endDate}" var="endParsedDate" pattern="yyyyMMdd" scope="page" />
				              		<fmt:formatDate type="date" value="${startParsedDate}" /> ~ 
				              		<fmt:formatDate type="date" value="${endParsedDate}" />
				              	</c:if>
			              	</label><br>
			              	<label>
			              		총 매출액 : 
			              		<c:if test="${totalSalesPrice > 0}">
			              			<fmt:formatNumber value="${totalSalesPrice}" type="currency" currencySymbol="￦"/>
			              		</c:if> 
			              	</label><br>
			              	<label>
			              		사용 포인트 합계 : 
			              		<c:if test="${totalUsedPoint > 0}">
			              			${totalUsedPoint} Point
			              		</c:if> 
			              	</label>
							<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 200px; text-align: center">구매일자</th>
										<th style="text-align: center">구매자</th>
										<th style="text-align: center">총 구매가격</th>
										<th style="text-align: center">사용 포인트</th>
										<th style="text-align: center">act</th>
									</tr>
								</thead>
								<tbody>
									
									<c:if test="${salesList.size() == 0 }">
										<tr><td colspan="5" style="text-align: center"><strong>자료가 없습니다.</strong></td></tr>
									</c:if>
									<c:if test="${salesList.size() != 0 }">
									
									<c:forEach var="sales" items="${salesList}" varStatus="status">
										<c:url var="salesDetailP" value="salesDetail.do">
											<c:param name="purchasedate" value="${sales.purchasedate}" />
											<c:param name="username" value="${sales.username}" />
										</c:url>
											<tr style="text-align: center">
												<td>${sales.purchasedate}</td>
												<td>${sales.username}</td>
												<td><fmt:formatNumber value="${sales.totalprice}" type="currency" currencySymbol="￦"/></td>
												<td>${sales.usedpoint} Point</td>
												<td>
												<a href="${salesDetailP}" class="btn btn-info" role="button" target="_blank">상세내역 조회</a>
												</td>
											</tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
						
						<!-- 페이징 -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<c:if test="${pageMaker.prev }">
									<c:url var="salesListP" value="salesList.do">
										<c:param name="pageCount" value="${pageMaker.start - 1}" />
										<c:param name="startDate" value="${startDate}" />
										<c:param name="endDate" value="${endDate}" />
									</c:url>
									<li><a href="${salesListP}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.start}"
									end="${pageMaker.end}" var="idx">
									<c:url var="salesListP" value="salesList.do">
										<c:param name="pageCount" value="${idx}" />
										<c:param name="startDate" value="${startDate}" />
										<c:param name="endDate" value="${endDate}" />
									</c:url>
									<li class='<c:out value="${idx == pageMaker.page ? 'active' : ''}"/>'>
										<a href='${salesListP }'>${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<c:url var="salesListP" value="salesList.do">
										<c:param name="pageCount" value="${pageMaker.end + 1}" />
										<c:param name="startDate" value="${startDate}" />
										<c:param name="endDate" value="${endDate}" />
									</c:url>
									<li><a href="${salesListP}">다음</a></li>
								</c:if>
							</ul>
						</div>
						
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