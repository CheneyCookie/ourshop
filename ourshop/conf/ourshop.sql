/*创建数据库,并设置编码*/
create database ourshop default character set utf8;

use ourshop;
/*删除管理员表*/
drop table if exists admin;
/*删除商品类别表*/
drop table if exists category;
/*删除商品信息表*/
drop table if exists product;

/*管理员表*/
create table admin
(
   /* 管理员编号,自动增长 */
   id int not null auto_increment,
   /* 管理员名  */
   name varchar(20),
   /* 管理员密码 */
   password	varchar(20),
   /* 设置编号为主键 */
   primary key (id)
);

/*商品类别表结构*/
create table category
(
   /* 类别编号,自动增长 */
   id int not null auto_increment,
   /* 类别名称 */
   type varchar(20),
   /* 设置类别编号为主键 */
   primary key (id)
);

/*商品表结构*/
create table product
(
   /* 商品编号,自动增长 */
   id int not null auto_increment,
   /* 商品名称 */
   name varchar(40),
   /* 商品价格 */
   price decimal(8,2),
   /*商品库存*/
   number bigint,
   /* 商品图片 */
   picture varchar(200),
   detailPic varchar(800),
   remarkPic varchar(800),
   /* 商品简单介绍 */
   remark longtext,
   /* 商品生成时间 */
   date timestamp default CURRENT_TIMESTAMP,
   /* 是否为推荐商品,推荐商品才有可能显示在商城首页 */
   commend bool default false,
   /* 是否为热销商品,热销商品才有可能显示在商城首页 */
   hot bool default false,
   /* 商品所在的类别编号*/
   cid int,
   /* 设置商品编号为主键 */
   primary key (id)
);

/*用户表结构*/
create table user
(
   /* 用户编号,自动增长 */
   id int not null auto_increment,
   /* 用户真实姓名 */
   name varchar(20),
   /* 用户登录名 */
   login varchar(20),
   picture varchar(30),
   /* 用户登录密码 */
   password varchar(20),
   /* 用户性别 */
   sex varchar(20),
   /*用户生日*/
   birthday date,
   /*注册时间*/
   date timestamp default CURRENT_TIMESTAMP,
   /* 用户电话 */
   phone varchar(20),
   /* 用户Email */
   email varchar(20),
   /* 设置用户编号为主键 */
   primary key (id)
);

/*地址表*/
create table address
(
	/*地址编号，自动增长*/
	id int not null auto_increment,
	name varchar(20),
	phone varchar(20),
	/*地址名*/
	addname longtext,
	/*所属用户*/
	uid int not null,
	/* 设置地址编号为主键 */
    primary key (id)
);

      
/*购物车表*/
create table shopcar
(
	/*购物车编号，自动增长*/
	id int not null auto_increment,
	/*商品数量*/
	number int,
	/*商品*/
	pid int,
	/*所属用户*/
	uid int,
	/*设置购物车编号为主键*/
	primary key (id)
);


/*订单表*/
create table ourshop_order
(
	/*订单编号*/
	id int not null auto_increment,
	pId varchar(200),
	pName varchar(200),
	pPrice varchar(200),
	pNumber varchar(200),
	pPicture varchar(200),
	address varchar(100),
	phone varchar(20),
	name varchar(20),
	/*订单总价*/
	total decimal(8,2),
	/*买家留言*/
	message longtext,
	/*订单生成日期*/
	date timestamp default CURRENT_TIMESTAMP, 
	/*订单所属用户*/
	uid int,
	sid int,
	primary key (id)
);


/* Table: 订单状态表结构  */
create table status
(
   /* 状态编号,自动增长 */
   id int not null auto_increment,
   /* 订单状态 */
   status varchar(10),
   /* 设置订单编号为主键 */
   primary key (id)
);

create table collection
(
	id int not null auto_increment,
	date timestamp default CURRENT_TIMESTAMP,
	pid int,
	uid int,
	primary key (id)
)



alter table product add constraint FK_Relationship_1 foreign key (cid)
      references category (id) on delete restrict on update restrict;
alter table address add constraint FK_Relationship_2 foreign key (uid)
      references user (id) on delete restrict on update restrict;
alter table shopcar add constraint FK_Relationship_3 foreign key (pid)
      references product (id) on delete restrict on update restrict;
alter table shopcar add constraint FK_Relationship_4 foreign key (uid)
      references user (id) on delete restrict on update restrict;
alter table ourshop_order add constraint FK_Relationship_5 foreign key (uid)
      references user (id) on delete restrict on update restrict;
alter table ourshop_order add constraint FK_Relationship_6 foreign key (sid)
	  references status (id) on delete restrict on update restrict;
alter table collection add constraint FK_Relationship_9 foreign key (pid)
      references product (id) on delete restrict on update restrict;
alter table collection add constraint FK_Relationship_10 foreign key (uid)
      references user (id) on delete restrict on update restrict;
alter table ourshop_order AUTO_INCREMENT = 2017000000;
      





/*插入测试用例*/
INSERT INTO admin(name,password) values ('admin','admin');

INSERT INTO category (type) VALUES ('电脑');
INSERT INTO category (type) VALUES ('手机');
INSERT INTO category (type) VALUES ('平板');
INSERT INTO category (type) VALUES ('相机');
INSERT INTO category (type) VALUES ('游戏机');


/* 商品测试用例 */
INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('华硕(ASUS)顽石四代',4599.00,500,'华硕101.jpg','华硕102.jpg,华硕112.jpg,华硕122.jpg','华硕12.jpg,华硕11.jpg,华硕12.jpg','顽石四代尊享版 FL590015.6英寸轻薄笔记本电脑',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('华硕（ASUS)顽石FH5900',5499.00,500,'华硕201.jpg','华硕202.jpg,华硕212.jpg,华硕222.jpg','华硕20.jpg,华硕21.jpg,华硕22.jpg','顽石电竞版FH5900 15.6英寸游戏笔记本电脑',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('华硕(ASUS)灵耀 U4000',7999.00,500,'华硕301.jpg','华硕302.jpg,华硕312.jpg,华硕322.jpg','华硕30.jpg,华硕31.jpg,华硕32.jpg','灵耀 U4000 14.0英寸超轻薄笔记本电脑',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' 惠普（HP）畅游人',4999.00,500,'hp111.jpg','hp121.jpg,hp122.jpg,hp123.jpg','hp131.jpg,hp132.jpg,hp133.jpg','惠普（HP）畅游人Pavilion 14-al125TX 14英寸轻薄笔记本',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('惠普（HP）EliteBook',5499.00,500,'hp211.jpg','hp221.jpg,hp222.jpg,hp223.jpg','hp231.jpg,hp232.jpg,hp233.jpg','惠普（HP）EliteBook 828 G3 12.5英寸商务轻薄笔记本电脑',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' 惠普(HP) 幽灵Spectre',5799.00,500,'惠普301.jpg','惠普302.jpg,惠普312.jpg,惠普322.jpg','惠普30.jpg,惠普31.jpg,惠普32.jpg',' 惠普(HP) 幽灵Spectre x360 13-w021TU 13.3英寸超轻薄翻转笔记本',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('联想（ThinkPad）轻薄系列',4399.00,500,'联想101.jpg','联想102.jpg,联想112.jpg,联想122.jpg','联想10.jpg,联想11.jpg,联想12.jpg','轻薄系列E470c（20H3A000CD）14英寸笔记本电脑',true,true,1);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('ThinkPad New S2',5499.00,500,'联想201.jpg','联想201.jpg,联想201.jpg,联想201.jpg','联想201.jpg,联想201.jpg,联想201.jpg','ThinkPad New S2（20GU0000CD）13.3英寸超薄笔记本电脑',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('ThinkPad X260',6999.00,500,'联想301.jpg','联想301.jpg,联想301.jpg,联想301.jpg','联想301.jpg,联想301.jpg','ThinkPad X260（20F6A09KCD）12.5英寸超极笔记本电脑',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('华为 Mate9 Pro',5588.00,500,'华为101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','华为 Mate9 Pro 4G手机 双卡双待 银钻灰 全网通4G(6G RAM+128G ROM)标配',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('HUAWEI Mate 9 pro 保时捷限量版',13999.00,500,'华为201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','HUAWEI Mate 9 pro 保时捷限量版 4G全网通手机 曜石黑 （6G RAM+256G',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('荣耀6X 畅玩6X',1399.00,500,'华为301.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' 荣耀6X 畅玩6X 全网通4G智能手机 典雅灰 全网通（3G+32G）标配版',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' 荣耀畅玩5',725.00,500,'华为401.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' 荣耀畅玩5 手机 畅玩5+金色 移动4G(2G RAM+16G ROM)标配  ',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('华为 nova',2299.00,500,'华为501.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','华为 nova 全网通手机 幻夜黑（华为nova青春版） 3GB+32GB 热销款 ',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('三星 Galaxy C9 Pro',3199.00,500,'三星201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','三星 Galaxy C9 Pro（C9000） 墨玉黑 全网通4G手机 双卡双待',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('三星 Galaxy A9',2249.00,500,'三星201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' 三星 Galaxy A9（SM-A9100）魔幻金 全网通4G手机 双卡双待',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('三星 Galaxy J3 Pro',799.00,500,'三星301.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' 三星 Galaxy J3 Pro（J3110）金色 移动联通双4G手机',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('三星 Galaxy J3 Pro',4888.00,500,'三星401.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','三星 Galaxy J3 Pro（J3110）金色 移动联通双4G手机',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('三星 Galaxy On5',1099.00,500,'三星501.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','三星 Galaxy On5 （G5700） 3GB+32GB 臻金版 流沙金 全网通4G手机 双卡双待',true,true,2);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Apple iPad 平板电脑',2688.00,500,'苹果101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' Apple iPad 平板电脑 9.7英寸（32G WLAN版/A9 芯片/Retina显示屏/Touch ID技术',true,true,3);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Apple iPad mini 4 平板电脑',3288.00,500,'苹果101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','Apple iPad mini 4 平板电脑 7.9英寸（128G WLAN版/A8芯片/Retina显示屏/Touch ID技术 MK9P2CH',true,true,3);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' 新款Apple iPad Air2平板电脑',4318.00,500,'苹果101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' 新款Apple iPad Air2平板电脑 9.7英寸升级版 深空灰 Air2 128G Cellular版+钢化膜 ',true,true,3);


INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('小米（MI）平板2代',1449.00,500,'小米201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','小米平板3 WIFI版 7.9英寸 （ MT8176 4G/64G 500W/1300W ）香槟金 ',true,true,3);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' 小米（MI）平板2代',1790.00,500,'小米201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','小米（MI）平板2代 7.9英寸平板电脑 前黑后银(2G RAM+16G ROM)套装 ',true,true,3);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Canon/佳能EOS',3300.00,500,'佳能101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','Canon/佳能EOS 1300D 入门级高清单反数码相机带WIFI',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Canon/佳能入门单反数码相机EOS',4300.00,500,'佳能201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' Canon/佳能入门单反数码相机EOS 760D 750D套机带WIFI ',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Canon/佳能 EOS 70D 套机',1549.00,500,'佳能301.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' Canon/佳能 EOS 70D 套机 高清数码单反相机 带WIFI ',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('  全新正品Canon/佳能',5480.00,500,'佳能401.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','Canon/佳能100DEOS 100D白色18-55单反相机kiss X7',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Nikon尼康 D5300套机',2400.00,500,'佳能501.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','全新正品Canon/佳能 EOS 80D套机 18-135USM中端高清单反数码相机',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Nikon/尼康D5600套机',3160.00,500,'尼康101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','Nikon尼康 D5300套机18-140VR镜头单反相机D5300单机AF-P18-55VR',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' Nikon尼康 D3200套机单反相机',1380.00,500,'尼康201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','Nikon/尼康D5600套机18-55mm 防抖单反相机胜5300 ',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('国行Nikon/尼康D5300',2598.00,500,'尼康301.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','Nikon尼康 D3200套机单反相机 18-55mm VRII镜头18-105 单机d3200',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('尼康D90单机 数码单反相机',2280.00,500,'尼康401.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','正品Nikon/尼康D90单机 数码单反相机 正品特价秒杀超D7100',true,true,4);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('索尼PSV2000全新原装', 1130.00,500,'尼康501.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','索尼PSV2000全新原装 PSV2000游戏机3.60破解掌机装好游戏免费玩',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('新亚电玩 原装全新索尼PSV',1060.00,500,'索尼101.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','广州新亚电玩 原装全新索尼PSV PSV2000 PSVITA 掌机游戏机',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('任天堂NS switch NS主机任天堂NX',1850.00,500,'索尼201.jpg','527X527 (1).jpg,527X527 (2).jpg,527X527 (3).jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg',' 任天堂NS switch NS主机任天堂NX 交换机游戏机家用日版/港版现货',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('原装NEW3DS 3DSLL免卡汉化主机',1080.00,500,'红白机101.jpg','红白机101.jpg,红白机101.jpg,红白机101.jpg','红白机101.jpg,红白机101.jpg','全新原装NEW3DS 3DSLL免卡汉化主机 3dsll/3ds 支持无卡',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('任天堂掌机',1198.00,500,'任天堂101.jpg','任天堂101.jpg,任天堂101.jpg,任天堂101.jpg','任天堂101.jpg,任天堂101.jpg','任天堂掌机 NEW 3DS 3DSLL 日版 新3DS 3DSLL 全新现货',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('视家庭体感游戏机',1749.00,500,'微软101.jpg','微软101.jpg,微软101.jpg,微软101.jpg','微软101.jpg,微软101.jpg',' 热销】全新XBOX360 E S版双人电视家庭体感游戏机 xboxone主机 ',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
('XBOX ONE xboxone S版',1299.00,500,'任天堂201.jpg','任天堂201.jpg,任天堂201.jpg,任天堂201.jpg','2_1478866035_detail.jpg,5_1478866035_detail.jpg','XBOX ONE xboxone S版 原装体感游戏机主机 国行 港版 新款1T 2T ',true,true,5);

INSERT INTO product (name,price,number,picture,detailPic,remarkPic,remark,commend,hot,cid) VALUES 
(' 任天堂FC红白机',238.00,500,'红白机101.jpg','红白机101.jpg,红白机101.jpg,红白机101.jpg','红白机101.jpg,红白机101.jpg','任天堂FC红白机经典插黄卡8位老式游戏机支持4K高清电视无线手柄',true,true,5);


/* 用户测试用例 */
INSERT INTO user (name,login,password,sex,birthday,phone,email,picture)
VALUES ('陈','cheney','123','男','1996-11-16','15079030106','10000@qq.com','avatar.png');

/*插入状态测试用例*/
INSERT INTO status (status) VALUES ('未支付');
INSERT INTO status (status) VALUES ('已支付');
INSERT INTO status (status) VALUES ('配送中');
INSERT INTO status (status) VALUES ('订单完成');




/*插入购物车测试用例*/
INSERT INTO shop_forder (name,phone,remark,date,total,address,post,uid) VALUES ('bb','123','备注',default,200.3,'广州天河区','1000',1);

/*插入购物车项测试用例*/
INSERT INTO shop_sorder (name,price,number,gid,fid) VALUES ('空调',200,1,15,2013021801);
INSERT INTO shop_sorder (name,price,number,gid,fid) VALUES ('电视',0.3,1,16,2013021801);


SELECT * FROM shop_account;
SELECT * FROM shop_category;
SELECT * FROM shop_product;
SELECT * FROM shop_user;
SELECT * FROM shop_status;
SELECT * FROM shop_forder;
SELECT * FROM shop_sorder;
