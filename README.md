rsb - Replacement Search Bar
===

Simple Replacement Search Bar for UISearchBar iOS 7

Because the UISearchBar in iOS 7 screws up all my views and has yet to be fixed after months, I made this. It's not anything advanced or special. It's just a simple drop-in search bar replacement.

Here is general usage:

1. Import SearchReplacement.h in whatever class you want to use this in
	#import "SearchReplacement.h"
	
2. Make sure to enter the delegate like <SearchReplacementDelegate> in the interface

3. Put it in your code somewhere like this
	SearchReplacement *search = [[SearchReplacement alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    search.delegate = self;
    [self.view addSubview:search];
    
4. The background view and the text field in the search bar can be accessed by their properties e.g.
	search.backgroundView
	search.searchField
	
5. The background of the search bar can have it's color changed with this property
	search.backgroundColor
	
6. The delegate methods for this are:

	- (void)searchReplacementSearchBarDidBeginEditing:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
	- (void)searchReplacementSearchBarDidEndEditing:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
	- (void)searchReplacementSearchButtonTapped:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
	- (void)searchReplacementSearchBarTextChanged:(SearchReplacement*)searchReplacementBar withSearchBar:(UITextField*)searchBar;
	
The delegate methods have both the search replacement bar and its UITextField for easier access.
	
7. That's pretty much it. It's not that special.
