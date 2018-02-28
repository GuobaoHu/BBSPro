<%@ page language="java" import="java.util.*,java.sql.*,guyue.BBS.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>

<%
//从数据库中获取对应id的详细信息
//1.对接收过来的id值进行检查
String strId = request.getParameter("id");
if(strId == null || strId.equals("")) {
	out.println("id为空！");
	return;
}
int id;
try {
	id = Integer.parseInt(strId);	
} catch (NumberFormatException e) {
	out.println("接收到articleDetail.jsp页面的id格式不正确！");
	return;
}

List<Article> articles = new ArrayList<Article>();
Connection conn = DB.getConn();

//2.查询数据库
String sql = "select * from article where id = " + id;
Statement stmt = DB.getStmt(conn);
ResultSet rs = DB.getRs(stmt, sql);
if(rs.next()) {
	Article article = new Article();
	article.initArt(rs);	
	articles.add(article);
}
DB.close(rs);
DB.close(stmt);

//3.查id号的子帖
Statement childStmt = DB.getStmt(conn);
ResultSet childRs = DB.getRs(childStmt, "select * from article where pid = " + id);
while(childRs.next()) {
	Article article = new Article();
	article.initArt(childRs);	
	articles.add(article);
}
DB.close(childRs);
DB.close(childStmt);
DB.close(conn);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="csdn-bbs">
    <head>
    <script charset="utf-8" src="imgs/b.js"></script><script src="imgs/hm.js"></script>
    <meta http-equiv="Cache-Control" content="no-transform">
    <link rel="alternate" media="handheld" href="#">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= articles.get(0).getTitle() %></title>
    <link href="imgs/main-38789a315043b4abb85969b3d47b6ab5.css" media="screen" rel="stylesheet" type="text/css">
    <link href="imgs/btn.css" media="screen" rel="stylesheet" type="text/css">
    <script type="text/javascript" async="" src="imgs/pr.js"></script><script type="text/javascript" async="" src="imgs/bvzdpzs.js"></script><script charset="utf-8" src="imgs/b.js"></script><script src="imgs/push.js"></script><script src="imgs/push.js"></script><script src="imgs/hm_002.js"></script><script src="imgs/application-6ceac2bf2615e60a422b82074c68ef10.js" type="text/javascript"></script>
    <script src="imgs/atsuggest.js" type="text/javascript"></script>
    <meta content="authenticity_token" name="csrf-param">
    <meta content="YVBiK6N4IDGMgkkpk4o9qWQV5ELLP5ZPfUb4FT8xV1w=" name="csrf-token">
    <link href="http://c.csdnimg.cn/public/favicon.ico" rel="SHORTCUT ICON">
    <link rel="stylesheet" href="imgs/content_toolbar.css">
    <script language="javascript" type="text/javascript" src="imgs/tracking-1.js"></script>
    <script type="text/javascript">
    document.domain = "csdn.net";
    var proxy_url = "http://internalapi.csdn.net/proxy.html";
		var ajaxProxyCaches = {};
		function ajaxProxy(proxyUrl, opts) {
		    var c = ajaxProxyCaches[proxyUrl];
		    if (c === undefined) {
		        c = ajaxProxyCaches[proxyUrl] = [];
		        var func = arguments.callee;
		        $('<iframe class="poxy_uc" src="' + proxyUrl + '" style="display:none">').load(function () {
		            c.contentWindow = this.contentWindow;
		            func(proxyUrl, opts);
		        }).prependTo('body');
		    } else if (c.contentWindow === undefined) {
		        c.push(opts);
		    } else {
		        do {
		            c.contentWindow.jQuery.ajax(opts);
		        } while (opts = c.shift());
		    }
		}
</script>
    <!-- 请置于所有广告位代码之前 -->
    <script src="imgs/ds.js"></script>
    <link href="imgs/sh-353e52ea73888f7bf72641c9ae8e6a45.css" media="all" rel="stylesheet" type="text/css">
    <script src="imgs/sh-83dfe6b3d61bfd8fe4da30e0d7046ae0.js" type="text/javascript"></script>
    <style>
#topic-detail-ad-ul {
	width: 960px;
	float: left;
	font-size: 1px;
	margin: 0;
	padding: 0
}
#topic-detail-ad-l {
	float: left;
}
#topic-detail-ad-r {
	float: right;
}
#topic-detail-ad-ul li {
	list-style: none;
}
</style>
    <script>
	var _hmt = _hmt || [];
	(function() {
	 var hm = document.createElement("script");
	 hm.src = "//hm.baidu.com/hm.js?6bcd52f51e9b3dce32bec4a3997715ac";
	 var s = document.getElementsByTagName("script")[0];
	 s.parentNode.insertBefore(hm, s);
	})();
	</script>
    <script type="text/javascript">
        window.bbsInfoflag = true;
        // 快速回复
        $(document).ready(function () {
            $("#com-quick-reply-bbs").bind("click", function(){
                //_gaq.push(['_trackEvent','function', 'onclick', 'BBS_articles_youhuifu']);
                $("#post_body").focus();
                window.scrollTo(0, $(document).height());
            });
        });
    </script>
    <link ref="canonical" href="imgs/392321225.htm">
    <script type="text/javascript" charset="utf-8" src="imgs/tracking-1_002.js"></script><script type="text/javascript" charset="utf-8" src="imgs/main-1.js"></script><script src="imgs/get_ads.php" type="text/javascript"></script>
    </head>
    <body id="topics-show">
<svg aria-hidden="true" style="position: absolute; width: 0px; height: 0px; overflow: hidden;">
      <symbol id="icon-xiajiantou" viewBox="0 0 1024 1024">
    <path d="M328.208 346.062h368.494c20.393 0 36.887 16.366 36.887 36.757 0 9.484-3.637 18.056-9.483 24.55L541.873 650.522c-12.211 16.105-35.2 19.484-51.438 7.275-2.859-2.08-5.324-4.547-7.274-7.275L298.853 404.772c-12.08-16.106-8.83-39.225 7.404-51.306 6.626-5.066 14.289-7.404 21.95-7.404z"></path>
  </symbol>
      <symbol id="icon-shouji" viewBox="0 0 1024 1024">
    <path d="M537.754 795.889c-26.41 0-47.893 21.478-47.893 47.892s21.484 47.893 47.893 47.893 47.892-21.479 47.892-47.893-21.483-47.892-47.892-47.892z"></path>
    <path d="M774.697 42.071H300.815c-39.864 0-72.3 32.43-72.3 72.3v795.264c0 39.869 32.43 72.3 72.3 72.3h473.872c39.87 0 72.3-32.431 72.3-72.3v-795.27c0.004-39.864-32.426-72.294-72.29-72.294zM300.815 90.266h473.872a24.125 24.125 0 0 1 24.1 24.1v595.809H276.72v-595.81a24.125 24.125 0 0 1 24.094-24.1z m473.882 843.463H300.815a24.125 24.125 0 0 1-24.1-24.1V762.501h522.072V909.63a24.115 24.115 0 0 1-24.09 24.1z"></path>
  </symbol>
      <symbol id="icon-tianxie" viewBox="0 0 1024 1024">
    <path d="M121.905 780.19h780.19v97.524h-780.19V780.19zM823.296 298.496l-68.974-68.974-344.795 344.796-34.475 103.448 103.424-34.475zM875.008 246.76l17.237-17.238-68.949-68.949-17.262 17.237-17.237 17.238 68.974 68.973z"></path>
  </symbol>
      <symbol id="icon-sousuo" viewBox="0 0 1024 1024">
    <path d="M1023.972002 964.002812l-59.981188 59.981189-271.443276-271.459276c-166.600191 136.489602-412.812649 126.986048-568.309361-28.494664-165.624236-165.624236-165.624236-434.187647 0-599.859881 165.624236-165.592238 434.187647-165.592238 599.827883 0 155.52871 155.52871 164.984266 401.789166 28.462666 568.389356L1023.972002 964.002812zM663.364906 184.007375c-132.585785-132.585785-347.327719-132.761777-479.705514-0.43198-132.329797 132.345796-132.121807 347.119729 0.463978 479.705514s347.375717 132.793775 479.705514 0.41598c132.329797-132.281799 132.169805-347.10373-0.463978-479.689514z"></path>
  </symbol>
      <symbol id="icon-guanbi" viewBox="0 0 1024 1024">
    <path d="M1002.211316 933.90818c24.46369 24.46369 29.007633 59.583246 10.159871 78.447007-18.863761 18.863761-53.983317 14.303819-78.447007-10.159871L21.807724 90.09486C-2.655966 65.631169-7.199909 30.495614 11.647853 11.647853c18.863761-18.863761 53.983317-14.303819 78.447007 10.159871L1002.211316 933.90818z"></path>
    <path d="M933.92418 21.807724C958.38787-2.655966 993.507426-7.199909 1012.371187 11.647853c18.863761 18.863761 14.303819 53.983317-10.159871 78.447007L90.09486 1002.211316c-24.46369 24.46369-59.583246 29.007633-78.447007 10.159871-18.847761-18.863761-14.303819-53.983317 10.159871-78.463007L933.92418 21.807724z"></path>
  </symbol>
      <symbol id="icon-caidan" viewBox="0 0 1024 1024">
    <path d="M0 132.8a48.496 48.496 0 0 0 48.496 48.496h927.008a48.496 48.496 0 1 0 0-96.992H48.496A48.496 48.496 0 0 0 0 132.8s0-26.784 0 0zM0 512.016a48.48 48.48 0 0 0 48.48 48.48h927.04a48.48 48.48 0 0 0 0-96.96H48.48A48.48 48.48 0 0 0 0 512.016s0-26.784 0 0zM0 891.2a48.496 48.496 0 0 0 48.496 48.496h927.008a48.496 48.496 0 1 0 0-96.992H48.496A48.496 48.496 0 0 0 0 891.2s0-26.784 0 0z"></path>
  </symbol>
      <symbol id="icon-yonghudenglu" viewBox="0 0 1024 1024">
    <path d="M1022.26704 962.432c-43.888-157.584-162.16-281.216-312.064-340.144 92.8-61.376 153.92-164.496 153.92-281.168C864.12304 153.04 706.04304 0 511.70704 0 317.35504 0 159.19504 153.04 159.19504 341.136c0 116.704 61.152 219.84 154.064 281.184C164.13904 681.024 46.18704 803.792 1.80304 960.16c-7.344 26.016 8.464 52.864 35.36 60.032a52.016 52.016 0 0 0 38.4-4.608 49.072 49.072 0 0 0 23.712-29.568c50.768-178.96 220.352-303.92 412.448-303.92 193.04 0 362.848 125.712 412.944 305.744 7.296 26.048 34.992 41.456 61.952 34.48 26.912-7.04 42.88-33.824 35.648-59.888zM260.25104 341.136c0-134.256 112.816-243.424 251.472-243.424 138.576 0 251.328 109.184 251.328 243.424 0 133.904-112.768 242.864-251.328 242.864-138.672 0-251.472-108.976-251.472-242.864z m0 0"></path>
  </symbol>
      <symbol id="toolbar-csdnlogo" viewBox="0 0 1024 1024">
    <path d="M533.941333 419.264c14.709333-1.621333 37.290667-3.264 68.352-3.264 51.872 0 93.802667 9.152 119.776 28.416 23.338667 17.952 38.858667 47.008 34.56 89.130667-3.978667 39.189333-24.042667 66.634667-53.312 83.594666C676.544 633.152 642.837333 640 592.106667 640c-29.888 0-58.421333-1.642667-80.106667-4.896l21.941333-215.84z m42.869334 172.938667c4.981333 0.992 11.562667 1.973333 24.533333 1.973333 51.882667 0 88.469333-25.877333 92.16-62.24 5.333333-52.554667-27.125333-70.944-81.802667-70.624-7.072 0-16.917333 0-22.133333 0.970667L576.8 592.213333h0.010667z m223.498666-164.704c210.954667-39.872 229.162667 31.776 222.645334 95.189333L1010.656 640h-66.944l11.210667-106.986667c2.421333-23.562667 17.504-69.653333-55.338667-67.914666-25.184 0.608-37.706667 4.064-37.706667 4.064s-2.186667 28.469333-4.832 49.514666L844.32 640H778.666667l13.024-119.573333" fill="#231916"></path>
    <path d="M226.634667 632.682667c-12.373333 4.341333-38.037333 7.317333-73.909334 7.317333C49.6 640-6.048 590.933333 0.522667 526.090667 8.416 448.810667 90.858667 405.333333 181.141333 405.333333c34.976 0 55.552 2.858667 74.858667 7.637334l-6.208 52.064c-12.821333-4.384-42.890667-8.405333-67.232-8.405334-53.141333 0-98.250667 16.042667-103.424 66.762667-4.608 45.354667 27.061333 67.04 86.816 67.04 20.8 0 51.477333-3.018667 65.653333-7.370667l-4.992 49.6 0.021334 0.021334z" fill="#C92027"></path>
    <path d="M272.714667 580.021333c19.285333 6.762667 59.488 13.504 92 13.504 35.029333 0 54.528-9.333333 56.096-23.797333 1.418667-13.205333-12.928-14.986667-52.490667-24.010667-54.666667-12.896-89.546667-32.842667-86.133333-64.704C286.176 443.989333 337.685333 416 416.725333 416c38.56 0 75.914667 2.613333 95.274667 8.714667l-6.656 46.666666c-12.565333-4.202667-60.672-10.037333-93.205333-10.037333-32.992 0-50.069333 9.973333-51.253334 20.917333-1.493333 13.845333 15.658667 14.485333 58.528 25.450667 58.026667 14.154667 83.402667 34.090667 80.085334 64.992C495.605333 609.109333 449.258667 640 356.714667 640c-38.528 0-71.744-6.762667-90.048-13.525333l6.048-46.453334z" fill="#231916"></path>
  </symbol>
      <symbol id="icon-morentouxiang" viewBox="0 0 1024 1024">
    <path d="M512 512m-512 0a512 512 0 1 0 1024 0 512 512 0 1 0-1024 0Z" fill="#A0C3FF"></path>
    <path d="M691.2 887.466667c-55.466667-25.6-123.733333-51.2-123.733333-51.2v-38.4c68.266667-25.6 119.466667-89.6 132.266666-166.4 12.8-4.266667 38.4-17.066667 46.933334-55.466667l8.533333-46.933333s4.266667-59.733333-42.666667-46.933334c4.266667-38.4 4.266667-81.066667 4.266667-115.2-4.266667-64-89.6-98.133333-89.6-98.133333l12.8-17.066667s-42.666667-12.8-59.733333-4.266666l12.8-29.866667s-85.333333 0-132.266667 38.4h-4.266667v-17.066667s-145.066667 21.333333-140.8 243.2c-46.933333-12.8-42.666667 46.933333-42.666666 46.933334l8.533333 46.933333c4.266667 38.4 29.866667 51.2 46.933333 55.466667 12.8 81.066667 64 145.066667 132.266667 166.4v38.4s-68.266667 29.866667-123.733333 51.2c-29.866667 12.8-59.733333 34.133333-81.066667 59.733333 68.266667 51.2 157.866667 76.8 256 76.8s187.733333-25.6 264.533333-72.533333c-21.333333-29.866667-51.2-46.933333-85.333333-64z" fill="#4374E0"></path>
  </symbol>
      <symbol id="icon-icon_boke" viewBox="0 0 1024 1024">
    <path d="M512 1024C229.248 1024 0 794.752 0 512S229.248 0 512 0s512 229.248 512 512-229.248 512-512 512z m298.667-256H213.333v42.667h597.334V768z m-21.334-448L704 234.667 341.333 597.333l-42.666 128 128-42.666L789.333 320z"></path>
  </symbol>
      <symbol id="icon-icon_gitchatx" viewBox="0 0 1024 1024">
    <path d="M810.667 533.333v-64h-384v85.334h298.666v128h85.334V533.333zM256 810.667h426.667v-85.334h-384V298.667h426.666V384h85.334V213.333H213.333v597.334H256zM512 1024C229.248 1024 0 794.752 0 512S229.248 0 512 0s512 229.248 512 512-229.248 512-512 512z m213.333-298.667v85.334h85.334v-85.334h-85.334z"></path>
  </symbol>
      <symbol id="icon-guanbi1" viewBox="0 0 1024 1024">
    <path d="M512 1024A512 512 0 1 1 512 0a512 512 0 0 1 0 1024z m160-768L512 416 352 256l-96 96 160 160-160 160 96 96 160-160 160 160 96-96-160-160 160-160-96-96z"></path>
  </symbol>
    </svg>
<!-- 自动推送工具代码--> 
<script>
      (function(){
          var bp = document.createElement('script');
          var curProtocol = window.location.protocol.split(':')[0];
          if (curProtocol === 'https') {
              bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
          }
          else {
              bp.src = 'http://push.zhanzhang.baidu.com/push.js';
          }
          var s = document.getElementsByTagName("script")[0];
          s.parentNode.insertBefore(bp, s);
      })();

  </script> 
<!-- <script type="text/javascript" src="http://c.csdnimg.cn/pubnav/js/pub_topnav_2011.js"></script> --> 

<!--全屏--> 
<ins data-revive-zoneid="149" data-revive-id="8c38e720de1c90a6f6ff52f3f89c4d57" id="revive-0-0"></ins> 
<!--全屏-->
<!-- 开始循环 -->
<%
        int j = 0;
          for(int i=0; i<articles.size(); i++) {
        	  Article article  = articles.get(i);
        %>



<div class="wraper"> 
      
      <!--[if IE]>
<style type="text/css" media="screen">
  .control_area .control .drop_menu{border:3px solid #ccc \9; _*border:3px solid #ccc;}
</style>
<![endif]--> 
      
      <!--<iframe id="frm_tt1" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="100%" src="/sda/TopicBodyTop.htm?v=1"></iframe>--> 
      <script type="text/javascript">
//  setTimeout(function () { document.getElementById("frm_tt1").src = "/sda/TopicBodyTop.htm?v="+new Date().getTime(); }, 5000);

  $(function(){
      //获取要定位元素距离浏览器顶部的距离
      $ = jQuery;
      var navH = $(".detail_title_fixed").offset().top;
      $(".detail_title_fixed").hide();

      var show_detail_title_fixed = true;
      //滚动条事件
      $(window).scroll(function(){

          //获取滚动条的滑动距离
          var scroH = $(this).scrollTop();

          //滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
          if(show_detail_title_fixed){
              if(scroH>=navH){
                  $(".detail_title_fixed").css({"position":"fixed","top":"0","border":"1px #198cc5 solid","z-index":"99999"});
                  $(".detail_title_fixed").show();
              }else if(scroH<navH){
                  $(".detail_title_fixed").css({"position":"static"});
                  $(".detail_title_fixed").hide();
              }
          }
      });

      $("#close_detail_title_fixed").click(function(){
          show_detail_title_fixed = false;
          $(".detail_title_fixed").hide();
      });

      $("#com-back-home").click(function(){
        window.location.href="/";
      });

      $("#com-back-channel").click(function(){
          window.location.href="/forums/Java_WebDevelop";
      });
  })
</script> 
      <script type="text/javascript">
      //百度代码：
      (function(){
      var bp = document.createElement('script');
      var curProtocol = window.location.protocol.split(':')[0];
      if (curProtocol === 'https') {
          bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
      }else{
          bp.src = 'http://push.zhanzhang.baidu.com/push.js';
      }
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(bp, s);
      })();
  </script>
      <div class="flash_messages"> </div>
      <div class="control_area top"></div>
      <div class="detailed">
    <table width="1515" border="0" cellpadding="0" cellspacing="0" class="post topic " id="post-403055364" data-post-id="403055364" data-is-topic-locked="false">
          <colgroup>
      <col width="110">
      <col>
      </colgroup>
          <tbody>     
        
        <tr>
              <td width="110" rowspan="2" valign="top" class="wirter" style="width: 110px"><dl class="user_info ">
              <label><%= article.getId() == id ? "楼主" : (j + "楼") %></label>
                  <dt class="user_head" data-username="yaotomo"> <a href="http://my.csdn.net/yaotomo" rel="nofollow" target="_blank"><img alt="yaotomo" class="avatar" src="imgs/1_yaotomo.jpg" style="height: 80px;"></a>
                  <div class="user_material" id="user_meterial_1518684688645" style="display: none;">
                      <div class="user_material_bg">
                      <dl>
                          <dt><a href="http://my.csdn.net/yaotomo" target="_blank"><img src="imgs/2_yaotomo.jpg" class="avatar_80"></a></dt>
                          <dd style="text-align: left;">账号:<a href="http://my.csdn.net/yaotomo" target="_blank">yaotomo</a></dd>
                          <dd style="text-align: left;" class="nickname">昵称:<span class="name2nick" style="overflow: initial;">yaotomo</span></dd>
                          <dd> <a class="button add follow_btn" data-username="yaotomo" href="javascript:void(0);">关注</a> <a href="http://blog.csdn.net/yaotomo" class="button" target="_blank">博客</a><a href="http://my.csdn.net/yaotomo" class="button" target="_blank">空间</a> </dd>
                        </dl>
                      <ol style="text-align: left;">
                          最新帖子:
                          <li><a href="http://bbs.csdn.net/topics/392322528" target="_blank" title="一个显示对齐的问题补充">一个显示对齐的问题补充</a></li>
                          <li><a href="http://bbs.csdn.net/topics/392322258" target="_blank" title="一个对齐显示的问题">一个对齐显示的问题</a></li>
                          <li><a href="http://bbs.csdn.net/topics/392321225" target="_blank" title="tomcat在eclispe下可以启动但命令行下不能">tomcat在eclispe下可以启动但命...</a></li>
                        </ol>
                      <a href="http://bbs.csdn.net/users/yaotomo/topics" class="more" target="_blank">更多 &gt;&gt;</a> </div>
                    </div>
                </dt>
                  <dd class="username" style="display: none"> <a href="http://my.csdn.net/yaotomo" rel="nofollow" target="_blank" title="yaotomo">yaotomo</a> </dd>
                  <dd class="nickname" style="word-break:break-all;"> <a href="http://my.csdn.net/yaotomo" rel="nofollow" target="_blank" title="yaotomo">yaotomo</a> <br>
                  <img alt="Bbs1" class="topic_show_user_level" src="imgs/bbs1.png" style="margin: 4px 0;">
                  <div class="topic_show_posts">
                      <div class="smallTittle"> 本版专家分：20 </div>
                    </div>
                </dd>
                  <dd class="close_rate" title="用户结帖率：94.03%
总发帖：201
正常结帖：189
未结帖：12">结帖率：94.03%</dd>
                  <dd class="showTittleDD"> </dd>
                </dl></td>
              <td width="1163" valign="top" class="post_info topic" style="vertical-align: bottom" data-username="yaotomo" data-floor="">
              <div class="post_body">
                  <div class="tag"><%= article.getTitle() %> </div>
                  <br>                  
                 <%= article.getCont() %>
                  
                  <!-- 主帖下Banner (D4) --> 
                  <!-- 主帖下文字 (D5) --> 
                </div></td>
            </tr>
          
        <tr>
              <td valign="bottom"><div class="control">  <strong class="fr">  </strong>
                  <div class="fr" style="margin-left:50px;"> <a href="javascript:void(0)" onclick="post_digg(392321225,403055364)" class="red digg">对我有用[0]</a> | <a href="javascript:void(0)" onclick="post_bury(392321225,403055364)" class="bury">丢个板砖[0]</a> | 
                  
                  <script>
          function post_digg(topic_id,post_id){
              $.ajax({
                  type:'PUT',
                  dataType: "json",
                  url:'/posts/'+post_id.toString()+'/digg',
                  data: {
                      topic_id: topic_id.toString()
                  },
                  success: function(json){
                      if(json.success){
                          $('table.post[data-post-id="'+post_id+'"] a.digg').text(json.digg);
                      }else{
                          alert("您已经投过票了");
                      }
                  }
              })
          }

          function post_bury(topic_id,post_id){
              $.ajax({
                  type:'PUT',
                  dataType: "json",
                  url:'/posts/'+post_id.toString()+'/bury',
                  data: {
                      topic_id: topic_id.toString()
                  },
                  success: function(json){
                      if(json.success){
                          $('table.post[data-post-id="'+post_id+'"] a.bury').text('丢个板砖['+json.bury+']');
                      }else{
                          alert("您已经投过票了");
                      }
                  }
              })
          }
        </script> 
                  <a href="reply.jsp?id=<%= article.getId() %>&rootid=<%= article.getRootId() %>&isleaf=<%= article.isIsleaf() ? "0" : "1" %>" class="quote" rel="nofollow">回复</a> | <a href="#quote" class="quote" rel="nofollow">引用</a> | <a href="http://bbs.csdn.net/posts/403055364/report?topic_id=392321225" class="fancybox red report_spam" rel="nofollow">举报 </a> | <span class="manage-toggle">
                    <div class="manage" style="display: none;"> <a href="http://bbs.csdn.net/topics/392321225/edit" class="fancybox" rel="nofollow">编辑</a> <a href="http://bbs.csdn.net/topics/392321225/destroy_edit" class="fancybox" rel="nofollow">删除</a> </div>
                    管理 </span> </div>
                  <span class="return_time">回复次数：11</span> </div></td>
            </tr>
      </tbody>
        </table>
  </div>
      <script type="text/javascript" charset="utf-8">
    $(function(){
        topics_page_js.show_page();
    });
</script><!-- 对联广告 -->
      <div id="ad_left" style="">
    <div> <ins data-revive-zoneid="56" data-revive-id="8c38e720de1c90a6f6ff52f3f89c4d57" id="revive-0-1"></ins> 
          <script type="text/javascript">  
  $(function(){
      if ($(parent.window).width() >= 1280) {
          parent.$('#ad_left').show();
      }
  });
</script> 
        </div>
  </div>
      <div id="ad_right" style="">
    <div> <ins data-revive-zoneid="57" data-revive-id="8c38e720de1c90a6f6ff52f3f89c4d57" id="revive-0-2"></ins> 
          <script type="text/javascript">    
    $(function(){
        if ($(parent.window).width() >= 1280) {
            parent.$('#ad_right').show();
        }
    });
</script> 
        </div>
  </div>
      <script>
  $(function(){
    window.onresize = function(){
      if($(parent.window).width() <= 1280){
        $('#ad_right').hide();
        $('#ad_left').hide();
      } else {
          $('#ad_right').show();
          $('#ad_left').show();
      }
    };
      if ($(parent.window).width() >= 1280) {
          $('#ad_right').show();
          $('#ad_left').show();
      }
  });

</script> 
      
      <!-- 浮层弹窗广告 --> 
      <!--AdForward Begin:--> 
      <!--AdForward End--> 
      
      <!-- go-backhome   go-backchannel--> 
      <!-- <button id="com-back-home" class="btn btn-top bbs-btn-gray28 bbs-btn-backhome" title="回到首页" style="cursor: pointer; border: 0px none; bottom: 35px; width: 80px; height: 28px; margin: 0px; padding: 0px; position: fixed; right: 40px; display: block; padding-right:13px;">回到首页</button>--> 
      <!-- <button id="com-back-channel" class="btn btn-top bbs-btn-gray28 bbs-btn-backchannel" title="回到频道" style="cursor: pointer; border: 0px none; bottom:68px; width: 80px; height: 28px; margin: 0px; padding: 0px; position: fixed; right: 40px; display: block; padding-right:13px;">回到频道</button> --> 
    </div>
    
    <%
          j ++;
          }
          
          %>
    
    <!-- 结束循环 -->
<script type="text/javascript" language="javascript" charset="utf-8">
window.bbsInfoflag = true;

//<![CDATA[
$(function(){
  $('.post .post_body fieldset+br').remove();
  $('.post .post_body blockquote').each(function(index, item) {
    var first_child = $(item).find(':first');
    if($(item).contents().get(0) !== undefined &&
      $(item).contents().get(0).nodeName.toLowerCase() === 'br' &&
      first_child.prop('tagName').toLowerCase() === 'br') {
      first_child.remove();
    }
  });
  
});

$(".showTittleDD span").hover(
        function () {
            $(this).find(".showTittle")[0].style.display="inline-block";
        },
        function () {
                $(this).find(".showTittle")[0].style.display="none";
        }
);

$(".topic_show_user_level").hover(
    function () {
    $(this).next().find(".smallTittle")[0].style.display="inline-block";


    },
    function () {
        $(this).next().find(".smallTittle")[0].style.display="none";
    }
);
//]]>
var auto_save_time = null;
$(document).ready(function(){
    autosavecontent = $("#autosave_post_val").val();
    if(autosavecontent != ''){$("#post_body").val(autosavecontent);}
    auto_save_time = setInterval(autosave, 90*1000);
});
function autosave(){
    var content =  $("#post_body").val();
    var old_content = $("#autosave_old_post_val").val();
    topic_id = 392321225
    if(content != "" && content != old_content) {
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '/posts/autosave_post',
            data: {
                content: content,
                topic_id: topic_id
            },
            success: function (result) {
                $("#autosave_old_post_val").val(content);
            },
            error: function (result) {
              if(result.status == 403 && result.responseText == '需要登录'){
                  clearInterval(auto_save_time);
              }
            }
        })
    }
}


</script>
<div id="pop_win" style="display:none ;position: absolute; z-index: 10000; border: 1px solid rgb(220, 220, 220); top: 222.5px; left: 630px; opacity: 1; background: none 0px 0px repeat scroll rgb(255, 255, 255);"> </div>
<div id="popup_mask"></div>
<div id="fancybox-wrap">
      <div id="fancybox-outer">
    <div class="fancybox-bg" id="fancybox-bg-n"></div>
    <div class="fancybox-bg" id="fancybox-bg-ne"></div>
    <div class="fancybox-bg" id="fancybox-bg-e"></div>
    <div class="fancybox-bg" id="fancybox-bg-se"></div>
    <div class="fancybox-bg" id="fancybox-bg-s"></div>
    <div class="fancybox-bg" id="fancybox-bg-sw"></div>
    <div class="fancybox-bg" id="fancybox-bg-w"></div>
    <div class="fancybox-bg" id="fancybox-bg-nw"></div>
    <div id="fancybox-content"></div>
    <a id="fancybox-close"></a>
    <div id="fancybox-title"></div>
    <a href="javascript:;" id="fancybox-left"><span class="fancy-ico" id="fancybox-left-ico"></span></a><a href="javascript:;" id="fancybox-right"><span class="fancy-ico" id="fancybox-right-ico"></span></a></div>
    </div>
<div style="position:fixed; top:0; left:0; overflow:hidden;">
      <input style="position:absolute; left:-300px;" id="focus_retriever" readonly="true" type="text">
    </div>
</body>
<%
DB.close(rs);
DB.close(stmt);
DB.close(conn);
%>
</html>