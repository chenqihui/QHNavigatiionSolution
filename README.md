QHNavigatiionSolution
=====================

记录一下导航融洽，此项目使用了三种导航，都具有动画添加viewcontroller和手势返回的功能

---------------------------华丽丽的分割线------------------------------

A.系统自带的UINavigationController

优点：

1、使用方便，只需使用UINavigationController做为rootViewController或者做为子页面的根页面就OK，
   并使用系统自动的push和pop的动画。

缺点：

1、如果想使用手势返回，就不能隐藏UINavigationBar（目前不知原因）

---------------------------华丽丽的分割线------------------------------

B.MLBlackTransition

详情在github地址：[MLBlackTransition](https://github.com/molon/MLTransition)

优点：

1、可以有效的兼容A想隐藏系统UINavigationBar时无法实现手势返回的问题

2、提供两种手势返回的触发类型

缺点：

1、只支持系统不低于iOS7，这里之前的版本MLTransition也可以实现同样的效果，只是在使用系统获取照片UIImagePickerController会有问题

---------------------------华丽丽的分割线------------------------------

C.LRNavigationController

这个是网上看到的，没找到对应的开源项目，它也是继承UINavigationController，等于是使用UINavigationController自带的容器，然后在push和pop那里替换自己的动画，这里在我另一个项目[DMCustomTransitions](https://github.com/chenqihui/DMCustomTransitions)，里面有更多动画，将其实现在UINavigationController的delgate，这部分后面再细讲。

优点：

1、方便自定义

缺点：

1、效果需要调节，目前原本手势返回是缩放的动画，下一个介绍也有这个效果

---------------------------华丽丽的分割线------------------------------

D.QHMainGestureRecognizerViewController

完全自定义的容器，自己使用数组来保存添加的viewcontroller

优点：

1、不受系统UINavigationController的限制

2、提供两种主流动画MoveTypeScale和moveTypeMove设置。

缺点：

1、流畅度和性能需要优化，主要是在手势滑动上，目前想到的是在滑动时显示在最上层的页面可以使用一个假的view图像，减少系统绘画的消耗，待实现。
