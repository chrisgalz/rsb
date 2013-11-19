//
//  SearchReplacement.m
//  Playr
//
//  Created by Chris Galzerano on 11/18/13.
//  Copyright (c) 2013 Chris Galzerano. All rights reserved.
//

#import "SearchReplacement.h"

@implementation SearchReplacement

@synthesize searchField = _searchField, backgroundColor = _backgroundColor, backgroundView = _backgroundView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self SetDefaults];
        
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _backgroundView.backgroundColor = _backgroundColor;
        [self addSubview:_backgroundView];
        
        UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, _backgroundView.frame.size.height, _backgroundView.frame.size.width, 1)];
        border.layer.borderWidth = 1;
        border.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.9].CGColor;
        [_backgroundView addSubview:border];
        
        _searchField = [[UITextField alloc] initWithFrame:CGRectMake(15, 7, frame.size.width-30, frame.size.height-14)];
        
        paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12.5, _searchField.frame.size.height)];
        
        _searchField.borderStyle = UITextBorderStyleNone;
        _searchField.placeholder = @"Search";
        _searchField.textAlignment = NSTextAlignmentCenter;
        _searchField.keyboardType = UIKeyboardTypeWebSearch;
        _searchField.layer.borderColor = [UIColor grayColor].CGColor;
        _searchField.layer.borderWidth = 1;
        _searchField.layer.cornerRadius = 15;
        _searchField.layer.backgroundColor = [UIColor whiteColor].CGColor;
        _searchField.clipsToBounds = YES;
        _searchField.delegate = self;
        _searchField.font = [UIFont systemFontOfSize:15];
        _searchField.clearButtonMode = UITextFieldViewModeAlways;
        
        _searchField.leftView = paddingView;
        _searchField.leftViewMode = UITextFieldViewModeAlways;
        _searchField.rightView = paddingView;
        _searchField.rightViewMode = UITextFieldViewModeUnlessEditing;
        
        [self addSubview:_searchField];
    }
    return self;
}

- (void) SetDefaults {
    _backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [_backgroundView setBackgroundColor:backgroundColor];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.textAlignment = NSTextAlignmentLeft;
    if ([_delegate respondsToSelector:@selector(searchReplacementSearchBarDidBeginEditing:withSearchBar:)])
        [_delegate searchReplacementSearchBarDidBeginEditing:self withSearchBar:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.length <= 0)
        textField.textAlignment = NSTextAlignmentCenter;
    if ([_delegate respondsToSelector:@selector(searchReplacementSearchBarDidEndEditing:withSearchBar:)])
        [_delegate searchReplacementSearchBarDidEndEditing:self withSearchBar:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if ([_delegate respondsToSelector:@selector(searchReplacementSearchButtonTapped:withSearchBar:)])
        [_delegate searchReplacementSearchButtonTapped:self withSearchBar:textField];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([_delegate respondsToSelector:@selector(searchReplacementSearchBarTextChanged:withSearchBar:)])
        [_delegate searchReplacementSearchBarTextChanged:self withSearchBar:textField];
    return YES;
}



@end
