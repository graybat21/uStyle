function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}

function pressKey() {
	var _val = document.getElementById('phone').value.trim();
	document.getElementById('phone').value = autoHypenPhone(_val);
}

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

function verifynotify(field1, field2, result_id, match_html, nomatch_html) 
{
  this.field1 = field1;
  this.field2 = field2;
  this.result_id = result_id;
  this.match_html = match_html;
  this.nomatch_html = nomatch_html;

  this.check = function() {
    // Make sure we don't cause an error
    // for browsers that do not support getElementById
    if (!this.result_id) { return false; }
    if (!document.getElementById){ return false; }
    r = document.getElementById(this.result_id);
    if (!r){ return false; }

    if (this.field1.value != "" && this.field1.value == this.field2.value) {
      r.innerHTML = this.match_html;
    } else {
      r.innerHTML = this.nomatch_html;
    }
  }
}

function verifyInput() 
{
	verify = new verifynotify();
	verify.field1 = document.form_validate.password;
	verify.field2 = document.form_validate.confirmation;
	verify.result_id = "password_result";
	verify.match_html = "<span style=\"color:blue\">패스워드가 일치합니다!<\/span>";
	verify.nomatch_html = "<span style=\"color:red\">귀하의 비밀번호가 일치하는지 확인하십시오!<\/span>";
	
	// Update the result message
	verify.check();
}

function addLoadEvent(func) 
{
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
	  window.onload = func;
	} else {
	  window.onload = function() {
	    if (oldonload) {
	      oldonload();
	    }
	    func();
	  }
	}
}

addLoadEvent(function() {
  verifyInput();
});

function verifyOK()
{
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;		
	var pwReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/g;
	var mailReg = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/g;
	var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
	
	if ( document.form_validate.password.value != document.form_validate.confirmation.value )
	{
		alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다. 다시 확인해주세요.");
		return false;	
	}
	else if ( $("#duplicateResult").text() != '사용 가능한 아이디입니다.' && location.pathname == '/register.do' ) 
	{
		alert("아이디 체크를 다시 진행해주세요.");
		return false;
	}
	else if ( !pwReg.test(document.form_validate.password.value) ) 
	{
		alert("패스워드는 6~20자의 영문 대소문자, 숫자, 특수문자로 이루어져야 하며, 최소 한개의 숫자 혹은 특수문자가 포함되어야 합니다.");
		return false;
	}
	else if ( !mailReg.test(document.form_validate.email.value) ) 
	{
		alert("올바른 메일주소 형식이 아닙니다. 다시 확인해주세요.");
		return false;
	}
	else if ( !phoneReg.test(document.form_validate.phone.value) ) 
	{
		alert("올바른 연락처 형식이 아닙니다. 다시 확인해주세요.");
		return false;
	}
	else
		return true;
}

function isExistUser()		// use keyup event -> To check id
{
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;	
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	
	if ( idReg.test($("#username").val()) )
	{	
		$.ajax({
		  url : "/duplicationCheck.do",
		  type : "post",
		  contentType : 'application/json; charset=utf-8',
		  data : JSON.stringify({ username : $("#username").val() }),
		  dataType: "json",
		  beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
		  success : function(data) {
		    if (data) {
		    	$("#duplicateResult").text("이미 해당 아이디로 가입된 회원이 있습니다. 다른 아이디를 입력해주세요."); 
		    } 
		    else {
		    	$("#duplicateResult").text("사용 가능한 아이디입니다."); 
		    }
		  },
		  error : function(error) {
		    alert(error.statusText);  
		  }
		});
	}
	else {
    	$("#duplicateResult").text("아이디는 영문 소문자로 시작하는 6~20자의 영문자 또는 숫자이어야 합니다."); 
	}
}
	
