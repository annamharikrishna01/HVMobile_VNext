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

#import "HVLib.h"
#import "HVViewController.h"
#import "HVTypeListViewController.h"

@implementation HVViewController

-(void)viewDidLoad
{
    self.navigationItem.title = nil;
    [super viewDidLoad];
    
    [self startApp];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!m_starting && ![HVClient current].isProvisioned)
    {
        [self startApp];
    }
}

-(void)startApp
{
    m_starting = TRUE;
    //
    // Startup the HealthVault Client
    // This will automatically ensure that application instance is correctly provisioned to access the user's HealthVault record
    // Look at ClientSettings.xml
    //
    [[HVClient current] startWithParentController:self andStartedCallback:^(id sender)
     {
         m_starting = FALSE;
         if ([HVClient current].provisionStatus == HVAppProvisionSuccess)
         {
             [self startupSuccess];
         }
         else
         {
             [self startupFailed];
         }
     }];
}

-(void)startupSuccess
{
    [self showTypeList];
}

-(void)startupFailed
{
    [HVUIAlert showWithMessage:@"Provisioning not completed. Retry?" callback:^(id sender) {
        
        HVUIAlert *alert = (HVUIAlert *) sender;
        if (alert.result == HVUIAlertOK)
        {
            [self startApp];
        }
    }];
}

-(void)showTypeList
{
    //
    // Navigate to the type list
    //
    HVTypeListViewController* typeListController = [[[HVTypeListViewController alloc] init] autorelease];
    [self.navigationController pushViewController:typeListController animated:TRUE];
}

@end
