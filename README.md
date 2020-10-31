# nested-classes-multiplatform

A demo project that reproduces an issue where nested classes in Kotlin Multiplatform library cannot be used in Swift when accessed through another Kotlin Multiplatform library.

## Project Overview
- `common`: Shared library (could be used for both a backend and mobile apps)
- `mobile`: Mobile library (could be used for shared view models/netowrking/etc). Uses `common`.
- An iOS app, located in `apple/FooBar`. Uses `FooBarShared`, which is generated from `mobile`.

## Setup

1. Clone repo
2. Run `./gradlew :mobile:packForXcode` to initialize the framework
3. Open `apple/FooBar.xcodeproj` and build the project

## Important files
- `apple/FooBar/AppDelegate.swift`: example of a nested classes that cannot be used in Swift
- `common/src/commonMain/kotlin/foo/bar/test/common/Fizz.kt`: Kotlin classes in the `common` library
- `mobile/src/commonMain/kotlin/foo/bar/test/mobile/Api.kt`: Kotlin class that uses `common` classes and its own example classes
- `mobile/build.gradle.kts`: Grandle setup for `mobile` project

## Notes
The following is taken from the header and cannot be used/accessed in Swift in any way:

```objective-c
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CommonFizz.Hello")))
@interface FooSharedCommonFizzHello : FooSharedBase
- (instancetype)initWithMyName:(NSString *)myName __attribute__((swift_name("init(myName:)"))) __attribute__((objc_designated_initializer));
- (NSString *)component1 __attribute__((swift_name("component1()")));
- (FooSharedCommonFizzHello *)doCopyMyName:(NSString *)myName __attribute__((swift_name("doCopy(myName:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString *myName __attribute__((swift_name("myName")));
@end;
```

In the generated header, a `Imported declaration 'FooSharedCommonFizzHello' could not be mapped to 'CommonFizz.Hello'` warning is generated on the `swift_name` attribute.

The following is the interface for the `Api` class that uses this type:
```objective-c
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Api")))
@interface FooSharedApi : FooSharedBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (void)argFromOtherModuleHey:(FooSharedCommonHey *)hey __attribute__((swift_name("argFromOtherModule(hey:)")));
- (void)nestedArgFromOtherModuleHello:(FooSharedCommonFizzHello *)hello __attribute__((swift_name("nestedArgFromOtherModule(hello:)")));
- (void)nestedArgFromThisModuleNest:(FooSharedNestNested *)nest __attribute__((swift_name("nestedArgFromThisModule(nest:)")));
- (void)noArgFunction __attribute__((swift_name("noArgFunction()")));
@end;
```
`nestedArgFromOtherModuleHello` is not visible in Swift, while the other functions work as expeted.
