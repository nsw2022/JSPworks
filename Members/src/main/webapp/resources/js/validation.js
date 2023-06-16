

/**
 * 
 */

function checkMember(){
		let form = document.member;
		
		let id = form.memberId.value.replaceAll(" ","");
		let pw1 = form.passwd1.value.replaceAll(" ","");
		let pw2 = form.passwd2.value.replaceAll(" ","");
		let name = form.name.value.replaceAll(" ","");
		
		let good = form.good.value
		if (good == "" ){
			alert('중복체크해주세요')
			return;
		}

		// 정규 표현식
		let pw_part1 = /\d+/; // 숫자만
		let pw_part2 = /[a-zA-Z]+/; // 영어 대소문자
		let pw_part3 = /[!@#$%^&*()_+]+/; // 특수문자
		
		let name_part = /^[가-힣]+$/ // 이름 정규식/^[가-힣]+$/;

		if (id.length < 4 || id.length > 15) {
			alert('아이디는 4~15자로 입력해야 합니다.');
			form.memberId.select();
			return;
		}
		
		//1. 아이디가 비밀번호가 비어있을때 처리
		if (id.trim() === '' || pw1.trim() === '' || name.trim() ==='' ) {
			alert('절대 input상자를 절대 공백으로 두지마');
			return;
		}

		if (!pw_part1.test(pw1) || !pw_part2.test(pw1) || !pw_part3.test(pw1) || pw1.length < 4 || pw1.length > 8) {
			alert('비밀번호는 4~8자의 숫자, 영어 대소문자, 특수문자로 구성되어야 합니다.');
			form.passwd1.select();
			return;
		}

		if (pw1 !== pw2) {
			alert('비밀번호 확인이 일치하지 않습니다.');
			form.passwd2.select();
			return;
		}
		
		if (!name_part.test(name)){
			alert('이름에 특수기호가 들어가면 안됐!')
			form.name.select()
			return
		}
		
	
		form.submit();
					
		
}
 