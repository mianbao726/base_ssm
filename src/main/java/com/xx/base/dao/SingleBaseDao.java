package com.xx.base.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public  class SingleBaseDao extends SqlSessionDaoSupport {
	
	private Logger log4j = Logger.getLogger(SingleBaseDao.class);
  	private SqlSessionTemplate sqlSessionTemplate;  
     
    public SqlSessionTemplate getSqlSessionTemplate() {  
        return sqlSessionTemplate;  
    }  
  
    @Resource(name="sqlSessionTemplate")  
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {  
        super.setSqlSessionTemplate(sqlSessionTemplate); 
    }  
    

	@SuppressWarnings("unchecked")
	public <T> List<T> selectList(String sqlid, Object paramObj) {
		return (List<T>) this.getSqlSession().selectList(sqlid, paramObj);
	}
	
	@SuppressWarnings("unchecked")
	public Map selectListByPage(String sqlAll,String sqlTotal, Map paramsMap) {
		
		Map result = new HashMap();
		
		List list  = selectList(sqlAll, paramsMap);
		result.put("data", list);
		
		
		if(null != paramsMap.get("start")){
			
			int total = list.size();
			Object totalObj =  selectOne(sqlTotal,
					paramsMap);

			if (totalObj != null) {
				
				if(!(totalObj instanceof Integer)){
					
					throw new RuntimeException("selectAllTotal 的　resultType　应该是 int类型，请检查对应的 T_XX_XX.xml文件的配置");
				}
				total = (Integer) totalObj;
			}
			
			result.put("recordsTotal", total);
			result.put("recordsFiltered", total);
		}		
		
		return result;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> selectList(String sqlid) {
		return (List<T>) this.getSqlSession().selectList(sqlid);
	}
	@SuppressWarnings("unchecked")
	public <T> List<T> selectList(String sqlid,Object paramObj,RowBounds arg3) {
		return (List<T>) this.getSqlSession().selectList(sqlid, paramObj, arg3);
	}
	@SuppressWarnings("unchecked")
	public <T> T selectOne(String sqlid) {
		return (T) this.getSqlSession().selectOne(sqlid);
	}
	@SuppressWarnings("unchecked")
	public <T> T selectOne(String sqlid, Object paramObj) {
		return (T) this.getSqlSession().selectOne(sqlid, paramObj);
	}
	@SuppressWarnings("unchecked")
	public Map selectMap(String arg0,String arg1) {
		return this.getSqlSession().selectMap(arg0, arg1);
	}
	@SuppressWarnings("unchecked")
	public Map selectMap(String arg0,Object arg1,String arg2) {
		return this.getSqlSession().selectMap(arg0, arg1, arg2);
	}
	@SuppressWarnings("unchecked")
	public Map selectMap(String arg0,Object arg1,String arg2,RowBounds arg3) {
		return this.getSqlSession().selectMap(arg0, arg1, arg2, arg3);
	}
	public int delete(String sqlid) {
		return this.getSqlSession().delete(sqlid);
	}
	
	public int delete(String sqlid,Object paramObj) {
		return this.getSqlSession().delete(sqlid, paramObj);
	}
	
	public int insert(String sqlid,Object paramObj) {
		return this.getSqlSession().insert(sqlid, paramObj);
	}
	public int insert(String sqlid) {
		return this.getSqlSession().insert(sqlid);
	}
	public void select(String sqlid,ResultHandler arg1) {
		this.getSqlSession().select(sqlid, arg1);
	}
	public void select(String sqlid,Object paramObj,ResultHandler arg1) {
		this.getSqlSession().select(sqlid, paramObj,arg1);
	}
	public void select(String sqlid,Object paramObj,RowBounds arg3,ResultHandler arg1) {
		this.getSqlSession().select(sqlid,paramObj,arg3, arg1);
	}
	
	public int update(String sqlid,Object paramObj) {
		return this.getSqlSession().update(sqlid, paramObj);
	}
	public int update(String sqlid) {
		return this.getSqlSession().update(sqlid);
	}

	/**
	 * 批量更新
	 * 方法描述：批量更新（效率没有在配置文件上的高）
	 * @param statementName
	 * @param list
	 * @throws DataAccessException
	 * @author anps
	 * @date 2013-4-3 上午11:14:37
	 * @comment
	 */
	public void batchUpdate(final String statementName, final List list)  throws DataAccessException{
		SqlSession session = sqlSessionTemplate.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
		try{
			if(null != list || list.size() > 0){
				int size = 10000;
			
				for (int i = 0, n = list.size(); i < n; i++) {
					this.update(statementName, list.get(i));
					if (i % 1000 == 0 || i == size - 1) {
	                    //手动每1000个一提交，提交后无法回滚
						session.commit();
	                    //清理缓存，防止溢出
						session.clearCache();
					}
				} 
			}
		}catch (Exception e){
			session.rollback();
			if (log4j.isDebugEnabled()) {
				e.printStackTrace();
				log4j.debug("batchUpdate error: id [" + statementName + "], parameterObject [" + list + "].  Cause: " + e.getMessage());
			}
		} finally {
			session.close();
        }
	}
	
	 /**
	 * 批量插入
	 * 方法描述：批量插入（效率没有在配置文件上的高）
	 * @param statementName
	 * @param list
	 * @throws DataAccessException
	 * @author anps
	 * @date 2013-4-3 上午11:27:39
	 * @comment
	 */ 
	public void batchInsert(final String statementName, final List list)  throws DataAccessException{

		SqlSession session = sqlSessionTemplate.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
		
		int size = 10000;
		try{
			if(null != list || list.size() > 0){
				for (int i = 0, n = list.size(); i < n; i++) {
					this.insert(statementName, list.get(i));
					if (i % 1000 == 0 || i == size - 1) {
	                    //手动每1000个一提交，提交后无法回滚
						session.commit();
	                    //清理缓存，防止溢出
						session.clearCache();
					}
				}
			}
		}catch (Exception e){
			session.rollback();
			if (log4j.isDebugEnabled()) {
				e.printStackTrace();
				log4j.debug("batchInsert error: id [" + statementName + "], parameterObject [" + list + "].  Cause: " + e.getMessage());
			}
		} finally {
			session.close();
        }
	}

	 /**
	 * 批量删除
	 * 方法描述：批量删除（效率没有在配置文件上的高）
	 * @param statementName
	 * @param list
	 * @throws DataAccessException
	 * @author anps
	 * @date 2013-4-3 上午11:29:53
	 * @comment
	 */ 
	public void batchDelete(final String statementName, final List list)  throws DataAccessException{
		SqlSession session = sqlSessionTemplate.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
		
		int size = 10000;
		try{
			if(null != list || list.size() > 0){
				for (int i = 0, n = list.size(); i < n; i++) {
					this.delete(statementName, list.get(i));
					if (i % 1000 == 0 || i == size - 1) {
	                    //手动每1000个一提交，提交后无法回滚
						session.commit();
	                    //清理缓存，防止溢出
						session.clearCache();
					}
				}
			}
		}catch (Exception e){
			session.rollback();
			if (log4j.isDebugEnabled()) {
				e.printStackTrace();
				log4j.debug("batchDelete error: id [" + statementName + "], parameterObject [" + list + "].  Cause: " + e.getMessage());
			}
		} finally {
			session.close();
        }
	} 

	 
}

 
 
