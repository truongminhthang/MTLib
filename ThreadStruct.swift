//
//  ThreadExtension.swift
//  MP_ARWedding
//
//  Created by Trương Thắng on 2/20/16.
//  Copyright © 2016 MyPrint. All rights reserved.
//

import Foundation


struct Thread {
    func dispatchMainAsyncSafe (block: dispatch_block_t) {
        if NSThread.isMainThread() {
            block()
        } else {
            dispatch_async(dispatch_get_main_queue(), block)
        }
    }
    
    func dispatchMainSyncSafe (block: dispatch_block_t) {
        if NSThread.isMainThread() {
            block()
        } else {
            dispatch_sync(dispatch_get_main_queue(), block)
        }
    }
}