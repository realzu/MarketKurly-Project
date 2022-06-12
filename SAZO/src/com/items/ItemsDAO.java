package com.items;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemsDAO {

	private Connection conn;

	public ItemsDAO(Connection conn) {
		this.conn=conn;
	}

	//num의 최대값
	public int getMaxNum() {

		int maxNum= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql="select nvl(max(itemNum),0) from items"; //null은 사칙연산이 안되므로 0을넣어줌

			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				maxNum = rs.getInt(1); //파생column이라 column명 사용불가 그래서 컬럼순번

			}

			rs.close();
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return maxNum;
	}

	//입력
	public int insertData(ItemsDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {
			sql="insert into items (itemNum,itemName,unit,kg,itemInfo,allegy,price,thumFile,image1,image2,category,comments,hitCount,created) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,0,sysdate)";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getItemNum());
			pstmt.setString(2, dto.getItemName());
			pstmt.setString(3, dto.getUnit());
			pstmt.setString(4, dto.getKg());
			pstmt.setString(5, dto.getItemInfo());
			pstmt.setString(6, dto.getAllegy());
			pstmt.setInt(7, dto.getPrice());
			pstmt.setString(8, dto.getThumFile());
			pstmt.setString(9, dto.getImage1());
			pstmt.setString(10, dto.getImage2());
			pstmt.setString(11, dto.getCategory());
			pstmt.setString(12, dto.getComments());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	public ItemsDTO getReadData(int itemNum){

		ItemsDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select itemNum, itemName, unit, kg, allegy, itemInfo, "
					+ "price, thumFile, image1, image2, category, hitCount, created, comments "
					+ "from items where itemNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, itemNum);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setAllegy(rs.getString("allegy"));
				dto.setUnit(rs.getString("unit"));
				dto.setKg(rs.getString("kg"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage2(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
				dto.setComments(rs.getString("comments"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;

	}

	//전체 데이터 갯수 구하기
	public int getDataCount(String searchValue) {

		int totalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%";

			sql = "select nvl(count(*),0) from items ";
			sql += "where itemName like ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);

			rs= pstmt.executeQuery();

			if(rs.next()) {
				totalCount = rs.getInt(1); //파생 column
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return totalCount;
	}


	//전체 데이터
	public List<ItemsDTO> getLists(int start, int end){

		List<ItemsDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
					+ "from items order by itemNum desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ItemsDTO dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage1(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return lists;

	}

	//전체 데이터
		public List<ItemsDTO> getLists(){

			List<ItemsDTO> lists_m = new ArrayList<>();

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {
				
				sql = "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created ";
				sql+= "from items order by itemNum desc";			

				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					ItemsDTO dto = new ItemsDTO();

					dto.setItemNum(rs.getInt("itemNum"));
					dto.setItemName(rs.getString("itemName"));
					dto.setItemInfo(rs.getString("itemInfo"));
					dto.setPrice(rs.getInt("price"));
					dto.setThumFile(rs.getString("thumFile"));
					dto.setImage1(rs.getString("image1"));
					dto.setImage1(rs.getString("image2"));
					dto.setCategory(rs.getString("category"));
					dto.setHitCount(rs.getInt("hitCount"));
					dto.setCreated(rs.getString("created"));

					lists_m.add(dto);
				}
				rs.close();
				pstmt.close();

			} catch (Exception e) {
				// TODO: handle exception
			}
			return lists_m;
		}
		//ㄴ-------------------------------------------------------------------------메인페이지
		

	public List<ItemsDTO> getLists(int start, int end, String searchValue){ //start rownum 시작 end rownum 마지막

		List<ItemsDTO> lists = new ArrayList<ItemsDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			searchValue = "%" + searchValue + "%" ;

			sql = "select * from (";
			sql+= "select rownum rnum, data.* from(";
			sql+= "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
					+ "from items where itemName like ? order by itemNum desc) data )";
			sql+= "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ItemsDTO dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage1(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));

				lists.add(dto);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return lists;
	}

	//조회수 증가
	public int updateHitCount(int itemNum) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update items set hitCount = hitCount+1 where itemNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, itemNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		}catch (Exception e) {
			// TODO: handle exception
		} 

		return result;
	}

	//수정
	public int updateData(ItemsDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update items set itemName=?,itemInfo=?,price=?,category=? ";
			sql+= "where itemNum = ?";

			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, dto.getItemName());
			pstmt.setString(2, dto.getItemInfo());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getCategory());
			pstmt.setInt(5, dto.getItemNum());

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	//삭제
	public int deleteData(int itemNum) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete items where itemNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, itemNum);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	public int getDataCount() {

		int totalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from items ";

			pstmt = conn.prepareStatement(sql);

			rs= pstmt.executeQuery();

			if(rs.next()) {
				totalCount = rs.getInt(1); //파생 column
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return totalCount;
	}
	public List<ItemsDTO> getLists_h(int start, int end){

		List<ItemsDTO> lists_h = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
					+ "from items order by hitCount desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ItemsDTO dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage1(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));

				lists_h.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists_h;
	}

	//created_전체데이터
	public List<ItemsDTO> getLists_d(int start, int end){

		List<ItemsDTO> lists_d = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
					+ "from items order by created desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ItemsDTO dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage1(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));

				lists_d.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists_d;
	}


	//lowprice_전체데이터
	public List<ItemsDTO> getLists_lp(int start, int end){

		List<ItemsDTO> lists_lp = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
					+ "from items order by price asc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ItemsDTO dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage1(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));

				lists_lp.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists_lp;
	}

	//highprice_전체데이터
	public List<ItemsDTO> getLists_hp(int start, int end){

		List<ItemsDTO> lists_hp = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
					+ "from items order by price desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ItemsDTO dto = new ItemsDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setItemInfo(rs.getString("itemInfo"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setImage1(rs.getString("image1"));
				dto.setImage1(rs.getString("image2"));
				dto.setCategory(rs.getString("category"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));

				lists_hp.add(dto);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists_hp;
	}
	
	//-------------------------------------------------------------------------카테고리 전체데이터
		public int getDataCount1(String category) {

		int totalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(count(*),0) from items where category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);			

			rs= pstmt.executeQuery();

			if(rs.next()) {
				totalCount = rs.getInt(1); //파생 column
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return totalCount;
	}
	
	
		//전체 데이터
		public List<ItemsDTO> getLists1(int start, int end, String category){

			List<ItemsDTO> lists_c = new ArrayList<ItemsDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;

			try {
				sql = "select * from (";
				sql+= "select rownum rnum, data.* from(";
				sql+= "select itemNum,itemName,itemInfo,price,thumFile,image1,image2,category,hitCount,created "
						+ "from items where category = ? order by itemNum desc) data )";
				sql+= "where rnum>=? and rnum<=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, category);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					ItemsDTO dto = new ItemsDTO();

					dto.setItemNum(rs.getInt("itemNum"));
					dto.setItemName(rs.getString("itemName"));
					dto.setItemInfo(rs.getString("itemInfo"));
					dto.setPrice(rs.getInt("price"));
					dto.setThumFile(rs.getString("thumFile"));
					dto.setImage1(rs.getString("image1"));
					dto.setImage2(rs.getString("image2"));
					dto.setCategory(rs.getString("category"));
					dto.setHitCount(rs.getInt("hitCount"));
					dto.setCreated(rs.getString("created"));

					lists_c.add(dto);
				}
				rs.close();
				pstmt.close();

			} catch (Exception e) {
				// TODO: handle exception
			}
			return lists_c;
		}

	

}

