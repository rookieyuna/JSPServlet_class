package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model1.board.BoardDTO;

public class MVCBoardDAO extends DBConnPool {
	//기본생성자 없어도 동작에는 영향이없다.
	public MVCBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		//카운트변수
		int totalCount =0;
		//쿼리문 작성
		String query = "SELECT COUNT(*) FROM mvcboard";
		//검색어가 있는 경우 where절 조건을 동적으로 추가한다.
		if(map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%' "; 
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			//결과 데이터를 읽음 (게시물 개수는 데이터가 한개뿐!)
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	
	
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		
		//3개의 쿼리문을 통한 페이지 처리
		String query = "SELECT * FROM ( "
					 + "	SELECT tb.*, ROWNUM rNUM FROM ( "
					 + "		SELECT * FROM mvcboard ";	
		
		//검색 조건 추가(검색어가 있는 경우에만 where절이 추가됨)
		if(map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
				   + " LIKE '%" + map.get("searchWord") + "%' "; 
		}
		query += " 		ORDER BY idx DESC "
			   + " 	  ) tb "
			   + " ) "
			   + " WHERE rNum BETWEEN ? AND ? ";
		/*JSP에서 계산된 게시물의 구간을 인파라미터로 처리함*/
		
		try {
			psmt = con.prepareStatement(query);
			//인파라미터 설정 : 구간을 위한 start, end를 설정
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			//쿼리문 실행
			rs = psmt.executeQuery();
			
			//select한 게시물의 갯수만큼 반복함
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				//리스트 컬렉션에 DTO객체를 추가한다.
				board.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		//목록 반환
		return board;
	}
	
	
	//새로운 게시물에 대한 입력처리
	public int insertWrite(MVCBoardDTO dto) {
		//입력결과 확인용 변수
		int result=0;
		
		try {
			//인파라미터가 있는 쿼리문 작성(동적쿼리문)
			String query = " INSERT INTO mvcboard ( "
						+ " idx,name,title,content,ofile,sfile,pass) "
						+ " VALUES ( "
						+ " seq_board_num.NEXTVAL,?,?,?,?,?,?)";
			//동적쿼리문 실행을 위한 prepared 객체 생성
			psmt = con.prepareStatement(query);
			//순서대로 인파라미터 설정
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			//쿼리문 실행 : 입력에 성공하면 1, 실패하면 0 반환
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
	
}
