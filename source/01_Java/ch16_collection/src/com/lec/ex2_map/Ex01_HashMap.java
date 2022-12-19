package com.lec.ex2_map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Ex01_HashMap {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("aaa");
		list.add("aaa");
		System.out.println(list.get(0) + "/" + list.get(1)); // 인덱스가 key
		HashMap<Integer, String> hashMap = new HashMap<Integer, String>();
		hashMap.put(new Integer(11), "str11"); // key는 유일한 값, key값을 똑같이쓰면 덮어씀, 위에서 Integer 선언을 해둬서 안써도 적용됨
		hashMap.put(12, "str11");
		hashMap.put(20, "str20");
		hashMap.put(30, "str33");
		System.out.println(11 + "key값의 데이터는 " + hashMap.get(11));
		System.out.println(hashMap);
		hashMap.remove(12); // remove 시는 key값으로만 이용
		System.out.println("remove 후 : " + hashMap);
		hashMap.clear();
		System.out.println(hashMap.isEmpty() ? "데이터 모두 제거" : "데이터 있음");
		// 출력
		hashMap.put(0, "Hong gildong");
		hashMap.put(10, "Kim donggil");
		hashMap.put(22, "Lee soonsin");
		hashMap.put(40, " Yu ain");
		System.out.println(hashMap);
		Iterator<Integer> iterator = hashMap.keySet().iterator(); // 반복자
		while (iterator.hasNext()) {
			Integer key = iterator.next();
			System.out.println(key + "의 데이터는" + hashMap.get(key));
		}
	}
}
