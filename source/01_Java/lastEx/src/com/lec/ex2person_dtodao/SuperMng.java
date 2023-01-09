package com.lec.ex2person_dtodao;

import java.util.ArrayList;
import java.util.Scanner;

import com.lec.ex3supermarket.CustomerDao;
import com.lec.ex3supermarket.CustomerDto;

public class SuperMng {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		Scanner sc = new Scanner(System.in);
		String fn;
		ArrayList<CustomerDto> customers;
		do {
			System.out.println("1:회원가입, 2:폰 뒷 4자리(orFULL)검색, 3: 물품구매, 4:레벨별 출력, 5:전체출력, 6:탈퇴 ▶");
			fn = sc.next();
			switch(fn) {
			case "1":
				System.out.print("가입할 회원님 전화번호: ");
				String ctel = sc.next();
				System.out.print("가입할 회원님 이름 : ");
				String cname = sc.next();
				//int result = dao.insertCustomer(ctel, cname);
				int result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
				System.out.println(result == CustomerDao.SUCCESS? cname+"님 회원가입 감사합니다. 포인트 1000점 드렸습니다" : cname+"님 회원가입 실패");
				break;
			case "2" :
				System.out.println("검색할 전화번호 뒤 4자리 or FULL번호 입력 : ");
				String searchTel = sc.next();
				customers = dao.ctelGetCustomers(searchTel);
				if(customers.isEmpty()) {
					System.out.println(searchTel + "해당 번호는 없습니다. 회원가입하세요");
				}else {
					System.out.println("아이디\t전화\t\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					for (CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "3":
				System.out.print("고객아이디 (고객아이디를 모를경우, 검색하세요): ");
				int cid = sc.nextInt();
				System.out.println("물품 가격 : ");
				int price = sc.nextInt();
				result = dao.buy(cid, price);
				if(result==CustomerDao.SUCCESS) {
					System.out.println("물품구매 감사합니다" +price+"원 구매하여 고객님 데이터가 다음과 같이 업데이트 되었습니다.");
					CustomerDto customer = dao.getCustomer(cid);
					System.out.println("아이디\t전화\t\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					System.out.println(customer);
				}else {
					System.out.println(cid+"는 유효한 고객 아이디가 아닙니다.");
				}
				break;
			case "4":
				System.out.println("검색하고자 하는 레벨"+dao.getLevelNames() + " : ");
				String levelName = sc.next();
				customers = dao.levelNameGetCustomers(levelName);
				if(customers.size()==0) {
					System.out.println("해당 레벨" + levelName+"은 고객이 검색되지 않습니다.");
					}else {
					System.out.println("아이디\t전화\t\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					for (CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "5":
				customers = dao.getCustomers();
				if(customers.size()==0) {
					System.out.println("고객닙이 검색되지 않습니다");
					}else {
					System.out.println("아이디\t전화\t\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추천구매액");
					for (CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "6":
				System.out.println("탈퇴할 고객 전화번호 : ");
				ctel = sc.next();
				result = dao.deleteCustomer(ctel);
				System.out.println(result==CustomerDao.SUCCESS? "회원 탈퇴가 완료되었습니다" :"유효한 전화번호가 아닙니다");
			}
		}while(fn.equals("1")||fn.equals("2")||fn.equals("3")||fn.equals("4")||fn.equals("5")||fn.equals("6"));
		System.out.println("BYE");
	}
}
