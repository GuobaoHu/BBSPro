package guyue.BBS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Article {
	private int id;
	private int pid;
	private int rootId;
	private String title;
	private String cont;
	private Date pdate;
	private boolean isleaf;
	private boolean singular;
	private int level;
	
	public void initArt(ResultSet rs) throws SQLException {
		this.setId(rs.getInt("id"));
		this.setPid(rs.getInt("pid"));
		this.setRootId(rs.getInt("rootid"));
		this.setTitle(rs.getString("title"));
		this.setCont(rs.getString("cont"));
		this.setPdate(rs.getTimestamp("pdate"));
		this.setIsleaf(rs.getInt("isleaf")==0 ? true : false);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public boolean isIsleaf() {
		return isleaf;
	}
	public void setIsleaf(boolean isleaf) {
		this.isleaf = isleaf;
	}
	
	public boolean isSingular() {
		return singular;
	}
	public void setSingular(boolean singular) {
		this.singular = singular;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
