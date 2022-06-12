package com.items;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;

public class BasketDAO {

	private Connection conn;

	public BasketDAO(Connection conn) {
		this.conn=conn;
	}

	public BasketDTO getReadData(int itemNum, String id){

		BasketDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {

			sql = "select itemNum, id, amount, price "
					+ "from basket where itemNum=? and id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, itemNum);
			pstmt.setString(2, id); //���� ���̵�

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new BasketDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setId(rs.getString("id"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getInt("price"));

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;

	}

	//�Է�
	public int insertData(BasketDTO dto,int itemNum ,String id) {

		int result = 0;
		//itemNum�� ���� row�� ������ update���� , ������ insert ����
		BasketDTO dtock=getReadData(itemNum,id);

		if(dtock!=null) {
			updateData(dto,itemNum,id);
			return result;
		}

		PreparedStatement pstmt = null;
		String sql;

		try {
			sql="insert into basket (itemNum, id, amount, price) "
					+ "values(?,?,?,?)";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getItemNum());
			pstmt.setString(2, id); // <<���ǿ��� �޾ƿð� �������� session 
			pstmt.setInt(3, dto.getAmount());
			pstmt.setInt(4, dto.getPrice());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	//����
	public int updateData(BasketDTO dto,int itemNum,String id) {

		int result = 0;
		//itemNum�� ���� row�� ������ update���� , ������ insert ����
		//getReadData(itemNum)�ؼ� amount,price�� �����´�.
		BasketDTO dtock=getReadData(itemNum,id);

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update basket set amount=?,price=? ";
			sql+= "where itemNum = ? and id=?";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getAmount()+dtock.getAmount());
			pstmt.setInt(2, dto.getPrice()+dtock.getPrice());
			pstmt.setInt(3, dto.getItemNum());
			pstmt.setString(4, id); //���ǿ��� �޾ƿ� ���̵�

			result = pstmt.executeUpdate();

			pstmt.close();


		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	//��ü ������
	public List<BasketDTO> getLists(int start, int end){

		List<BasketDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select * from (";
			sql += "select rownum rnum, data.* from (";
			sql += "select itemNum, id, amount, price "
					+ "from basket order by itemNum desc) data) ";
			sql += "where rnum>=? and rnum<=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				BasketDTO dto = new BasketDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setId(rs.getString("id"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getInt("price"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return lists;

	}

	//��ü ������
	public List<BasketDTO> getLists(String id){

		List<BasketDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			sql = "select b.itemNum, i.itemName, b.id, b.amount, b.price, i.thumFile "
					+ "from basket b, items i where b.itemNum=i.itemNum and b.id=? order by b.itemNum desc ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);//�������� �޾ƿð�
			
			rs = pstmt.executeQuery();

			while(rs.next()) {

				BasketDTO dto = new BasketDTO();

				dto.setItemNum(rs.getInt("itemNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setId(rs.getString("id"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getInt("price"));
				dto.setThumFile(rs.getString("thumFile"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return lists;

	}

	//��ü����
	public int deleteData() {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete basket";

			pstmt = conn.prepareStatement(sql);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	//���� ����
	public int deleteData(int itemNum) {

		int result = 0;
		String id = "test";
		
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "delete basket where itemNum=? and id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, itemNum);
			pstmt.setString(2, id); //���� �޾ƿ���

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

}
