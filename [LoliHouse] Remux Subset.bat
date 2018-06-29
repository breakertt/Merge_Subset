@ECHO OFF & CD/D "%~dp0"
 
md audio
md video

::usage: drag .vpy to .bat

::setexe
::set demuxer
set eac3to="D:\Encode\Tools\eac3to\eac3to.exe"
set mkvextract="D:\Encode\Tools\MKVToolNix\mkvextract.exe"
set ffmsindex="D:\Encode\Tools\ffms\ffmsindex.exe"
::set muxer
set mkvmerge="D:\Encode\Tools\MKVToolNix\mkvmerge.exe"
set mp4box="D:\Encode\Tools\mp4box\mp4box.exe"
set ffmpeg64="D:\Encode\Tools\ffmpeg\ffmpeg64.exe"
set ffmpeg="D:\Encode\Tools\ffmpeg\ffmpeg.exe"
set lsmashmuxer="D:\Encode\Tools\lsmash\muxer.exe"
set lsmashremuxer="D:\Encode\Tools\lsmash\remuxer.exe"
::set pipe
set vspipe="D:\Encode\Tools\VapourSynth64\vspipe.exe"
set avs2pipemod="D:\Encode\Tools\avs2pipemod\avs2pipemod.exe"
set avs2pipe26mod="D:\Encode\Tools\avs2pipemod\avs2pipe26mod.exe"
set avs4x26x="D:\Encode\Tools\avs4x26x.exe"
set avs4x26x64="D:\Encode\Tools\avs4x26x_64.exe"
::set encoder
set x264-8bit="D:\Encode\Tools\encoder\x264-8bit.exe"
set x264-10bit="D:\Encode\Tools\encoder\x264-10bit.exe"
set x264-8bit_tmod="D:\Encode\Tools\encoder\x1264-8bit_tmod.exe"
set x264-10bit_tmod="D:\Encode\Tools\encoder\x264-10bit_tmod.exe"
set x265-8bit="D:\Encode\Tools\encoder\x265-8bit.exe"
set x265-8bit_asuna="D:\Encode\Tools\encoder\x265-8bit_asuna.exe"
set x265-10bit="D:\Encode\Tools\encoder\x265-10bit.exe"
set x265-10bit_asuna="D:\Encode\Tools\encoder\x265-10bit_asuna.exe"
set x265-12bit="D:\Encode\Tools\encoder\x265-12bit.exe"
set NVEncC="D:\Encode\Tools\NVEncC\NVEncC.exe"
set NVEncC32="D:\Encode\Tools\NVEncC\x86\NVEncC.exe"
set qaac64="D:\Encode\Tools\qaac\qaac64.exe"
set qaac="D:\Encode\Tools\qaac\qaac.exe"
set flac="D:\Encode\Tools\flac\flac.exe"
set afs="D:\Encode\Tools\AssFontSubset\AssFontSubset.exe"
set Quality=100

:start
IF "%~1"=="" GOTO :END 

:extract
::%mkvextract% tracks "%~n1.mkv" 1:"%~n1.aac"

:subfont
::%afs% "%CD%\%~n1.tc.ass" "%CD%\%~n1.sc.ass"

:mux
python "[LoliHouse] Remux Subset.py" %afs% %mkvmerge% "%~n1"
:others

:扫尾
SHIFT /1
GOTO :start

:End
echo 任务已完成
echo 
pause
