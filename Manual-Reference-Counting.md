# Manual Reference Counting

Answer the following questions inline with this document.

1. Are there memory leaks with this code? (If so, where are the leaks?)

	```swift
	NSString *quote = @"Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle. As with all matters of the heart, you'll know when you find it. - Steve Jobs";

    NSCharacterSet *punctuationSet = [[[NSCharacterSet punctuationCharacterSet] retain] autorelease];

	NSString *cleanQuote = [[quote componentsSeparatedByCharactersInSet:punctuationSet] componentsJoinedByString:@""];
	
	NSArray *words = [[cleanQuote lowercaseString] componentsSeparatedByString:@" "];

	NSMutableDictionary<NSString *, NSNumber *> *wordFrequency = [[[NSMutableDictionary alloc] init] autorelease];

	for (NSString *word in words) {
		NSNumber *count = wordFrequency[word];
		if count != nil {
			wordFrequency[word] = [NSNumber numberWithInteger:count.integerValue + 1];
		} else {
			wordFrequency[word] = [[NSNumber alloc] initWithInteger:1];
		}
	}

	printf("Word frequency: %s", wordFrequency.description.UTF8String);
	```

	2. Rewrite the code so that it does not leak any memory with ARC disabled

2. Which of these objects is autoreleased?  Why?

	1. `NSDate *yesterday = [NSDate date];`
	Yes, because date is not allocated. 
	
	2. `NSDate *theFuture = [[NSDate dateWithTimeIntervalSinceNow:60] retain];`
	No, because the object is retain and it increments the receiver’s reference count.
	Retain prevents the object from being deallocated until I have finished using it.
	
	3. `NSString *name = [[NSString alloc] initWithString:@"John Sundell"];`
	No, because name is allocated in memory. The reference count is +1. 
	
	4. `NSDate *food = [NSDate new];`
	Yes, because food is not being initialize.
	
	5. `LSIPerson *john = [[LSIPerson alloc] initWithName:name];`
	No, because john is not allocated.
	
	6. `LSIPerson *max = [[[LSIPerson alloc] initWithName:@"Max"] autorelease];`
	Yes, because autorelease decrements the receiver’s retain count

3. Explain when you need to use the `NSAutoreleasePool`.
When I'm not using Automatic Reference Counting. 


4. Implement a convenience `class` method to create a `LSIPerson` object that takes a `name` property and returns an autoreleased object.

```swift
@interface LSIPerson: NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
```

```swift
#import "LSIPerson.h"

@implementation LSIPerson

@end
```


