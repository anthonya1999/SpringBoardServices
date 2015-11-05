//
//  ViewController.m
//  SBTest
//
//  Created by Anthony Agatiello on 11/3/15.
//  Copyright © 2015 Anthony Agatiello. All rights reserved.
//

#import "ViewController.h"
#include <dlfcn.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)suspendApp {
    void *SpringBoardServices = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", RTLD_LAZY);
    NSParameterAssert(SpringBoardServices);
    mach_port_t (*SBSSpringBoardServerPort)() = dlsym(SpringBoardServices, "SBSSpringBoardServerPort");
    NSParameterAssert(SBSSpringBoardServerPort);
    SpringBoardServicesReturn (*SBSuspend)(mach_port_t port) = dlsym(SpringBoardServices, "SBSuspend");
    NSParameterAssert(SBSuspend);
    mach_port_t sbsMachPort = SBSSpringBoardServerPort();
    SBSuspend(sbsMachPort);
    dlclose(SpringBoardServices);
}

- (IBAction)lockDevice {
    void *SpringBoardServices = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", RTLD_LAZY);
    NSParameterAssert(SpringBoardServices);
    mach_port_t (*SBSSpringBoardServerPort)() = dlsym(SpringBoardServices, "SBSSpringBoardServerPort");
    NSParameterAssert(SBSSpringBoardServerPort);
    SpringBoardServicesReturn (*SBSLockDevice)(mach_port_t port) = dlsym(SpringBoardServices, "SBSLockDevice");
    NSParameterAssert(SBSLockDevice);
    mach_port_t sbsMachPort = SBSSpringBoardServerPort();
    SBSLockDevice(sbsMachPort);
    dlclose(SpringBoardServices);
}

- (IBAction)setVolume {
    void *SpringBoardServices = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", RTLD_LAZY);
    NSParameterAssert(SpringBoardServices);
    mach_port_t (*SBSSpringBoardServerPort)() = dlsym(SpringBoardServices, "SBSSpringBoardServerPort");
    NSParameterAssert(SBSSpringBoardServerPort);
    SpringBoardServicesReturn (*SBSetMediaVolume)(mach_port_t port, float volumeLevel) = dlsym(SpringBoardServices, "SBSetMediaVolume");
    NSParameterAssert(SBSetMediaVolume);
    mach_port_t sbsMachPort = SBSSpringBoardServerPort();
    SBSetMediaVolume(sbsMachPort, 1.0);
    dlclose(SpringBoardServices);
}

@end