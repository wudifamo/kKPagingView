# kKPagingView
ios8.0+ iphone ipad均可<br/>
使用方法<br/>
storyboard拖拽一个uiview，并添加约束(固定高度或固定比例均可)<br/>
import "kKPagingView"; <br/>
初始化<br/>
kkView=[[kKPagingView alloc]initCustomView]; <br/>
将此view加入刚才拖拽的uiview中<br/>
[self.uiview addSubview:kkView]; <br/>
如需点击事件，请添加代理<br/>
kkView.kksvdelegate=self; <br/>
添加图片列表 <br/>
[kkView setupImage:NSArray];   <br/>
DIY及详细请参照Demo
