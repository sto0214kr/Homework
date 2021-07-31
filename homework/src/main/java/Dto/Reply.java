package Dto;

public class Reply {

	private int rno;
	private int bno;
	private String rwriter;
	private String rcontents;
	private String rdate;
	
	public Reply() { }

	public Reply(int rno, int bno, String rwriter, String rcontents, String rdate) {
		this.rno = rno;
		this.bno = bno;
		this.rwriter = rwriter;
		this.rcontents = rcontents;
		this.rdate = rdate;
	}
	
	public Reply(int bno, String rwriter, String rcontents, String rdate) {
		this.bno = bno;
		this.rwriter = rwriter;
		this.rcontents = rcontents;
		this.rdate = rdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRcontents() {
		return rcontents;
	}

	public void setRcontents(String rcontents) {
		this.rcontents = rcontents;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
	
}
