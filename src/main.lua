require"import"
import "include"
hsn,mulu,sdk=this.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height )--获取状态栏高
,Environment.getExternalStorageDirectory().toString().."/alittlemc/",tonumber(Build.VERSION.SDK)

import "fun"

import "cjson"
local alm=fr(mulu.."data.json") or false

if alm then
  data=cjson.decode(alm)
  alm=nil
else
  data={
    ui={
      id={
        [1]=2,
        [2]=1
      },
      theme={
        ct={
          {0xFF0097A7,0x008080FF,0xFF009688,android.R.style.Theme_Material_Light,true},
          {0xFF3F51B5,0x008080FF,0xFFE91E63,0x7f060001,false},--Google 这样写防止在AndroLua+报错
          {0xFF3F51B5,0x008080FF,0xFFE91E63,0x7f060002,false},--Red
          
          {0xFF2096F3,0x008080FF,0xFFE91E63,android.R.style.Theme_Material_Light,true},
          {0xFF303030,0x008080FF,0xFF009688,android.R.style.Theme_Material,true},
        },
        ber={true,false},
        id=1,
        name={"默认","粉","红","鸭绿-蓝","*夜间"},
        w_h=false,
      },
      image=false,
      icon1={
        [1]="btn1.png",
        [2]=true,
        [3]=""
      },
      icon2={
        [1]="btn2.png",
        [2]=false,
        [3]=""
      },
      title={
        [1]="标题",
        [2]=0
      },
      icon3={
        [1]="btn3.png",
        [2]=false
      },
      icon_x={
        [1]="xfan.png",
        [2]="xfan.png"
      },
    },
    load={
      _id={
        [1]=true,
        [2]=math.random(1,1000),
        [3]=""
      },
      diy=false,
      guide=true
    } --[[,
   strings={
      [1]=false,
      [2]=false,
      [3]=true,
      [4]=true
    }]]
  }
end

--是否为夜间主题
local alm=data.ui.theme.id
if not tonumber(alm) then
  alm=1
  data.ui.theme.id=1
end
if alm==#data.ui.theme.name then--最后一个主题为黑色
  theme_n,theme_l="#ffffffff","#FF303030"
  alm_=true
else
  theme_n,theme_l="#FF303030","#ffffffff"
end

--是否横屏(test)
if data.ui.theme.w_h then
  hh,wh=activity.getWidth(),activity.getHeight()
  activity.setRequestedOrientation(0)
else
  wh,hh=activity.getWidth(),activity.getHeight()
end

--主题色赋值以及主题
color1=data.ui.theme.ct[alm][1] or 0xFF3F51B5
color2=data.ui.theme.ct[alm][2] or 0x008080FF
color3=data.ui.theme.ct[alm][3] or 0xFFE91E63
activity.setTheme(data.ui.theme.ct[alm][4] or android.R.style.Theme_Material_Light)
if data.ui.theme.ct[alm][5] then
  activity.ActionBar.hide()
end

import "code_diy_split"

--getRgb(0,0,0,0)
--getRgb(0,0,0,0)

--[[task(1000,function()
local alm=data["load"]["_id"][3]
if #alm>4 and fs(mulu.."QQ_icon.png",false)<=1000 then
  http.download("http://q1.qlogo.cn/g?b=qq&nk="..alm.."&s=640",mulu.."QQ_icon.png")
end
end)]]

--隐藏状态栏
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
--设置缓入动画
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
activity.overridePendingTransition(android.R.anim.slide_in_left,android.R.anim.fade_out)
--关闭输入法
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)

import "build"
import "setting"

if alm_ then
  mn.setColorFilter(0xaa303030)
  chI.setColorFilter(0xaa303030)
end
alm_=nil

local alm=data.ui.image
if alm then
  setIm(mn,alm)
  setIm(chI,alm)
else
  setBz(mn,chI)
end
--ui_Im(tass,data["ui"]["icon_x"][1])--悬浮按钮图片
--ui_Im(tass_,data["ui"]["icon_x"][2])
--ui_Im(btn1,data["ui"]["icon1"][1])--两个按钮
ui_Mod(bity1,data.ui.icon1[2])
--ui_Im(btn2,data["ui"]["icon2"][1])
ui_Mod(bity2,data.ui.icon2[2])

function btn1.onClick(view)
  load(data.ui.icon1[3])()
end

function btn2.onClick(view)
  load(data.ui.icon2[3])()
end

task(10,function()
  DH(pack_1,"Y",{hh*0.84,hh*1.5},1,"f")
end)

title_top.Text=data.ui.title[1]--设置标题
title_top.getPaint().setFakeBoldText(true)


local dat={}
adp=LuaMultiAdapter(this,dat,setting)
--adp.add{__type=2,subtitle="主题配色",message="设置软件的主题陪色"}
adp.add{__type=1,title="布局"}
adp.add{__type=2,subtitle="主题",message="修改日/夜间主题,设置主题色\n(重新启动生效)"}
adp.add{__type=4,subtitle="*横屏",message="为平板准备的功能\n(注意,还没有弄好)",status={Checked=Boolean.valueOf(data.ui.theme.w_h or false)}}

List_Add()

adp.add{__type=1,title="脚本"}
adp.add{__type=4,subtitle="预加载",message="省去加载提高性能,但是新加入的脚本也不会更新到软件中",status={Checked=Boolean.valueOf(data.load.diy or false)}}

--adp.add{__type=4,subtitle="自动更新",message="软件启动时检测新版",status={Checked=Boolean.valueOf(data["strings"][1])}}
adp.add{__type=1,title="测试功能"}
adp.add{__type=4,subtitle="向导模式",message=Html.fromHtml("允许通过<b>剪切板</b>获取可执行的代码,并且执行"),status={Checked=Boolean.valueOf(data.load.guide or false)}}
--adp.add{__type=2,subtitle="优化内存",message="手动清理一些无用内容collectgarbage(\"collect\")"}
--local a,b,c,d=getDPI(activity)
--adp.add{__type=2,subtitle="density",message=a.."_"..b.."_\n"..c.."_"..d}

adp.add{__type=1,title="关于"}
adp.add{__type=6,subtitle="信息",message="包名:"..activity.getPackageName().."\n版本:0.1-(2019-3-2)",imagesrc="icon.png"}
adp.add{__type=2,subtitle="感谢",message="参考了开源代码:模拟v7布局/设置界面/alua手册提供的资料"}
adp.add{__type=2,subtitle="联系我",message="感谢您的使用,如果有疑问可以联系我"}
adp.add{__type=2,subtitle=Html.fromHtml("<font color='red'>重置/卸载</font>"),message="如果遇到bug重置一些配置文件，当然也提供了卸载方法"}

--adp.add{__type=6,subtitle="你好",message="hhh",imagesrc="icon.png"}
--[[adp.add{__type=1,title="彩蛋"}
if app_bool("com.mojang.minecraftpe") then adp.add{__type=7,subtitle="Minecraft(我的世界)",message="你好世界"}end
if app_bool("com.coolapk.market") then adp.add{__type=7,subtitle=Html.fromHtml("<font color='#0fa05a'>酷安</font>"),message="酷安基佬好评!"}end
if app_bool("cn.com.shouji.market") then adp.add{__type=7,subtitle=Html.fromHtml("<font color='#0fa05a'>手机乐园</font>"),message="乐园还没倒闭好评!"}end
if app_bool("com.sf.ALuaGuide") then adp.add{__type=7,subtitle=Html.fromHtml("<font color='#E91E63'>alua手册</font>"),message="你也是个ALua的开发者"}end
]]
adp.add{__type=7,subtitle="",message="alittlemc"}

cehuait.setAdapter(adp)

--adp.remove(1)
--[[adp.insert(3,{__type=3,subtitle="关于软件"})
adp.notifyDataSetChanged()]]

cehuait.setOnItemClickListener(AdapterView.OnItemClickListener{

  onItemClick=function(id,v,zero,one)
    alm=v.Tag.subtitle.Text
    if alm=="主题" then
      AlertDialog.Builder(this)
      .setTitle("主题")
      .setSingleChoiceItems(data["ui"]["theme"]["name"],data["ui"]["theme"]["id"]-1,
      {
        onClick=function(l,v)data["ui"]["theme"]["id"]=v+1 activity.finish()end}).show()
    elseif alm=="*横屏" then

      if v.Tag.status.Checked then
        data["ui"]["theme"]["w_h"]=false
        dat[one].status["Checked"]=false
      else
        data["ui"]["theme"]["w_h"]=true
        dat[one].status["Checked"]=true
      end

    elseif alm=="向导模式" then

      if v.Tag.status.Checked then
        data.load.guide=false
        dat[one].status["Checked"]=false
      else
        data.load.guide=true
        dat[one].status["Checked"]=true
      end

    elseif alm=="预加载" then

      if v.Tag.status.Checked then
        data.load.diy=false
        dat[one].status["Checked"]=false
      else
        data.load.diy=true
        dat[one].status["Checked"]=true
      end

    elseif alm=="优化内存" then

      local a=collectgarbage("count")
      collectgarbage("collect")
      print(a-collectgarbage("count"))
      a=nil

    elseif alm=="重置/卸载" then
      clear()
    elseif alm=="联系我" then
      AD_L(alm,{"应用市场","QQ临时会话","Github开源网页"},function(v)
        if v==1 then
          --调用应用商店搜索应用
          intent=Intent("android.intent.action.VIEW")
          intent.setData(Uri.parse("market://details?id="..activity.getPackageName()))
          this.startActivity(intent)
        elseif v==2 then
          qq_lt("2358742797")
        elseif v==3 then
          web_url("https://github.com/alittlemc/org.alittlemc.bug/")
        elseif v==4 then

        end

      end)
    else
      List_Fun(alm,id,v,zero,one)
      --sr_edit1.getSelectionStart()
      --sr_edit1.setSelection(30)
    end
    adp.notifyDataSetChanged()
    alm=nil
  end
})

--print("\xe6\x88\x91")
--wdsj.Text=tostring(s)

--交互
function setTt(str)
  sr_edit1.Text=tostring(str)
end
--主函数
function set()
  tox=require "tox"

  call("setTt",tostring(
  "rtox:"..tox.rtox(1,2)..
  "\nxtor:"..tox.xtor(200,2)..
  "\nxtor:"..tox.xtor(248,2)..
  "\nxtor:"..string.format("%d",tox.rtor("68e6",16,2))..
  "\n"..(250/316-80)..
  "\n"..(320/399)
  ))
  --local a={{"1","2","3"},{"a","b","c"}}
  --call("setT","")
end

thread(set)
--功能函数
import "alm"
import "alert_dialog"
--[[
luau=LuaUtil
local time0=os.clock()
--os.execute("ls -a "..mulu)
--shell("ls -a "..mulu)
print(LuaUtil.getFileMD5(mulu.."data.json"))
print("Os_time:"..os.clock()-time0.."s")

local time0=os.clock()
local md5 = require "codelua/md5"
print(md5.file(mulu.."data.json"))
print("Lua_time:"..os.clock()-time0.."s")
]]

--print(lfs.attributes(mulu.."function.lua"))
--[[
System.out.println('是否存在：' + file.exists()); 
System.out.println('文件名：' + file.getName()); 
System.out.println('上级目录：' + file.getParent()); 
System.out.println('是否可读：' + file.canRead()); 
System.out.println('是否可写：' + file.canWrite()); 
System.out.println('绝对路径：' + file.getAbsolutePath()); 
System.out.println('相对路径：' + file.getPath()); 
System.out.println('是否为绝对路径：' + file.isAbsolute()); 
System.out.println('是否为目录：' + file.isDirectory()); 
'是否为文件：' + file.isFile())
'是否为隐藏文件：' + file.isHidden()); 
'最后修改时间：' + new Date(file.lastModified())); 
'文件长度：' + file.length());]]

--print(this.openFileInput("help.lua"))
--fw(mulu.."help.lua",fr_data("help.lua",true))
--fw_data("help.lua","2")
--print(fr_data("help.lua",true))

Alm_Main()

collectgarbage("collect")
