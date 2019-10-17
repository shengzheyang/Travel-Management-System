package pers.shengzy.service;

import pers.shengzy.domain.SysLog;

public interface LogService {
    /**
     * save log
     * @param log
     */
    void save(SysLog log);
}
