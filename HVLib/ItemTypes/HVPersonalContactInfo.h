//
//  HVPersonalContactInfo.h
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
#import "HVTypes.h"

@interface HVPersonalContactInfo : HVItemDataTyped
{
@private
    HVContact* m_contact;
}

//-------------------------
//
// Data
//
//-------------------------
@property (readwrite, nonatomic, retain) HVContact* contact;

//-------------------------
//
// Initializers
//
//-------------------------
-(id) initWithContact:(HVContact *) contact;

+(HVItem *) newItem;

//-------------------------
//
// Type Info
//
//-------------------------
+(NSString *) typeID;
+(NSString *) XRootElement;

@end
