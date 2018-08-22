//
//  IVUtils.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#ifndef IVUtils_h
#define IVUtils_h

#define SINGLETON_FOR_CLASS(getter,classname)\
+ (id) getter {\
static dispatch_once_t pred = 0;\
static id _sharedObject = nil;\
dispatch_once(&pred, ^{\
_sharedObject = [classname new];\
});\
return _sharedObject;\
}


#endif /* IVUtils_h */
