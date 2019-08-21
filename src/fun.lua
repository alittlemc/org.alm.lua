local format,sub,gsub,concat,match=string.format,string.sub,string.gsub,table.concat,string.match

function split(szFullString, szSeparator)
  local nFindStartIndex = 1
  local nSplitIndex = 1
  local nSplitArray = {}
  while true do
    local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
    if not nFindLastIndex then
      nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
      break
    end
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
    nFindStartIndex = nFindLastIndex + string.len(szSeparator)
    nSplitIndex = nSplitIndex + 1
  end
  return nSplitArray
end


function DialogButtonFilter(dialog,button,WidgetColor)
  import "android.graphics.PorterDuffColorFilter"
  import "android.graphics.PorterDuff"
  if button==1 then
    dialog.getButton(dialog.BUTTON_POSITIVE).setTextColor(WidgetColor)
   elseif button==2 then
    dialog.getButton(dialog.BUTTON_NEGATIVE).setTextColor(WidgetColor)
   elseif button==3 then
    dialog.getButton(dialog.BUTTON_NEUTRAL).setTextColor(WidgetColor)
  end
end

function onKeyDown(code,event)
  if code==82 then clear() end
end

function colordx(a)
  return "#"..format("%x",tonumber(a))
end

function app_bool(n)
  return (pcall(function() activity.getPackageManager().getPackageInfo(tostring(n),0) end)
  and {true} or {false})[1]
end

function getJqb()
  return tostring(activity.getSystemService(Context.CLIPBOARD_SERVICE).getText())
end

function setJqb(a)
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(tostring(a))
end

function onResume()
  local a,b="alm:guide}",getJqb()
  if data["load"]["guide"] and b and tonumber(jishu(b,a))>=24+3 then
    load(match0(b,"{"..a,"{/"..a))()
  end
end

function base64(sr,mod)--java
  import "android.util.Base64"
  mod=(mod==0 and {Base64.DEFAULT}or{Base64.NO_PADDING})[1]
  return Base64.encodeToString(String(sr).getBytes(),mod)
end

function qq_xml(title,content,url_0,url_1,url_2,app_name,app_id)
  title,content,url_0=base64(title) or "",base64(content) or "",base64(url_0) or ""
  url_1=(url_1 and{base64(url_1)}or{""})[1]
  url_2=(url_2 and{base64(url_2)}or{""})[1]
  app_name=(app_name and{base64(app_name)}or{"6ZuG5ZCI"})[1]
  url=concat({"mqqapi://share/to_fri?file_type=news&src_type=web&version=1&share_id=",
    app_id,
    "&url="..url_0,
    "&previewimageUrl=",
    url_1,
    "&image_url=",
    url_2,
    "&title=",
    title,
    "&description=",
    content,
    "&callback_type=scheme&thirdAppDsplayName=UVE&app_name=",
    app_name,
    "&shareType=0"})
  --setJqb(url)
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end
--qq_xml("我是标题","我在这里怎么写都可以","https://github.com/alittlemc/org.alittlemc.bug/","","http://q1.qlogo.cn/g?b=qq&nk=2358742797&s=640","UC浏览器",100951776)

--1101114500it之家

--infos = am.getRunningAppProcesses()
--print(tostring(uid))

--[[activity.getPackageManager()

infos = pm.getInstalledPackages(0)

info.applicationInfo.loadIcon(pm)]]

--[[for k,v in pairs(am) do
  print(k..":"..tostring(v).."\n")
 end]]

--print(info.processName + " ; " + info.uid + " ; " + info.pid)

function tableChange1(sr,a,b)
  local la,lb,len=#a,#b,0
  if la>0 and lb>0 and type(a)=="table" and type(b)=="table" then
    len=(la>=lb and{la}or{lb})[1]
    for i=1,len,1 do
      sr=gsub(sr,a[i],b[i])
    end
  end
  return sr
end

function tableChange2(sr,a)
  local ls,len=#a,0
  if ls>0 and type(a)=="table" then
    len=(ls%2==0 and {ls} or {ls-1})[1]
    for i=1,len,2 do
      sr=gsub(sr,a[i],a[i+1])
    end
  end
  return sr
end

function qq_lt(q)
  url="mqqwpa://im/chat?chat_type=wpa&uin="..q
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end

function qq_team(q)
  url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin="..q.."&card_type=group&source=qrcode"
  activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
end

function intent_url(url)
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end

function unzip(zippath,outfilepath,filename)
  local time=os.clock()
  task(function(zippath,outfilepath,filename)
    require "import"
    import "java.util.zip.*"
    import "java.io.*"
    local file = File(zippath)
    local outFile = File(outfilepath)
    local zipFile = ZipFile(file)
    local entry = zipFile.getEntry(filename)
    local input = zipFile.getInputStream(entry)
    local output = FileOutputStream(outFile)
    local byte=byte[entry.getSize()]
    local temp=input.read(byte)
    while temp ~= -1 do
      output.write(byte)
      temp=input.read(byte)
    end
    input.close()
    output.close()
  end,zippath,outfilepath,filename,
  function()
    print(os.date().."解压完成,耗时 "..os.clock()-time.." s")
  end)
end

--调用其它程序打开文件
function OpenFile(path,mod)--目录,修改无时的打开方式
  f=tostring(File(path).Name)
  ExtensionName=match(f,"%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName) or
  MimeTypeMap.getSingleton().getMimeTypeFromExtension(mod)
  if Mime then
    intent = Intent()
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    intent.setAction(Intent.ACTION_VIEW)
    intent.setDataAndType(Uri.fromFile(File(path)),Mime)
    activity.startActivity(intent);
   else
    print("找不到可以用来打开此文件的程序")
  end
end

--获取运营商名称
--import "android.content.Context"
--print(activity.getSystemService(Context.TELEPHONY_SERVICE).getNetworkOperatorName())
--READ_PHONE_STATE
--print(os.date("%Y-%m-%d %H:%M:%S"))

function bool(a)
  return (a and{false} or {true})[1]
end

function onDestroy()
  onDestroy_Fun()
  if data then
    data["ui"]["theme"][1],data["ui"]["theme"][2],data["ui"]["theme"][3]=color1,color2,color3
    fw(mulu.."data.json",cjson.encode(data))
   else
    fd(mulu.."data.json")
  end
end

function sgg(s,i,j)
  local o=utf8.offset
  local i,j,n,m=tonumber(i),tonumber(j),o(s,i),
  ((j or -1)==-1 and -1) or o(s,j+1)-1
  return sub(s,n,m)
end

function notnil(a)
  return (a and {a} or {""})[1]
end

function match0(sr,a,b)
  n=sr:match(a..((a=="" or b=="") and{"(.+)"} or {"(.-)"})[1]..b)
  return (n and {n} or {""})[1]
end

function shell(cmd)
  local p=io.popen(format('%s',cmd),"r")
  local s=p:read("*a")
  p:close()
  --[[for cnt in p:lines() do
    print(cnt)
  end]]
  return s
end

function setBz(...)
  for i,a in ipairs({...}) do
    wallpaperManager = WallpaperManager.getInstance(this)
    wallpaperDrawable = wallpaperManager.getDrawable()
    a.setDrawingCacheEnabled(true)
    a.setImageDrawable(wallpaperDrawable)
  end
end

function DH(id,mod,sr,time,fool)
  if fool=="f" or fool=="F" then
    ObjectAnimator().ofFloat(id,mod,sr).setDuration(time).start()
   elseif fool=="i" or fool=="I" then
    ObjectAnimator().ofInt(id,mod,sr).setDuration(time).start()
  end
end

function del_app(pack)
  task(function(pack)
    uri = Uri.parse("package:"..pack)
    intent = Intent(Intent.ACTION_DELETE,uri)
    activity.startActivity(intent)
  end,pack,function()print("正在卸载"..pack)end)
end

--文件
function fr(f)--j
  F,n=io.open(f,"r")--文件不存在or是否为文件夹
  return (n and {false} or {(not File(f).isDirectory() and {F:read("*a")} or {false})[1]})[1]
end

function fw(a,b)--j
  local t=os.clock()
  task(function(a,b)
    f=File(tostring(File(tostring(a)).getParentFile())).mkdirs()--创建文件夹
    io.open(tostring(a),"w"):write(tostring(b)):close()
  end,a,b,function() print("写入文件用时"..os.clock()-t.."s")end)
end

function fd(f)
  if fbool(f) then
    local t=os.clock()
    task(function(f)
      os.remove(f)
    end,f,function() print("删除文件用时"..os.clock()-t.."s")end)
   else
    return false
  end
end

function fod(fo)
  os.execute("rm -r "..fo)
end
function fbool(f)
  return (f and {File(f).exists()} or {false})[1]
end

function fs(f,mod)
  size=File(tostring(f)).length()
  Sizes=Formatter.formatFileSize(activity,size)
  return (mod and {Sizes} or {size})[1]
end

function ft(f)
  return Calendar.getInstance().setTimeInMillis(File(f).lastModified()).getTime().toLocaleString()
end

function fchange(f,str,sr)
  fw(f,gsub(fr(f),str,sr))
end

function fchange_get(f,get,str,sr)
  fw(f,gsub(get,str,sr))
end

function fr_data(f,mod)
  local content,i={},0
  local r = BufferedReader(InputStreamReader(this.openFileInput(f)))
  while r.readLine() do
    content[i] = tostring(r.readLine())
    i=i+1
  end
  return (mod and {table.concat(content,"\n")}or{content})[1]
end

function fw_data(f,str)
  -- task(function()
  local time=os.clock()
  task(function(f,str)
    local writer = BufferedWriter(OutputStreamWriter(this.openFileOutput(f,Context.MODE_PRIVATE)))
    writer.write(str)
    writer.close()
  end,f,str,function()
    print("私有文件夹写入用时"..os.clock()-time.."s")end)
end

function fr_line(f)
  local fline_table,i={},1
  for F in io.lines(f) do
    fline_table[i]=F
    i=i+1
  end
  return fline_table
end

function fremove(f,f_)
  local t=os.clock()
  task(function(f,f_)
    os.execute("mv "..f.." "..f_)

    --os.rename(tostring(a),tostring(b))
  end,f,f_,function() print("修改文件名用时"..os.clock()-t.."s")end)
end

function frename(f,f_)
  --local t=os.clock()
  task(function(f,f_)
    File(f).renameTo(File(f_))
    --os.rename(tostring(a),tostring(b))
  end,f,f_,function() --[[print("修改文件名用时"..os.clock()-t.."s")]]end)
end
--print(mulu)
--frename(mulu.."data.json",mulu.."alittlemc.apk")
--fremove(mulu.."data.json",mulu.."diy")
--frename(mulu.."",mulu.."/diy")
--[[
function f(a)
  function run()
    print(a)
    a=a+1
  end
end

t=timer(f,0,1000,1)
t.Enabled=false--暂停定时器
--t.Enabled=true--重新定时器
--t.stop()--停止定时器
]]
--print(shell("ls -a /sdcard/"))

--[[获取文件Mime类型
function GetFileMime(name)
import "android.webkit.MimeTypeMap"
ExtensionName=tostring(name):match("%.(.+)")
Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
return tostring(Mime)
end]]

--print(GetFileMime("/sdcard/a.png"))
--print(tostring(mulu.."data.json"):match("%.(.+)"))

function debug_(bool,r,u)
  if bool and r then
    r()
   elseif u then
    u()
  end
end

function ui_Vc(id,color)
  if id and color then
    id.setBackgroundColor(color)
  end
end

function ui_Mod(id,fool)
  if id and fool then
    id.setVisibility(View.VISIBLE)
   elseif id and not fool then
    id.setVisibility(View.GONE)
  end
end

function ui_Im(id,mbt)
  if id and mbt then
    id.setImageBitmap(loadbitmap(mbt))
  end
end

function ui_Tc(id,color)
  if id and color then
    id.setTextColor(color)
  end
end

function ui_Ripple(id,color)
  RippleHelper(id).RippleColor=color--0x1CFFFFFF
end

function removeView(id)
  id.getParent().removeView(id)
end

function closeui(alm)
  activity.finish()
  activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
  if alm==1 then
    data=nil
   elseif alm==2 then
    --os.remove(mulu.."diy/ui.lua")
   elseif alm==3 then
    os.remove(mulu.."functions.lua")
   elseif alm==4 then
    -- os.remove(mulu.."diy/ui.lua")
    os.remove(mulu.."functions.lua")
  end
end