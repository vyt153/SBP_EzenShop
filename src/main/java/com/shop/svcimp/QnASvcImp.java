package com.shop.svcimp;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.dao.QnADao;
import com.shop.dto.QnADto;
import com.shop.svc.QnASvc;

@Service
public class QnASvcImp implements QnASvc{
	
	QnADao qnaDao;
	
	@Autowired
	public QnASvcImp(QnADao qnaDao) {
		this.qnaDao = qnaDao;
	}
	
	private static final int maxSize = 1024 * 1024 * 100;
	private static final String strPath = "classpath:static/qnaDir/";
	
	@Override
	public List<QnADto> qnaList() {
		return qnaDao.qnaList();
	}

	@Override
	public boolean write(HttpServletRequest req) throws IOException  {
		
		int ref = qnaDao.getRef()+1;
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		
		MultipartRequest multi = new MultipartRequest(req, uploadPath, 
				maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
		String filename = multi.getFilesystemName("filename");
		String oriFilename = multi.getOriginalFileName("filename");
		Long filesize = 0L;
		if(filename!=null) {
			filesize = multi.getFile("filename").length();
		}
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("p1", multi.getParameter("uid"));
		map.put("p2", multi.getParameter("qnapw"));
		map.put("p3", multi.getParameter("uname"));
		map.put("p4", multi.getParameter("subject"));
		map.put("p5", multi.getParameter("content"));
		map.put("p6", filename);
		map.put("p7", oriFilename);
		map.put("p8", filesize);
		map.put("p9", ref);
		map.put("p10", 0);
		
		return qnaDao.write(map);
		
	}

	@Override
	public QnADto read(int num) {
		return qnaDao.read(num);
	}
	
	@Override
	public boolean modify(HttpServletRequest req) throws IOException {
		String filename = "";
		String OriginalFileName = "";
		Integer filesize = 0;
		
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		
		MultipartRequest multi = new MultipartRequest(
				req,
				uploadPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				); 
		
		if(Integer.parseInt(multi.getParameter("delFile"))==1) {
			
			String fileName = qnaDao.getFileName(Integer.parseInt(multi.getParameter("num")));
			System.out.println(fileName);
			
			if(fileName!=null) {
				String fileSrc = uploadPath + "/" + fileName;
				File file = new File(fileSrc);
				file.delete();
			}
			
		}
		if(multi.getFilesystemName("filename")!=null) {
			OriginalFileName = multi.getOriginalFileName("filename");
			filename = multi.getFilesystemName("filename");
			filesize = (int)multi.getFile("filename").length();
		}
		
		Map<String, Object>map = new HashMap<>();
		map.put("p1",  Integer.parseInt(multi.getParameter("num")));
		map.put("p2",  multi.getParameter("subject"));
		map.put("p3",  multi.getParameter("content"));
		
		if(filesize>0) {
			map.put("p4",  filename);
			map.put("p5",  filesize);
			map.put("p6",  OriginalFileName);
			return qnaDao.modify(map);
		} else {
			map.put("p4",  "");
			map.put("p5",  0);
			map.put("p6",  "");
			return qnaDao.modify(map);
		}
		
	}

	@Override
	public void delete(int num) {
		qnaDao.delete(num);
	}

	@Override
	public boolean reply(HttpServletRequest req) throws IOException {
		
		String uploadPath = ResourceUtils.getFile(strPath).toPath().toString();
		
		MultipartRequest multi = new MultipartRequest(req, uploadPath, 
				maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
		String filename = multi.getFilesystemName("filename");
		String oriFilename = multi.getOriginalFileName("filename");
		Long filesize = 0L;
		if(filename!=null) {
			filesize = multi.getFile("filename").length();
		}
		Map<String, Object>map = new HashMap<String, Object>();
		
		System.out.println(multi.getParameter("num"));
		map.put("p1", multi.getParameter("uid"));
		map.put("p2", multi.getParameter("qnapw"));
		map.put("p3", multi.getParameter("uname"));
		map.put("p4", multi.getParameter("subject"));
		map.put("p5", multi.getParameter("content"));
		map.put("p6", filename);
		map.put("p7", oriFilename);
		map.put("p8", filesize);
		map.put("p9", multi.getParameter("num"));
		map.put("p10", 1);
		
		return qnaDao.write(map);
	}

}
