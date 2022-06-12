package com.items;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {

	private Connection conn;

	public OrdersDAO(Connection conn) {
		this.conn=conn;
	}

	//orderNum�� �ִ밪
	public int getMaxOrderNum() {

		int maxNum= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql="select nvl(max(orderNum),0) from orders"; //null�� ��Ģ������ �ȵǹǷ� 0���־���

			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				maxNum = rs.getInt(1); //�Ļ�column�̶� column�� ���Ұ� �׷��� �÷�����

			}

			rs.close();
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return maxNum;
	}
	//�Է�
	public int insertData(OrdersDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {
			sql="insert into orders (orderNum,orderState,id,itemNum,price,amount,buyDate) "
					+ "values(?,'�����Ϸ�',?,?,?,?,sysdate)";

			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getOrderNum());
			//pstmt.setString(2, dto.getOrderState());
			pstmt.setString(2, dto.getId());//<<�̰� ���ǿ��� �޾ƾ��ҵ�
			pstmt.setInt(3, dto.getItemNum());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setInt(5, dto.getAmount());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	//��ü ������
	public List<OrdersDTO> getLists(String id){

		List<OrdersDTO> lists = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select o.orderNum, i.itemName, o.amount, o.price, o.orderState, i.thumFile, m.addr1, m.addr2, m.addr3, i.itemNum ";
			sql+= "from orders o, items i, member m ";
			sql+= "where o.itemNum=i.itemNum and o.id=m.id and o.id=? ";
			sql+= "order by o.orderNum desc";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);//�������� �޾ƿð�

			rs = pstmt.executeQuery();

			while(rs.next()) {

				OrdersDTO dto = new OrdersDTO();

				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setItemName(rs.getString("itemName"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getInt("price"));
				dto.setOrderState(rs.getString("orderState"));
				dto.setThumFile(rs.getString("thumFile"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setItemNum(rs.getInt("itemNum"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return lists;

	}
}
