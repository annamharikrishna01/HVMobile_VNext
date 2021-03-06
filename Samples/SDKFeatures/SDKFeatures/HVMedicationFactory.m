//
//  HVMedicationFactory.m
//  SDKFeatures
//
//  Copyright (c) 2013 Microsoft Corporation. All rights reserved.
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
//

#import "HVMedicationFactory.h"

@implementation HVMedication (HVFactoryMethods)

+(HVItemCollection *)createRandomForDay:(NSDate *)date
{
    HVItem* item = [HVMedication createRandomForDate:[HVApproxDateTime fromDate:date]];

    return [[[HVItemCollection alloc] initwithItem:item] autorelease];
}

+(HVItemCollection *)createRandomMetricForDay:(NSDate *)date
{
    return [HVMedication createRandomForDay:date];
}

@end

@implementation HVMedication (HVDisplay)

-(NSString *) detailsString
{
    return [NSString stringWithFormat:@"%@ [Dose: %@]", self.name.description, self.dose ? self.dose.description : c_emptyString];
}

-(NSString *) detailsStringMetric
{
    return [self detailsString];
}

@end
