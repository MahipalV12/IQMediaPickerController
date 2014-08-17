//
//  IQImagePickerController.m
//  ImagePickerController
//
//  Created by Canopus 4 on 06/08/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "IQMediaPickerController.h"
#import "IQMediaCaptureController.h"
#import "IQAssetsPickerController.h"
#import "IQAudioPickerController.h"

@interface IQMediaPickerController ()

@end

@implementation IQMediaPickerController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setMediaType:IQMediaPickerControllerMediaTypePhoto];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)setMediaType:(IQMediaPickerControllerMediaType)mediaType
{
    _mediaType = mediaType;
    
    switch (mediaType)
    {
        case IQMediaPickerControllerMediaTypeVideo:
        {
            IQMediaCaptureController *controller = [[IQMediaCaptureController alloc] init];
            controller.captureMode = IQMediaCaptureControllerCaptureModeVideo;
            self.viewControllers = @[controller];
        }
            break;
        case IQMediaPickerControllerMediaTypePhoto:
        {
            IQMediaCaptureController *controller = [[IQMediaCaptureController alloc] init];
            controller.captureMode = IQMediaCaptureControllerCaptureModePhoto;
            self.viewControllers = @[controller];
        }
            break;
        case IQMediaPickerControllerMediaTypeAudio:
        {
            IQMediaCaptureController *controller = [[IQMediaCaptureController alloc] init];
            controller.captureMode = IQMediaCaptureControllerCaptureModeAudio;
            self.viewControllers = @[controller];
        }
            break;
        case IQMediaPickerControllerMediaTypePhotoLibrary:
        {
            IQAssetsPickerController *controller = [[IQAssetsPickerController alloc] init];
            controller.pickerType = IQAssetsPickerControllerAssetTypePhoto;
            self.viewControllers = @[controller];
        }
            break;
        case IQMediaPickerControllerMediaTypeVideoLibrary:
        {
            IQAssetsPickerController *controller = [[IQAssetsPickerController alloc] init];
            controller.pickerType = IQAssetsPickerControllerAssetTypeVideo;
            self.viewControllers = @[controller];
        }
            break;
        case IQMediaPickerControllerMediaTypeAudioLibrary:
        {
            IQAudioPickerController *controller = [[IQAudioPickerController alloc] init];
            controller.allowsPickingMultipleItems = YES;
            self.viewControllers = @[controller];
        }
            break;
        default:
            break;
    }
}

@end

