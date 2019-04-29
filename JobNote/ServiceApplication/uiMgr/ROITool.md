ROITool
=======

* Width && level </br>
  图片像素是由内存单元表示的 那么灰度就会有一个范围空间 不可能同一时间显示 </br>
  所有的梯度, 所以这两个变量说明图片显示灰度值在level附近的+/-Width的范围内
* FOV </br>
  球管发射的射线是锥形的, 顶角的角度是可以变换的, 所以就有了FOV的概念, FOV </br>
  表示射线照射到CT的床上时, 截平面的大小, 同时也是ImagePanel所示的边界大小
* Min, Max, Mean, Std Dev, Area </br>
  Min: 梯度的最小值
  Max: 梯度的最大值
  Mean: 梯度的平均值
  Std Dev: 方差
  Area: 选取的面积