# kKPagingView
ios8.0+ iphone ipad均可
使用方法
storyboard拖拽一个uiview，并添加约束(固定高度或固定比例均可)
import "kKPagingView";
初始化
kkView=[[kKPagingView alloc]initCustomView];
将此view加入刚才拖拽的uiview中
[self.uiview addSubview:kkView];
如需点击事件，请添加代理
kkView.kksvdelegate=self;
添加图片列表
[kkView setupImage:NSArray];