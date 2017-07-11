var header = $("meta[name='_csrf_header']").attr("content");
var token  = $("meta[name='_csrf']").attr("content");

/**
	상품의 썸네일 이미지를 클릭했을 때, 클릭한 이미지를 메인이미지가 있던 곳에 불러오게 하는 작업
*/
$( ".em-moreviews-slider li a" ).click(function() {
    var address = $(this).children("img");
    $(".product-image img").attr("src", address.attr("src").replace("/s_", "/"));
    $(this).parent().addClass("on").siblings().removeClass("on");
    return false;
});

function verifyReview()
{
	/*if ( $("#username").val() == '' )
	{
		alert("로그인 후 작성하실 수 있습니다.");
		return false;
	}
	else if ( $("#contents").val().trim() == '' )
	{
		alert("내용을 입력해주세요.");
		return false;
	}
	else if ( $("#contents").val().length > 150 )
	{
		alert("리뷰 내용은 띄어쓰기를 포함하여 최대 150자로 제한됩니다.");
		return false;
	}
	else*/
		return true;
}

/**
	색상을 선택했을 때 수행되는 작업
*/
 
$( "#configurable_swatch_color li a" ).click(function() {
	var productid = $("#productid").val();
	var selectedColor = $(this).attr("value");
	
	$("span#select_label_color").text(selectedColor);
	$("#selectedItemColor").val(selectedColor);
	
	$.ajax({
		url: "/product/selectedColor.do",
		data: JSON.stringify({productid: productid, color: selectedColor}),
		dataType: 'text',
		type: 'POST',    
		headers : {
			"Content-Type": "application/json; charset=utf-8",
			"X-HTTP-Method-Override": "POST"
		},
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
	    },
		success: function(data) {
			var result = JSON.parse(data);
			var makeOptionHtml = "<option value='' selected='true' disabled>Choose an Option...</option>";
			
			console.log(data);
			
			$.each(result, function(idx, obj) {
				if ( obj.stock > 0 )
					makeOptionHtml += "<option value='" + obj.size + "'>" + obj.size + "</option>";
				else
					makeOptionHtml += "<option value='" + obj.size + "' disabled>" + obj.size + "- Out of Stock</option>";
			});
			
			console.log(makeOptionHtml);
			
			$("#attribute-size").empty(); 
			$("#attribute-size").html(makeOptionHtml);
		},
		error: function(request, status, error) {
		    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
	    }
	});
});

/**
	사이즈를 선택했을 때 수행되는 작업(Item별로 남아있는 수량을 고려하여 Qty Select Box 옵션값을 조정한다. 그리고 색상과 사이즈에 맞춘 가격을 올바르게 표시한다.)
*/

$("select#attribute-size").change(function() {
	var productid     = $("#productid").val();
	var selectedColor = $("#selectedItemColor").val();
	
	var selectedSize  = $(this).children(":selected").html();
	
	$("#selectedItemSize").val(selectedSize);
	
	$.ajax({
		url: "/product/selectedSize.do",
		data: JSON.stringify({productid: productid, color: selectedColor, size: selectedSize}),
		dataType: 'text',
		type: 'POST',    
		headers : {
			"Content-Type": "application/json; charset=utf-8",
			"X-HTTP-Method-Override": "POST"
		},
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
	    },
		success: function(data) {
			var result = JSON.parse(data);
			console.log(result);
			
			var makeOptionHtml = "<option value='1'>1</option>";
			
			if ( result.stock > 1 )		
			{
				for ( var i = 2; i <= 10; i++ )
				{	
					if ( i > result.stock )
						break;
					
					makeOptionHtml += "<option value='" + i + "'>" + i +"</option>";
				}
			}
			
			console.log(makeOptionHtml);
			
			$("#attribute-qty").empty(); 
			$("#attribute-qty").html(makeOptionHtml);
			
			var originalprice = parseInt(result.originalprice);
			var saleprice = parseInt(result.saleprice);
			
			var makePriceHtml = "";
			
			if ( originalprice > saleprice )
			{
				makePriceHtml += "<span id='price-original' class='price'><del>" + "￦" + set_comma(originalprice) + "</del></span>";
			}
			
			makePriceHtml += "<span id='price-sale' class='price'>" + "￦" + set_comma(saleprice) + "</span>";
			
			$("#price-box-wrapper").empty(); 
			$("#price-box-wrapper").html(makePriceHtml);
			
			$("#itemid").val(result.itemid);
		},
		error: function(request, status, error) {
		    alert("code:" + request.status + "\n" + "message:" + request.responseText+"\n" + "error:" + error);
	    }
	});
});

$("select#attribute-qty").change(function() {
	$("#count").val($(this).children(":selected").html());
});

/**
	색상, 사이즈, 수량을 선택한 후 장바구니 추가 버튼을 클릭했을 때 수행되는 작업
*/

$("#product-addtocart-button").click(function() {
	
	if ( $('#selectedItemColor').val() == '' ) {
		alert("색상을 선택하세요.");
		return false;
	}
	else if ( $('#selectedItemSize').val() == '' ) {
		alert("사이즈를 선택하세요.");
		return false;
	}
	
	$("#product_addtocart_form").submit();	
});

jQuery('.cloud-zoom-gallery').click(function() {
    jQuery('#zoom-btn').attr('href', this.href);
});

function set_comma(n) { 
	var reg = /(^[+-]?\d+)(\d{3})/; 
	
	n += ''; 
	
	while (reg.test(n)) 
		n = n.replace(reg, '$1' + ',' + '$2'); 
	
	return n; 
}

function doSliderMoreview() {
    var owl = $("ul.em-moreviews-slider");
    if (owl.length) {
        owl.owlCarousel({
            // Navigation
            navigation: true,
            navigationText: ["Previous", "Next"],
            pagination: false,
            paginationNumbers: false,
            // Responsive
            responsive: true,
            items: 7,
            /*items above 1200px browser width*/
            itemsDesktop: [1200, 4],
            /*//items between 1199px and 981px*/
            itemsDesktopSmall: [992, 7],
            itemsTablet: [768, 3],
            itemsMobile: [480, 2],
            // CSS Styles
            baseClass: "owl-carousel",
            theme: "owl-theme",
            transitionStyle: false,
            addClassActive: true,
        });
    }
}

function changeQty(increase) {
    var qty = parseInt($('#qty').val());
    if (!isNaN(qty)) {
        console.log(qty);
        qty = increase ? (qty > 9 ? 10 : qty + 1) : (qty > 1 ? qty - 1 : 1);
        $('#qty').val(qty);
    }
}

(function($) {
    $(window).load(function() {
        if (!isPhone) {
        	$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
        }
        doSliderMoreview();

        /* Up sell */
        var owl = $("#em-upsell");
        if (owl.length) {
            owl.owlCarousel({
                // Navigation
                navigation: true,
                navigationText: ["Previous", "Next"],
                pagination: false,
                paginationNumbers: false,
                // Responsive
                responsive: true,
                items: 4,
                /*items above 1200px browser width*/
                itemsDesktop: [1200, 4],
                /*//items between 1199px and 981px*/
                itemsDesktopSmall: [992, 3],
                itemsTablet: [768, 3],
                itemsMobile: [480, 2],
                // CSS Styles
                baseClass: "owl-carousel",
                theme: "owl-theme",
                transitionStyle: false,
                addClassActive: true,
                afterMove: function() {
                    var $_img = owl.find('img.em-img-lazy');
                    if ($_img.length) {
                        var timeout = setTimeout(function() {
                            $_img.trigger("appear");
                        }, 200);
                    }
                },
            });
        }
    });
})(jQuery);