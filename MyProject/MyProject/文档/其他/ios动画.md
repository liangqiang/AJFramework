
# ios动画

## 常见的实现方式
### 1.beginAnimation

	//开始动画 
	[UIView beginAnimations:nil context:nil];  
	//设定动画持续时间 
	[UIView setAnimationDuration:2]; 
	//动画的内容 
	frame.origin.x += 150; 
	[img setFrame:frame]; 
	//动画结束 
	[UIView commitAnimations]; 
	

## 动画支持UIView下面的这些属性改变：

frame  
bounds  
center  
transform  
alpha 
backgroundColor 
contentStretch