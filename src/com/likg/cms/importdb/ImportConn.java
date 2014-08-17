package com.likg.cms.importdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

/**
 * 数据库连接工具类
 * 
 * @author likg
 */
public class ImportConn {
	
	static Logger log = Logger.getLogger(ImportConfig.class);
	
	/**
	 * 加载数据库驱动
	 */
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			log.error("加载驱动时出现异常！", e);
		}
	}

	/**
	 * 创建数据库连接
	 * 
	 * @return：数据库连接对象
	 */
	public static Connection getConnection() {
		Connection conn = null;

		try {
			String url = ImportConfig.url;
			String user = ImportConfig.username;
			String password = ImportConfig.password;

			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			log.error("获取数据库连接时出现异常！", e);
		}

		return conn;
	}

	/**
	 * 关闭JDBC对象
	 * 
	 * @param rs
	 *            ：ResultSet结果集对象
	 * @param stmt
	 *            ：Statement数据库操作对象
	 * @param conn
	 *            ：Connection数据库连接对象
	 */
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			log.error("关闭ResultSet对象出现异常！", e);
		}

		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			log.error("关闭Statement对象出现异常！", e);
		}

		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			log.error("关闭Connection对象出现异常！", e);
		}
	}
}
