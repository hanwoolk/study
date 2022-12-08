package com.lec.quiz;
//name, int computePay(),int computeIncentive(월급이 300이상인 사람만 월급의 5%를 incentive)
public abstract class Employee {
	private String name;
	public Employee(String name) {
		this.name = name;
	}
	public abstract int computePay();
	public static final int computeIncentive() {
		int temp = computePay();
		if(temp>3000000)
			return (int)(temp*0.05);
		return 0;
	}
	
	// getter & setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getComputeIncentive() {
		return computeIncentive;
	}
	public void setComputeIncentive(int computeIncentive) {
		this.computeIncentive = computeIncentive;
	}
	
}
