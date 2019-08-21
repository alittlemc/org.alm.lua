local _convertTable = {
  ["0"]=0,
  ["1"]=1,
  ["2"]=2,
  ["3"]=3,
  ["4"]=4,
  ["5"]=5,
  ["6"]=6,
  ["7"]=7,
  ["8"]=8,
  ["9"]=9,
  ["a"]=10,
  ["b"]=11,
  ["c"]=12,
  ["d"]=13,
  ["e"]=14,
  ["f"]=15,
  ["g"]=16,
  ["h"]=17,
  ["i"]=18,
  ["j"]=19,
  ["k"]=20,
  ["l"]=21,
  ["m"]=22,
  ["n"]=23,
  ["o"]=24,
  ["p"]=25,
  ["q"]=26,
  ["r"]=27,
  ["s"]=28,
  ["t"]=29,
  ["u"]=30,
  ["v"]=31,
  ["w"]=32,
  ["x"]=33,
  ["y"]=34,
  ["z"]=35,
  ["A"]=36,
  ["B"]=37,
  ["C"]=38,
  ["D"]=39,
  ["E"]=40,
  ["F"]=41,
  ["G"]=42,
  ["H"]=43,
  ["L"]=44,
  ["J"]=45,
  ["K"]=46,
  ["I"]=47,
  ["M"]=48,
  ["N"]=49,
  ["O"]=50,
  ["P"]=51,
  ["Q"]=52,
  ["R"]=53,
  ["S"]=54,
  ["T"]=55,
  ["U"]=56,
  ["V"]=57,
  ["W"]=58,
  ["X"]=59,
  ["Y"]=60,
  ["Z"]=61,
  ["!"]=62,
  ['"']=63,
  ["#"]=64,
  ["$"]=65,
  ["%"]=66,
  ["&"]=67,
  [","]=68,
  ["("]=69,
  [")"]=70,
  ["*"]=71,
  ["'"]=72,
  ["-"]=73,
  ["."]=74,
  ["/"]=75,
  ["<"]=76,
  ["="]=77,
  [">"]=78,
  ["?"]=79,
  ["@"]=80,
  ["["]=81,
  ["\\"]=82,
  ["]"]=83,
  ["^"]=84,
  ["_"]=85
}

local insert,concat=table.insert,table.concat
local sub,len,pow=string.sub,string.len,math.pow

local function GetNumFromChar(char)
  return _convertTable[char] or 0
end

local function Convert(dec, x)

  local function fn(num, t)
    if(num < x) then
      insert(t, num)
    else
      fn(math.floor(num/x), t)--math.floor
      insert(t, num%x)
    end
  end

  local x_t = {}
  fn(dec, x_t)--, x)
  return x_t
end

function xtor(dec, x)
  local x_t = Convert(dec, x)

  --[[local text = ""
  for k, v in ipairs(x_t) do
    text = text.._convertTable[v]
  end]]
  return concat(x_t)
end

function rtox(text, x)
  local x_t ,text= {},tostring(text)
  --local len = len(text)
  local index = len(text)

  for i=0,index ,1 do

    local char=sub(text,index-i,index-i)
    x_t[i+1]=GetNumFromChar(char)

  end

  --[[ while index>0 do
    local char = sub(text, index, index)
    x_t[#x_t + 1] = GetNumFromChar(char)
    -- print(#x_t,i)
    index = index - 1
  end]]

  local num = 0
  for k, v in ipairs(x_t) do
    num = num + v * pow(x, k - 1) 
  end
  return num
end

local function rtor(text,r1,r2)
  return xtor(rtox(text,r1),r2)
end

return {
  xtor=xtor,
  rtox=rtox,
  GetNumFromChar=GetNumFromChar,
  rtor=rtor
}