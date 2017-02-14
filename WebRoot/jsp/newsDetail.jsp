<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="../css/common.css" />
<style type="text/css">
<!--
-->
</style>
</head>

<body>
<!--页面的头部-->
<div id="header">
    <!--页面顶部-->
    <div class="main-top">
        <div class="logo"><a href=""><span>新闻大视野</span></a></div>
        <div class="login-box">
            <label>用户名</label><input type="text" name="uname" /><label>密码</label><input type="text" name="upassword" /><button>登录</button>
        </div>
         <!--导航-->
        <div class="nav">
            <ul class="clearfix">
                <li><a href="#">首页</a></li>
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">娱乐</a></li>
                <li><a href="#">军事</a></li>
            </ul>
        </div>
    </div>
    <!--banner-->
    <div class="main-banner"><img src="../images/banner.png" /></div>
    <!--搜索横框-->
    <div class="search-box">
        <div class="sl">
            <div class="sr clearfix">
                <span class="left-search clearfix">
                    <label>站内搜索</label><input type="text" name="keyword" value="关键词" /><button class="go-btn"></button>
                </span>
                <span class="right-link">
                    <label>快速链接</label><select><option>-----专题选择-----</option></select><button class="go-btn"></button>
                </span>
            </div>
        </div>    
    </div>
</div>
<!--页面的主体-->
<div id="content" class="main-content clearfix">
	<!--主体的的左边部分-->
    <div class="main-content-left">
        <!--新闻专题分类-->
        <div class="class-box">
            <div class="class-box-header">
                <span class="fr"><a href="#">更多...</a></span>
                <h3>新闻专题</h3>
            </div>
            <div class="class-box-content">
                <ul>
                    <li><a href="#">国内</a></li>
                    <li><a href="#">国际</a></li>
                    <li><a href="#">娱乐</a></li>
                    <li><a href="#">军事</a></li>
                    <li><a href="#">财经</a></li>
                    <li><a href="#">天气</a></li>
                    <li class="clear-bottom-line"><a href="#">科技</a></li>
                </ul>
            </div>
        </div>
        <!--最新新闻-->
        <div class="left-box">
            <div class="left-box-tbg">
                <div class="left-box-bbg">
                    <div class="left-box-header"><h3>最新新闻</h3></div>
                    <div class="left-box-content">
                        <ul>
                            <li><a href="#">詹姆斯26+9+7热火2-1雷霆 詹姆斯快速实战迷踪步2+1</a></li>
                            <li><a href="#">詹姆斯26+9+7热火2-1雷霆 詹姆斯快速实战迷踪步2+1</a></li>
                            <li><a href="#">詹姆斯26+9+7热火2-1雷霆 詹姆斯快速实战迷踪步2+1</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--最新评论-->
        <div class="left-box">
            <div class="left-box-tbg">
                <div class="left-box-bbg">
                    <div class="left-box-header"><h3>最新评论</h3></div>
                    <div class="left-box-content">
                        <ul>
                            <li><a href="#">詹姆斯26+9+7热火2-1雷霆 詹姆斯快速实战迷踪步2+1</a></li>
                            <li><a href="#">詹姆斯26+9+7热火2-1雷霆 詹姆斯快速实战迷踪步2+1</a></li>
                            <li><a href="#">詹姆斯26+9+7热火2-1雷霆 詹姆斯快速实战迷踪步2+1</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--页面主体的右部，包括新闻的列表和评论内容 -->
    <div class="main-content-right">
        <!--各专题的新闻列表-->
        <div class="main-text-box">
            <div class="article-place"><a href="#">新闻中心</a> > <a href="#">国内</a></div>
      		<div class="main-text-box-tbg">
                <div class="main-text-box-bbg">
                    <div class="article-box">
                    	<!--新闻的标题-->
                    	<%
                    	 /*新闻更新时间*/
                    	 Date today=new Date();
                    	 SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
                    	 String str_today=simpleDateFormat.format(today);
                    	 String title="\"谈北京精神\"";//新闻标题
                    	  String author="Bdqn";//新闻发布者
                    	  String category="新闻信息";//新闻分类
                    	  //新闻摘要
                    	  String summary="北京是一座拥有灿烂文明的古城，厚重的历史积淀，涵育了辉煌的北京文化。而这种融贯北京万众情怀、铸造北京城市特质、传沿北京文化基因、孕育北京创新灵魂的文化精髓，就是北京精神。";
                    	  //新闻内容
                    	  String content="<p>侯仁之先生在谈到北京的城市建设时曾经提到过3个里程碑：紫禁城，天安门广场和国家奥林匹克体育中心、亚运村。侯先生认为，紫禁城是封建社会宫殿建筑中最有代表性的一组建筑群，是历史上封建皇权统治的中心，无论在文化上还是古迹上都举世闻名。新中国把天安门广场这样一个旧时代的宫廷广场，改造成人民的广场，给北京带来了一个全新的景象，这在北京城市建设发展史上具有重要意义。</p><p>国家奥林匹克体育中心和亚运村的建设是对北京城传统中轴线的延伸，代表着北京走向国际、走向世界。北京的城市建设和建筑是与民族的兴衰联系在一起的，就像北京的中轴线，从北京厚重的历史中出发，奔向充满光明、充满希望的未来，奔向广阔的世界、无垠的宇宙。北京有着3000多年的建城史，800多年的建都史。从西周时期到辽金时期，北京作为地方首府，城市的中心点和中轴线不断改变。直到元代，蒙古铁骑扫荡了华夏四方，北京才真正成为全国的政治中心，中轴线也确定下来。中轴线在北京城市规划上具有重要意义，它就像一条奔涌着民族血液的动脉，为我们的民族、我们的国家、我们的北京时刻输送着营养和活力。中轴线凝聚了北京人民的爱国情怀，显示了北京的宽容、厚重与博大，也体现了北京的吸纳与创新。纵观世界，多少历史古城在浩瀚的风云中固守而亡，而北京几经磨难，依然能迈着豪迈的步伐，坚定自信地向充满希望的未来走去，我们不能不为北京的吸纳与创新而自豪！</P>";
                    	%>
                        <h1><%=title %></h1>
                        <div class="source-bar">发布者：<%=author %> 分类：<%=category%>  更新时间：<%=str_today %></div>
                        <div class="article-content">
                            <span class="article-summary"><b>摘要：</b><%=summary%></span>
                            <%=content%>
                        </div>
                        <div class="comment">
                            <dl>
                                <dt class="comment-top">
                                    <span class="fr">2011-09-25 13:33:55</span>
                                    <b>1楼</b> <b>水上漂</b>
                                </dt>
                                <dd class="comment-body">
                                    爱北京，爱中国！
                                </dd>
                            </dl>
                            <dl>
                                <dt class="comment-top">
                                    <span class="fr">2011-09-25 13:33:55</span>
                                    <b>2楼</b> <b>拉娜</b>
                                </dt>
                               <dd class="comment-body">
                                    中国人雄起！
                                </dd>
                            </dl>
                        </div>
                        <div class="comment-form">
                            <div class="comment-form-header">
                                <span>用户：Landodo</span>
                                <h3>发表评论：</h3>
                            </div>
                            <div class="comment-form-content">
                                <textarea class="comment-textarea"></textarea>
                                <button type="submit" class="comment-btn">评论</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//-->
        
    </div>
</div>
<!--页面底部-->
<div class="main-footer-box">
    24小时客户服务热线：010-68988888 常见问题解答 新闻热线：010-627488888<br />
    文明办网文明上网举报电话：010-627488888 举报邮箱：jubao@bj-aptech.com.cn<br />
    Coyright&copy;1999-2007 News China gov,All Right Reserved.<br />
    新闻中心版权所有
</div>
</body>
</html>