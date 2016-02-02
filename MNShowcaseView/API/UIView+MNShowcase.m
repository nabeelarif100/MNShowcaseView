//
//  UIView+MNShowcase.m
//  MNShowcaseView
//
//  Created by Nabeel Arif on 10/13/15.
//  Copyright © 2015 Muhammad Nabeel Arif. All rights reserved.
//

#import "UIView+MNShowcase.h"
#import "MNShowcaseLongPressGestureRecognizer.h"
#import "MNShowcaseView.h"

@implementation UIView (MNShowcase)

-(void) registerForShowcaseView
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        if ([gesture isKindOfClass:[MNShowcaseLongPressGestureRecognizer class]]) {
            return;
        }
    }
    MNShowcaseLongPressGestureRecognizer *longPress = [[MNShowcaseLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(actionDisplayShowCase:)];
    [self addGestureRecognizer:longPress];
}
-(void)actionDisplayShowCase:(MNShowcaseLongPressGestureRecognizer*)sender
{
    if ([sender isKindOfClass:[MNShowcaseLongPressGestureRecognizer class]]) {
        
        if (sender.state == UIGestureRecognizerStateBegan)
        {
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Gestures" message:@"Long Gesture Detected" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alertView show];
            MNShowcaseView *showcaseView = [[MNShowcaseView alloc] init];
            [showcaseView setViewToFocus:self title:@"Test Title" description:@"Copyright © 2015 Muhammad Nabeel Arif. All rights reserved."];
            showcaseView.shouldDismissOnBackgroundClick = YES;
            showcaseView.shouldShowDefaultButton = YES;
            [showcaseView showOnMainWindow];
        }
    }
}
@end
