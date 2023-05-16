package com.peng.service;

import java.util.Set;

public interface StudyService {

    Object searchphoto(int id);

    Set<Object> searchname(int id);

    Void updatescore(Long tel, Integer score);

    Void inserquestion(Long tel, int id);
}
