//设置导航栏识别锁定
	$(window).scroll(function(){
		if($(this).scrollTop()>100){
			$('#menu').addClass('navbar-fixed-top fixMenu');
		}else{
			$('#menu').removeClass('navbar-fixed-top fixMenu');

		}
	})
	
	//设置轮播图自动播放
	/**$('.myCarousel').carousel({
		interval:4000;
	})
	*/
	
	//商品的内阴影响应与按钮的隐藏显示
	$('.index_show').mouseenter(function(){
		$(this).addClass('inShadow');
		$(this).find("#btn_list").css('visibility','visible'); 
		
	})
	
	$('.index_show').mouseleave(function(){
		$(this).removeClass('inShadow');
		$(this).find("#btn_list").css('visibility','hidden'); 
		
	})
	
	
	
	//返回顶部
	$(document).ready(function(){
		$('#back_top').hide();
		$(window).scroll(function(){
			if($(this).scrollTop()>100){
				$('#back_top').fadeIn(500);
			}else{
				$('#back_top').fadeOut(500);
			}
		})
		
	})
	
	$('#back_top').click(function(){
		$('body,html').animate({scrollTop:0},100); 
		return false;
	})
	
//	//需要在手机端检测
//	$(window).ready(function(){
//		if(window.screen.height<1024){
//			$('#index_pic').addClass('hidden');
//		}
//	})
	
	//默认地址
	$(document).ready(function(){
			$('.address_list').click(function(){
				$('.address_list').removeClass('address_selected');
				$(this).addClass('address_selected');
				//拿着这个获取收货地址
			})
			
		})
	
