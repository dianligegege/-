/*
 Navicat Premium Data Transfer

 Source Server         : day1
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : readbook

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 23/03/2019 11:02:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `b_name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名字',
  `b_writer` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书作者',
  `b_transer` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书翻译者',
  `b_class` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书分类',
  `b_tag` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书标签',
  `b_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图书信息',
  `b_point` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图书特点',
  `b_score` double NULL DEFAULT NULL COMMENT '图书推荐人数',
  `b_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图书图片',
  `b_update` date NULL DEFAULT NULL COMMENT '上传时间',
  `b_uperclass` int(11) NULL DEFAULT 0 COMMENT '上传人分类0管理员 1用户',
  `b_upername` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '张立' COMMENT '上传人姓名',
  `b_status` int(11) NULL DEFAULT 0 COMMENT '图书状态0正常 1删除',
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '学习JavaScript数据结构与算法（第2版）', '巴西] Loiane Groner', '邓钢 孙晓博 吴双 陈迪 袁源', '计算机', 'javascript&数据结构&算法', '本书首先介绍了JavaScript 语言的基础知识以及ES6 和ES7 中引入的新功能，接下来讨论了数组、栈、队列、链表、集合、字典、散列表、树、图等数据结构，之后探讨了各种排序和搜索算法，包括冒泡排序、选择排序、插入排序、归并排序、快速排序、堆排序、计数排序、桶排序、基数排序、顺序搜索、二分搜索，然后介绍了动态规划和贪心算法等常用的高级算法以及函数式编程，最后还介绍了如何计算算法的复杂度。', '数据结构是计算机为了高效地利用资源而组织数据的一种方式。数据结构和算法是解决一切编程问题的基础。', 15, 'uploads/2018/11/1.jpg', '2018-10-30', 0, '张立', 0);
INSERT INTO `books` VALUES (2, 'Web开发权威指南', 'Chris Aquino, Todd Gandee', '奇舞团', '科普', 'web开发&权威指南', '本书在知名培训机构Big Nerd Ranch培训教材的基础上编写而成，囊括了JavaScript、HTML5、CSS3等现代前端开发人员急需的技术关键点，包括响应式UI，访问远程Web服务，用Ember.js构建应用，等等。此外，还会介绍如何使用前沿开发工具来调试和测试代码，并且充分利用Node.js和各种开源的npm模块的强大功能来进行开发。', '专业——源自大名鼎鼎的Big Nerd Ranch训练营实战课程，该训练营已经为微软、Google、Facebook等行业巨头培养了众多专业人才。', 18, 'uploads/2018/11/2.jpg', '2018-11-03', 0, '张立', 0);
INSERT INTO `books` VALUES (3, '深度学习入门：基于Python的理论与实现', '斋藤康毅', '陆宇杰', '设计', 'python&人工之能&机器学习&深度学习', '本书是深度学习真正意义上的入门书，深入浅出地剖析了深度学习的原理和相关技术。书中使用Python3，尽量不依赖外部库或工具，从基本的数学知识出发，带领读者从零创建一个经典的深度学习网络，使读者在此过程中逐步理解深度学习。书中不仅介绍了深度学习和神经网络的概念、特征等基础知识，对误差反向传播法、卷积神经网络等也有深入讲解，此外还介绍了深度学习相关的实用技巧，自动驾驶、图像生成、强化学习等方面的应用，以及为什么加深层可以提高识别精度等“为什么”的问题。', '1.日本深度学习入门经典畅销书，原版上市不足2年印刷已达100 000册。长期位列日亚“人工智能”类图书榜首，超多五星好评。2.使用Python 3，尽量不依赖外部库或工具，从零创建一个深度学习模型。3.示例代码清晰，源代码可下载，需要的运行环境非常简单。读者可以一边读书一边执行程序，简单易上手。4.使用平实的语言，结合直观的插图和具体的例子，将深度学习的原理掰开揉碎讲解，简明易懂。5.使用计算图介绍复杂的误差反向传播法，非常直观。6.相比AI圣经“花书”，本书更合适入门。对于非AI方向的技术人员，本书将大大降低入门深度学习的门槛；对于在校大学生、研究生，本书不失为学习深度学习的一本好教材；即便是在工作中已经熟练使用框架开发各类深度学习模型的读者，也可以从本书中获得新的体会。——摘自本书译者序', 28, 'uploads/2018/11/3.jpg', '2018-11-05', 0, '张立', 0);
INSERT INTO `books` VALUES (4, '区块链技术进阶与实战', '蔡亮 , 李启雷 , 梁秀波', NULL, '经营', '上市销售&玄幻', '本书从实战的角度出发，结合实际应用开发场景，对区块链技术进行了全面介绍和剖析。全书共分为四个部分：第一部分对区块链进行了全景分析，介绍了其概念、历史、技术流派、主要公司和典型应用场景，并给出了当前区块链产业生态图谱；第二部分对知名开源区块链平台以太坊和HyperLedger进行了详细解读，并介绍了如何基于这两个平台进行区块链应用开发；第三部分以自主可控联盟区块链Hyperchain为例，分析了企业级区块链平台的核心技术，介绍了基于Hyperchain的企业级区块链应用开发技术；第四部分介绍了多个区块链实际应用项目案例，并对开发过程和关键代码进行了详细分析。本书不仅全面深入，而且注重实战，非常适合区块链开发人员由浅入深地学习区块链技术。', '* 国内区块链顶尖研究者和一线开发者出品* 中国工程院院士陈纯等业内专家大力推荐* 专注介绍区块链核心原理和应用技术。* 详细解读区块链平台以太坊和HyperLedger\r\n* 注重实战，全书包含5个完整实际项目案例\r\n* 配有开发者平台，边学边做，快速上手\r\n\r\n\r\n* 来自一线开发者和研究者的经验。作者团队为国内区块链技术顶尖研究者和一线开发者，在区块链行业具有很高的知名度和丰富的项目实战经验，并且依托高层次科研平台积累了大量的区块链科研和产业项目的经验，在本书中向读者介绍了更新更实用的区块链技术内容。\r\n\r\n* 真实区块链案例，注重实战。书中5个实战案例都是基于区块链实际落地项目撰写。作者团队在国内多家银行和金融机构都实施了多个区块链项目，合作机构包括谷歌、上海证券交易所、中国银联、农业银行、光大银行和浙商银行等，本书的案例具有显著的实战特点和真实参考价值，可以指导技术人员快速上手做出实际可用的区块链应用项目。\r\n\r\n\r\n本书由浙江大学和趣链科技联合撰写，融合了浙江大学的理论研究成果和趣链科技的实际开发经验，是一本实践性非常强的区块链技术图书。\r\n——贲圣林，浙江大学互联网金融研究院院长\r\n\r\n本书从技术原理、市场发展、政府规划、应用场景和平台对比等角度对区块链进行了全景分析，对三个主流区块链平台进行了深入介绍，配有动手开发指南，并提供了实际项目案例说明和源代码，是一本不可多得的理论与实践相结合的区块链技术图书。\r\n——杨小虎，浙江大学软件学院常务副院长 \r\n\r\n本书非常务实，干货满满，给读者呈现了当前区块链技术发展的最新动态，所提供的案例内容翔实，其背后必然有脚踏实地做技术的“实战派”团队支持。相信本书会对有志于从事区块链技术研究和应用开发的人员有帮助。\r\n——宋士正，浙商银行信息科技部总经理\r\n\r\n本书按照区块链基础知识、开源平台、企业级平台和开发案例的顺序介绍了区块链技术的基本原理和开发技术，并包含多个案例，非常适合相关技术人员由浅入深地学习区块链技术。\r\n——史晨阳，中国光大银行信息科技部副总经理', 11, 'uploads/2018/11/4.jpg', '2018-11-05', 0, NULL, 0);
INSERT INTO `books` VALUES (5, 'Java虚拟机基础教程', 'Vincent van der Leun', '袁国忠', '心理学', 'Java&Scala&Clojure&kotlin&groovy&jvm', '本书概述Java 虚拟机（JVM）及其特性，并用大量示例详细介绍了Java、Scala、Clojure、Kotlin 和Groovy 这5 种基于JVM 的语言。具体而言，首先概述了Java 平台，紧接着详细阐述了JVM，然后分别介绍了上述各种语言的基础知识和核心概念，并运用它们开发项目、创建应用程序。', 'Java虚拟机（JVM）是开发和部署软件的成熟的现代平台，最初只有Java一门语言运行于其中。随着Java的日益复杂以及JVM性能的增强，出现了新一代可在JVM中运行的编程语言。\r\n\r\n本书首先概述JVM及其特性，并介绍至关重要的JVM概念。接下来介绍Java、Scala、Clojure、Kotlin和Groovy这五种基于JVM的语言，分别探讨它们的特性和用例，并通过使用它们编写示例项目来展现各自的优缺点，以便帮读者找出能满足特定需求的语言。\r\n\r\n\r\n- 了解JVM基本概念\r\n- 熟悉流行的JVM语言及Java类库\r\n- 掌握命令式、面向对象的和函数式等编程范式\r\n- 使用Eclipse IDE、Gradle、Maven等常见JVM工具\r\n- 探索SparkJava、Vert.x、Akka、JavaFX等框架\r\n- 了解主流编程语言（JavaScript、Python、Ruby和Haskell）的JVM实现', 3, 'uploads/2018/11/5.jpg', '2018-11-05', 0, '张立', 0);
INSERT INTO `books` VALUES (6, '电子工程师必读：元器件与技术', 'John M. Hughes', '李薇濛', '电工电子', '电子学&硬件&创客&电子技术&电子电路&元器件', '本书是一本电子学方面的实际操作指南，这些知识大多需要多年的工作实践才能从中总结出来。本书的每章将就特定的主题进行讨论，以便读者理清脉络，迅速找到问题的答案。比如，如何阅读电子元件的数据表，如何决定微控制器的接口管脚上能连接多少个元件，如何装配各种型号的连接器，如何把信号接口电路上的噪声和干扰降到最低，如何决定模拟-数字转换器的分辨率，不同型号的串口和网络接口是怎样工作的，以及怎样使用开源工具进行电路图绘制和PCB布局，等等。', '“信息多，内容新……是目前市场上数一数二的通识电子学参考书。”——Amazon读者评论\r\n\r\n为了能够制作出一些有趣的电子器件，或创造性地改进已有器件，需要了解多少电子学知识呢？如果没有电子学基础，但是想自己动手制作电子设备，如何入手呢？\r\n\r\n本书正是为有以上需求的读者准备的，介绍了电子元器件、技术和工具的方方面面，而这些知识通常需要多年经验积累才能得到。即使是使用过电子产品或具有电子学理论背景的读者，也能在本书中受益匪浅。\r\n\r\n* 阅读并理解电子元器件的数据表。\r\n* 电子学中常用的工具及其使用方法。\r\n* 确定微控制器接口管脚上连接的元件数量。\r\n* 选择合适的电源、开关、模拟和数字集成电路。\r\n* 挑选和装配各种类型的连接器。\r\n* 不同型号的串行端口和网络接口的工作原理。\r\n* 使用开源工具绘制电路图和PCB布局。\r\n* 测试和封装。', 12, 'uploads/2018/11/6.jpg', '2018-11-05', 0, '张立', 0);
INSERT INTO `books` VALUES (7, '普林斯顿微积分读本（修订版）', '[美］阿德里安·班纳', '杨爽 , 赵晓婷 , 高璞', '高等数学', '微积分&数学&最受欢迎', '本书阐述了求解微积分的技巧，详细讲解了微积分基础、极限、连续、微分、导数的应用、积分、无穷级数、泰勒级数与幂级数等内容，旨在教会读者如何思考问题从而找到解题所需的知识点，着重训练大家自己解答问题的能力。\r\n\r\n本书适用于大学低年级学生、高中高年级学生、想学习微积分的数学爱好者以及广大数 学教师。本书既可作为教材、习题集，也可作为学习指南，同时还有利于教师备课。', '对于大多数学生来说，微积分或许是他们曾经上过的倍感迷茫且备受挫折的一门课程了。而本书，不仅让学生们能有效地学习微积分，更重要的是提供了战胜微积分的必备工具。 \r\n\r\n这本经典著作源于风靡美国普林斯顿大学的阿德里安·班纳教授的微积分复习课程，将易用性与可读性以及内容的深度与数学的严谨完美地结合在了一起，激励学生不再惧怕微积分，并在考试中获得高分。\r\n\r\n作者阿德里安·班纳是美国普林斯顿大学的著名数学教授，并担任新技术研究中心主任。 班纳教授的授课风格是非正式的、有吸引力并完全不强求的，甚至在不失其详尽性的基础上又增添了许多娱乐性，而且他不会跳过讨论一个问题的任何步骤。\r\n\r\n作者独创的“内心独白”方式，即问题求解过程中学生们应遵循的思考过程，为我们提供了不可或缺的推理过程以及求解方案。本书的重点在于创建问题求解的技巧，其中涉及的例题从简单到复杂并对微积分理论进行了深入探讨。读者会在非正式的对话语境中体会微积分的无穷魅力。', 38, 'uploads/2018/11/7.jpg', '2018-11-05', 0, '张立', 0);
INSERT INTO `books` VALUES (8, 'AKB48 Group官方访谈集：星光的起点与纪念', '周刊朝日编辑部', '尤斌斌', '文艺艺术', '粉丝经济&娱乐文化', '本书为《周刊朝日》对日本人气女子偶像团体AKB48 Group成员的官方访谈集，辑录了AKB48、SKE48、NMB48、HKT48等团体中的人气成员的采访文章。访谈从个体角度，以第一人称透视日本偶像的发展历程，以及成员个人成长中关于梦想、奋斗的青春物语，并收录了多名成员未曾公布的秘闻与趣事。 \r\n\r\n即便是现在人气正旺的岛崎遥香、渡边麻友，她们也都曾是与偶像道路毫无交集的普通女孩子。这本书记录了AKB48那些耀眼成员从“普通女孩”到“偶像明星”的发展轨迹，也让人确实感受这种“成长”的力量。 \r\n——日本亚马逊读者评论', '日本人气偶像团体AKB48 Group 成员官方访谈集 \r\n\r\n透视日本偶像发展历程 \r\n讲述娱乐行业背后的成长故事 \r\n\r\nAKB48·SKE48·NMB48·HKT48 \r\n\r\n大岛优子、渡边麻友、柏木由纪、高桥南、小嶋阳菜 \r\n岛崎遥香、横山由依、秋元才加、宫泽佐江、松井珠理奈 \r\n松井玲奈、山本彩、渡边美优纪、指原莉乃 \r\n宫脇咲良、峯岸南、梅田彩佳…… ', 6, 'uploads/2018/11/8.jpg', '2018-11-05', 0, '张立', 0);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `c_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '收藏人id',
  `b_id` int(11) NULL DEFAULT NULL COMMENT '收藏图书',
  `c_date` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  `c_status` int(2) NULL DEFAULT 1 COMMENT '收藏状态默认为1表示收藏',
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (9, 1, 2, '2018-11-07 14:04:09', 1);

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `s_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '推荐人id',
  `b_id` int(11) NULL DEFAULT NULL COMMENT '推荐图书',
  `s_date` datetime NULL DEFAULT NULL COMMENT '推荐时间',
  `s_status` int(2) NULL DEFAULT 1 COMMENT '推荐状态默认为1表示推荐',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for talk
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id主键',
  `t_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `b_id` int(11) NULL DEFAULT NULL COMMENT '电影id',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `u_name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `t_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `t_status` int(4) NULL DEFAULT 1 COMMENT '默认1显示',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of talk
-- ----------------------------
INSERT INTO `talk` VALUES (1, '大家好，我是灭霸，我的手套被扣在海关了，急需要200元交罚款，如果你5月11愿意发红包给我，我保证在打响指时你会活下来。我代表我们泰坦星下发红头文件:赶在2019面之前务必要让全宇宙的人口降低一半，宇宙的人均GDP才能翻一番，实现又好又快发展。这是千年大计、宇宙大事！', 1, 1, '张三', '2018-09-25 15:58:46', 1);
INSERT INTO `talk` VALUES (2, '只是我的第一条评论', 1, 2, '王伟', '2018-09-25 16:46:41', 1);
INSERT INTO `talk` VALUES (3, '王伟是大好人的同桌\r\n', 1, 1, '电里', '2018-09-25 16:47:12', 1);
INSERT INTO `talk` VALUES (4, '111111111111111111111111', 2, 1, '电里', '2018-09-25 16:50:43', 1);
INSERT INTO `talk` VALUES (5, '我的评论提交', 3, 2, '王伟', '2018-09-25 19:23:35', 1);
INSERT INTO `talk` VALUES (6, '闪闪撒所所所所所所所所所所', 2, 1, '电里', '2018-09-25 22:16:16', 1);
INSERT INTO `talk` VALUES (7, '我是王伟我是王伟', 3, 2, '王伟', '2018-09-26 15:15:08', 1);
INSERT INTO `talk` VALUES (8, '我的评论我的评论', 2, 16, '账号2', '2018-09-26 17:14:04', 1);
INSERT INTO `talk` VALUES (9, '玩儿体育对方过后就开了； ', 10, 1, '张立', '2018-09-26 17:30:55', 1);
INSERT INTO `talk` VALUES (10, 'pinglun\r\n', 3, NULL, NULL, '2018-10-11 21:38:19', 1);
INSERT INTO `talk` VALUES (11, '123', NULL, 1, '电里', '2018-11-02 15:15:21', 1);
INSERT INTO `talk` VALUES (12, '123', 1, 1, '电里', '2018-11-02 15:38:55', 1);
INSERT INTO `talk` VALUES (13, '点点滴滴', 1, 1, '电里', '2018-11-02 16:00:09', 1);
INSERT INTO `talk` VALUES (14, '123', 1, 1, '电里', '2018-11-02 16:01:03', 1);
INSERT INTO `talk` VALUES (15, '哈哈哈哈', 1, 1, '电里', '2018-11-02 16:01:11', 1);
INSERT INTO `talk` VALUES (16, 's', 1, 1, '电里', '2018-11-05 17:24:03', 1);
INSERT INTO `talk` VALUES (17, '123', 1, 1, '电里', '2018-11-07 14:27:33', 1);
INSERT INTO `talk` VALUES (18, '123', 1, 1, '电里', '2018-11-07 14:28:01', 1);
INSERT INTO `talk` VALUES (19, 'ddd', 1, 1, '电里', '2018-11-07 14:32:17', 1);
INSERT INTO `talk` VALUES (20, 'ddd', 1, 1, '电里', '2018-11-07 14:32:17', 1);
INSERT INTO `talk` VALUES (21, 'dfdfff', 1, 1, '电里', '2018-11-09 11:41:24', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_name` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆账号',
  `u_tel` bigint(20) NULL DEFAULT NULL COMMENT '用户电话',
  `u_password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `u_lasttime` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `u_head` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户头像',
  `u_sex` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `u_age` int(10) NULL DEFAULT NULL COMMENT '用户年龄',
  `u_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个性签名',
  `u_status` int(2) NULL DEFAULT 1 COMMENT '0登录  1没有登录',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张立', 4, 'zhangli', '2018-11-05 16:17:41', NULL, '男', 4, '4', 1);
INSERT INTO `user` VALUES (2, '王伟', 110, 'wangwei', '2018-09-26 15:13:08', 'uploads/2018/09/1537945601982_08637581.png', '男', 18, '我是王伟', 1);
INSERT INTO `user` VALUES (16, '王伟2', 120, 'wangwei2', '2018-09-26 17:20:26', 'uploads/2018/09/1537953578185_58454639.png', '男', 18, '签名', 1);
INSERT INTO `user` VALUES (17, 'ddd', 0, 'fafaf', '2018-11-05 14:20:36', NULL, '男', NULL, NULL, 1);
INSERT INTO `user` VALUES (23, 's', 0, 's', NULL, NULL, '男', NULL, NULL, 1);
INSERT INTO `user` VALUES (22, 'd', 0, 'd', NULL, NULL, '女', NULL, NULL, 1);
INSERT INTO `user` VALUES (24, 'huobi', 0, 'huobi', NULL, NULL, '男', NULL, NULL, 1);
INSERT INTO `user` VALUES (25, '1', 2, '423', NULL, NULL, '男', NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
