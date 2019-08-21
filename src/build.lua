
import "android.view.animation.AlphaAnimation"

--ocal t_mod=data.ui.title[2]

local bilu={DrawerLayout;
  id="ch"; 
  {RelativeLayout;
    layout_width="-1";
    layout_height="-1";
    id="di0",
    {ScrollView;
      layout_width="-1";
      id="bit";
      OverScrollMode=2;
      verticalScrollBarEnabled=false;
      layout_height="-1";
      {LinearLayout;
        layout_width="-1";
        layout_height="-1";
        {LinearLayout; 
          id="mty";
          layout_width="-1";
          layout_height="-1";
          --main
        };
      };
    };
    {FrameLayout;
      layout_width="-1";
      id="menus";
      --layout_alignParentBottom="true";
      background=colordx(color1);
      layout_height="300dp";--305
      translationZ="10.3";
      {ImageView;--背景图
        layout_width="-1";
        id="mn";
        layout_height="330dp";
        scaleType="centerCrop"; 
      };
      {FrameLayout;
        layout_marginTop=hsn;
        layout_width="-1";
        id="gft";
        layout_height="-1";
        background="#00000000";
        --paddingTop=hsn*0.25;
        {LinearLayout;--图标控件
          layout_width="-1";
          id="reo";
          gravity="center";
          orientation="horizontal";
          layout_height="66dp";--66
          -- paddingTop=hsn*0.5;--"-14sp";--0
          {LinearLayout;
            gravity="center";
            layout_height="-1"; 
            layout_marginLeft="-10dp";
            {CardView;
              --id="btn";
              layout_width="65dp";
              layout_height="65dp";
              background="#00000000"; 
              PreventCornerOverlap=false; 
              CardElevation="0dp";
              radius="33dp"; 
              UseCompatPadding=false;
              {LinearLayout;
                layout_width="-1";
                layout_height="-1";
                gravity="center"; 
                {RelativeLayout;
                  layout_width="-1";
                  id="all";
                  layout_height="50dp";
                  {LinearLayout;
                    layout_width="20dp";
                    layout_centerInParent="true";
                    background="#fafafa";
                    layout_height="2.5dp";
                    id="center";
                  };
                  {LinearLayout;
                    layout_width="20dp";
                    layout_centerInParent="true";
                    layout_height="2.5dp";
                    layout_marginTop="19dp";
                    layout_alignParentTop="true";
                    id="top";
                    background="#fafafa";
                  };
                  {LinearLayout;
                    layout_width="20dp";
                    layout_centerInParent="true";
                    layout_marginBottom="19dp";
                    layout_alignParentBottom="true";
                    background="#fafafa";
                    layout_height="2.5dp";
                    id="bottom"; 
                  }; 
                };
              };
              {ImageView;
                layout_width="-1";
                id="btn";
                layout_margin="-10dp";
                layout_height="-1";
                background="#00000000"; 
                padding="28dp";
              };
            };
          };
          --
          {
            TextView;
            text="alittlemc";
            id="title_top";
            textSize="18dp";
            layout_marginTop="19dp";
            textColor="#FFFFFF";
            singleLine=true;
            textSize="20dp";
            layout_width="-2";
            typeface=Typeface.DEFAULT_BOLD;
            layout_height="65dp";
            background="#00000000";
            layout_marginRight="-17dp";
          };
          --
          {TextView;
            layout_width="-1";
            layout_height="-1";
            singleLine=true;
            gravity="center|left";
            layout_weight="1";
            textColor="#FFFFFF";
            layout_marginLeft="-15dp";
          };
          {CardView;
            id="bity1",
            layout_width="65dp";
            layout_height="65dp";
            background="#00000000";
            layout_marginRight="-17dp";
            PreventCornerOverlap=false;
            CardElevation="0dp";
            radius="33dp";
            Visibility=8;
            UseCompatPadding=false;
            {ImageView;
              layout_width="-1";
              id="btn1";
              layout_margin="-10dp";
              layout_height="-1";
              background="#00000000"; 
              padding="28dp";
              src=data["ui"]["icon1"][1];
            };
          };
          {CardView;
            id="bity2",
            Visibility=8;
            layout_width="65dp";
            layout_height="65dp";
            background="#00000000";
            layout_marginRight="-19dp";
            PreventCornerOverlap=false;
            CardElevation="0dp";
            radius="33dp";
            UseCompatPadding=false;
            {
              ImageView;
              layout_width="-1";
              id="btn2";
              layout_margin="-10dp";
              layout_height="-1";
              background="#00000000";
              padding="28dp";
              src=data["ui"]["icon2"][1];
            };
          };
          {CardView;
            layout_width="65dp";
            layout_height="65dp";
            background="#00000000";
            layout_marginRight="-10dp";
            PreventCornerOverlap=false;
            CardElevation="0dp";
            radius="33dp";
            UseCompatPadding=false; 
            {ImageView;
              layout_width="-1";
              id="btn3";
              layout_margin="-10dp";
              layout_height="-1";
              background="#00000000";
              padding="31dp";
              src="btn3.png";
            };
          };
        };
      };
      {TextView;
        layout_height=hsn;--hsn
        layout_width="-1";
        background="#38000000";
      };
      {TextView;
        background="#00000000";
        id="bhj",
        layout_width="-1";
        layout_height=hsn;--14sp
      };

      {TextView;
        background="#00000000";
        id="bh",
        layout_marginTop=hsn;
        layout_height=1;
        layout_marginLeft=0.99*wh;
      };
    };
    {TextView;
      layout_height="224dp";--224
      id="mbys";
      background="#00000000";
    };
    {TextView;
      layout_height="138dp";--168
      id="mby";
    };
    --[[{TextView;
      layout_width="-1";
      id="title";
      --Visibility=8;
      --typeface=Typeface.DEFAULT_BOLD;
      --typeface=Typeface.MONOSPACE;
      gravity="center|left";
      ellipsize="end";
      --text="Title";
      typeface=Typeface.DEFAULT_BOLD;
      textColor="#FFFFFF";
      singleLine=true;
      textSize="18dp";
      layout_height="56dp";
      layout_marginRight="75dp";
      layout_marginLeft="90dp";
      layout_marginTop="249dp";--249*2.5-(24*2.5-hsn);--249
    };]]
  };
  {LinearLayout;
    layout_width="-1";
    layout_height="-1";
    --gravity="top|right";
    orientation="vertical";
    id="xu";
    {CardView;
      layout_marginTop="277dp";
      id="xfun";
      background=colordx(color3);
      layout_height="60dp";
      radius="30dp";
      CardElevation="8dp";
      layout_marginLeft=0.8*wh;
      layout_width="60dp";
      {ImageView;--Button;
        layout_width="-1";
        id="tass";
        --ColorFilter="#616161";
        layout_margin="-7dp";
        layout_height="-1";
        background="0";
        padding="25dp";
        scaleType="fitXY";
        src=data["ui"]["icon_x"][1];
      };
    };
  };
};

local main_layout={
  RelativeLayout;
  layout_width="-1";
  layout_height="-1";
  gravity="center|top";
  {RelativeLayout;
    layout_width="-1";
    layout_height="-1";
    id="mian_di";
  }
};

--ch
local drawer={
  FrameLayout;
  layout_width="-1";
  layout_width=0.68*wh;--68
  layout_height="-1";
  layout_gravity="left";
  background=theme_l;
  {LinearLayout;
    orientation="vertical";
    layout_height="-1";
    id="mii";
    {ImageView;
      layout_width="-1";
      layout_height=0.26*hh;--24
      contentDescription="侧滑图片";
      scaleType="fitXY";
      scaleType="centerCrop"; 
      id="chI";
    };
    {CardView;
      layout_marginTop=-0.03*hh;
      radius="3dp";
      layout_height=-1,--0.85*hh;
      layout_width="-1";
      --layout_marginBottom=-0.002*hh;
      {ListView;
        layout_width="-1";
        layout_height="-1";--0.792*hh;
        contentDescription="侧滑列表";
        id="cehuait";
        layout_marginTop="0dp";
        dividerHeight="0";
        VerticalScrollBarEnabled=false;
      };
    };
    -- };
  },
  {TextView;
    layout_width="-1";
    layout_height=hsn;--"24sp";
    background="#38000000";
  };
};

local bar_={
  CardView;
  layout_width=0.94*wh;
  layout_marginLeft=0.03*wh;
  layout_marginTop=0.8*hh;
  layout_height=0.24*hh;
  CardElevation="0dp";
  layout_marginBottom="-10";
  radius="3dp";
  id="pack_1";
  translationZ="10.3";
  {AbsoluteLayout;
    layout_width="-1";
    layout_height="2dp";
    layout_marginTop="-2";
    {TextView;
      layout_width="-1";
      layout_height="-1";
      background=colordx(color1);
      id="bq";
    };
  };}
local insert=table.insert
insert(bilu,drawer)

insert(bar_,bar_0)
insert(bilu[2],bar_)
insert(main_layout,ui_do)
insert(bilu[2][2][2][2],main_layout)

local alm0={
  CardView;
  layout_marginLeft=0.8*wh;
  layout_marginTop=0.7777*hh;
  layout_width="60dp";
  id="xfan";
  radius="30dp";
  layout_height="60dp";
  CardElevation="4dp";
  layout_marginBottom="24dp";
  background=colordx(color3);
  {ImageView;
    id="tass_";
    layout_width="26dp";
    layout_height="26dp";
    layout_gravity="center";
    src=data["ui"]["icon_x"][2];
  };
};

insert(bilu[2],alm0)
activity.setContentView(loadlayout(bilu))
local pagev_ui=pagev.getAdapter().getCount()

local function vgy(view,color1,color2,times)
  ObjectAnimator.ofInt(view,"backgroundColor",{color1,color2}).setDuration(times).setEvaluator(ArgbEvaluator()).start()
  ObjectAnimator.ofFloat(xfun,"alpha",{0,1}).setDuration(300).start()
end

local function vgys(view,color1,color2,times)
  ObjectAnimator.ofInt(view,"backgroundColor",{color1,color2}).setDuration(times).setEvaluator(ArgbEvaluator()).start()
  ObjectAnimator.ofFloat(xfun,"alpha",{1,0}).setDuration(300).start()
end

local function vgys1(view,color1,color2,times)
  ObjectAnimator.ofInt(view,"backgroundColor",{color1,color2}).setDuration(times).setEvaluator(ArgbEvaluator()).start()
end

local function vgys2(view,color1,color2,times)
  ObjectAnimator.ofInt(view,"backgroundColor",{color1,color2}).setDuration(times).setEvaluator(ArgbEvaluator()).start()
end

local function sdry(id,e,i)
  ObjectAnimator().ofFloat(id,"ScaleY",{e,i}).setDuration(300).start()
  ObjectAnimator().ofFloat(id,"ScaleX",{e,i}).setDuration(300).start()
end

task(100,function()
  ades=menus.getHeight()
  ---mbt=title.getY()
  ---title.setScaleY(1.6)
  ---title.setScaleX(1.6)
  --一定要给滚动父布局
  if mty.getHeight()<(ades*2)+bit.getHeight() then
    layoutParams = mty.getLayoutParams();
    layoutParams.setMargins(0,ades,0,0);--4个参数按顺序分别是左上右下  
    layoutParams.height =bit.getHeight()-(mby.getHeight()/3)-hsn
    mty.setLayoutParams(layoutParams);
  else
    layoutParams = mty.getLayoutParams();
    layoutParams.setMargins(0,ades,0,0);--4个参数按顺序分别是左上右下  
    mty.setLayoutParams(layoutParams);
  end 
end)

local ase=true

menus.setTranslationZ(8)

---title.setTranslationZ(8)

xfan.setScaleY(0)
xfan.setScaleX(0)

function bit.onScrollChange(a,b,j,y,u)

  if j==0 then
    ---title.setTranslationY(-hsn) 
    if CoordBottom~=nil then CoordBottom() end

    ---title.setTranslationY(0)
    --gft.setBackgroundColor(Color.argb(0,231,30,98))
    ---title.setScaleY(1.6)
    ---title.setScaleX(1.6)
    linearParams = menus.getLayoutParams()
    linearParams.height =mbys.getHeight()+((mby.getHeight()/3)+hsn)+25
    menus.setLayoutParams(linearParams)
    mn.setTranslationY(0)
    xu.setTranslationY(0)
    ---title.setTranslationX(0)

    if not ase then

      ase=true
      background,backgrounds1= gft.getBackground(),bhj.getBackground() 
      vgy(gft,background.getColor(),color2,1000)
      vgys1(bhj,backgrounds1.getColor(),color2,1500)
      sdry(xfun,0,1)
      sdry(xfan,1,0)
      DH(pack_1,"Y",{hh*0.83,hh*1.3},400,"f")

      --nil

    end
  elseif j > 0 and j <= mbys.getHeight() then--中

    local scale= j / mbys.getHeight()
    local alpha = (255 * scale)
    if CoordProg~=nil then CoordProg(scale) end 
    ---title.setTranslationY(-scale*mbys.getHeight())
    xu.setTranslationY(-scale*mbys.getHeight())
    mn.setTranslationY((-j/3))
    ---title.setTranslationX(-(scale*(mby.getHeight()*0.2)))
    ---title.setScaleY(1+(0.6*(1-scale)))
    ---title.setScaleX(1+(0.6*(1-scale)))
    --gft.setBackgroundColor(Color.argb(alpha,231,30,98))   
    linearParams = menus.getLayoutParams()
    linearParams.height =((mbys.getHeight()*0.25)+hsn)+(mbys.getHeight()-((j/mbys.getHeight())*mbys.getHeight()))
    menus.setLayoutParams(linearParams)
    if j<=mby.getHeight() then
      if not ase then
        ase=true
        background = gft.getBackground(); 
        backgroundsy1 = bhj.getBackground(); 
        local bac=xu.getBackground()
        vgy(gft,background.getColor(),color2,1000)
        vgys1(bhj,backgroundsy1.getColor(),color2,1000)
        sdry(xfun,0,1)
        sdry(xfan,1,0)
        DH(pack_1,"Y",{hh*0.83,hh*1.3},400,"f")
      end
    else
      if ase then
        ase=false
        backgrounds = gft.getBackground(); 
        backgroundsg1 = bhj.getBackground(); 
        vgys(gft,backgrounds.getColor(),color1,600) 
        vgys2(bhj,backgroundsg1.getColor(),color1,600) 
        sdry(xfun,1,0)
        sdry(xfan,0,1)
        DH(pack_1,"Y",{hh*1.3,hh*0.83},400,"f")
      end
    end
  else
    if ase then
      ase=false
      backgrounds = gft.getBackground(); 
      backgroundss1 = bhj.getBackground(); 
      vgys(gft,backgrounds.getColor(),color1,600) 
      vgys2(bhj,backgroundss1.getColor(),color1,600) 
      sdry(xfun,1,0)
      sdry(xfan,0,1)
      DH(pack_1,"Y",{hh*1.3,hh*0.83},400,"f")
      --nil
    end 
    ---title.setTranslationY(-(mby.getHeight()+(mbys.getHeight()*0.25)))
    ---title.setScaleY(1)
    ---title.setScaleX(1) 
    mn.setTranslationY(-((mbys.getHeight())/3))
    ---title.setX((mby.getHeight()/3))

    xu.setTranslationY(-mbys.getHeight())
    linearParams = menus.getLayoutParams()
    linearParams.height =(mbys.getHeight()*0.25)+hsn+25
    menus.setLayoutParams(linearParams) 
    if CoordTop~=nil then CoordTop() end 
  end
end

function Themenu(menu)
  menu.add("设置").onMenuItemClick=function()
    ch.openDrawer(3)
  end
  menu.add("重启软件").onMenuItemClick=function()
    activity.finish()
    activity.newActivity("main",android.R.anim.fade_in,android.R.anim.fade_out)
  end
  menu.add("新开模板").onMenuItemClick=function()
    activity.newActivity("main",android.R.anim.fade_in,android.R.anim.fade_out)
  end
  menu.add("重置软件..").onMenuItemClick=function()
    clear()
  end
  menu.add("退出").onMenuItemClick=function()
    closeui(0)
  end
  debug_(data["load"]["_id"][1]=="R",function()
    menu.add("data.json").onMenuItemClick=function()
      print(fr(mulu.."data.json"))
    end
  end,nil)
end

task(100,function()
  local pop=PopupMenu(activity,bh)
  local menu=pop.Menu
  Themenu(menu)
  btn3.onClick=function()
    pop.show()
  end
  btn3.onLongClick=function()
    pop.show()
  end

  function btn.onClick()
    ch.openDrawer(3)
  end
  function btn.onLongClick()
    ch.openDrawer(3)
  end

  RippleHelper(btn1).RippleColor=0x1CFFFFFF
  RippleHelper(btn2).RippleColor=0x1CFFFFFF
  RippleHelper(btn3).RippleColor=0x1CFFFFFF
  RippleHelper(btn).RippleColor=0x1CFFFFFF
end)

local pio=wh*0.68
ch.setDrawerListener(DrawerLayout.DrawerListener{
  onDrawerSlide=function(v,i)
    if ch.isDrawerOpen(3) then
      di0.setTranslationX(i*pio)
      all.Rotation=-i*180
      top.Rotation=i*48
      bottom.Rotation=-i*48
      top.scaleX=(1-i*0.4)
      bottom.scaleX=(1-i*0.4)
      center.scaleX=(1-i*0.2)
      center.setTranslationX(-i*12)
      top.setTranslationY(i*4.2)
      bottom.setTranslationY(-i*4.2)
      xfun.setTranslationX(i*pio*1.5)
    else
      di0.setTranslationX(i*pio)
      all.Rotation=i*180
      top.Rotation=i*48
      bottom.Rotation=-i*48
      top.scaleX=(1-i*0.4)
      bottom.scaleX=(1-i*0.4)
      center.scaleX=(1-i*0.2)
      center.setTranslationX(-i*12)
      top.setTranslationY(i*4.2)
      bottom.setTranslationY(-i*4.2)
      xfun.setTranslationX(i*pio*1.5)
    end
    xfun.setAlpha(1-i*0.9)
  end,Drawer_Fun()})

pagev.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    bq.setTranslationX(wh/pagev_ui*(a+b)) 
  end,
  onPageSelected=function(a)
    data["ui"]["id"][2]=a+1
    pagev_bar.showPage(a)
  end,Pagev_Fun()})

local alm=data["ui"]["id"][2]-1
if alm~=0 and alm<=pagev_ui then
  pagev.showPage(alm)
end

task(100,function()
  local linearParams = bq.getLayoutParams()
  linearParams.width =0.87*wh/pagev_ui--0.87
  bq.setLayoutParams(linearParams)
end)

tass.onClick=function(view)
  Xfun_Fun(tointeger(data["ui"]["id"][2]))
end

tass_.onClick=function(view)
  Xfun_Fun(tointeger(data["ui"]["id"][2]))
end

Alm_Build()
collectgarbage("count")
--collectgarbage("collect")
--print("Build:"..count-collectgarbage("count").."Kb")