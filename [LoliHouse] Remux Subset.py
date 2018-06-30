import os
import sys
import time

afs = sys.argv[1]
mkvmerge = sys.argv[2]
file = sys.argv[3]
print(file)

#Find Subtitles
sub_dict = {}
sc_list = ["sc","chs","gb","gbk"]
tc_list = ["tc","cht","big5"]
jpn_list = ["jap","jp","jpn"]
for filename in os.listdir(os.getcwd()):
    filename_split = filename.split('.')
    if len(filename_split) != 3:
        continue
    #print(filename_split)
    if filename_split[0] == file and filename_split[2] == "ass":
        lang = filename_split[1].lower()
        if lang in sc_list:
            sub_dict["sc"] = filename
        if lang in tc_list:
            sub_dict["tc"] = filename
        if lang in jpn_list:
            sub_dict["jpn"] = filename
print("Subtitles Found \n%s" % sub_dict)

#Using AFS
AFS_command = "%s " % afs
for lang, filename in sub_dict.items():
    if len(filename)>2:
        AFS_command += "\"" + os.getcwd() + "\\" + "%s\" " % filename
print("Start to run AutoFontSubset by youlun\n")
os.system(AFS_command)

#Create Mkvmerge command of subs
sub_command = ""
lang_dict = {"sc":"简体", "tc":"繁体", "jpn":"日语"}
sub_default_cmd = " --default-track 0:yes"
for lang in lang_dict:
    if lang in sub_dict:
        if lang == "jpn":
            sub_command  += "--language 0:jpn%s --track-name \"0:%s\" \"output/%s\" " %(sub_default_cmd,lang_dict[lang],sub_dict[lang])
        else:
            sub_command  += "--language 0:chi%s --track-name \"0:%s\" \"output/%s\" " %(sub_default_cmd,lang_dict[lang],sub_dict[lang])
        sub_default_cmd = ""

#Find Fonts and create command
font_command = ""
for fontfile in os.listdir(".\\output"):
    if (os.path.splitext(fontfile)[1].lower() == ".otf") or (os.path.splitext(fontfile)[1].lower() == ".ttf"):
        font_command += " --attach-file \"output\\%s\"" % fontfile

if not os.path.exists("output_mkv"):
    os.mkdir("output_mkv")

inti_command = "%s " % mkvmerge
inti_command += "--output \"output_mkv\\%s.mkv\" --no-subtitles --no-attachments " % file
inti_command += "--language 0:und --default-track 0:yes --language 1:jpn --default-track 1:yes \"%s.mkv\" " % file



#Combine Command
command = inti_command + sub_command + font_command
time.sleep(1) #我想睡一会儿QAQ
os.system(command)
print(command)