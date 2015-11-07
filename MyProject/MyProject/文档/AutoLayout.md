

## NSLayoutConstraint constraintsWithVisualFormat

* 定义

    /* Create an array of constraints using an ASCII art-like visual format string.
    */
    + (NSArray *)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views;

## VFL
* "|"表示super view
* H表示横向，V表示纵向
* 方括号[]表示view
* 圆括号()表示尺寸数字，支持大于、小于、等于，或另一个view
* 优先级用@表示  
UILayoutPriorityRequired  
UILayoutPriorityDefaultHigh  
UILayoutPriorityDefaultLow  
UILayoutPriorityFittingSizeLevel  


