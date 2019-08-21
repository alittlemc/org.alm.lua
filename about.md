# 基本说明
该工程请使用**ALuaj**编译
已经进行初步优化也可以使用**AndroLua+**打包
> 但是主题会不生效,建议使用十六进制地址不要使用R,因为会报错
# 代码逻辑(lua)
* 动态布局+初始化->"main.lua"
* 布局->"build.lua"
* 外部diy脚本(split模式)->"coed_diy_split.lua"
* 外部diy脚本(传统模式,已经弃用)->"coed_diy.lua"
* 核心初始化函数->"fun.lua"
* 功能函数->"alm.lua"
* 导入包->"include.lua"
* ListView预制布局->"setting.aly"
* 任意进制/可动态修改的整数进制转化->"tox.lua"(初衷用于算计算机网络的进制转换,雾)
* 其他无关紧要或者未使用

# 借用开源
* v7动画模拟->"build.lua"(已经魔改)
* 设置界面->"string.aly"(新增部分功能)
* 网上和Alua手册的例子
> 本源代码开源,请不要用于商业软件
