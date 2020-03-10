#! /bin/bash
content=`pbpaste` #读粘贴板
content=`echo ${content//A/ a}`
content=`echo ${content//B/ b}`
content=`echo ${content//C/ c}`
content=`echo ${content//D/ d}`
content=`echo ${content//E/ e}`
content=`echo ${content//F/ f}`
content=`echo ${content//G/ g}`
content=`echo ${content//H/ h}`
content=`echo ${content//I/ i}`
content=`echo ${content//J/ j}`
content=`echo ${content//K/ k}`
content=`echo ${content//L/ l}`
content=`echo ${content//M/ m}`
content=`echo ${content//N/ n}`
content=`echo ${content//O/ o}`
content=`echo ${content//P/ p}`
content=`echo ${content//Q/ q}`
content=`echo ${content//R/ r}`
content=`echo ${content//S/ s}`
content=`echo ${content//T/ t}`
content=`echo ${content//U/ u}`
content=`echo ${content//V/ v}`
content=`echo ${content//W/ w}`
content=`echo ${content//X/ x}`
content=`echo ${content//Y/ y}`
content=`echo ${content//Z/ z}`
content=`echo ${content// /%20}`
echo $content #驼峰处理完成 ex: setOnClickListener -> set%20on%20click%20listener

result=`curl -d "doctype=json&type=AUTO&i="$content fanyi.youdao.com/translate` #有道翻译api
#result: {"type":"EN2ZH_CN","errorCode":0,"elapsedTime":2,"translateResult":[[{"src":"content","tgt":"内容"}]]}
echo "请求完成"
result=`echo ${result#*\"tgt\"}` #截取\"tgt\"之后字符
result=`echo ${result#*\"}` #截取第一个双引号之后
result=`echo ${result%\"*}` #截取第一个双引号之前
echo -n $result|pbcopy
echo "翻译结果是：\""$result"\" (已复制到粘贴板)"
