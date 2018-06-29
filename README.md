# Lolihouse_Merge_Subset
识别字幕种类并用[AssFontSubset](https://github.com/youlun/AssFontSubset)生成字体子集并进行封装

## 依赖
1. [AssFontSubset](https://github.com/youlun/AssFontSubset)
2. [MKVToolNix](https://mkvtoolnix.download/doc/mkvmerge.html)
环境变量请在.bat中修改 

感谢中津静流提供.bat思路

## 文件结构
<pre>
------------------
|-[LoliHouse] Remux Subset.py
|-[LoliHouse] Remux Subset.bat
|-encoded.mkv
|--output
|---encoded.mkv__(After)__
|---encoded.sc.ass__(Optional)__
|---encoded.tc.ass__(Optional)__
|---encoded.jpn.ass__(Optional)__
|--fonts
|--output
</pre>

## 使用方法
1. 按照上述文件结构准备好文件
2. 将encoded.mkv拖到[LoliHouse] Remux Subset.bat上
3. 程序会自动生成带有精简字体集以及字幕的mkv文件
