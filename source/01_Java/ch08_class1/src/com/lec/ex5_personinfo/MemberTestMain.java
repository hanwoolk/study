package com.lec.ex5_personinfo;

public class MemberTestMain {
	public static void main(String[] args) {
		Member member1 = new Member("aaa", "xxx", "홍길동", "hong@company.com", "서울 강남구", "2000-01-01", 'M');
		Member member2 = new Member("bbb", "xxx", "신길동", "shin@company.com", "경기 안양시", "2001-02-02", 'F');

		Member[] members = { member1, member2 };
		for (Member member : members) {
			System.out.println(member.infoString());
		}
	}
}
