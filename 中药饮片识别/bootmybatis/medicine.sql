/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : medicine

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 11/05/2022 00:50:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accumulate
-- ----------------------------
DROP TABLE IF EXISTS `accumulate`;
CREATE TABLE `accumulate`  (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `aclate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accumulate
-- ----------------------------
INSERT INTO `accumulate` VALUES (1, '小明', 0);
INSERT INTO `accumulate` VALUES (2, '小白', 0);
INSERT INTO `accumulate` VALUES (3, '小花', 0);

-- ----------------------------
-- Table structure for local
-- ----------------------------
DROP TABLE IF EXISTS `local`;
CREATE TABLE `local`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `top` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `local` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `p1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `p2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `p3` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of local
-- ----------------------------
INSERT INTO `local` VALUES (1, '川麦冬种植效益分析', '2月21日的最新行情，新货平均成交价60-70元之间，其中6成干的新货当地今日成交价在64-68元左右。买家整体购买积极性不高，成交量随着干货增多，反而下滑，购买者多为订单急用加工商户，压货补仓者。实际每日成交比例占35%-55%不等。毕竟产量品质提高的已成今年麦冬产新主旋律，大家对于目前价位没有承接意愿，更多是在持币观望中，所以个人认为最近一段时间的成交价格并不作为整体麦冬产新的行情走势。', '川麦冬种植方法', NULL, NULL, '1、选地整地，种植麦冬的土壤要保证疏松透气、土层深厚、富含营养物质，并且麦冬不能连坐，如果该地之前种过其它作物，要将土壤打整细碎，然后施加堆肥，让麦冬健康生长。', '2、处理苗株，麦冬一般采用分株的方式繁殖，首先要选择健壮的植株，将其须根斩下，分成单株，剪去残留须根，然后将麦冬放在清水中吸收水分，等植株枝叶舒展后进行栽种。', '3、栽种方法，栽种麦冬要在非雨天进行，在土壤中开挖条沟，施加稀薄的猪粪水，然后将苗株放入，麦冬栽种后要用泥土将根系固定住，将生长温度维持在15摄氏度左右。', NULL, NULL);
INSERT INTO `local` VALUES (2, '茜草种植效益分析', '茜草药用为小品种， 年需求量500吨，2006年至今，价格一直缓步攀升，从10元左右上涨到26元，预计价格可能还会有上涨。一方面*生资源不足，虽然茜草产区广泛，但每年实际的产量并不大，而且茜草的恢复能力很慢，一般一次性采挖过后， 需要几年时间才能恢复，*生资源越挖越少；并且采挖人员也在减少；另一方面家种刚刚起步，暂时还不能弥补*生资源不足的局面；同时随着现代医学的不断研发，用途也会越来越广，需求量也会上升。 ', '茜草种植方法', NULL, NULL, '1、整地施肥、茜草喜凉爽而湿润的环境，有较强的耐寒力，怕积水，需要求土壤疏松肥沃、富含有机质的沙质壤土，土壤过度贫瘠或低洼易积水的地区不宜种植。种植前先将杂草残株清除干净，在结合深翻每亩施入土杂肥三千公斤、氮磷钾肥50-80公斤，在作畦，方便排水。', ' 2、繁殖、前茬可通过种子和扦插做好繁殖，其中播种又可包括春播和秋播，春播的时间清明节前后，秋播在封冻前。播种时在畦面上开浅沟，在将种子撒入沟中，然后覆土浇水、保墒，沟距30cm，每亩播种3公斤。扦插选生长健壮，发育良好，无病虫害的茎蔓，将其按每2-3节剪成做插条，按株行距10×5cm插入土中，然后浇水、保墒、遮荫。', '3、田间管理，无论是播种還是扦插，基本都需要培育1年的时间才能做好移栽，移栽时将幼苗调节株行距50×30cm定植在畦面上，浇水保墒，促进成活。在茜草出苗整齐后，需要要注意中耕除草，以免杂草抢占养分，中耕松土可使根系生长顺利，还需要要注意水分，在干旱时需要立刻浇水，阴下雨天需要要注意排水防涝，以免烂根。但幼苗生长到30cm时，需要搭架支柱，使其能攀援。', NULL, NULL);
INSERT INTO `local` VALUES (3, '远志种植效益分析', '远志种植首先需要租土地，租金一般是六百块钱左右；其次就是购买远志种子，每亩至少需要三四公斤，种子价格约为一百八十块钱一公斤，那么种子费用约为五百到六百；还有就是种植所需肥料费用，差不多就只要三百块钱；最后就是人工成本投入，一亩差不多是七百块钱；那么总成本投入约为两千二。而每亩的产量算一百五到两百公斤，远志的收购价是七十到一百一十元不等，那么种植的总收益是一万一到一万七之间不等。减去种植的成本之后，每亩的纯利润是八千到一万四不等', '远志种植方法', NULL, NULL, '1.直接播种、生产上多采用直播的方式播种。远志种子小，要求整地质量高；水浇地要做畦，畦内要平整；灌足底墒水，待墒情适宜时再播种。按行距20厘米开沟，沟宽10-12厘米、沟深1.5-2.0厘米，用滚简将种子播于沟内，稍加镇压，覆薄土（一般用脚顺沟拖，或用1布袋装土顺沟拖）。覆土以看不见种子为宜，切不可过深。然后再撒盖草，以利保墒。无盖草的地区可用锯木屑（每亩用量为2立方米）。一般每亩播种量4.0-4.5千克，播后15天左右出苗。', '2.育苗移栽，（1）育苗。可提前到3月上、中旬进行播种。在整好的苗床上开沟条播，覆土1厘米，地面干燥时适当浇水，随即用塑料薄膜盖畦面，用土压紧，防止风刮。盖膜能提高地温，保持湿润，播种后10天左右即可出苗。为了加快繁殖速度，提高种苗的成活率，也可在温室下采用塑料育苗盘及蛭石做基质育苗，1粒种子1穴，8-10 天即可出苗。由于温室温度适宜，小苗生长快、长势壮，容易形成大苗、壮苗。待大田气温适宜时，再定植于大田，成活率达9%。由于带蛭石移栽，所以远志无缓苗期、大田生长旺盛、采挖期提早、产量高。', '3.根段繁殖，远志的地下根上有根节，根节可产生不定芽，因此，远志的根可做繁殖材料。选择健壮、无病虫害、色泽新鲜、根直径在0.3-0.5厘米以上的根，在4月上旬开始种植。在整好的地上按行距15~20厘米开沟，沟深6-8厘米，将根掰成小段，每段有根节2-3节，每隔10厘米放1段，然后覆土3~5厘米。根段繁殖生产性能好，同时也是良种繁育、品种选择的有效途径。', NULL, NULL);
INSERT INTO `local` VALUES (4, '防己种植效益分析', '防己为防己科植物粉防己的根，春秋季种植，生长期6-8年。防己生长周期长，要在地下生长6-8年才可采挖，导致家种面积比较少，市场上防己以野生资源为主，所以家种防己后市比较看好。', '防己种植方法', NULL, NULL, '1，选择适宜的环境，防己属于多年生落叶成本植物，具有耐旱喜阴，喜欢温暖，适宜生长的土壤PH值在6.8~7，在微酸性土壤中生长良好，在偏碱性的土壤中生长较差。因此，选择种植防己的土地，要同时符合，土壤深厚疏松，肥沃，微酸性，富含有机质的沙壤土中，适宜生长的温度为15~25度，容易获得优质高产。', '2，采集防己种子，防己的种子一般在9月份成熟，果实外表皮，转为红色，变软，就可及时采收，将种子取出后，放在干燥通风阴凉处风干，进行保存，一般，优质成熟的防己种子，千粒重大约在26克左右，在第2年3月至4月份就可进行播种，也可采集种子后，在当年的9月10月份进行播种', '3，种子播种育苗，将干透的防己种子放在50度的温水当中，进行烫种，一边放进种子，一边搅拌，大约经过10分钟左右，水温降至30度，停止搅拌，水温降至常温，把种子捞出来放入现配的0.1%高锰酸钾水溶液中，继续浸泡20个小时左右，然后捞出来，就可进行播种。早春播种，10厘米地温，稳定在15公分以上，育苗床应选择土地疏松肥沃，排灌方便，雨后不积水，在育苗床上是用充分腐熟的农家肥，或者使用育苗床专用肥，并且加入微生物菌剂，每平方米苗床可用50~100克微生物菌剂。一般育苗床，按照播幅宽15公分，行距20公分，将种子撒播之后，上面覆盖0.5公分厚的细潮土，应保持土壤湿润，春季播种上面需覆盖小拱棚有利于保温。也可经过催芽之后，在育苗盘内育苗，每穴播种两粒，催芽后的种子。播种之后，保持土壤湿润，将温度控制在17~18度，大约60天左右，就可出苗。', NULL, NULL);

-- ----------------------------
-- Table structure for mistake_question
-- ----------------------------
DROP TABLE IF EXISTS `mistake_question`;
CREATE TABLE `mistake_question`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `mistake`(`id`) USING BTREE,
  CONSTRAINT `mistake` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mistake_question
-- ----------------------------
INSERT INTO `mistake_question` VALUES (1, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538231.jpg', 172);
INSERT INTO `mistake_question` VALUES (2, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538540.jpg', 173);
INSERT INTO `mistake_question` VALUES (3, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1516002.jpg', 174);
INSERT INTO `mistake_question` VALUES (4, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517323.jpg', 175);
INSERT INTO `mistake_question` VALUES (5, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517322.jpg', 176);
INSERT INTO `mistake_question` VALUES (6, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450454.jpg', 177);
INSERT INTO `mistake_question` VALUES (7, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450454.jpg', 178);
INSERT INTO `mistake_question` VALUES (8, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517322.jpg', 179);
INSERT INTO `mistake_question` VALUES (9, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1515493.jpg', 180);
INSERT INTO `mistake_question` VALUES (10, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450454.jpg', 181);
INSERT INTO `mistake_question` VALUES (11, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538540.jpg', 182);
INSERT INTO `mistake_question` VALUES (12, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1515491.jpg', 183);
INSERT INTO `mistake_question` VALUES (13, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517322.jpg', 184);
INSERT INTO `mistake_question` VALUES (14, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517173.jpg', 185);
INSERT INTO `mistake_question` VALUES (15, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517173.jpg', 186);
INSERT INTO `mistake_question` VALUES (16, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517173.jpg', 187);
INSERT INTO `mistake_question` VALUES (17, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538540.jpg', 188);
INSERT INTO `mistake_question` VALUES (18, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538540.jpg', 189);
INSERT INTO `mistake_question` VALUES (19, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538231.jpg', 190);
INSERT INTO `mistake_question` VALUES (20, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517323.jpg', 191);
INSERT INTO `mistake_question` VALUES (21, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538231.jpg', 192);
INSERT INTO `mistake_question` VALUES (22, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1515491.jpg', 193);
INSERT INTO `mistake_question` VALUES (23, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517173.jpg', 194);
INSERT INTO `mistake_question` VALUES (24, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450372.jpg', 195);
INSERT INTO `mistake_question` VALUES (25, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538231.jpg', 196);
INSERT INTO `mistake_question` VALUES (26, '远志', 'http://101.201.118.42:8080images/question1/远志/IMG_20220307_1538231.jpg', 197);
INSERT INTO `mistake_question` VALUES (27, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450454.jpg', 198);
INSERT INTO `mistake_question` VALUES (28, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538540.jpg', 199);
INSERT INTO `mistake_question` VALUES (29, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1449281.jpg', 200);
INSERT INTO `mistake_question` VALUES (30, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517323.jpg', 201);
INSERT INTO `mistake_question` VALUES (31, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1516002.jpg', 202);
INSERT INTO `mistake_question` VALUES (32, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538361.jpg', 203);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `headimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `top` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头部消息',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `buttom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '底部消息',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (0, 'http://101.201.118.42:8080/images/newimg/new1.jpeg', '“你看这位老太太舌苔有点腻，是淡红舌，舌体胖，是气虚。”5月5日，“人民英雄”、中国工程院院士张伯礼与新国博方舱医院中医组的专家们，针对6名超过一周不转阴的患者进行线上会诊。', 'http://101.201.118.42:8080/images/content1/changyang.jpg', '会上，专家组通过“辨寒热，定虚实”，认为湿浊内蕴、正气不足是患者“阴阳不定”的重要原因，治疗应当注意扶正化浊。针对上述患者，新国博方舱医院中医组拟定扶正、化浊方，经过两日服药后，目前数名患者核酸Ct值已明显上升，1名患者已出院。', '“长阳”患者加速转阴：新国博方舱医院中药方助力患者出院时间降低2.5天');
INSERT INTO `news` VALUES (1, 'http://101.201.118.42:8080/images/newimg/new2.jpeg', '　　4月27日，云浮市中医药局、百城融湾智库等部门负责人走进“香雪制药”，举办中医药产业发展交流会。会前，参访团一同领略早已融入百姓生活中的凉茶、药膳等广式膳食文化，了解智慧中医前沿发展。', 'http://101.201.118.42:8080/images/content1/shanshi.png', '交流会上，广东省政协常委、香雪制药董事长王永辉着重介绍了香雪提前布局药膳、智慧中医的情况。他说，中药更大发展在于药膳，作为药食同源，它能让中药走进更多百姓家，不仅食以药膳，也可达到治未病的作用。中医真正出路在于发展智慧中医，用科技手段保留传统中医中的个体化诊断与开方配药，通过不断完善、积累海量个体化诊疗数据，让智慧中医不断趋于科学化，从而让中医能够真正走出国门，让国际社会接受中医。', '中医药产业发展的未来路径：中药膳食与智慧中医');
INSERT INTO `news` VALUES (2, 'http://101.201.118.42:8080/images/newimg/new3.jpeg', '这也是自今年上半年A股中医药行情启动后，中医药行业最大的一笔并购交易。今年3月29日，国务院办公厅印发《“十四五”中医药发展规划》，明确“十四五”时期中医药发展目标任务和重点措施，随后带动中医药板块持续上涨。而随着这起收购诞生，后续中药行业或将在政策利好下出现更多整合。', 'http://101.201.118.42:8080/images/content1/huarun.jpg', '华润三九拟以29亿元入主昆药集团，开启中药行业新一轮整合序幕？在主要产品方面，“昆药血塞通”和“昆中药1381”系列口服产品为昆药集团的“两柄尖刀”。其中，血塞通主要成分为五加科人参属植物三七提取物。2021年，昆药血塞通系列口服产品实现销售9.48亿元，同比增长18.80%；昆药血塞通软胶囊单品实现销售5.93亿元，同比增长28.28%，其中，零售端销售收入突破1.9亿元，同比增长135.80%。此外，昆药血塞通滴丸在湖北牵头19省（区、市）中成药省际联盟集中带量采购中中标，打开了院内市场新的增量空间。', '华润三九拟以29亿元入主昆药集团，开启中药行业新一轮整合序幕？');
INSERT INTO `news` VALUES (3, 'http://101.201.118.42:8080/images/newimg/new4.jpeg', '陕西省内知名的中药材专家、中兽医专家、家禽专家，澄城县药材办、渭南职业技术学院、省畜牧业协会、省饲料协会以及陕西鑫诚大唐相关负责人参加会议。', 'http://101.201.118.42:8080/images/content1/chengcheng.webp', '陕西鑫诚大唐畜牧有限公司成立于2001年，是一家集药品研发、生产、销售、服务和中药材种植为一体的高新技术企业。公司依托渭南周边得天独厚的中药材种植基地，在有着“黄芩之乡”的澄城县流转1500亩土地，作为公司中药材黄芩、连翘、柴胡等GAP种植基地。在帮助当地脱贫致富的同时，公司也进入中药材重点原料可控阶段。强化品质观念，严格操作规程，建立健全完善的质量保障体系。', '打造中药材全产业链模式项目启动会在澄城县成功召开');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1515491.jpg');
INSERT INTO `question` VALUES (2, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1515493.jpg');
INSERT INTO `question` VALUES (3, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1516002.jpg');
INSERT INTO `question` VALUES (4, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1449281.jpg');
INSERT INTO `question` VALUES (5, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450372.jpg');
INSERT INTO `question` VALUES (6, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1450454.jpg');
INSERT INTO `question` VALUES (7, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517173.jpg');
INSERT INTO `question` VALUES (8, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517322.jpg');
INSERT INTO `question` VALUES (9, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517323.jpg');
INSERT INTO `question` VALUES (10, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538231.jpg');
INSERT INTO `question` VALUES (11, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538361.jpg');
INSERT INTO `question` VALUES (12, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538540.jpg');

-- ----------------------------
-- Table structure for scene
-- ----------------------------
DROP TABLE IF EXISTS `scene`;
CREATE TABLE `scene`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scene
-- ----------------------------
INSERT INTO `scene` VALUES (1, '防己种植方法', 'http://101.201.118.42:8080/images/scene1/防己.jpeg');
INSERT INTO `scene` VALUES (2, '川麦冬种植方法', 'http://101.201.118.42:8080/images/scene1/川麦冬.png');
INSERT INTO `scene` VALUES (3, '茜草种植方法', 'http://101.201.118.42:8080/images/scene1/茜草.jpg');
INSERT INTO `scene` VALUES (4, '远志种植方法', 'http://101.201.118.42:8080/images/scene1/远志.jpg');

-- ----------------------------
-- Table structure for search
-- ----------------------------
DROP TABLE IF EXISTS `search`;
CREATE TABLE `search`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pingyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `component` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `structure` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search
-- ----------------------------
INSERT INTO `search` VALUES (1, '川麦冬', '\r\n    涪城麦冬', '麦冬为百合科植物麦冬的块根，块根呈纺锤形，颗粒肥大，两端略尖、中柱细小。表面淡黄白色，有光泽，细纵纹。断面乳白色、半透明、质柔韧。气香，嚼之发粘，甘、微苦、微寒。', 'http://101.201.118.42:8080/images/search1/川麦冬.jpg', '麦冬又名沿阶草、书带草、麦门冬，为百合科沿阶草属多年生常绿草本植物。须根较粗壮，根的顶端或中部常膨大成为纺锤状肉质小块。表面黄白色或淡黄色，有细纵纹。质柔韧，断面黄白色，半透明，中柱细小。气微香，味甘、微苦。', '中国现存最早的药物学著作、约成书于西汉以前的《神农本草经》把药物依其治疗效能和使用目的，分为三大类，名为三品，即上、中、下三品。上品是无毒的、具有补养作用的药物，可以久服，使人延年益寿。也就是可以食用。《神农本草经》上经（上品）草：“麦门冬，味甘平。主心腹，结气伤中伤饱，胃络脉绝，羸瘦短气。久服轻身，不老不饥。生川谷及堤阪。”涪城麦冬是中国传统的药食两用药材，具有养阴生津、润肺消火的功效，是中药材中滋阴生津的要药，有“涪城麦冬千金宝，本草遗株万国珍”之说。麦冬的药用价值很广，养阴生津，润肺清心。用于肺燥干咳，虚劳咳嗽，津伤口渴，心烦失眠，内热消渴，肠燥便秘，白喉。', '因受气候、温度、土质、加工技术的影响，各地所产麦冬品质各有差异，《中国药典》记载，位于东经104°56′、北纬31°15′所产麦冬品质最高。涪城麦冬产区分布于四川涪江流域和长江嘉陵江交汇的三角地带，位于海拔450米至550米的涪江沿岸，地下水位在50厘米以下的Ⅰ、Ⅱ级阶地，酸碱度为中性或微碱性（pH值7.0至8.0）潮湿沙泥土壤，水源充足、灌（排）水方便、土质肥沃、土壤耕作土层≥20厘米，有机质含量≥1.3%。非常适宜于麦冬的生长生产。');
INSERT INTO `search` VALUES (2, '茜草', '\r\n    Rubia cordifolia L.', '茜草（学名：Rubia cordifolia L.）：茜草科，茜草属多年生草质攀援藤木，长通常可达3.5米；根状茎和其节上的须根均红色；茎多条，细长，方柱形，棱上生倒生皮刺，叶片轮生，纸质，披针形或长圆状披针形，顶端渐尖，心形，边缘有齿状皮刺，两面粗糙，叶柄长可达2.5厘米，聚伞花序腋生和顶生，，有花数十朵，花序和分枝均细瘦，花冠淡黄色，花冠裂片近卵形，果球形，橘黄色。8-9月开花，10-11月结果。', 'http://101.201.118.42:8080/images/search1/茜草.jpg', '凉血止血：《本草正义》曰：“茜根性寒，所主多血热失血之症。古今说解，都无异之。《别录》止血，以血热涌泄言之。一以清血中之热，一以通壅积之瘀，斯血循故道而不横逆。”本鼎味苦、咸，性寒，功能凉血止血，可用治血热妄行之吐血、衄血、尿血、血崩诸证。', '茜草喜凉爽而湿润的环境。耐寒，怕积水。对土壤要求以疏松肥沃，富含有机质的沙质壤土栽培为好。喜凉爽气候和较湿润的环境，性耐寒。土壤以肥沃、深厚、湿润、含腐植质丰富的壤土为好。地势高燥、土壤贫瘠以及低洼易积水之地均不宜种植。常生于灌丛中。', '分布于中国东北、华北、西北和四川（北部）及西藏（昌都地区）等地。常生于疏林、林缘、灌丛或草地上。分布于朝鲜、日本和俄罗斯远东地区。');
INSERT INTO `search` VALUES (3, '远志', '\r\n    Polygala tenuifolia Willd. ', '远志（学名：Polygala tenuifolia Willd），又名葽绕、蕀蒬等。产东北、华北、西北和华中以及四川；多年生草本，主根粗壮，韧皮部肉质。具有安神益智、祛痰、消肿的功能，用于心肾不交引起的失眠多梦、健忘惊悸，神志恍惚，咳痰不爽，疮疡肿毒，乳房肿痛。', 'http://101.201.118.42:8080/images/search1/远志.webp', '远志筒：呈筒状，中空，拘挛不直，长3～12厘米，直径0.3～1厘米。表面灰色，或灰黄色。全体有密而深陷的横皱纹，有些有细纵纹及细小的疙瘩状根痕。质脆易断，断面黄白色、较平坦，微有青草气，味苦微辛，有刺喉感。', '春播在4月中，下；秋播在8月中，下旬进行；因地制宜，不可过晚，以保证出苗后不因气温太低而死亡一般先在整好的地上浇水，水下渗后再进行播种。每亩用种1-1.5 kg.播前用水或 0.3%磷酸二氢钾水溶 液浸种1昼夜,捞出后与3-5 倍细沙混合秋播用当年种子,于8月下旬播种,在第二年春出苗。育苗移栽 3月上，中旬进行，在苗床上条播，覆土约lcm，保持苗床湿润，温度控制在15 ～ 20℃ 为佳，播后约10天出苗，待苗高5cm时进行定植。在阴雨天或午后进行。', '产东北、华北、西北和华中以及四川；生于草原、山坡草地、灌丛中以及杂木林下，海拔200-2300米。分布于朝鲜、蒙古和俄罗斯。');
INSERT INTO `search` VALUES (4, '防己', '木防己 ', '防己，中药名。为防己科植物粉防己Stephania tetrandra S.Moore的干燥根。秋季采挖，洗净，除去粗皮，晒至半干，切段，个大者再纵切，干燥。', 'http://101.201.118.42:8080/images/search1/防己.webp', '祛风湿、止痛：因为防己性寒，善于治疗风湿热痹证，经常和牛膝、薏仁、木瓜等配用，属寒湿痹痛者，可以和肉桂、附子等温经止痛药同用；利水、清泻：入膀胱经和肾经，所以能利水并清下焦的湿热，常用来治疗水肿、脚气浮肿，常配合葶苈子、椒目、大黄等。脾虚水肿、小便不利，通常可以配合黄芪、白术等一同使用。', '多年生落叶藤本。块根通常圆柱状，肉质，深入地下，长3-15cm，直径1-5cm；外皮淡棕色或棕褐色；具横纹。茎枝纤细，有直条纹，叶互生；叶柄长5-6cm，盾状着生；叶片三角状宽卵形或阔三角形，长4-6cm，宽5-6cm，先端钝，具小突尖，基部平截或略呈心形，全缘，上面绿色，下面灰绿色或粉白色，两面均被短毛，下面较密，掌状脉5条。花小，单性，雌雄异株；雄株为头状聚伞花序，总状排列；雄花；萼片4，排成1轮，绿色，匙形，长1mm，宽约0.5mm，基部楔形；花瓣4，绿色，倒卵形，长约0.9mm，宽约0.7mm，肉质，边缘略内弯，有时具短爪；雄蕊4，花丝合生成柱状，上部盘状，花药着生其上；雌株为缩短的聚伞花序，呈假头状，总状排列；雌花；萼片4，排成1轮；花瓣4；子房椭圆形，长约1mm，花柱3，乳头状。核果球形，红色，直径5-6mm；内果皮长、宽均为4-5mm，背部有4行雕纹，中间2行呈鸡冠状隆起，每行有15-17颗，胎座迹不穿孔。花期5-6月，果期7-9月。', '广东、广西、湖南等地。');

-- ----------------------------
-- Table structure for stone
-- ----------------------------
DROP TABLE IF EXISTS `stone`;
CREATE TABLE `stone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岩石名字',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stone
-- ----------------------------
INSERT INTO `stone` VALUES (1, '川麦冬', 'http://101.201.118.42:8080/images/question1/川麦冬/chuanmaidong-excellentIMG_20220307_1515491.jpg');
INSERT INTO `stone` VALUES (2, '茜草', 'http://101.201.118.42:8080/images/question1/茜草/IMG_20220307_1517173.jpg');
INSERT INTO `stone` VALUES (3, '远志', 'http://101.201.118.42:8080/images/question1/远志/IMG_20220307_1538231.jpg');
INSERT INTO `stone` VALUES (4, '防己', 'http://101.201.118.42:8080/images/question1/防己/IMG_20220307_1449281.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` int(255) NULL DEFAULT NULL COMMENT '性别',
  `score` int(255) NULL DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '15696547234', '111111', 'http://101.201.118.42:8080/images/headimg/f010c405a14845d3ae8a6413cc1f38d2_oHIz23egjBjw23ed5288a3d85d73d320d2e6d2548289.jpeg', NULL, NULL, NULL,1, 6);
INSERT INTO `user` VALUES (2, '18716761820', '123456', 'http://101.201.118.42:8080/images/headimg/f010c405a14845d3ae8a6413cc1f38d2_oHIz23egjBjw23ed5288a3d85d73d320d2e6d2548289.jpeg', '小明', '123', '测试中药识别', 1, 14);
INSERT INTO `user` VALUES (3, '17830307722', '123456', 'http://101.201.118.42:8080/images/headimg/e7546880e97f44ad80b7888bda5b2c58_avqNWxMLQueuedf6935c6e13dba30015b44309e57e17.png', NULL, NULL, NULL, NULL, 6);

SET FOREIGN_KEY_CHECKS = 1;
