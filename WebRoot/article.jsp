<%@ page language="java" import="java.util.*,java.sql.*,guyue.BBS.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>

<%!
//行标记
boolean rowFlg = true;

/* 递归方法 */
private void tree(List<Article> articles, Connection conn, int id, int level) {
	Statement stmt = null;
	ResultSet rs = null;
	try {
		String sql = "select * from article where pid = " + id;
		stmt = DB.getStmt(conn);
		rs = DB.getRs(stmt, sql);
		while(rs.next()) {
			Article a = new Article();
			a.initArt(rs);
			a.setLevel(level);
			a.setSingular(rowFlg);
			articles.add(a);
			
			rowFlg = ! rowFlg;			
			if(! a.isIsleaf()) {
				tree(articles, conn, a.getId(), level+1);
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DB.close(rs);
		DB.close(stmt);
	}
}
%>

<%
Connection conn = DB.getConn();
List<Article> articles = new ArrayList<Article>();
tree(articles, conn, 0, 0);
DB.close(conn);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="csdn-bbs">
<head>
<script charset="utf-8" src="imgs/b.js"></script><script src="imgs/hm.js"></script>
<link rel="alternate" media="handheld" href="#">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java论坛-CSDN论坛</title>
<link href="imgs/index-364163dbe5c7173bb8ebcb91209d8821.css" media="screen" rel="stylesheet" type="text/css">
<link href="imgs/btn.css" media="screen" rel="stylesheet" type="text/css">
<script src="imgs/push.js"></script><script src="imgs/application-6ceac2bf2615e60a422b82074c68ef10.js" type="text/javascript"></script>
<link href="imgs/main-38789a315043b4abb85969b3d47b6ab5.css" media="screen" rel="stylesheet" type="text/css">
<!--<script src="http://counter.csdn.net/a/js/AreaCounter.js" type="text/javascript" charset="utf-8"></script>-->

<link href="http://c.csdnimg.cn/public/favicon.ico" rel="SHORTCUT ICON">
<link rel="stylesheet" href="imgs/content_toolbar.css">
<script language="javascript" type="text/javascript" src="imgs/tracking-1_002.js"></script>
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
<link href="http://bbs.csdn.net/forums/Java.atom" rel="alternate" title="ATOM" type="application/atom+xml">
<link ref="canonical" href="http://bbs.csdn.net/forums/Java">
<script type="text/javascript" charset="utf-8" src="imgs/tracking-1.js"></script><script type="text/javascript" charset="utf-8" src="imgs/main-1.js"></script><script src="imgs/get_ads.php" type="text/javascript"></script>
</head>
<body style="margin-left: 100px;margin-right: 100px">
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

<script src="imgs/left_menu-15a978e14716cc2800b8777f2087e418.js" type="text/javascript"></script> 
<script type="text/javascript" src="imgs/cnick.js"></script> 
<script src="imgs/left_menu.js" type="text/javascript" charset="utf-8"></script>
<style>

  .news-nav .container {
    MARGIN: 0px auto;width:1170px; FONT-FAMILY: "Microsoft YaHei";
    padding:0;
  }
  .nav-bar{
    font-size :16px;
    color:#fff;
    float:left;
  }
  .nav-bar a{
    padding: 0;
    display: inline-block;
    line-height: 44px;
    margin-right: 32px;
    color: #4f4f4f;
    text-decoration: none;
    font-family: "Microsoft YaHei";
  }
  .nav-bar .current, .nav-bar .active, .nav-bar a:hover {
    position: relative;
    border:none;
  }
  .nav-bar .current::after,
  .nav-bar .active::after,
  .nav-bar a:hover::after {
    content: '';
    position: absolute;
    bottom: 0;
    height: 3px;
    left: 0;
    right: 0;
    background-color: #c92027;
  }


  .search-download{
    float:right;
    margin-top:11px;
  }
  .search-download form{
    float:left;
    border: 1px solid #ddd;
  }
  .search-download input{
    /* border:solid 1px #ddd;
    border-right:none; */
    border:none;
    height: 26px;
    line-height:22px;
    padding:0 10px;
    margin-right:-5px;
    width: 229px;
  }
  .search-download .download-search-bth{
    background: url(http://c.csdnimg.cn/public/common/toolbar/images/f_icon.png) no-repeat 0 -189px;
    display: inline-block;
    border: none;
    width: 22px;
    height: 26px;
    vertical-align: middle;
    padding-right: 2px;
    background-color: #fff;
  }
  .search-download .help{
    float:left;
    margin:3px 0 0 20px;
    font-size: 15px;
    color: #4f4f4f;
    line-height: 35px;
    border: 0 !important;
  }
  .search-download .help .fa{
    margin-right:5px;
  }

</style>
<div class="wrap">
  <div class="conts"> </div>
  
  <!--AdForward Begin:--> 
  <ins data-revive-zoneid="52" data-revive-id="8c38e720de1c90a6f6ff52f3f89c4d57" id="revive-0-1"></ins> 
  <!--AdForward End-->
  
  <div class="clearfix"></div>
  <div class="page_nav">
    <ul>
      <li class="select"> <a href="http://bbs.csdn.net/forums/Java">首页</a> </li>
      <li class="select"> <a href="http://bbs.csdn.net/forums/Java">1</a> </li>
      <li class=""> <a href="http://bbs.csdn.net/forums/Java?page=2">2</a> </li>
      <li class=""> <a href="http://bbs.csdn.net/forums/Java?page=3">3</a> </li>
      <li class=""> <a href="http://bbs.csdn.net/forums/Java?page=4">4</a> </li>
      <li class=""> <a href="http://bbs.csdn.net/forums/Java?page=5">5</a> </li>
      <li class=""> <a href="http://bbs.csdn.net/forums/Java?page=6">6</a> </li>
      <li class="page gap"> ... </li>
      <li> <a href="http://bbs.csdn.net/forums/Java?page=2" class="next">下一页</a> </li>
      <li class=""> <a href="http://bbs.csdn.net/forums/Java?page=2946">尾页</a> </li>
      <li><span>总数：147270，</span><span>共2946页</span></li>
    </ul>
  </div>
  <div class="content">
    <table class="table_list parent_forum " cellspacing="0" cellpadding="0" width="100%" border="0">
      <colgroup>
      <col>
      <col width="60px">
      <col width="120px">
      <col width="60px">
      <col width="120px">
      <col width="60px">
      </colgroup>
      <tbody>
        <tr class="zebra">
          <th>标题</th>
          <th class='tc'>分数</th>
          <th class='tc'>提问人</th>
          <th class='tc'>回复数</th>
          <th class='tc'>最后更新时间</th>
          <th class='tc'>功能</th>
        </tr>
        <%
        for(int i=1; i<articles.size(); i++) {
        	Article a = articles.get(i-1);
        	String preStr = "";
        	for(int j=0; j<a.getLevel(); j++) {
        		preStr = preStr + "---- ";
        	}
        %>
        <tr class="<%= a.isSingular() ? "zebra" : ""%>">
          <td class="title"><strong class="green">？</strong> <a href="articleDetail.jsp?id=<%= a.getId() %>" target="_blank" title="<%= a.getTitle()%>"><%= preStr + a.getTitle() %></a> <span class="forum_link">[<span class="parent"><a href="http://bbs.csdn.net/forums/Java">Java</a></span> <a href="http://bbs.csdn.net/forums/Java_WebDevelop">Web 开发</a>]</span></td>
          <td class="tc">50</td>
          <td class="tc"><a href="http://my.csdn.net/qq_32461501" rel="nofollow" target="_blank" title="qq_32461501">qq_32461501</a><br>
            <span class="time"><%= new SimpleDateFormat("yyyy.MM.dd HH:mm").format(a.getPdate()) %></span></td>
          <td class="tc">3</td>
          <td class="tc"><a href="http://my.csdn.net/qq_32461501" rel="nofollow" target="_blank" title="qq_32461501">qq_32461501</a><br>
            <span class="time">2018-02-15 15:52</span></td>
          <td class="tc"><a href="http://bbs.csdn.net/topics/392320895/close" target="_blank">管理</a></td>
        </tr>
        <%
        }
        %>
        
      </tbody>
    </table>
  </div>
</div>
</body>
</html>