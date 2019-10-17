package pers.shengzy.service.impl;

import pers.shengzy.dao.LogDao;
import pers.shengzy.domain.SysLog;
import pers.shengzy.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LogServiceImpl implements LogService {

    @Autowired
    LogDao logDao;
    @Override
    public void save(SysLog log) {
        logDao.save(log);
    }
}
