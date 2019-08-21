if (fbool(mulu.."func.lua") and data.load.diy) then

  dofile(mulu.."func.lua")

 else

  local ui_code,code_,bar_code=[[ui_do={PageView;id="pagev";layout_width="-1";layout_height="-1";]],"\n};\n",
  [[bar_0={PageView;id="pagev_bar";layout_width="-1";layout_height="-1";]]

  local funs={
    [[
--添加侧边栏布局
function List_Add()
  ---{list_1}
]],

    [[
--侧边List点击事件setOnItemClickListener
function List_Fun(alm,id,v,zero,one)
  ---{list_2}
]],

    [[
--移动置顶事件
function CoordTop()
  ui_Tc(title,0xFFFFFFFF)
  ---{top}
]],

    [[
--移动监听事件
function CoordProg(ss)
  ---{prog}
]],

    [[
--自动置底事件
function CoordBottom()
  ui_Tc(title,0xFFFFD900)
  ---{bottom}
]],

    [[
--new退出软件事件
function onDestroy_Fun()
  ---{end}
]],

    [[
--xfun点击事件
function Xfun_Fun(i)
  ---{xfun}
]],

    [[
--build.lua文件底
function Alm_Build()
  ---{load_build}
]],

    [[
--mian.lua文件底
function Alm_Main()
  ---{load_main}
]],

    [[
--setOnPageChangeListener
function Pagev_Fun()
  ---{pagev}
]],

    [[
--setDrawerListener
function Drawer_Fun()
  ---{drawer}
]]}

  local find,sub,gsub,match,concat=string.find,string.sub,string.gsub,string.match,table.concat
  local table_class={{"1"},{"2"},{"3"},{"4"},{"5"},{"6"},{"7"},{"8"},{"9"},{"10"},{"11"},{"12"},{"13"}}--13,于#funcs+2同
  --不存在diy时解压缩自带的配置文件
  if not File(mulu.."diy").isDirectory() then
    LuaUtil.unZip(activity.getLuaDir().."/diy.zip",mulu.."/diy")
  end

  --ls=luajava.astable(File(mulu.."diy").listFiles())
  ls=split(shell("ls "..mulu.."diy"),"\n")

  --[[for k,v in pairs(ls) do
    print(k,v)
  end]]

  local k=0
  for i=1,#ls-1,1 do
    ls[i]=mulu.."diy/"..ls[i]
    if File(ls[i]).isDirectory() and fbool(ls[i].."/main.lua") then
      --local d=match(ls[i],".+/([^/]*%.%w+)$") or "名称丢失"
      local d="Directory"
      ls[i]=ls[i].."/main.lua"
     elseif File(ls[i]).isFile() and match(ls[i],"%.(.+)")~="0" then
      --local d=match(ls[i],".+/([^/]*%.%w+)$") or "名称丢失"
      local d="File"
     else
      k=k+1
      continue
    end

    local class=fr(ls[i]) or ""
    define=match(class,"{define}\n(.-)\n{define}") or ""
    class=match(class,"{body}(.-){body}") or ""
    --k
    if class=="" then
      k=k+1
      continue
    end

    class=tableChange2(class,{"@path@",ls[i],"@id@",i-k,"@mod@",d})--内部变量嵌入
    if define~="" then
      defineT=split(define,",")--使用split提为列表
      class=(defineT[0] and {tableChange1(class,defineT)} or {tableChange2(class,defineT)})[1]--选择模式并且宏定义
    end


    class=split(class,"<alittlemc/split>")--class为拆文件内的内容组
    --table_class[j][i]=class[j]

    for k,v in pairs(class) do
      table_class[k][i]=v
    end

    --[[
      内容组1={{第一个文件的内容组1},{第二个文件的内容组1}},
      内容组2={{第一个文件的内容组2},{第二个文件的内容组2}}
      ]]
    --合并第n个内容组table_class[n])

  end


  --{ui},1
  --{bar},2

  --{list_ui},3
  --{list_fun},4
  --{top},5
  --{prog(ss)},6
  --{bottom},7
  --{end},8
  --{xfun(i)},9
  --{load_build},10
  --{load_main},11
  --{pagev},12
  --{drawer},13
  local ui=concat({
    ui_code,
    "\npages={\n--{ui}",
    concat(table_class[1]),"};",
    code_,
    bar_code,
    "\npages={\n--{bar}",
    concat(table_class[2]),"};",
    code_})
  load(ui)()
  local func=""
  for k,v in pairs(funs) do
    func=concat({func,concat({v,concat(table_class[k+2]),"\nend\n\n"})})
  end
  --fw(activity.getLuaDir().."/test.lua",ui.."\n"..func)

  if data["load"]["diy"] then
    fw(mulu.."func.lua",ui.."\n"..func)
  end

  load(func)()
end

collectgarbage("collect")