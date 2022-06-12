package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;



public class MemberDAO {

	private Connection conn = null;

	public MemberDAO(Connection conn) {
		this.conn = conn;
	}

	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(num),0) from member";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next())
				maxNum = rs.getInt(1);

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;

	}
	
	public int insertData(MemberDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into member (id,pwd,name,email,tel,addr1,";
			sql+= "addr2,addr3,birth,gender) ";
			sql+= "values (?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getAddr1());
			pstmt.setString(7, dto.getAddr2());
			pstmt.setString(8, dto.getAddr3());
			pstmt.setString(9, dto.getBirth());
			pstmt.setString(10, dto.getGender());

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}

	public String getName(String id) {

		String name = "";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where id=?";

		conn = DBConn.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.toString();
		}
		return id;
	}

////////////////아이디와 비밀번호가 맞는지 체크
	public boolean isLogin(String id, String pwd) {
		boolean flag = false;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where id=? and pwd=?";

		conn = DBConn.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rs = pstmt.executeQuery();

//비밀번호가 맞는 데이터가 있으면 true 반환
			if (rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return flag;
	}
	
	public MemberDTO getReadData(String id) {
	
		MemberDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {



			/*	sql = "select id,pwd,name,email,tel,addr1,";
				sql+= "addr2,addr3,to_char(birth,'yyyy-mm-dd') birth,";
				sql+= "gender from member where id=?";*/

			sql = "select id,name,email from member ";
			sql+= "where id=?";

			pstmt = conn.prepareStatement(sql);//문법검사 

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();//실행하고 

			if(rs.next()) {

				dto = new MemberDTO();

				dto.setId(rs.getString("id"));
				//dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				//dto.setTel(rs.getString("tel"));
				//dto.setAddr1(rs.getString("addr1"));
				//dto.setAddr2(rs.getString("addr2"));
				//dto.setAddr3(rs.getString("addr3"));
				//dto.setBirth(rs.getString("birth"));
				//dto.setGender(rs.getString("gender"));

			}

			rs.close();//열었으니 닫아주고
			pstmt.close();//열었으니 닫아주고

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;//리턴값으로 dto보내주고 

	}//end getReadData(String Id)

	public int getDataCount() {
		
		int totalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "select nvl(count(*),0) from orders "; //데이터가 있으면 카운터ㅇ하고 없으면 0으로 표기 NVL <
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				totalCount = rs.getInt(1); //첫번째 데이터가 나옴
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return totalCount;
	
	}
	
	/*public List<OrdersDTO> getLists(int start, int end){
		
		List<OrdersDTO> lists = new ArrayList<OrdersDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {

			//현재내가 가져오려하는 페이지 -1 x 가져올데이터수x3 에 +1 <<시작값 //끝값구하는 공식>> 현재페이지수 x 가져올 데이터수 

			sql  = "select * from (";
			sql += "select rownum rnum, data.* from (select ORDERNUM ORDERSTATE	SELLER STEL SADDR ID";
			sql += " from orders order by ORDERNUM desc) data) where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end); //물음표값 순서대로 써준것.

			rs = pstmt.executeQuery();

			while(rs.next()) {

				OrdersDTO dto = new OrdersDTO();
				
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setOrderState(rs.getString("orderState"));
				dto.setName(rs.getString("name"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				
				lists.add(dto);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}*/
	
}

