require 'import'

return_var={0,0,0,0}

--编辑框布局
--AD_ETV(t,{text,hint},f(text))
--return_var=text

--拖动条布局
--AD_SBV(t,{p,max,p_hint},f(p))
--return_var=p

--下拉式选择布局
--AD_SPV(t,{...},f(id))
--[[function f(id)
if id=0 then
  ...
  end
]]

--文件选择布局
--ChoicePath(t,mod,startPath,f(path))
--mod true显示文件 false隐藏文件

--取色
--ADRgb(A,R_,G,B,f(A,R_,G,B))
--传入return_var{A,R_,G,B}
local function colorC(dialog,t,c)
  if t[1] then
    dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(c)
  end
  if t[2] then
    dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(c)
  end
  if t[3] then
    dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(c)
  end
end

function clear()
  local items_={false,false,false,false}
  local items={"清除数据","重置预加载脚本","删除脚本文件夹(危)","卸载主程序(危)"}
  local bar=AlertDialog.Builder(this,0x7f060001)
  .setTitle("重置应用")
  .setMultiChoiceItems(items,0x7f060001,{onClick=function(v,p)
      items_[p+1]=bool(items_[p+1])
    end})
  .setPositiveButton("取消",nil)
  .setNeutralButton("目录",{onClick=function()
      ChoicePath("查看文件",true,mulu,function(path)
        OpenFile(path,"txt")
      end)end})--ChoicePath(t,mod,startPath,f(path))
  .setNegativeButton("#确定所选#",{onClick=function()
      if items_[3] then
        fod(mulu.."diy")
      end
      if items_[2] then
        fd(mulu.."func.lua")
      end
      if items_[1] then
        data=nil
        fd(mulu.."data.json")
        activity.finish()
        activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
      end
      if items_[4] then
        del_app("org.alittlemc.lua")
        activity.finish()
        activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
      end
    end}).show()
end

function AD_ETV(t,h,f)
  ETV_ui={
    LinearLayout;
    orientation="vertical";
    {TextView;
      layout_marginTop="10dp";
      text="例子",
      layout_marginRight="20dp";
      layout_marginLeft="30dp";
      textSize="14dp";
    };
    {EditText;
      text=h[1];
      hint=h[2];
      layout_marginTop="0dp";
      layout_width="-1";
      layout_gravity="center",
      layout_marginRight="25dp";
      layout_marginLeft="25dp";
      id="edit";
    };
  };
  bar=AlertDialog.Builder(this)
  .setTitle(t)
  .setView(loadlayout(ETV_ui))
  .setPositiveButton("确定",{onClick=function(v)
      return_var=edit.Text
      f(return_var)end})
  .setNegativeButton("取消",nil)
  .show()
end

--AD_ETV("写入格式",{"","funk"},function(text)print(text)end)
function AD_SBV(t,p,f)
  SBV_ui={
    LinearLayout;
    orientation="vertical";
    {TextView;
      layout_marginTop="10dp";
      layout_marginRight="30dp";
      layout_marginLeft="30dp";
      textSize="14dp";
      id="tt";
      text="("..p[1].."/"..p[2]..")";
    };
    {SeekBar;
      layout_marginRight="20dp";
      layout_marginLeft="20dp";
      id="sbv";
      layout_width="-1";
      Max=p[2];
      secondaryProgress=p[3] or 100;
      Progress=p[1];
    };
  };
  bar=AlertDialog.Builder(this)
  .setTitle(t)
  .setView(loadlayout(SBV_ui))
  .setPositiveButton("确定",{onClick=function(v)
      return_var=sbv.getProgress()
      f(return_var)end})
  .setNegativeButton("取消",nil)
  .show()
  sbv.setOnSeekBarChangeListener{
    onProgressChanged=function(v,i)
      tt.Text="("..i.."/"..p[2]..")";
    end}
end

--AD_SBV("选择大小",{10,100,100},function(p)print(p,return_var)end)

function AD_SPV(t,a,f)
  SPV_ui={
    LinearLayout;
    orientation="vertical";
    {Spinner;
      layout_marginRight="20dp";
      layout_marginLeft="20dp";
      layout_width="-1";
      id="spv";
    };
  };
  i=1
  bar=AlertDialog.Builder(this)
  .setTitle(t)
  .setView(loadlayout(SPV_ui))
  .setPositiveButton("确定",{onClick=function()

      f(i)end})
  .setNegativeButton("取消",nil)
  .show()
  pz={TextView,padding="10dp",textSize="18dp",layout_width="-1",typeface=Typeface.DEFAULT_BOLD}
  adapter=LuaArrayAdapter(activity,pz,String(a))
  spv.setAdapter(adapter)
  spv.onItemSelected=function(parent,view,id,idshu) 
    i=id+1
  end
end

function AD_L(t,list,f)
  bar=AlertDialog.Builder(this)
  .setTitle(t)
  .setItems(list,{onClick=function(l,i)
      f(i+1)
    end})
  .show()
end

function ChoicePath(t,mod,StartPath,callback)
  StartPath=StartPath or Environment.getExternalStorageDirectory().toString()
  --创建ListView作为文件列表
  lv=ListView(activity).setFastScrollEnabled(true)
  --创建路径标签
  cp=TextView(activity)
  cp.layout_marginLeft="10dp";
  lay=LinearLayout(activity).setOrientation(1).addView(cp).addView(lv)
  ChoiceFile_dialog=AlertDialog.Builder(activity)--创建对话框
  .setTitle(t)
  .setPositiveButton("确定",{
    onClick=function()
      callback(tostring(cp.Text))
    end})
  .setNegativeButton("取消",nil)
  .setView(lay)
  .show()
  adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1)
  lv.setAdapter(adp)
  function SetItem(path)
    path=tostring(path)
    adp.clear()--清空适配器
    cp.Text=tostring(path)--设置当前路径
    if path~="/" then--不是根目录则加上../
      adp.add("../")
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
    else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then--如果是文件夹则
        adp.add(c.Name.."/")
      elseif mod then
        adp.add(c.Name)
      end
    end
  end
  lv.onItemClick=function(l,v,p,s)--列表点击事件
    path_=tostring(cp.Text)=="/" and ls[p+1] or ls[p]
    if tostring(v.Text)=="../" then
      SetItem(File(cp.Text).getParentFile())
    elseif path_.isDirectory() then
      SetItem(path_)
    elseif path_.isFile() then
      return_var=tostring(path_)
      callback(return_var)
      ChoiceFile_dialog.hide()
    end
  end
  SetItem(StartPath)
end


--ChoicePath("选择文件夹",true,nil,function(path)print(path)end)

function AD_Rgb(A,R_,G,B,f)
  --alittlemc原创
  getRgb_bar={
    RelativeLayout;
    --padding="10dp";
    layout_height="-1";
    layout_width="-1";
    {LinearLayout;
      layout_width="-1";
      --padding="10dp";
      id="textbar";
      layout_height="120dp";
      gravity="center";
      layout_marginBottom="30dp";
      {TextView;
        text="A:0";
        layout_marginRight="10dp";
        padding="10dp";
        id="tvA";
        gravity="center";
        textSize="22dp";
        typeface=Typeface.DEFAULT_BOLD;
      };
      {TextView;
        text="R:0";
        layout_marginRight="10dp";
        padding="10dp";
        id="tvR";
        gravity="center";
        textSize="22dp";
        typeface=Typeface.DEFAULT_BOLD;
      };
      {TextView;
        text="G:0";
        layout_marginRight="10dp";
        padding="10dp";
        id="tvG";
        gravity="center";
        textSize="22dp";
        typeface=Typeface.DEFAULT_BOLD;
      };
      {TextView;
        text="B:0";
        padding="10dp";
        id="tvB";
        gravity="center";
        textSize="22dp";
        typeface=Typeface.DEFAULT_BOLD;
      };
    };
    {SeekBar;
      layout_below="textbar";
      layout_marginRight="30dp";
      layout_marginLeft="30dp";
      layout_marginBottom="30dp";
      id="sbA";
      layout_width="-1";
      Max="255";
      --secondaryProgress=100;
      Progress=A;
    };
    {SeekBar;
      layout_below="sbA";
      layout_marginRight="30dp";
      layout_marginLeft="30dp";
      layout_marginBottom="30dp";
      id="sbR";
      layout_width="-1";
      Max="255";
      --secondaryProgress=100;
      Progress=R_;
    };
    {SeekBar;
      layout_below="sbR";
      layout_marginRight="30dp";
      layout_marginLeft="30dp";
      layout_marginBottom="30dp";
      id="sbG";
      layout_width="-1";
      Max="255";
      --secondaryProgress=100;
      Progress=B;
    };
    {SeekBar;
      layout_below="sbG";
      layout_marginRight="30dp";
      layout_marginLeft="30dp";
      id="sbB";
      layout_width="-1";
      Max="255";
      --secondaryProgress=100;
      Progress=B;
    };
  };
  bar=AlertDialog.Builder(this)
  .setView(loadlayout(getRgb_bar))
  .setPositiveButton("选定颜色",{onClick=function(v)
      return_var={A,R_,G,B}
      f(A,R_,G,B) end})
  .setNegativeButton("取消",nil)
  .show()
  local function ui_Back(id,color)
    id.setBackgroundColor(color)
  end
  ui_Back(textbar,Color.argb(A,R_,G,B))
  --tvA.setTextColor(Color.argb(A,R_,G,B))
  sbA.setOnSeekBarChangeListener{
    onProgressChanged=function(v,i)
      A=i
      tvA.Text="A:"..i
      ui_Back(textbar,Color.argb(A,R_,G,B))
      if i>240 then i=200 end
      tvA.setTextColor(Color.argb(i,255,255,255))
    end}
  sbR.setOnSeekBarChangeListener{
    onProgressChanged=function(v,i)
      R_=i
      tvR.Text="R:"..i
      ui_Back(textbar,Color.argb(A,R_,G,B))
      if i>240 then i=200 end
      tvR.setTextColor(Color.argb(255,i,255,255))
    end}
  sbG.setOnSeekBarChangeListener{
    onProgressChanged=function(v,i)
      G=i
      tvG.Text="G:"..i
      ui_Back(textbar,Color.argb(A,R_,G,B))
      if i>240 then i=200 end
      tvG.setTextColor(Color.argb(255,255,i,255))
    end}
  sbB.setOnSeekBarChangeListener{
    onProgressChanged=function(v,i)
      B=i
      tvB.Text="B:"..i
      ui_Back(textbar,Color.argb(A,R_,G,B))
      if i>240 then i=200 end
      tvB.setTextColor(Color.argb(255,255,255,i))
    end}
end

--AD_Rgb(10,20,35,28,function(a,b,c,d)print(a,b,c,d))

--AD_SBV("选择大小",{10,100,100},function(p)print(p,return_var)end)
