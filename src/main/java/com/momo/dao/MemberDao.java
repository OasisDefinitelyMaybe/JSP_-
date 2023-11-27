package com.momo.dao;


import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnPool {
	
	public int regMember(MemberDto dto) {
		int res = 0;
		String sql = "insert into member (id , pass, name, regidate, email)\r\n"
				+   " values(?, ?, ?, sysdate, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public MemberDto login(String id, String pass) {
		MemberDto memberDto = new MemberDto();
		String sql = "select     *\r\n"
                      + "from    member\r\n"
                      + "where    id = ?\r\n"
                      + "and      pass = ?";
		
		try {
			// 입력받은 사용자 정보를 DB로부터 조회
			pstmt = con.prepareStatement(sql);
			//파라미터 세팅
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			//쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 로그인 성공
				memberDto.setId(rs.getString(1));
				memberDto.setName(rs.getString(2));
				memberDto.setRegidate(rs.getString(4));
				// 사용자 정보를 Dto에 담아서 반환
				return memberDto;
			} else {
				// 로그인 실패
				return null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		}
	
	}
}
