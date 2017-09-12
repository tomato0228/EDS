package com.njust.eds.service;

import com.njust.eds.model.Filedata;
import org.springframework.stereotype.Service;

/**
 * @author tomato
 * @create 2017-09-08 下午10:39
 */
@Service
public interface FiledataService {

    public void saveFiledata(Filedata filedata);

    public Filedata getFiledataById(Integer id);
}
