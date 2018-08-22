//
//  IVUtils.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#ifndef IVUtils_h
#define IVUtils_h



static inline void ASYNC_BACKGROUND(dispatch_block_t block){
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),block);
    
}

static inline void ASYNC_MAIN(dispatch_block_t block){
    dispatch_async(dispatch_get_main_queue(),block);
    
}

static inline void SYNC_MAIN(dispatch_block_t block){
    if ([NSThread isMainThread])
    {
        block();
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}


static inline void ASYNC_AFTER(float seconds, dispatch_block_t block){
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
    
}



#define BLOCK_TYPEDEF(_blockName_,_returnType_,_params_) typedef _returnType_ (^_blockName_)_params_;


#define WEAK_SELF __weak __typeof(self) wself=self;

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
