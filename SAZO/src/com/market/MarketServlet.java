package com.market;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.items.BasketDAO;
import com.items.BasketDTO;
import com.items.ItemsDAO;
import com.items.ItemsDTO;
import com.items.OrdersDAO;
import com.items.OrdersDTO;
import com.member.MemberDAO;
import com.member.MemberDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyUtil;

public class MarketServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String cp = req.getContextPath();

		Connection conn = DBConn.getConnection();
		ItemsDAO dao = new ItemsDAO(conn);
		BasketDAO daoba = new BasketDAO(conn);
		OrdersDAO daood = new OrdersDAO(conn);
		MemberDAO daom = new MemberDAO(conn);
		MyUtil myUtil = new MyUtil();
		
		String uri = req.getRequestURI();

		String url;

		//���� ���� ���
		String root = getServletContext().getRealPath("/");
		String path = root + "product" + File.separator + "imageFile" + (dao.getMaxNum()+1);

		File f = new File(path);

		if(!f.exists()) {
			f.mkdirs();
		}

		if(uri.indexOf("write.do")!=-1) {

			url = "/manage/write.jsp";
			forward(req, resp, url);
		}

		else if(uri.indexOf("write_ok.do")!=-1) {

			//���� ���ε�
			String encType = "UTF-8";
			int maxSize = 30 * 1024 * 1024;

			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());

			//�������� DB�� ����
			if(mr.getFile("thumFile")!=null && mr.getFile("image1")!=null) {
				System.out.println("DB����Ϸ�");
				ItemsDTO dto = new ItemsDTO();

				int maxNum = dao.getMaxNum();

				dto.setItemNum(maxNum + 1);
				System.out.println(dto.getItemNum());

				dto.setItemName(mr.getParameter("itemName"));
				System.out.println(dto.getItemName());

				dto.setItemInfo(mr.getParameter("itemInfo"));
				System.out.println(dto.getItemInfo());

				dto.setAllegy(mr.getParameter("allegy"));
				dto.setUnit(mr.getParameter("unit"));
				dto.setKg(mr.getParameter("kg"));
				
				dto.setPrice(Integer.parseInt(mr.getParameter("price")));
				System.out.println(dto.getPrice());

				dto.setThumFile(mr.getFilesystemName("thumFile"));
				System.out.println(dto.getThumFile());

				dto.setImage1(mr.getFilesystemName("image1"));
				System.out.println(dto.getImage1());

				dto.setImage2(mr.getFilesystemName("image2"));
				System.out.println(dto.getImage2());

				dto.setCategory(mr.getParameter("category"));
				System.out.println(dto.getCategory());
				
				dto.setComments(mr.getParameter("comments"));
				System.out.println(dto.getComments());

				dao.insertData(dto);

			}

			url = cp + "/admin/list.do";
			resp.sendRedirect(url);
		}

		else if(uri.indexOf("list.do")!=-1) {
			List<ItemsDTO> lists = null;

			//
			MyUtil MyUtil = new MyUtil();

			//��ü������ ���� ���ϱ�
			int dataCount = dao.getDataCount();

			//�ϳ��� �������� ǥ���� ������ ����
			int numPerPage = 9;

			//��ü ������ ����
			int totalPage = 0;

			if(dataCount!=0) {
				totalPage = MyUtil.getPageCount(numPerPage, dataCount);
			}

			//�Ѿ�� ������ ��ȣ
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;

			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}

			//������ ������ ����¡ �߰�ó��
			if(currentPage >totalPage) {
				currentPage = totalPage;
			}

			//������ �������� ���۰� ��
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			lists = dao.getLists(start, end);

			//����¡ ó��
			String listUrl = cp + "/admin/list.do";

			String pageIndexList = MyUtil.pageIndexList(currentPage, totalPage, listUrl);	
			//

			//���ϻ������
			String deletePath = cp + "/admin/delete.do?pageNum=" + currentPage;
			//�ٿ�ε���
			String downloadPath = cp + "/manage/download.do";
			//�̹��� ���
			String imagePath = cp + "/product/imageFile"; //�̹����� �����ּ�X

			req.setAttribute("lists", lists);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("currentPage", currentPage);

			req.setAttribute("deletePath", deletePath);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("pageIndexList", pageIndexList);

			url = "/manage/list.jsp";
			forward(req, resp, url);

		}
		
		if(uri.indexOf("login.do")!=-1) {
			
			url = "/views/login.jsp";
			forward(req, resp, url);
	
			
		}else if(uri.indexOf("login_ok.do")!=-1) {
			
			String id = req.getParameter("id");
			
			
			HttpSession session = req.getSession();
			
			MemberDTO dto = daom.getReadData(id);
			
			if(dto==null) {

				url = "/market/login.do";
				forward(req, resp, url);
				return; //��â�� �߸� �Ʒ��ڵ��� �����ϸ� �ȵǹǷ� return�� ���־� ������.
				
			}
			MemberDTO test = new MemberDTO();
			
			test.setId(id);
			session.setAttribute("test", test);
				
			url = cp + "/market/main.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("main.do")!=-1) {
			
			
			
			List<ItemsDTO> lists_m = dao.getLists();

			//�̹��� ���
			String imagePath = cp + "/product/imageFile";

			req.setAttribute("lists_m", lists_m);
			req.setAttribute("imagePath", imagePath);	
			
			
			url = "/views/mainpage.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("view.do")!=-1) {
			
			url = "/views/view.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("join.do")!=-1) {
			
			url = "/views/join.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("join_ok.do")!=-1) {
			
			MemberDTO dto = new MemberDTO();
			
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			
			dto.setId(req.getParameter("id"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setTel(req.getParameter("tel"));
			dto.setAddr1(req.getParameter("addr1"));
			dto.setAddr2(req.getParameter("addr2"));
			dto.setAddr3(req.getParameter("addr3"));
			dto.setBirth(req.getParameter("birth"));
			dto.setGender(req.getParameter("gender"));
			
			daom.insertData(dto);
			
			req.setAttribute("id", id);
			req.setAttribute("name", name);
			req.setAttribute("email", email);
			
			url = "/views/myJoin2.jsp";
			forward(req, resp, url);
			
			/*url = cp + "/member/myJoin.do";
			resp.sendRedirect(url);*/
			

	
			
		}else if(uri.indexOf("mypage.do")!=-1) {
			
			List<OrdersDTO> orderlist = null;
			HttpSession session = req.getSession();
			
			MemberDTO test = (MemberDTO)session.getAttribute("test");
			
			String id = test.getId();
			

			orderlist = daood.getLists(id); //�������̵� ���Ѱɷ� �����;��� ������ �����Ұ�

			System.out.println(orderlist);
			
			String imagePath = cp + "/product/imageFile"; //����� ���� �̹��� ������������

			req.setAttribute("orderlist", orderlist);
			req.setAttribute("imagePath", imagePath);
			url = "/views/mypage.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("logout.do")!=-1) {
			
			HttpSession session = req.getSession();
			
			 //������ ����°�.
			session.invalidate(); //���� ������ ����°�
			
			url = cp + "/market/main.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("destination.do")!=-1) {
			
			
			
			url = "/views/destination.jsp";
			forward(req, resp, url);
	
		}else if(uri.indexOf("product.do")!=-1) {

				int itemNum = Integer.parseInt(req.getParameter("itemNum"));

				
				
				ItemsDTO dto = dao.getReadData(itemNum);
				System.out.println(dto);
				dto.setComments(dto.getComments().replace("\n", "<br/>"));
				//�̹��� ���
				String imagePath = cp + "/product/imageFile";

				req.setAttribute("dto", dto);
				req.setAttribute("imagePath", imagePath);
				
				

				url = "/product/product1.jsp";
				forward(req, resp, url);
			}

			else if(uri.indexOf("delete.do")!=-1) {

				String pageNum = req.getParameter("pageNum");

				int itemNum = Integer.parseInt(req.getParameter("itemNum"));

				ItemsDTO dto = dao.getReadData(itemNum);

				//���ϻ���
				FileManager.doFileDelete(dto.getThumFile(), path); //���������̸� ���� ��������� �̸�
				FileManager.doFileDelete(dto.getImage1(), path);
				FileManager.doFileDelete(dto.getImage2(), path);

				//DB����
				dao.deleteData(itemNum);
				url = cp + "/admin/list.do?pageNum=" + pageNum ;
				resp.sendRedirect(url);

			}

			//��ٱ��� ���ǳѰ��ֱ�,Ȥ�� basket�� ������ �־��ֱ�, getReadData(itemNum)������ ������ ������ insert ������ update
			else if(uri.indexOf("basket.do")!=-1) {
				HttpSession session = req.getSession();
				
				MemberDTO test = (MemberDTO)session.getAttribute("test");
				String id = test.getId();
				
				int itemNum = Integer.parseInt(req.getParameter("itemNum"));
				//System.out.println(itemNum);
				int amount = Integer.parseInt(req.getParameter("amount"));
				//System.out.println(amount);

				//���̺�
				int price = Integer.parseInt(req.getParameter("sum"));
				
				
				BasketDTO dto = new BasketDTO();

				dto.setItemNum(itemNum);
				dto.setAmount(amount);
				dto.setPrice(price);
				dto.setId(id);  //���ǿ��� �޾ƿͼ� id�߰�
				
				System.out.println(itemNum + " / " + amount + " / " + price + " / " + id);

				System.out.println(daoba.insertData(dto,itemNum,id) + "--------------------------------------");

				url = cp + "/market/product.do?itemNum=" + itemNum;
				resp.sendRedirect(url);

			}

			else if(uri.indexOf("basketck.do")!=-1) {
				List<BasketDTO> lists = null;
				HttpSession session = req.getSession();
				
				MemberDTO test = (MemberDTO)session.getAttribute("test");
				
				String id = test.getId();
				
				lists = daoba.getLists(id); //�������̵� ���Ѱɷ� �����;��� ������ �����Ұ�

				String imagePath = cp + "/product/imageFile"; //����� ���� �̹��� ������������

				req.setAttribute("lists", lists);
				req.setAttribute("imagePath", imagePath);

				url = "/product/basketck2.jsp";
				forward(req, resp, url);
			}

			else if(uri.indexOf("deleteall.do")!=-1) {
				HttpSession session = req.getSession();
				
				MemberDTO test = (MemberDTO)session.getAttribute("test");
				String id = test.getId();
				
				//id=���ǿ��� �޾ƿ� ���̵�
				//DB����
				daoba.deleteData();
				url = cp + "/market/basketck.do?id=" + id;// ���ǿ��� id�޾Ƽ� �ֱ�
				resp.sendRedirect(url);

			}

			else if(uri.indexOf("basketclear.do")!=-1) {
				
				//userid�ް� itemnum �޾Ƽ� ����
				int itemNum = Integer.parseInt(req.getParameter("itemNum"));
				HttpSession session = req.getSession();
				
				MemberDTO test = (MemberDTO)session.getAttribute("test");
				String id = test.getId();
				
				//DB����
				daoba.deleteData(itemNum);
				url = cp + "/market/basketck.do?id=" + id;
				resp.sendRedirect(url);

			}

			else if(uri.indexOf("pay.do")!=-1) {

				//orders���� �����ϰ�
				//�ٽ��� ������ ����
				OrdersDTO dto = new OrdersDTO();

				int maxNum = daood.getMaxOrderNum();

				HttpSession session = req.getSession();
				
				MemberDTO test = (MemberDTO)session.getAttribute("test");
				String id = test.getId();
				
				dto.setOrderNum(maxNum + 1);

				dto.setId(id); //session id �޾Ƽ� �ֱ�
				
				daood.insertData(dto);

				url = cp + "/market/mypage.do";
				resp.sendRedirect(url);

			}
			
			else if(uri.indexOf("order.do")!=-1) {
				HttpSession session = req.getSession();
				
				MemberDTO test = (MemberDTO)session.getAttribute("test");
				String id = test.getId();
				//Basket���� Orders�� �����ִ� �κ�
				List<BasketDTO> lists = null;
				lists = daoba.getLists(id);
				int OrderNum = daood.getMaxOrderNum();
				
				for(BasketDTO dtoba : lists) {
					
					OrdersDTO dtoor = new OrdersDTO();
					
					dtoor.setOrderNum(OrderNum + 1);
					dtoor.setAmount(dtoba.getAmount());
					dtoor.setId(id); //���ǿ��� �޾ƿ��� id�� �����Ұ�
					dtoor.setItemNum(dtoba.getItemNum());
					dtoor.setPrice(dtoba.getPrice());
					
					daood.insertData(dtoor);
					
					OrderNum++;
				}
				
				//DB����
				daoba.deleteData();
				
				//�ֹ������� �ѷ��� �κ�
				List<OrdersDTO> orderlist = null;
				
				

				orderlist = daood.getLists(id); //�������̵� ���Ѱɷ� �����;��� ������ �����Ұ�

				System.out.println(orderlist);
				
				String imagePath = cp + "/product/imageFile"; //����� ���� �̹��� ������������

				req.setAttribute("orderlist", orderlist);
				req.setAttribute("imagePath", imagePath);
				
				url = "/views/mypage.jsp";
				forward(req, resp, url);
			}else if(uri.indexOf("check1.do")!=-1) {
				String message = "test";
				String id = req.getParameter("id");
				System.out.println(id);

				MemberDTO dto = daom.getReadData(id);
				System.out.println(dto);
				if(dto==null) {
					message ="��밡���� ID�Դϴ�.";
					
				}else {
					message ="���Ұ����� ID�Դϴ�.";
				
				}

				/*url = "/SAZO/marketMember/idCheck.jsp";
				resp.sendRedirect(url);*/
				
				req.setAttribute("message", message);
				
				req.setAttribute("id", id);
				url = "/views/idCheck.jsp";
				forward(req, resp, url);

			}
			else if(uri.indexOf("check.do")!=-1) {

				url = "/views/idCheck.jsp";
				forward(req, resp, url);

			}else if(uri.indexOf("list_new.do")!=-1) { //�Ż�ǰ

				int num;
				num = Integer.parseInt(req.getParameter("num"));

				if(req.getParameter("num")==null || req.getParameter("num").equals("")) {
					num=2;
				}

				//��ü������ ���� ���ϱ�
				int dataCount = dao.getDataCount();

				//�ϳ��� �������� ǥ���� ������ ����
				int numPerPage = 6;

				//��ü ������ ����
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				//�Ѿ�� ������ ��ȣ
				String pageNum = req.getParameter("pageNum");		

				int currentPage = 1;

				if(pageNum!=null) {
					currentPage = Integer.parseInt(pageNum);				
				}

				//������ ������ ����¡ �߰�ó��
				if(currentPage>totalPage)
					currentPage = totalPage;

				//������ �������� ���۰� ��
				int start = (currentPage-1)*numPerPage+1;
				int end = currentPage*numPerPage;

				List<ItemsDTO> lists_h = dao.getLists_h(start, end);
				List<ItemsDTO> lists_d = dao.getLists_d(start, end);
				List<ItemsDTO> lists_hp = dao.getLists_hp(start, end);
				List<ItemsDTO> lists_lp = dao.getLists_lp(start, end);

				//����¡ ó��
				String listUrl = cp + "/market/list_new.do?num=" + num;

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

				//�̹��� ���
				String imagePath = cp + "/product/imageFile";

				req.setAttribute("lists_h", lists_h);
				req.setAttribute("lists_d", lists_d);
				req.setAttribute("lists_hp", lists_hp);
				req.setAttribute("lists_lp", lists_lp);

				req.setAttribute("dataCount", dataCount);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("currentPage", currentPage);

				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("imagePath", imagePath);	

				url = "/items/list_new.jsp?num="+num;
				forward(req, resp, url);	

				
			}else if(uri.indexOf("list_best.do")!=-1) { //����Ʈ
				
				
				
				int num;
				num = Integer.parseInt(req.getParameter("num"));

				if(req.getParameter("num")==null || req.getParameter("num").equals("")) {
					num=3;
				}

				//��ü������ ���� ���ϱ�
				int dataCount = dao.getDataCount();

				//�ϳ��� �������� ǥ���� ������ ����
				int numPerPage = 6;

				//��ü ������ ����
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				//�Ѿ�� ������ ��ȣ
				String pageNum = req.getParameter("pageNum");		

				int currentPage = 1;

				if(pageNum!=null) {
					currentPage = Integer.parseInt(pageNum);				
				}

				//������ ������ ����¡ �߰�ó��
				if(currentPage>totalPage)
					currentPage = totalPage;

				//������ �������� ���۰� ��
				int start = (currentPage-1)*numPerPage+1;
				int end = currentPage*numPerPage;

				List<ItemsDTO> lists_h = dao.getLists_h(start, end);
				List<ItemsDTO> lists_d = dao.getLists_d(start, end);
				List<ItemsDTO> lists_hp = dao.getLists_hp(start, end);
				List<ItemsDTO> lists_lp = dao.getLists_lp(start, end);

				//����¡ ó��
				String listUrl = cp + "/market/list_best.do?num=" + num;

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

				//�̹��� ���
				String imagePath = cp + "/product/imageFile";

				req.setAttribute("lists_h", lists_h);
				req.setAttribute("lists_d", lists_d);
				req.setAttribute("lists_hp", lists_hp);
				req.setAttribute("lists_lp", lists_lp);

				req.setAttribute("dataCount", dataCount);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("currentPage", currentPage);

				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("imagePath", imagePath);	

				url = "/items/list_best.jsp?num="+num;
				forward(req, resp, url);	
				
			}else if(uri.indexOf("list_price.do")!=-1) { //�˶��ǰ
				
				int num = Integer.parseInt(req.getParameter("num"));

				if(req.getParameter("num")==null || req.getParameter("num").equals("")) {
					num=2;
				}

				//��ü������ ���� ���ϱ�
				int dataCount = dao.getDataCount();

				//�ϳ��� �������� ǥ���� ������ ����
				int numPerPage = 6;

				//��ü ������ ����
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				//�Ѿ�� ������ ��ȣ
				String pageNum = req.getParameter("pageNum");		

				int currentPage = 1;

				if(pageNum!=null) {
					currentPage = Integer.parseInt(pageNum);				
				}

				//������ ������ ����¡ �߰�ó��
				if(currentPage>totalPage)
					currentPage = totalPage;

				//������ �������� ���۰� ��
				int start = (currentPage-1)*numPerPage+1;
				int end = currentPage*numPerPage;

				List<ItemsDTO> lists_h = dao.getLists_h(start, end);
				List<ItemsDTO> lists_d = dao.getLists_d(start, end);
				List<ItemsDTO> lists_hp = dao.getLists_hp(start, end);
				List<ItemsDTO> lists_lp = dao.getLists_lp(start, end);

				//����¡ ó��
				String listUrl = cp + "/market/list_price.do?num=" + num;

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

				//�̹��� ���
				String imagePath = cp + "/product/imageFile";

				req.setAttribute("lists_h", lists_h);
				req.setAttribute("lists_d", lists_d);
				req.setAttribute("lists_hp", lists_hp);
				req.setAttribute("lists_lp", lists_lp);

				req.setAttribute("dataCount", dataCount);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("currentPage", currentPage);

				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("imagePath", imagePath);	

				url = "/items/list_price.jsp?num="+num;
				forward(req, resp, url);
							
				
			}else if(uri.indexOf("search.do")!=-1) { //�˻�		
				
				int num = Integer.parseInt(req.getParameter("num"));
				String searchValue = req.getParameter("searchValue");			
				String pageNum = req.getParameter("pageNum");//�Ѿ�� ������ ��ȣ
				String itemNum = req.getParameter("itemNum");
							
				int currentPage = 1;

				if(pageNum!=null) {
					currentPage = Integer.parseInt(pageNum);				
				}			
				
				//�˻� �� Ȯ��
				if(searchValue==null||searchValue.equals("")) {
					searchValue = "";
				}else {
					if(req.getMethod().equalsIgnoreCase("GET")) {
						searchValue = URLDecoder.decode(searchValue, "UTF-8"); 
					}
				}
				
				//��ü������ ���� ���ϱ�
				int dataCount = dao.getDataCount(searchValue);

				//�ϳ��� �������� ǥ���� ������ ����
				int numPerPage = 6;

				//��ü ������ ����
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				//������ ������ ����¡ �߰�ó��
				if(currentPage>totalPage)
					currentPage = totalPage;

				//������ �������� ���۰� ��
				int start = (currentPage-1)*numPerPage+1;
				int end = currentPage*numPerPage;

				List<ItemsDTO> lists = dao.getLists(start, end, searchValue);

				String param = "";
				if(searchValue!=null && !searchValue.equals("")) {
					param = "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
				}
				
				//����¡ ó��
				String listUrl = cp + "/market/search.do?num=" + num;
				
				if(!param.equals("")) { //�˻��ߴ�
					listUrl += "&" + param;
				}

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

				//��ǰ������ ���
				String productUrl = cp + "/market/product.do?pageNum=" + currentPage + "&num=" + num + "&itemNum" + itemNum;			
				if(!param.equals("")) {
					productUrl += "&" + param;
				}
				
				//�̹��� ���
				String imagePath = cp + "/product/imageFile";

				req.setAttribute("lists", lists);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("currentPage", currentPage);

				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("imagePath", imagePath);
				req.setAttribute("productUrl", productUrl);
				req.setAttribute("params", param);

				req.setAttribute("searchValue", searchValue);
							
				url = "/items/search.jsp?num="+num+param;
				forward(req, resp, url);

			}else if(uri.indexOf("list_cate.do")!=-1) { //ī�װ�������
				
				String category = req.getParameter("category");

				//��ü������ ���� ���ϱ�
				int dataCount = dao.getDataCount1(category);
				//������ where category
				
				
				//�ϳ��� �������� ǥ���� ������ ����
				int numPerPage = 6;

				//��ü ������ ����
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);

				//�Ѿ�� ������ ��ȣ
				String pageNum = req.getParameter("pageNum");		

				int currentPage = 1;

				if(pageNum!=null) {
					currentPage = Integer.parseInt(pageNum);				
				}

				//������ ������ ����¡ �߰�ó��
				if(currentPage>totalPage)
					currentPage = totalPage;

				//������ �������� ���۰� ��
				int start = (currentPage-1)*numPerPage+1;
				int end = currentPage*numPerPage;

				List<ItemsDTO> lists_c = dao.getLists1(start, end, category);

				//����¡ ó��
				String listUrl = cp + "/market/list_cate.do?category=" + category;

				String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

				//�̹��� ���
				String imagePath = cp + "/product/imageFile";

				req.setAttribute("lists_c", lists_c);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("currentPage", currentPage);

				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("imagePath", imagePath);	

				url = "/views/list_cate.jsp?category=" + category;
				forward(req, resp, url);

			}
			
	}
}



