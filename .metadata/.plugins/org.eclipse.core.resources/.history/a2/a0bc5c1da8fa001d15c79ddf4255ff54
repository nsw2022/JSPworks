package taketrans;

public class Person {

	String name;
	int age;
	int money;

	Person(String name, int money){
		this.name = name;
		this.money = money;
	}
	
	public void takeBus(Bus bus) {
		bus.take(1300);
		this.money -= 1300;
	}
	
	public void takeSubway(Subway subway) {
		subway.take(1250);
		this.money -=1250;
	}
	
	public void showInfo() {
		System.out.println(name + "님의 남은 돈은 "+money+"원 입니다.");
	}

}
