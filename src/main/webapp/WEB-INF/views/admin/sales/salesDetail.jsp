<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Content Wrapper. Contains page content -->
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>매출 상세내역</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">매출 상세내역</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
			              	<label>
				              	구매일자 : ${userMap.purchasedate}
			              	</label><br>
			              	<label>
				              	구매자 : ${userMap.username}
			              	</label><br>
			              	<label>
				              	수취인 : ${userDetailMap.recipientname}
			              	</label><br>
			              	<label>
				              	배송지 : ${userDetailMap.addr1} ${userDetailMap.addr2} 
			              	</label><br>
			              	<label>
			              		구매 금액 : <fmt:formatNumber value="${userDetailMap.totalsalesprice}" type="currency" currencySymbol="￦"/>
			              	</label><br>
			              	<label>
			              		사용 포인트 합계 : ${userDetailMap.totalusedpoint} Point 
			              	</label><br>
							<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="text-align: center">상품명</th>
										<th style="text-align: center">색상</th>
										<th style="text-align: center">사이즈</th>
										<th style="text-align: center">정상가격(원)</th>
										<th style="text-align: center">판매가격(원)</th>
										<th style="text-align: center">수량(개)</th>
										<th style="text-align: center">합계(원)</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="salesDetail" items="${salesDetailList}" varStatus="status">
										<tr style="text-align: center">
											<td>${salesDetail.productname}</td>
											<td>${salesDetail.color}</td>
											<td>${salesDetail.size}</td>
											<td><fmt:formatNumber value="${salesDetail.originalprice}" type="currency" currencySymbol="￦"/></td>
											<td><fmt:formatNumber value="${salesDetail.saleprice}" type="currency" currencySymbol="￦"/></td>
											<td>${salesDetail.count}</td>
											<td><fmt:formatNumber value="${salesDetail.saleprice * salesDetail.count}" type="currency" currencySymbol="￦"/></td>
										</tr>
									</c:forEach>
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