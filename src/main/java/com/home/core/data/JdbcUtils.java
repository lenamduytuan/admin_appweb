package com.home.core.data;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;

import com.home.core.util.ResourceUtils;
import com.home.core.util.SpringUtils;

import oracle.jdbc.pool.OracleDataSource;

public class JdbcUtils {
	private static ResourceBundle RB = null;
	static{
		try{
			RB = ResourceUtils.getResourceBundle("config", Locale.getDefault());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private static OracleDataSource ods=null;
	private static Object lock=new Object();
	
	private static OracleDataSource getDataSource() throws Exception{
        synchronized(lock){ 
            if(ods==null){
                try{
                	String username = ResourceUtils.getString(RB,"username");
                	String password = ResourceUtils.getString(RB,"password");
                	String url = ResourceUtils.getString(RB,"url");
                    ods = new OracleDataSource();
                    ods.setURL(url);
                    ods.setUser(username);
                    ods.setPassword(password);
                }catch (Exception ex){
                    throw ex;
                }
            }
        }
        return ods;
    }
	
	private static OracleDataSource getDataSourceBMT() throws Exception{
        synchronized(lock){ 
            if(ods==null){
                try{
                    ods = new OracleDataSource();
                    ods.setURL(ResourceUtils.getString(RB,"urlBMT"));
                }catch (Exception ex){
                    throw ex;
                }
            }
        }
        return ods;
    }
  
    public static Connection getConnection() throws Exception{
        Connection conn = null;    
        String bctc_tt_db = ResourceUtils.getString(RB,"bctc_tt_db");
        try{        	
        	if("2".equals(bctc_tt_db)){
        		conn = getDataSource().getConnection();
        	}else{
	        	ApplicationContext appContext =  SpringUtils.getSpringContext();
	        	DataSource dataSource = (DataSource)appContext.getBean("dataSource");
	        	conn = dataSource.getConnection();
        	}
        }catch (Exception ex){
            throw ex;
        }
        return conn;
    }
    
    public static Connection getConnectionTDTTTCT() throws Exception{
        Connection conn = null;    
        try{
            conn = getDataSource().getConnection();
        }catch (Exception ex){
            throw ex;
        }
        return conn;
    }
    
    public static Connection getConnectionNtkXml() throws Exception{
        Connection conn = null;    
        try{
            conn = getDataSource().getConnection();
        }catch (Exception ex){
            throw ex;
        }
        return conn;
    }

    public static void releaseConnection(Connection conn){
        if(conn!=null){
            try{
                conn.close();
            }
            catch (SQLException e) {}
        }
    }
  
    public static void releaseCallableStatement(CallableStatement cs){
       if(cs!=null){
            try{
              cs.close();
            }catch (SQLException e) {}
        }
    }
  
    public static void releaseResultSet(ResultSet rs){
        if(rs!=null){
            try{
              rs.close();
            }catch (SQLException e) {}
        }
    }
  
    public static void releasePreparedStatement(PreparedStatement ps){
       if(ps!=null){
            try{
              ps.close();
            }catch (SQLException e) {}
        }
    }
     
    public static String getOwnerAccountBCTC() throws SQLException {
		Connection conn = null;
		CallableStatement cs = null;
		String sql = null;
		String userName = "";
		String password = "";
		String account = "";

		try {
			conn = getDataSourceBMT().getConnection();
			sql = "{call bmt_pck_bmht.prc_get_key()}";
			cs = conn.prepareCall(sql);
			cs.executeQuery();
			
			sql = "call bmt_pck_bmht.Prc_Get_App_Owner(?, ?, ?)";
			cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, Types.VARCHAR);
			cs.registerOutParameter(2, Types.VARCHAR);
			cs.setString(3, "BCTC");
			cs.executeQuery();
			userName = cs.getString(1);
			password = cs.getString(2);			
			account += userName + "=" + password;
			
		} catch (Exception sqle) {
			sqle.printStackTrace();
		} finally {
			releaseCallableStatement(cs);
			releaseConnection(conn);
		}
		return account;
	}
}
