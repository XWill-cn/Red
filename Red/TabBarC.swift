//
//  TabBarC.swift
//  Red
//
//  Created by 徐维 on 2021/2/20.
//用作图片处理

import UIKit
import YPImagePicker
import AVKit
class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
  
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is  PostVC{
            
            
            
            //待做 登陆
            
            
            var config = YPImagePickerConfiguration()
            // MARK: 通用设置
            config.isScrollToChangeModesEnabled = false //避免误滑
            config.onlySquareImagesFromCamera = false //照片大小不一，长方形正方形
            config.usesFrontCamera = false//前置后置摄像头
            config.showsPhotoFilters = true//滤镜
            config.showsVideoTrimmer = true//剪辑视频功能
            config.shouldSaveNewPicturesToAlbum = true//自动保存
            config.albumName = "小红书fake"//如果有必要 借助bundle 来判定 用户语言来设置不同的相册文件夹名 bundle displayname
           
        
            
            config.startOnScreen = YPPickerScreen.library//默认打开相册
            config.screens = [.library, .photo, .video]
            config.showsCrop = .none//裁剪
            config.targetImageSize = YPImageSize.original
           // config.overlayView = UIView()
            config.hidesStatusBar = false
            config.hidesCancelButton = false
            config.preferredStatusBarStyle = UIStatusBarStyle.default
            config.maxCameraZoomFactor = 5
         
            // MARK: 相册设置
            config.library.preSelectItemOnMultipleSelection = true//预选
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoNum
            config.library.spacingBetweenItems = 2.0
            config.library.preselectedItems = nil

            config.gallery.hidesRemoveButton = false//删除按钮
            
            
            // MARK: 视频配置
            config.video.compression = AVAssetExportPresetHighestQuality
            config.video.fileType = .mov
            config.video.recordingTimeLimit = 60.0//拍摄时长
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 3.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 3.0
            
            let picker = YPImagePicker(configuration: config)
       
            picker.didFinishPicking { [unowned picker] items, _ in
            
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
                    print(photo.originalImage) // original image selected by the user, unfiltered
          
                }//闭包的参数
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            return false
    }
        
            return true
        
    }//为真 常规展示，子视图；为假 自定义展示
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }
}
