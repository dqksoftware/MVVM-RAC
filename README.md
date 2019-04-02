# MVVM-RAC
mvvm+rac响应式编程架构

项目文件架构

### Base
  * 主要放一些通用父类 比如 BaseController, BaseRequest
### Common
  * 主要放一些（二次封装）通用工具类，系统扩展类，比如：CommonWebController, HUD, Refresh，NSNumber+FlickerNumber
### Define
  * 主要配置一些头文件，宏定义
### Module
  * 主要放公司业务模块类


## 主要类介绍
     此项目主要是mvvm架构，以及面向对象思想。
   ### 网络请求
     此网络框架是基于YTKNetWorking 封装, 面向对象的思想，所有的网络请求，以对象思想处理
     
   * RKBaseRequest
   
   
     请求对象的基类，如果你的业务请求不需要分页操作，必须继承此类并且子类必须覆盖以下方法
     
   * RKBasePageRequest
   
   
      请求对象的基类，如果你的业务请求需要分页操作，必须继承此类并且子类必须覆盖以下方法
      
   ### loading加载框、HUD信息提示
   * UIView+Loading
   
   
      页面请求加载loading，希望loading显示在哪块视图上可以调用此类方法，方便灵活
   * RKHUD
      
      
      显示文本信息，以及一些成功、错误信息提示
   
   
   具体使用方法请下载demo运行，LoginController、RegisterController、TestController 参照, MVVM+Rac结合使用
   
   此项目是简单基础篇，TableViewCell 与 Model 绑定，后期更新。欢迎issuse.
     
        
     
       

