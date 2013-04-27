$().ready(function(){
    		var $inputname = "";
    		var $hidsid = "";
    		//添加新商品
    		$(".add_link").mouseover(function(){
    			$(this).css("background-color","#fff");
    			$(this).attr("title","点击修改内容");
    		}).bind("mouseout",function(){
    			$(this).css("background-color","#DDEEF2");
    		});
    		//列表中内容
    		$("#goods_tab .goods_tab_content span").mouseover(function(){
    			$(this).css("background-color","#27828C");
    		}).mouseout(function(){
    			$(this).css("background-color","#fff");
    		});
    		//列表内容修改完毕
    		$(".hidvalue").bind("blur keydown",function(e){
    			if(e.keyCode == 13 || e.keyCode == 0){
    				if($inputname == "sprice"){
	    				var reg = /(^\d+$)|^\d+(\.\d+)?$/;
	    				if(!reg.test($(this).val())){
	    					alert("请输入正确的价格格式");
	    					$(this).val($(this).prev().text()).focus();
	    					return false;
	    				}
    				}else if($inputname == "sort" || $inputname == "stock"){
    					var reg = /^\d+$/;
    					if(!reg.test($(this).val())){
    						alert("请输入正确的数字格式");
    						$(this).val($(this).prev().text()).focus();
    						return false;
    					}
    				}
    				if($(this).val().length == 0){
	   					alert("不可以存入空值");
	   					$(this).val($(this).prev().text()).focus();
	   					return false;
 					}
	   				$.ajax({
	   					url : encodeURI(encodeURI("jqueryinputajax.action?"+$inputname+"="+$(this).val())),
	   					type : "POST",
	   					data : {
	   						"sid" : $hidsid
	   					}
	   				});
	   				$(this).parent("td").children("span").css("display","");
	   				$(this).css("display", "none");
	  				$(this).parent("td").children("span").text($(this).val());
	    		}
   			});
   			//转入修改
    		$("#goods_tab span").bind("click", function(){
    			$(this).css("display", "none");
    			$(this).next().css("display", "").focus();
    			$inputname = $(this).attr("class");
    			$hidsid = $(this).parent("td").children(".hidsid").val();
   			});
   			//列表中对错的修改
   			$("#goods_tab td img").click(function(){
   				var $src = $(this).attr("src");
   				var $img = "images/yes.gif";
   				$inputname = $(this).attr("class");
   				$hidsid = $(this).next().val();
   				if($src == $img){
   				$.ajax({
   					url : "jqueryinputajax.action?"+$inputname+"Sta = 1&"+$inputname+"=false",
   					type : "POST",
   					data : {
   						"sid" : $hidsid
   					}
   				});
   					$(this).attr("src", "images/no.gif");
   				}else{
   					$.ajax({
   					url : "jqueryinputajax.action?"+$inputname+"Sta = 1&"+$inputname+"=true",
   					type : "POST",
   					data : {
   						"sid" : $hidsid
   					}
   				});
   					$(this).attr("src","images/yes.gif");
   				}
   			});
   			//表格表头样式
   			$("#goods_tab .goods_tab_first_tr font").hover(function(e){
   				$(this).css({"color":"#9D7250","cursor":"pointer"});
   				$(this).attr("title", "点击对列表进行排序");
   				/* var tooltip = "<div id='tooltip'>点击对列表进行排序</div>";
   				$("body").append(tooltip);
   				$("#tooltip").css({
   					"position" : "absolute",
   					"top" : (e.pageY + 10) + "px",
   					"left" : (e.pageX + 10) + "px"
   				}).show("fast"); */
   			},function(){
   				$(this).css({"color":"#000","cursor":"default"});
   				//$("#tooltip").remove();
   			});
    	});