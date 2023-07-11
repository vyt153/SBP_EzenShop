package com.shop.dto;

import com.shop.oauth.OAuthProvider;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDto {

	
	private 	int		 num;						
    private 	String   uid;				
    private 	String	 upw;					
    private 	String	 uname;				
	private 	String	 gender;					
	private 	String	 uemail;				
	private 	String	 phoneNum;			
	private 	String	 uaddr	;				
	private 	String	 uzipCode;		
	private 	String	 ubirthday;		
	private 	String	 joinTm;	
	private 	OAuthProvider	 oauth;	
}
