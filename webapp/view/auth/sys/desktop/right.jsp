<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>jeecms-left</title>
<%@ include file="/view/auth/portal/init.jsp" %>
<%@ include file="/view/auth/sys/desktop/head.jsp" %>
</head>
<body>
<div class="box-positon">
        	 <h1>当前位置: 首页 - 欢迎页</h1>
        </div>
        
        
<div class="body-box">
        <div class="welcom-con">
        	 <div class="we-txt">
             	  <p>
                  欢迎使用JEECMS内容管理系统！<br>
                  JEECMS程序版本： jeecms-2012-beta 【<a target="_blank" href="http://www.jeecms.com">查看最新版本</a>】<br>
                  您上次登录的时间是：2012-06-05<br>
                  已用内存：<span style="color:#0078ff;">968.4MB</span>&nbsp;&nbsp;&nbsp;&nbsp;剩余内存：<span style="color:#ff8400;">47.73MB </span>&nbsp;&nbsp;&nbsp;&nbsp;最大内存：<span style="color:#00ac41;">1016.12MB</span>
                  </p>
             </div>
             <ul class="ms">
             	<li class="wxx">访问量</li><li class="attribute">&#12288;&#12288;&#12288;系统属性</li>
             </ul>
             <div class="ms-xx">
                 <div class="xx-xx">
             	      <table width="100%" cellspacing="0" cellpadding="0" border="0">
             	       <tbody><tr>
                        <td width="20%" height="30" align="right"></td>
                        <td width="25%"><b>PV</b></td>
                        <td width="25%"><b>IP</b></td>
                        <td width="30%"><b>独立访客</b></td>
                    </tr>
                      <tr>
                        <td height="30" align="right">今日：</td>
                     	<td>61</td>
                     	<td>26</td>
                     	<td>26</td>
                    </tr>
                      <tr>
                        <td height="30" align="right">昨日：</td>
                     	<td>165</td>
                     	<td>54</td>
                     	<td>58</td>
                    </tr>
                      <tr>
                        <td height="30" align="right">本周：</td>
                     	<td>310</td>
                     	<td>107</td>
                     	<td>112</td>
                    </tr>
                      <tr>
                        <td height="30" align="right">本月：</td>
                     	<td>500</td>
                     	<td>170</td>
                     	<td>188</td>
                     </tr>
                     <tr>
                        <td height="30" align="right">累计：</td>
                     	<td>23695</td>
                     	<td>4992</td>
                     	<td>7110</td>
                     </tr>
               </tbody></table>
                 </div>
                 <div style="float:left" class="attribute-xx">
                 	  <table width="100%" cellspacing="0" cellpadding="0" border="0">
                          <tbody><tr>
                            <td width="30%" height="30" align="right">操作系统版本：</td>
                            <td height="30"><span class="black">Windows 2003 5.2</span></td>
                        </tr>
                          <tr>
                            <td width="30%" height="30" align="right">操作系统类型：</td>
                            <td height="30"><span class="black">x86 32位</span> </td>
                        </tr>
                          <tr>
                            <td width="30%" height="30" align="right">用户、目录、临时目录：</td>
                            <td height="30"><span class="black">SYSTEM, d:\tomcat6, d:\tomcat6\temp</span></td>
                        </tr><tr>
                            <td width="30%" height="30" align="right">JAVA运行环境：</td>
                            <td height="30"><span>Java(TM) SE Runtime Environment 1.6.0_10-ea-b08</span></td>
                          </tr>
                          <tr>
                            <td width="30%" height="30" align="right">JAVA虚拟机：</td>
                            <td height="30"> <span>Java HotSpot(TM) Client VM 1.6.0_10-ea-b08</span></td>
                        </tr>
                   </tbody></table>  
               </div>
               
               <div class="attribute-xx" style="float:left">
                 	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="30%" height="30" align="right">操作系统版本：</td>
                            <td height="30"><span class="black">${props['os.name']!} ${props['os.version']!}</span></td>
                        </tr>
                          <tr>
                            <td width="30%" height="30" align="right">操作系统类型：</td>
                            <td height="30"><span class="black">${props['os.arch']!} ${props['sun.arch.data.model']!}位</span> </td>
                        </tr>
                          <tr>
                            <td width="30%" height="30" align="right">用户、目录、临时目录：</td>
                            <td height="30"><span class="black">${props['user.name']!}, ${props['user.dir']!}, ${props['java.io.tmpdir']!}</span></td>
                        </tr><tr>
                            <td width="30%" height="30" align="right">JAVA运行环境：</td>
                            <td height="30"><span>${props['java.runtime.name']!} ${props['java.runtime.version']!}</span></td>
                          </tr>
                          <tr>
                            <td width="30%" height="30" align="right">JAVA虚拟机：</td>
                            <td height="30"> <span>${props['java.vm.name']!} ${props['java.vm.version']!}</span></td>
                        </tr>
                   </table>  
               </div>

             </div>
             
  </div>

</div>
</body>
</html>