# 阿剑框架AJFramework 
锋利的ios框架 
（https://github.com/liangqiang/AJFramework）

该框架的目标是：提供简便常用的基础库，服务和开发结构，使得能够快速方便地开发App。

随着实际项目的使用，需不断改进发展。

## 基础库
通用库，与应用完全无关

### AJDefine 常用宏定义
* WEAKSELF, STRONGSELF

	block常用，防止循环引用导致内存不被释放。	
	block中必须使用weakSelf；如果block较长，超过5行，则单写函数

* APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT

	屏幕的宽度和高度。
	
* LINE_HEIGHT

	线高度，对于高清屏，线高<1。
	
* HEXCOLOR

	颜色，方便直接使用16进制颜色值
	
* IS_IPHONE_4系列，设备类型判断
* AJVoidBlock系列，常用block定义

### AJAddition 常见扩展
* **AJViewCreator** 	创建View便捷方法

	主要方法是newWith，使用方式如：
`    UILabel *label = [UILabel newWith:kFont16B, kWhiteColor, msg, @(NSTextAlignmentCenter), nil];
`
	通常的View就可以一行代码就完成了创建，大大简便了。

	* UIView newWith: `backgroundColor`
	* UIView setCornerRadiusWith: `cornerRadius, borderWidth, borderColor（设置圆角和边线）`
	* UILabel newWith: `font, textColor, text, textAlignment`
	* UIImageView newWith: `contentMode, image, highlightedImage`
	* UIButton newWith: `titleLabelFont, normalColor, normalTitle, cornerRadius`
	* UIButton setBgColorWith: `normalBgColor, highligtedBgColor, normalImage, highlightedImage (设置背景色或图片)`
	* UITextView newWith: `font, textColor`
	* UITextField newWith: `font, textColor`

* NSObject+AJAddition

	* **safeSetProperty:**

		通过字典直接给对象设置属性。通常用于1、服务端返回的数据，直接解析成对象；2、ViewController之间数据传递
		
	* jsonEncode, jsonDecode JSON编解码
	* extraData 用来保存额外信息
	* safeString，safeArray系列函数

		安全的类型转换函数。不能转换则返回nil，防止调用方法时crash。
		
* NSString+AJAddition

	* MD5 计算字符串的md5
	* limitToLength 限制字符串长度（考虑emoji的长度大于1）
	* clearEmoji 删除图文字
	* stringWithLineSpacing 设置行间距

		用法：label.attributedText = [content stringWithLineSpacing:4];
		
	* **sizeWithFont:** 计算字符串显示大小size

* UIView+AJAddition

	* **left, top ,right, bottom**
	* **width, height, origin, size**

	View布局设置的利器！！避免frame的繁琐操作
	
	* addSubviews:, removeAllSubviews

	添加多个子View，删除全部子View
	
	* **handleClick:**

	用block方式处理手势tap事件
	
	* addLineWithX, addLineWithY 添加线条
	* **layoutWithInsets:** 对父View相对布局

	布局利器！！UIEdgeInsets的定义顺序是top, left, bottom, right。
	
	表示距父View四边的距离，EAuto表示不限制；如top＝EAuto、Bottom＝EAuto则表示上下居中；left、right同理。可以使用UIEdgeInsetsZero、UIEdgeInsetsCenter（自定义）.
	
	例子：
	`
	    [button layoutWithInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
	`

* UIControl+AJAddition

	* handleEvent:withBlock: 事件处理block
	
	替代
	`- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
`

	```
	WEAKSELF
    [debugButton handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        [weakSelf onDebugClicked];
    }];
```

* UIScroll+AJAddition
	* addBlankSection:
	* **addSection:**
	* removeAllSections

	自动计算contentSize，避免子View位置的繁琐计算。

### AJBase 超轻量MVVM
* NSObject+AJViewModel
	
	超轻量级MVVM。其实只是一个简单的block刷新机制，将View和ViewModel分离开来。基于NSObject的扩展，易于植入。
	
	用法：
	
	```
	 WEAKSELF
    self.viewModel = [self createViewModel];
    [self.viewModel setRefreshBlock:^{
        [weakSelf updateViews];
    }];
	```

* AJSectionItem 表格通用数据结构
	* id sectionInfo
	* NSMutableArray *cellDataArray

	通常定义一个数组NSArray *sectionArray，每一项是AJSectionItem
	
* AJTableView 表格类

	设置sectionArray后，该类实现了UITableViewDataSource, UITableViewDelegate。自动调用Cell的updateWithItem:。
	
	* setClickBlock: 处理点击事件

	通常要实现一个AJTableView子类，子类说明使用哪个Cell类，cell高度、section header view等UI相关，而无需关注数据的组织。
	
### AJUtil 常用方法	
* **toast:** 弹出信息提示
* **actionSheet:** 弹出菜单选择
* showLoading, hideLoading 显示／隐藏进度条
* tag() 生成tag
* performSelector:onTarget: 执行selector
* runAfterDelay:block: 延迟执行
* mainWindow() 获取顶window
* topMostViewController() 获取最上层ViewController

### 其他
* AJSettings 文件保存key、value
* AJIconFont 使用iconfont图标的基础库
* AJRefreshBase 上下拉刷新基础库

## 服务
与应用相关，但通用的功能。不同应用之间可以有一些差异。

* AJUIDefine UI相关的宏
* AJSettingsDefine 供AJSettings使用的宏
* NSObject+AJProperty 便利创建方法
	* createViewModel
	* createScrollView
	* createTableView
* 调试 

	提供status bar的全局调试入口
	
* 上下拉刷新

	设置上下拉刷新
	
	```
	-(void)setRefreshHeaderBlock:(AJRefreshViewBlock)headerBlock;
-(void)setRefreshFooterBlock:(AJRefreshViewBlock)footerBlock;
	```

	AJRefreshHeaderView、AJRefreshFooterView为刷新的界面样式。
	
* IconFont

	使用iconfont的宏以及文件

* **导航**
	
	基本结构是：
	1. 最底层是UINavigationController。
	2. 如果有UITabBarController，则必须rootVC下的第一个VC
	3. TabBar下的每个VC，都是UINavigationController
	4. 如有TabBar，则使用TabBar当前tab下的UINavigationController
	
	* createViewController:withProp:

		创建ViewController，用字符串类名创建，并设置属性传递输入参数
		
	* setRootViewController:
	* pushViewController:, popViewController
	* presentViewController:, dismissViewController


## 代码基本结构

### 代码结构
* ViewController子类
	
	ViewController中包含一个ViewModel，VC不处理任何业务逻辑，而由viewModel来处理。
	
	通常包含一个scrollView或tableView。
	
* ViewModel子类

	ViewModel包含页面数据结构，事件的处理。所有业务逻辑处理都在这里。可包含位于“服务”下面的通用界面操作，如页面导航、toast、actionSheet等。
	
	ViewModel不依赖于任何ViewController、View等具体界面相关。
	
* Item子类

	纯数据结构，没有任何依赖，供ViewModel、子View使用。

* TableView子类

	指明Cell类，cell高度，section的headerView等

* TableViewCell子类
* 自定义View

### 推荐的代码写法
| 过程 | ViewController | 自定义View＋TableViewCell |
| --- | --- | --- |
| 1 初始化自身属性 | 重载init函数 | initWithFrame，重载initWithStyle:reuseIdentifier: |
| 2 创建并添加子View（固定布局） | 重载loadView（newWith，Getter，createView）| initContentView（newWith，Getter，createView） |
| 3 布局子View（动态布局） | 重载viewWillLayoutSubviews（较少用到） |重载 layoutSubviews |
| 4 事件处理 | 具体事件delegate处理 | 具体事件delegate处理 |
| 5 入参和更新 | 重载viewDidLoad：设置viewModel并启动；自定义updateViews | 对外接口updateWith＊方法，setNeedLayout |
| 6 输出 | 无 | 对外接口getValue |

## 编码规范

