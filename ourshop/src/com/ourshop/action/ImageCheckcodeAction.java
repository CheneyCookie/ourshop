package com.ourshop.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;


@Controller("imageCheckcode")
@Scope("prototype")
public class ImageCheckcodeAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	
		//生成验证码
		public  String execute(){
			BufferedImage bi = new BufferedImage(100, 40, BufferedImage.TYPE_INT_BGR);	
			Graphics g = bi.getGraphics();
			//随机数对象
			Random random = new Random();
			//设置验证码图片背景的颜色
			g.setColor(new Color(255,255,240));
			//定义验证码图片的位置、大小
			g.fillRect(0, 0, 100, 40);
			//创建字符数组，存放验证码所需字符
			char[] ch = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890".toCharArray();

			//设置统一的验证码字符大小
			Font font = new Font(null,206,25);
			//索引，获取字符数组任意下标
			int index=0;
			//创建存放验证码字符的容器
			StringBuffer sb = new StringBuffer();
			//画出验证码
			creatCode(g,index,random,ch,font,sb);
			//画干扰线
			creatLine(g, 100, 40, 5);
			//画干扰点
			creatPoint(g, 100, 40, 30);
			//将验证码保存在session中方便验证
			ServletActionContext.getRequest().getSession().setAttribute("imgcode",sb.toString());
			//将验证码做成图片格式
			try {
				ImageIO.write(bi,"JPG",ServletActionContext.getResponse().getOutputStream());
			} catch (IOException e) {
				throw new RuntimeException("验证码出错！");
			}
			
			return NONE;
		}
		/**
		 * @param g       画笔
		 * @param index	     索引，获取字符数组任意下标
		 * @param random  随机数
		 * @param ch	     验证码字符数组
		 * @param font    验证码字体
		 * @param sb	     存放验证码字符的容器
		 */
		private  void creatCode(Graphics g,int index,Random random,char[] ch,Font font,StringBuffer sb){
			for(int i=0;i<4;i++){
				index = random.nextInt(ch.length);
				g.setColor(getColor());
				g.setFont(font);
				//将验证码画出
				g.drawString(ch[index]+"",(i*23)+10,28);
				//存放验证码字符
				sb.append(ch[index]);
			}
		}
		
		//生成干扰线
		/**
		 * @param g		   画笔
		 * @param weight 画布的宽度
		 * @param height 画布的高
		 * @param num    干扰线的数量
		 */
		private  void creatLine(Graphics g,int weight,int height,int num){
			for(int i=0;i<num;i++){
				int x1=(int) (Math.random()*(weight/3));
				int y1=(int) (Math.random()*(height));
				int x2=(int) (Math.random()*(weight/2+(weight/2)));
				int y2=(int) (Math.random()*(height));
				g.setColor(getColor());
				g.drawLine(x1, y1, x2, y2);
			}
		}
		
		//生成干扰点
		/**
		 * @param g		   画笔
		 * @param weight 画布的宽度
		 * @param height 画布的高
		 * @param num    干扰点的数量
		 */
		private  void creatPoint(Graphics g,int weight,int height,int num){
			for(int i=0;i<num;i++){
				int x = (int) (Math.random()*weight);
				int y = (int) (Math.random()*height);
				g.setColor(getColor());
				g.drawString(".", x, y);
			}
		}
		
		//随机返回一种颜色
		private  Color getColor() {
			int R = (int) (Math.random() * 255);
			int G = (int) (Math.random() * 255);
			int B = (int) (Math.random() * 255);
			return new Color(R, G, B);
		}
}
