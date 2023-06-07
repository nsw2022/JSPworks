package address;

import java.util.ArrayList;

public class AddrBookDAO {
	// 자료를 저장할 ArrayList 생성
	private ArrayList<AddrBook> addrList = new ArrayList<>();
	
	// 자료 삽입
	public void add(AddrBook addrBook) {
		addrList.add(addrBook);
	}
	
	// 자료 목록 조회(출력)
	public ArrayList<AddrBook> getList() {
		return addrList;
	}
	
	// 주소 상세보기
	public AddrBook getAddrBook(String username) {
		AddrBook addrbook = null;
		
		for (int i = 0; i < addrList.size(); i++) { // 전체를 순회함녀서
			String dbUserName = addrList.get(i).getusername();
			if (dbUserName.equals(username)) {
				addrbook = addrList.get(i);// 주소 1개를 가져옴 
				break;
			}//if
			
		}//for
		return addrbook;
	}//getAddrBook
	
	// 주소 삭제
	public void deleteAddrBook(String username) {
	
		for (int i = 0; i < addrList.size(); i++) { // 전체를 순회함녀서
			String dbUserName = addrList.get(i).getusername();
			if (dbUserName.equals(username)) {

				addrList.remove(i);// 주소 1개를 삭제함 
				break;
			}//if
		}//for
		
	}//delete
	
}
