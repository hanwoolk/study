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
			System.out.println("1:ȸ������, 2:�� �� 4�ڸ�(orFULL)�˻�, 3: ��ǰ����, 4:������ ���, 5:��ü���, 6:Ż�� ��");
			fn = sc.next();
			switch(fn) {
			case "1":
				System.out.print("������ ȸ���� ��ȭ��ȣ: ");
				String ctel = sc.next();
				System.out.print("������ ȸ���� �̸� : ");
				String cname = sc.next();
				//int result = dao.insertCustomer(ctel, cname);
				int result = dao.insertCustomer(new CustomerDto(0, ctel, cname, 0, 0, null, 0));
				System.out.println(result == CustomerDao.SUCCESS? cname+"�� ȸ������ �����մϴ�. ����Ʈ 1000�� ��Ƚ��ϴ�" : cname+"�� ȸ������ ����");
				break;
			case "2" :
				System.out.println("�˻��� ��ȭ��ȣ �� 4�ڸ� or FULL��ȣ �Է� : ");
				String searchTel = sc.next();
				customers = dao.ctelGetCustomers(searchTel);
				if(customers.isEmpty()) {
					System.out.println(searchTel + "�ش� ��ȣ�� �����ϴ�. ȸ�������ϼ���");
				}else {
					System.out.println("���̵�\t��ȭ\t\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t��������������õ���ž�");
					for (CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "3":
				System.out.print("�����̵� (�����̵� �𸦰��, �˻��ϼ���): ");
				int cid = sc.nextInt();
				System.out.println("��ǰ ���� : ");
				int price = sc.nextInt();
				result = dao.buy(cid, price);
				if(result==CustomerDao.SUCCESS) {
					System.out.println("��ǰ���� �����մϴ�" +price+"�� �����Ͽ� ���� �����Ͱ� ������ ���� ������Ʈ �Ǿ����ϴ�.");
					CustomerDto customer = dao.getCustomer(cid);
					System.out.println("���̵�\t��ȭ\t\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t��������������õ���ž�");
					System.out.println(customer);
				}else {
					System.out.println(cid+"�� ��ȿ�� �� ���̵� �ƴմϴ�.");
				}
				break;
			case "4":
				System.out.println("�˻��ϰ��� �ϴ� ����"+dao.getLevelNames() + " : ");
				String levelName = sc.next();
				customers = dao.levelNameGetCustomers(levelName);
				if(customers.size()==0) {
					System.out.println("�ش� ����" + levelName+"�� ���� �˻����� �ʽ��ϴ�.");
					}else {
					System.out.println("���̵�\t��ȭ\t\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t��������������õ���ž�");
					for (CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "5":
				customers = dao.getCustomers();
				if(customers.size()==0) {
					System.out.println("������ �˻����� �ʽ��ϴ�");
					}else {
					System.out.println("���̵�\t��ȭ\t\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t��������������õ���ž�");
					for (CustomerDto customer : customers) {
						System.out.println(customer);
					}
				}
				break;
			case "6":
				System.out.println("Ż���� �� ��ȭ��ȣ : ");
				ctel = sc.next();
				result = dao.deleteCustomer(ctel);
				System.out.println(result==CustomerDao.SUCCESS? "ȸ�� Ż�� �Ϸ�Ǿ����ϴ�" :"��ȿ�� ��ȭ��ȣ�� �ƴմϴ�");
			}
		}while(fn.equals("1")||fn.equals("2")||fn.equals("3")||fn.equals("4")||fn.equals("5")||fn.equals("6"));
		System.out.println("BYE");
	}
}
