package banking.bankarray;

import java.util.Scanner;

public class BankMain {


	// 통장 계좌를 만들 객체 배열 100개 생성
	static Account[] accountArray = new Account[100];
	static Scanner scanner = new Scanner(System.in);
	
	
	public static void main(String[] args) {
		boolean run = true;
		
		while (run) {
			try {				
				System.out.println("-----------------------------------------");
				System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.종료");
				System.out.println("-----------------------------------------");
				System.out.print("선택> ");
				// 메뉴 선택 변수
				int selectNo = Integer.parseInt(scanner.nextLine());
				
				if (selectNo==1) { // 계좌생성
					createAccount();
				}else if (selectNo==2) {  // 계좌목록
					getAccountList();
				}
				else if(selectNo==5){ 
					run=false;
					System.out.println("종료");
				}else{
					System.out.println("지원되지 않는 기능입니다.");
				}
			} 
			catch (Exception e) {
				System.out.println("네녀석이 입력한건 문자다 크큭 숫자를 입력해라");
			}
			
		}//while
		
	}//main


	// 계좌를 생성하는 함수

	private static void createAccount() {
		System.out.println("-----------------------------------------");
		System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.종료");
		System.out.println("-----------------------------------------");
		
		System.out.print("계좌번호: ");
		String ano = scanner.nextLine();
		
		System.out.print("계좌주: ");
		String onwer = scanner.nextLine();
		
		System.out.print("초기입금액: ");
		int balance = Integer.parseInt(scanner.nextLine());
		
		for (int i = 0; i < accountArray.length;i++) {// 전체배열반복
			if ( accountArray[i] == null ) { // 조건식 null일때만 넣기
				accountArray[i] = new Account(ano, onwer, balance);
				System.out.println();
				break;
			}
		}
	}//createAccount
	
	
	private static void getAccountList() {
		for (Account account : accountArray){
			if (account != null) {//계좌가 null 인 값 제외 전원출력			
				System.out.print("계좌번호:" + account.getAno()+"\t");
				System.out.print("계좌주 :" + account.getOwner()+"\t");
				System.out.println("잔  액:" + account.getBalance());
			}
		}		
	}//getAccountList
	


}//class
