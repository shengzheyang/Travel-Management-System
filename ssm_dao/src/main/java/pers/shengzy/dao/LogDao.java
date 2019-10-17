package pers.shengzy.dao;

import pers.shengzy.domain.SysLog;
import org.apache.ibatis.annotations.Insert;

public interface LogDao {

    @Insert("insert into sys_log values(log_seq.nextval,#{visitTime},#{username},#{ip},#{method})")
    void save(SysLog log);
}
