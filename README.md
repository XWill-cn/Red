# 本地化（适配）
### 1.配置
添加支持的语言和区域(目的:1.让某些系统控件或权限弹框自动本地化,2.本地化操作的第一步)
Project--Info--Localizations--Add(如添加简体中文)--Finish

### 2.文本的本地化
#### 2-1.storyboard中的文本
紧接上一步,sb文件下方多了一个.strings文件（项目实际文件系统中表现为xx.lproj文件,大家可右击show in finder看一下）,里面是当前sb里所有控件的文本,可改成相应的本地化语言

关于修改:
1.若一开始sb文件中不是base语言(如:英文)(和我们这个项目一样),或者之后sb中追加很多文本的话,可在sb右边面板localize处取消勾以删掉.strings文件(从disk删除),然后再点上勾重新生成.strings文件
2.也可逐个手动添加:sb上选中UI控件--identity inspector--Object ID，去本地化文件写上对应的本地化字串
3:素材中推荐的bartycrouch命令行工具

关于测试:
按住option键单击'运行'按钮,在出来的edit scheme窗口的options中选语言，并运行

#### 2-2代码中的文本
1.手动一个一个添加--代码中用NSLocalizedString("xx","xxxx"),创建Localizable.strings文件(名字不能错),和之前的.strings文件一样,在里面指定key-value(如:"xx" = "某某";)
2.一次性提取出全部NSLocalizedString--终端cd到项目target文件夹下,输入'genstrings -o zh-Hans.lproj Home/*.swift',表明把Home文件夹下所有的swift文件中的NSLocalizedString都提取出来,并在真实文件夹中生成Localizable.strings文件并写入.之后需把此文件拖进xcode(若之前没有创建过Localizable.strings文件,创建过的话则覆盖里面内容)

注意事项:
1.若没在Localizable.strings文件里找到相应的key对应的value的话,则使显示NSLocalizedString里面的key,故可不配置英文strings文件
2.多人合作时，各自分工取不同名字的.strings文件，代码中需用NSLocalizedString的tableName构造器，tableName为各自的strings文件名

### 3.App Display Name的本地化
新建InfoPlist.strings文件(必须这个名字)，右边面板Localize，填入各自的CFBundleDisplayName的value

### 4.图片的本地化
1.Assets右边面板右下角选择Localize，和适配深色模式一样进行配置
2.或本地化UIImage里面的文本

