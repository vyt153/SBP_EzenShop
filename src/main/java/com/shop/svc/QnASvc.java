package com.shop.svc;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shop.dto.QnADto;

public interface QnASvc {

	List<QnADto> qnaList();
	
	boolean write(HttpServletRequest req) throws IOException;
	
	QnADto read(int num);

	boolean modify(HttpServletRequest req) throws IOException;

	void delete(int num);

	boolean reply(HttpServletRequest req) throws IOException;
}
