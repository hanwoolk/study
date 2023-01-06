package com.lec.ex3supermarket;

public class CustomerDto {
	private	int 	cid;
	private	String	ctel;
	private	String	cname;
	private	int		cpoint;
	private	int		camount;
	private	String	clevelname;
	private	int		nextlevel;
	public CustomerDto() {}
	public CustomerDto(int cid, String ctel, String cname, int cpoint, int camount, String clevelname) {
		this.cid = cid;
		this.ctel = ctel;
		this.cname = cname;
		this.cpoint = cpoint;
		this.camount = camount;
		this.clevelname = clevelname;
	}
	public CustomerDto(int cid, String ctel, String cname, int cpoint, int camount, String clevelname,
			int nextlevel) {
		this.cid = cid;
		this.ctel = ctel;
		this.cname = cname;
		this.cpoint = cpoint;
		this.camount = camount;
		this.clevelname = clevelname;
		this.nextlevel = nextlevel;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCpoint() {
		return cpoint;
	}
	public void setCpoint(int cpoint) {
		this.cpoint = cpoint;
	}
	public int getCamount() {
		return camount;
	}
	public void setCamount(int camount) {
		this.camount = camount;
	}
	public String getClevelname() {
		return clevelname;
	}
	public void setClevelname(String clevelname) {
		this.clevelname = clevelname;
	}
	public int getNextlevel() {
		return nextlevel;
	}
	public void setNextlevel(int nextlevel) {
		this.nextlevel = nextlevel;
	}
	
}
