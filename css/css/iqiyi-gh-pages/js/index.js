// JavaScript Document
window.onload=function(){
	//顶部开始
	var oTop=document.getElementById("top");
	var oTopUl=oTop.getElementsByTagName("ul")[0];
	var aTopLi=oTopUl.getElementsByTagName("li");
	var aTopTxt1=getByClass(oTop,"txt1")[0];
	var oTopUpload=document.getElementById("upload");
	var oTopUploadHidden=document.getElementById("upload_hidden");
	var oTopMessage=document.getElementById("message");
	var oTopMessageHidden=document.getElementById("message_hidden");
	var oTopHistory=document.getElementById("history");
	var oTopHistoryHidden=document.getElementById("history_hidden");
	var timerTop=null;
	
	//上传
	oTopUploadHidden.onmouseover=oTopUpload.onclick=function(){
		clearInterval(oTopUpload.timerTop);
		oTopUpload.timerTop=setInterval(function(){
			topDisplay(oTopUpload,oTopUploadHidden);
		},10);	
	};
	
	oTopUpload.onmouseover=function(){
		clearInterval(oTopUpload.timerTop);
		topMouseover(oTopUpload);	
	};
	
	oTopUploadHidden.onmouseout=oTopUpload.onmouseout=function(){
		_this=this;
		clearInterval(oTopUpload.timerTop);
		oTopUpload.timerTop=setInterval(function(){
			topMouseout(oTopUpload,oTopUploadHidden);
		},10);
	};
	
	//消息
	oTopMessageHidden.onmouseover=oTopMessage.onclick=function(){
		clearInterval(oTopMessage.timerTop);
		oTopMessage.timerTop=setInterval(function(){
			topDisplay(oTopMessage,oTopMessageHidden);
		},10);	
	};
	
	oTopMessage.onmouseover=function(){
		clearInterval(oTopMessage.timerTop);
		topMouseover(oTopMessage);	
	};
	
	oTopMessageHidden.onmouseout=oTopMessage.onmouseout=function(){
		clearInterval(oTopMessage.timerTop);
		oTopMessage.timerTop=setInterval(function(){
			topMouseout(oTopMessage,oTopMessageHidden);
		},10);
	};
	
	var oMessageHiddenCenter=getByClass(oTopMessageHidden,"center")[0];
	var oMessageHiddenLi=oTopMessageHidden.getElementsByTagName("li");
	var oMessageHiddenCenterSpan=oMessageHiddenCenter.getElementsByTagName("span");
	
	for(var i=0;i<oMessageHiddenLi.length;i++){
		
		oMessageHiddenLi[i].index=oMessageHiddenLi[i].index=i;
		oMessageHiddenLi[i].onmouseover=oMessageHiddenLi[i].onclick=function(){
			for(var i=0;i<oMessageHiddenLi.length;i++){
				oMessageHiddenCenterSpan[i].className="";		
			}
			oMessageHiddenCenterSpan[this.index].className="selected";	
		};	
	}
	
	
	//播放记录
	oTopHistoryHidden.onmouseover=oTopHistory.onclick=function(){
		clearInterval(oTopHistory.timerTop);
		oTopHistory.timerTop=setInterval(function(){
			topDisplay(oTopHistory,oTopHistoryHidden);
		},10);	
	};
	
	oTopHistory.onmouseover=function(){
		clearInterval(oTopHistory.timerTop);
		topMouseover(oTopHistory);	
	};
	
	oTopHistoryHidden.onmouseout=oTopHistory.onmouseout=function(){
		clearInterval(oTopHistory.timerTop);
		oTopHistory.timerTop=setInterval(function(){
			topMouseout(oTopHistory,oTopHistoryHidden);
		},10);
	};
	
	function topDisplay(obj1,obj2){
		var aI=obj1.getElementsByTagName("i")[0];
		obj2.style.display="block";
		aI.style.borderTop=0;
		aI.className="selected";
	}
	
	function topMouseover(obj1){
		var aI=obj1.getElementsByTagName("i")[0];
		if(aI.className!="selected"){
			aI.style.borderTop="6px solid #6CC900";
		}
	}
	
	function topMouseout(obj1,obj2){
		var aI=obj1.getElementsByTagName("i")[0];
		aI.className="";
		aI.style.borderTop="6px solid #CCC";
		obj2.style.display="none"	
	}
	
	//顶部结束

	//图片文字列表开始
	var oBgPic=document.getElementById("bg_pic");
	var oBgTxt=document.getElementById("bg_txt");
	var aBgPicLi=oBgPic.getElementsByTagName("li");
	var aBgTxtA=oBgTxt.getElementsByTagName("a");
	
	var timerBgPic=null;
	var iNow=0;
	
	for(var i=0;i<aBgTxtA.length;i++){
		aBgTxtA[i].index=i;
		aBgTxtA[i].onmouseover=function(){
			clearInterval(timerBgPic);
			iNow=this.index;
			changeA();	
		};	
		
		aBgTxtA[i].onmouseout=function(){
			autoTab();				
		};	
	}
	
	function changeA(){
		for(var i=0;i<aBgPicLi.length;i++){
			aBgPicLi[i].className="";
			aBgTxtA[i].className="";	
		}	
		aBgPicLi[iNow].className="selected";
		aBgTxtA[iNow].className="selected";
	}
		
	function autoTab(){
		timerBgPic=setInterval(function(){
			iNow++;
			if(iNow==aBgPicLi.length){
				iNow=0;	
			}
			changeA();
		},5000);
	}
	autoTab();
	//图片文字列表结束
	
	//今日焦点开始
	var oFocus=document.getElementById("focus");
	var oFocusBtnLeft=getByClass(oFocus,"btn-left")[0];
	var oFocusBtnRight=getByClass(oFocus,"btn-right")[0];
	var aFocusTwoPic=getByClass(oFocus,"top")[0].getElementsByTagName("img");
	var aFocusTwoTopBg=getByClass(oFocus,"top_bg")[0];
	var aFocusTwoSpan=aFocusTwoTopBg.getElementsByTagName("span");

	var iFocusNow=0;
	var timerFocus=null;
	
	oFocusBtnLeft.onmouseover=oFocusBtnRight.onmouseover=function(){
		clearInterval(timerFocus);
	};
	
	oFocusBtnLeft.onmouseout=oFocusBtnRight.onmouseout=function(){
		focusAutoTab();
	};
	
	oFocusBtnLeft.onclick=function(){
		clearInterval(timerFocus);
		iFocusNow--;
		if(iFocusNow<0){
			iFocusNow=aFocusTwoPic.length-1;	
		}
		changeFocus();
	};
	
	oFocusBtnRight.onclick=function(){
		clearInterval(timerFocus);
		iFocusNow++;
		if(iFocusNow>aFocusTwoPic.length-1){
			iFocusNow=0;	
		}
		changeFocus();
	};
	
	function changeFocus(){
		for(var i=0;i<aFocusTwoPic.length;i++){
			aFocusTwoPic[i].className="";
			aFocusTwoSpan[i].className="";
		}
		aFocusTwoPic[iFocusNow].className="selected";
		aFocusTwoSpan[iFocusNow].className="selected";
	}
	
	function focusAutoTab(){
		clearInterval(timerFocus);
		timerFocus=setInterval(function(){
			iFocusNow++;
			if(iFocusNow==aFocusTwoPic.length){
				iFocusNow=0;
			}	
			changeFocus();
		},2000);	
	}
	
	focusAutoTab();
	//今日焦点结束
	
	//综艺开始
	var aVarietyImg=$("#variety .left .bottom .one img");
	var aVarietyP=$("#variety .left .bottom .one div");
	
	var iVarietyNow=0;
	var timerVariety=null;
	$("#variety .btn-left, #variety .btn-right").hover(function(){
		clearInterval(timerVariety);
	},function(){
		varietyAutoTab();
	});
	$("#variety .btn-left").bind("click",function(){
		clearInterval(timerVariety);
		iVarietyNow--;
		if(iVarietyNow<0){
			iVarietyNow=aVarietyImg.length-1;	
		}
		changeVariety();
	});
	
	$("#variety .btn-right").bind("click",function(){
		clearInterval(timerVariety);
		iVarietyNow++;
		if(iVarietyNow>aVarietyImg.length-1){
			iVarietyNow=0;	
		}
		changeVariety();
	});
	
	function changeVariety(){
		for(var i=0;i<aVarietyImg.length;i++){
			aVarietyImg[i].className="";
			aVarietyP[i].className="variety_p";
		}
		aVarietyImg[iVarietyNow].className="selected";
		aVarietyP[iVarietyNow].className="variety_p selected";
	}
	
	function varietyAutoTab(){
		clearInterval(timerVariety);
		timerVariety=setInterval(function(){
			iVarietyNow++;
			if(iVarietyNow==aVarietyImg.length){
				iVarietyNow=0;
			}	
			changeVariety();
		},2000);	
	}
	
	varietyAutoTab();
	//综艺结束
	
	//隐藏的导航条开始
	var oFixedTopOut=document.getElementById("fixed_top_out");
	var oFixedTop=document.getElementById("fixed_top");
	var oFixedTopUl=oFixedTop.getElementsByTagName("ul")[0];
	var aFixedTopLi=oFixedTopUl.getElementsByTagName("li");
	var aFixedTopTxt1=getByClass(oFixedTop,"txt1")[0];
	var oFixedTopUpload=document.getElementById("fixed_upload");
	var oFixedTopUploadHidden=document.getElementById("fixed_upload_hidden");
	var oFixedTopMessage=document.getElementById("fixed_message");
	var oFixedTopMessageHidden=document.getElementById("fixed_message_hidden");
	var oFixedTopHistory=document.getElementById("fixed_history");
	var oFixedTopHistoryHidden=document.getElementById("fixed_history_hidden");
	var oFixedNavBtn=document.getElementById("fixed_nav_btn");
	var oFixedNavBg=document.getElementById("fixed_nav_bg");
	
	var timerFixedTop=null;
	
	window.onscroll=function(){
		if(document.documentElement.scrollTop>=window.screen.availHeight){
			oFixedTopOut.style.display="block";
		}else{
			oFixedTopOut.style.display="none";
		}
	};
	
	oFixedNavBtn.onclick=function(){
		if(oFixedNavBg.style.display=="block"){
			oFixedNavBg.style.display="none";
			oFixedNavBtn.style.backgroundPosition="0 0";
			oFixedNavBtn.style.height=38+"px";
		}else{
			oFixedNavBg.style.display="block";
			oFixedNavBtn.style.backgroundPosition="0 -39px";
			oFixedNavBtn.style.height=49+"px";
		}
	};
	
	//上传
	oFixedTopUploadHidden.onmouseover=oFixedTopUpload.onclick=function(){
		clearInterval(oFixedTopUpload.timerFixedTop);
		oFixedTopUpload.timerFixedTop=setInterval(function(){
			topDisplay(oFixedTopUpload,oFixedTopUploadHidden);
		},10);	
	};
	
	oFixedTopUpload.onmouseover=function(){
		clearInterval(oFixedTopUpload.timerFixedTop);
		topMouseover(oFixedTopUpload);	
	};
	
	oFixedTopUploadHidden.onmouseout=oFixedTopUpload.onmouseout=function(){
		_this=this;
		clearInterval(oFixedTopUpload.timerFixedTop);
		oFixedTopUpload.timerFixedTop=setInterval(function(){
			topMouseout(oFixedTopUpload,oFixedTopUploadHidden);
		},10);
	};
	
	//消息
	oFixedTopMessageHidden.onmouseover=oFixedTopMessage.onclick=function(){
		clearInterval(oFixedTopMessage.timerFixedTop);
		oFixedTopMessage.timerFixedTop=setInterval(function(){
			topDisplay(oFixedTopMessage,oFixedTopMessageHidden);
		},10);	
	};
	
	oFixedTopMessage.onmouseover=function(){
		clearInterval(oFixedTopMessage.timerFixedTop);
		topMouseover(oFixedTopMessage);	
	};
	
	oFixedTopMessageHidden.onmouseout=oFixedTopMessage.onmouseout=function(){
		clearInterval(oFixedTopMessage.timerFixedTop);
		oFixedTopMessage.timerFixedTop=setInterval(function(){
			topMouseout(oFixedTopMessage,oFixedTopMessageHidden);
		},10);
	};
	
	var oFixMessageHiddenCenter=getByClass(oFixedTopMessageHidden,"center")[0];
	var oFixMessageHiddenLi=oFixedTopMessageHidden.getElementsByTagName("li");
	var oFixMessageHiddenCenterSpan=oFixMessageHiddenCenter.getElementsByTagName("span");
	
	for(var i=0;i<oFixMessageHiddenLi.length;i++){
		
		oFixMessageHiddenLi[i].index=oFixMessageHiddenLi[i].index=i;
		oFixMessageHiddenLi[i].onmouseover=oFixMessageHiddenLi[i].onclick=function(){
			for(var i=0;i<oFixMessageHiddenLi.length;i++){
				oFixMessageHiddenCenterSpan[i].className="";		
			}
			oFixMessageHiddenCenterSpan[this.index].className="selected";	
		};	
	}
	
	
	//播放记录
	oFixedTopHistoryHidden.onmouseover=oFixedTopHistory.onclick=function(){
		clearInterval(oFixedTopHistory.timerFixedTop);
		oFixedTopHistory.timerFixedTop=setInterval(function(){
			topDisplay(oFixedTopHistory,oFixedTopHistoryHidden);
		},10);	
	};
	
	oFixedTopHistory.onmouseover=function(){
		clearInterval(oFixedTopHistory.timerFixedTop);
		topMouseover(oFixedTopHistory);	
	};
	
	oFixedTopHistoryHidden.onmouseout=oFixedTopHistory.onmouseout=function(){
		clearInterval(oFixedTopHistory.timerFixedTop);
		oFixedTopHistory.timerFixedTop=setInterval(function(){
			topMouseout(oFixedTopHistory,oFixedTopHistoryHidden);
		},10);
	};
	
	function topDisplay(obj1,obj2){
		var aI=obj1.getElementsByTagName("i")[0];
		obj2.style.display="block";
		aI.style.borderTop=0;
		aI.className="selected";
	}
	
	function topMouseover(obj1){
		var aI=obj1.getElementsByTagName("i")[0];
		if(aI.className!="selected"){
			aI.style.borderTop="6px solid #6CC900";
		}
	}
	
	function topMouseout(obj1,obj2){
		var aI=obj1.getElementsByTagName("i")[0];
		aI.className="";
		aI.style.borderTop="6px solid #CCC";
		obj2.style.display="none"	
	}
	//隐藏的导航条结束
	
	//个人信息
	var oPerInfo=document.getElementById("person_info").getElementsByTagName("img")[0];
	var oBigPerInfo=document.getElementById("person_info").getElementsByTagName("div")[0];
	
	var timerPerInfo=null;
	
	oBigPerInfo.onmouseover=oPerInfo.onmouseover=function(){
		oBigPerInfo.style.display="block";
		clearInterval(timerPerInfo);
		timerPerInfo=setInterval(function(){
			var iCur=parseInt(parseFloat(getStyle(oBigPerInfo,"opacity"))*100);	
			var iSpeed=(100-iCur)/8;
			iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
				
			oBigPerInfo.style.filter="alpha(opacity:"+(iCur+iSpeed)+")";				
			oBigPerInfo.style.opacity=(iCur+iSpeed)/100;												
		},10);
	};
	oBigPerInfo.onmouseout=oPerInfo.onmouseout=function(){
		var bStop=true;
		clearInterval(timerPerInfo);
		timerPerInfo=setInterval(function(){
			var iCur=parseInt(parseFloat(getStyle(oBigPerInfo,"opacity"))*100);	
			var iSpeed=iCur/8;
			iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
			if(iCur!=0){
				bStop=false;
				oBigPerInfo.style.filter="alpha(opacity:"+(iCur-iSpeed)+")";				
				oBigPerInfo.style.opacity=(iCur-iSpeed)/100;												
			}else{
				bStop=true;	
			}
			if(bStop){
				clearInterval(timerPerInfo);
				oBigPerInfo.style.display="none";
			}
		},30);
	};
};

















//class选择器
function getByClass(oParent,sClass){
	if(document.getElementsByClassName){
		return oParent.getElementsByClassName(sClass);	
	}else{
		var aEle=oParent.getElementsByTagName("*");
		var aResult=[];
		var re=new RegExp("\\b"+sClass+"\\b","i");

		for(var i=0;i<aEle.length;i++){
			if(re.test(aEle[i].className)){
				aResult.push(aEle[i]);
			}	
		}
		return aResult;
	}
}



//调用非行间样式
function getStyle(obj,attr){          
	if(obj.currentStyle){
		return obj.currentStyle[attr];	//适用于IE和Opera浏览器
	}else{
		return getComputedStyle(obj,false)[attr];   //适用于Firefox和Chrome浏览器
	}
}

















