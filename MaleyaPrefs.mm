/*
 * MaleyaPrefs.mm
 * MaleyaPrefs
 *
 * Created by cgm616
 * Copyright (c) 2015 cgm616. All rights reserved.
 */

#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface MaleyaPrefsListController: PSListController {
}
@end

@implementation MaleyaPrefsListController

-(id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"MaleyaPrefs" target:self] retain];

		UIBarButtonItem *shareButton ([[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(composeTweet:)]);
		shareButton.tag = 1;
		[[self navigationItem] setRightBarButtonItem:shareButton];
		[shareButton release];
	}
	return _specifiers;
}

-(void)composeTweet:(id)sender {
	SLComposeViewController * composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
	[composeController setInitialText:@"I love Maleya, an awesome theme by @Axinen. Check it out! https://www.dropbox.com/s/j3g5dckd72v83ki/Header.png?dl=0"];
	[self.parentController presentViewController:composeController animated:YES completion:nil];
}

-(void)changesButton {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.macciti.com/pages/maleya/changelog.php"]];
}

-(void)twitterButton {
  NSString *user = @"Axinen";
  if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];

  else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];

  else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];

  else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];

  else
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
}

-(void)twitterButton2 {
  NSString *user = @"cgm616";
  if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];

  else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];

  else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];

  else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];

  else
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
}

@end

@interface MaleyaTitleCell : PSTableCell <PreferencesTableCustomView> {
    UILabel *tweakTitle;
    UILabel *tweakSubtitle;
}

@end

@implementation MaleyaTitleCell

-(id)initWithSpecifier:(PSSpecifier *)specifier {
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];

  if(self) {
		CGSize size = [[UIScreen mainScreen] bounds].size;

		UIImage *img = [[UIImage alloc]initWithContentsOfFile:@"/Library/PreferenceBundles/MaleyaPrefs.bundle/header_big.png"];

		UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [img drawInRect:CGRectMake(0, 0, size.width, (size.width * 1080) / 1920)];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

		UIImageView *imgView = [[UIImageView alloc] initWithImage:newImg];
		[self addSubview:imgView];
  }

  return self;
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width {
	CGSize size = [[UIScreen mainScreen] bounds].size;
	return (size.width * 1080) / 1920;
}

@end

// vim:ft=objc
