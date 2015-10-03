#import <Preferences/Preferences.h>

@interface MaleyaPrefsListController: PSListController {
}
@end

@implementation MaleyaPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"MaleyaPrefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
