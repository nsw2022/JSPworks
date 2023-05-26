package objectarray;

public class DeepCopy {
	public static void main(String[] args) {
		// 객체 배열의 복사
		Book[] array1 = new Book[3];
		Book[] array2 = new Book[3];
		
		array1[0] = new Book("반응형 웹사이트", "김은아");
		array1[1] = new Book("Tiny Python Project", "켄 유엔스-클락");
		array1[2] = new Book("혼자 공부하는 자바","신용권");
		
		// array2는 기본생성자로 생성
		array2[0] = new Book();
		array2[1] = new Book();
		array2[2] = new Book();
		
		// arr1의 배열요소를 array2에 복사
		for (int i = 0; i < array2.length; i++) {
			array2[i].setBookName(array1[i].getBookName());
			array2[i].setAuthor(array1[i].getAuthor());
		}
		
		// 첫번재 책 수정(변경)
		array2[0].setBookName("나는 변경되었따!!");
		array2[0].setAuthor("작가도 변경되었따!");
			
		// array1 출력
		for (int i = 0; i < array1.length; i++) {
			array1[i].bookInfo();
		}
		System.out.println("===============================");
		// array2 출력
		for (Book book : array2) book.bookInfo();
		
 	}
}
