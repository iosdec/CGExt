//
//  CGExt.m
//  Kho
//
//  Created by iOSDec on 08/02/2018.
//  Copyright © 2018 iosdec. All rights reserved.
//

#import "CGExt.h"

@implementation UIView (CGExt)

- (void)sameRectWithNewX:(CGFloat)x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
- (void)sameRectWithNewX:(CGFloat)x y:(CGFloat)y {
    self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}
- (void)sameRectWithNewY:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}
- (void)sameRectWithNewWidth:(CGFloat)width {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}
- (void)sameRectWithNewHeight:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}
- (void)sameRectWithNewHeight:(CGFloat)height y:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, height);
}
- (void)sameRectWithView:(UIView *)view {
    self.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
}
- (void)sameRectWithNewWidth:(CGFloat)width height:(CGFloat)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
}

- (void)sameRectWithNewWidth:(CGFloat)width height:(CGFloat)height y:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, width, height);
}

@end

//
//
//

@implementation CGeometry : NSObject

+ (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font {
    CGFloat result = font.pointSize + 4;
    if (text) {
        CGSize textSize = { widthValue, CGFLOAT_MAX };
        CGSize size;
        CGRect frame = [text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height+1);
        result = MAX(size.height, result); //At least one row
    } return result;
}

+ (CGFloat)recalculatedViewHeight:(UIView *)view label:(UILabel *)label minHeight:(CGFloat)min {
    CGFloat original_height     =   view.frame.size.height;
    CGFloat height              =   [self findHeightForText:label.text havingWidth:label.frame.size.width - (16 * 2) andFont:label.font];
    CGFloat original_box_height =   label.frame.size.height;
    if (height < min) { height = min; }
    return (original_height - original_box_height) + height;
}

+ (CGFloat)recalculatedViewHeight:(UIView *)view textView:(UITextView *)label minHeight:(CGFloat)min {
    CGFloat original_height     =   view.frame.size.height;
    CGFloat height              =   [self findHeightForText:label.text havingWidth:label.frame.size.width - (16 * 2) andFont:label.font];
    CGFloat original_box_height =   label.frame.size.height;
    if (height < min) { height = min; }
    return (original_height - original_box_height) + height;
}

@end
