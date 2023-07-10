<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>복권추첨</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
	<jsp:include page="../hearder.jsp" />
	<div id="container">
		<section id="hihi">
		<h1>행운의 복권</h1>
		<img alt="사진" src="resources/images/bronx.png">
        <button onclick="hihi()">추첨 드가자</button>
        <p id="display"></p>
		</section>

	</div>
	   <script>
	   
        function hihi(){

            
            let name = ['이진성', '노승우', '박성호', '권지혜', '김은효', '이경철', '성의석', '이유진', '유성길', '한주훈', 
                '강정현', '김현우', '이영준', '김민정', '유세현', '윤기은', '오화룡', '조은별', '이가은', '안재훈'];
            let numbers = new Array(5); 
        
           
            for(let i = 0; i < numbers.length; i++){
                let num = Math.floor(Math.random() * name.length); //랜덤 번호
                numbers[i] = num;      
                console.log(numbers);

                // 중복 제거
                for(let j = 0; j < i; j++){
                    if(numbers[j] == numbers[i]){
                        //console.log("중복 번호 : " + numbers[i])
                        i--;  //중복된 인덱스 삭제함
                    }
                }
            }

            
            let winners = new Array(5) // 당첨자 5명
            //출력
            for(let i = 0; i < winners.length; i++){
                winners[i] = name[numbers[i]]

            }
            
           	document.getElementById('display').innerHTML = winners.join(', ');
            document.getElementById('display').style.backgroundColor = 'aqua';
            document.getElementById('display').style.transition = 'all 3s ease'
      
            
    }
    </script>
	<jsp:include page="../footer.jsp" />
</body>
</html>
