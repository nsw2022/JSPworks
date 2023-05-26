package arraylist.scorlist;



public class Student {
	// field 필드(멤버변수)
	int studentId; 	   // 학번
	String sutdentName;// 이름
	Subject korean = new Subject();    // 국어
	Subject math = new Subject();	   // 수학
	
	//생성자
	public Student(int studentId, String studnetName) {
		this.studentId=studentId;
		this.sutdentName=studnetName;
		korean = new Subject();
		math = new Subject();
		
	}
	
	// 국어 성적 입력 메서드
	public void koreanSubject(String name, int score) {
		korean.setSubjectName(name);
		korean.setScorePoint(score);
	}
	
	// 국어 성적 입력 메서드
	public void mathSubject(String name, int score) {
		math.setSubjectName(name);
		math.setScorePoint(score);
	}
	
	// 학생정보출력
	 public void showInfo() {
		System.out.printf("학생 %s의 국어 성적은 %d 점이고, 수학성적은 %d 점입니다\n",
				sutdentName, korean.getScorePoint(), math.getScorePoint());
	}
}
