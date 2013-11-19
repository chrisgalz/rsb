//
//  SearchReplacement.h
//  Playr
//
//  Created by Chris Galzerano on 11/18/13.
//  Copyright (c) 2013 Chris Galzerano. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchReplacement;

@protocol SearchReplacementDelegate<NSObject>
@optional
- (void)searchReplacementSearchBarDidBeginEditing:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
- (void)searchReplacementSearchBarDidEndEditing:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
- (void)searchReplacementSearchButtonTapped:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
- (void)searchReplacementSearchBarTextChanged:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
@end

@interface SearchReplacement : UIView <UITextFieldDelegate> {
    UIView *paddingView;
}

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UITextField *searchField;
@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign) id<SearchReplacementDelegate> delegate;

@end
