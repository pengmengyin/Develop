package com.peng.service.impl;



import com.peng.entity.Photo;
import com.peng.entity.Stonename;
import com.peng.mapper.StudyMapper;

import com.peng.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("studyService")
public class StudyServiceImpl implements StudyService {
    @Autowired
    private StudyMapper studyMapper;

    @Override
    public Object searchphoto(int id) {
        Object photo = null;
        try {
            photo = studyMapper.searchphoto(id);
            return photo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Set<Object> searchname(int id) {
        Set<Object> name = new HashSet<>();
        Object nameA =null;
        try{
            List<Stonename> names = studyMapper.searchother(id);
            nameA = studyMapper.searchname(id);
            for(Stonename stone :names)
            {
                name.add(stone);
            }
            name.add(nameA);
            return name;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public Void updatescore(Long tel, Integer score) {
        try{
            Integer score1=studyMapper.searchscore(tel);
            score=score+score1;
            return studyMapper.updatescore(tel,score);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Void inserquestion(Long tel, int id) {
        try{
            Long getid=studyMapper.searchid(tel).getId();
            Integer ID = getid.intValue();
            Photo name =studyMapper.searchview(id);
            Photo photo = (Photo) studyMapper.searchphoto(id);
            studyMapper.inserquestion(ID,name.getName(),photo.getSrc());

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }
}
