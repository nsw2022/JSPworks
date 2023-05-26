package inheritance.airplane;

public class SuperSonicAirPlane extends Airplane {
	// 비행 모드 1-일반비행 2-초음속비행
	static final int NOMAL = 1;
	static final int SUPERSONIC = 2;


	int flymode = NOMAL;


	@Override // 매서드 재정이 오버라이드
	public void fly() {
		// 조건문 - 비행기가 초음속 비행합니다.
		if (flymode == SUPERSONIC) {
			System.out.println("비행기가 초음속 비행합니다.");
		} else { // 매서드 상속
			super.fly(); // 비행기가 비행합니다.
		}
	}

}
