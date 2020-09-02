package com.wezion.data;

import java.util.ArrayList;
 
public interface MemberMapper {
    ArrayList<Member> getMembers();
    void insertMember(Member member);
    void updateMember(String name);
    void deleteMember(String name);
}
