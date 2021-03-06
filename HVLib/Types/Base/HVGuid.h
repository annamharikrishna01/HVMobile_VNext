//
//  HVGuid.h
//  HVLib
//
//  Copyright (c) 2012 Microsoft Corporation. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import "HVType.h"

@interface HVGuid : HVType
{
@private
    CFUUIDRef m_guid;
}

@property (readwrite, nonatomic) CFUUIDRef value;
@property (readonly, nonatomic) BOOL hasValue;

-(id) initWithNewGuid;
-(id) initWithGuid:(CFUUIDRef) guid;
-(id) initFromString:(NSString *) string;

@end

CFUUIDRef newGuidCreate(void);
NSString* guidString(void);
CFUUIDRef parseGuid(NSString *string);
NSString* guidToString(CFUUIDRef guid);