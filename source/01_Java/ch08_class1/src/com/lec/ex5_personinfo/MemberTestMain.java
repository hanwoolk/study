package com.lec.ex5_personinfo;

public class MemberTestMain {
	public static void main(String[] args) {
		Member member1 = new Member("aaa", "xxx", "ȫ�浿", "hong@company.com", "���� ������", "2000-01-01", 'M');
		Member member2 = new Member("bbb", "xxx", "�ű浿", "shin@company.com", "��� �Ⱦ��", "2001-02-02", 'F');

		Member[] members = { member1, member2 };
		for (Member member : members) {
			System.out.println(member.infoString());
		}
	}
}
