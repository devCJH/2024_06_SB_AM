package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.FileVO;

@Mapper
public interface FileDao {

	@Insert("""
			INSERT INTO file
				SET regDate = NOW()
					, originName = #{orgName}
					, savedName = #{savedName}
					, savedPath = #{savedPath}
			""")
	void insertFile(String orgName, String savedName, String savedPath);

	@Select("""
			SELECT *
				FROM `file`
			""")
	List<FileVO> getFiles();

	@Select("""
			SELECT *
				FROM `file`
				WHERE id = #{id}
			""")
	FileVO getFileById(int id);
}
