#import <Foundation/Foundation.h>
#import "VTColorUtils.h"
#import "VTRGBColor.h"

@interface VTXYZColor : NSObject

@property (nonatomic, readonly) double X;
@property (nonatomic, readonly) double Y;
@property (nonatomic, readonly) double Z;
@property (nonatomic, readonly) VTColorUtilsWhitePointRef whitePointRef;
@property (nonatomic, readonly) VTColorUtilsObserver stdObserver;

+ (instancetype) XYZColorWithX: (double) x Y: (double) y Z: (double)z usingRef: (VTColorUtilsWhitePointRef) whitePointRef;
+ (instancetype) XYZColorWithX: (double) x Y: (double) y Z: (double)z usingRef: (VTColorUtilsWhitePointRef) whitePointRef usingObserver:(VTColorUtilsObserver)observer;
- (VTRGBColor *) RGBColorInSpace: (VTColorUtilsRGBSpace) colorSpace;
@end
