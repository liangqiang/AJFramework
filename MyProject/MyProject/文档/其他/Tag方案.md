# tag轻量级解决方案

## 已有用法和问题
设置UIView的tag属性后，可以用viewWithTag方法再找到该UIView对象。

好处是：
* 不需要将UIView定义成属性
* 在创建函数和使用函数中，可自由使用，减少了外部依赖，利于代码整理重构

现实使用时通常有以下方案：
1. 直接用数字
2. 枚举（局部枚举或全局枚举）
3. 宏定义
4. 使用扩展，参考 http://www.atatech.org/articles/7333

存在的问题和困惑：
1. 系统占用了部分tag
2. tag不应重复，否则可能会找不到想要的对象
3. 需要事先定义，有点过重

## 解决方案
* 定义宏tag(name)，书写简便，方便直接使用
* 将name转换为字符串，该字符串再对应于一个唯一的数字，作为tag返回
* 实现时，用一个全局的字典来保存字符串与数字的对应关系

用法和例子：

	通过约定，保证输入的name不重复即可，通常按 页面标识＋控件标识 来命名，如
	UIImageView *avatar = [[UIImageView alloc]initWithFrame:rect];
	avatar.tag = tag(MineAvatar);

	UIImageView *avatar = (UIImageView*)[self.view viewWithTag:tag(MineAvatar)];

好处
1. 不需要事先定义，可直接使用
2. 自动保证唯一性
3. XCode下支持输入提示

## 具体实现

宏定义：

	#define tag(name) [AKPublicFunction tag:@#name]
	#define TAG_START_NUMBER 900000

具体实现：

	static NSMutableDictionary *s_tags = nil;

	+(NSInteger)tag:(NSString*)key{
		if (!s_tags) {
			s_tags = [NSMutableDictionary dictionary];
		}

		NSInteger number = [[s_tags objectForKey:key]integerValue];
		if (number == 0) {
			number = TAG_START_NUMBER + s_tags.count;
			[s_tags setObject:@(number) forKey:key];
		}

		return number;
	}

支持一组tag：

	用法：
	titleLab.tag = tag2(SegmentTitleLab, i);

	#define tag2(name,index) [AKPublicFunction tag:[NSString stringWithFormat:@"%@_%zd", @#name, index]]

注意：对于一组tag，并不保证它们的tag值是连续递增的，只保证tag的唯一性！！！

并且，使用tag来传递额外信息，如顺序号等，是不推荐不鼓励的！！！

