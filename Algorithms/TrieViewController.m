//
//  TrieViewController.m
//  Algorithms
//
//  Created by Carl Wieland on 10/6/12.
//  Copyright (c) 2012 balanceoni. All rights reserved.
//

#import "TrieViewController.h"
#import "TrieView.h"
#import "Trie.h"
#import "SuggestionViewController.h"

@implementation TrieViewController
-(Trie*)trie{
    if (_trie !=nil) {
        return _trie;
    }
    _trie = [[Trie alloc] init];
    return _trie;
}

- (IBAction)addValue:(id)sender {
    [self.trie addString:[[self.valueField text] lowercaseString]];
    [self refresh];
}

-(void)refresh{
    [self.root removeFromSuperview];
    if (self.trie.root) {
        self.root = [[TrieView alloc] initWithNode:self.trie.root];
        [self.scrollView addSubview:self.root];
        //[self.scrollView setContentSize:self.root.frame.size];
        CGFloat min = MIN(self.scrollView.frame.size.height / self.root.frame.size.height
                          , self.scrollView.frame.size.width / self.root.frame.size.width);

        self.scrollView.minimumZoomScale = min;
        self.scrollView.maximumZoomScale = 2.0;
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale];
    }
}

- (IBAction)getSuggestions:(UIButton*)sender {
    if ([self.codePickerPopover isPopoverVisible]) {
        [self.codePickerPopover dismissPopoverAnimated:YES];
        
    }
    else{
        NSArray* array = [self.trie suggestionsForString:[self.suggestionField text]];
        SuggestionViewController* sugg = [self.storyboard instantiateViewControllerWithIdentifier:@"suggestionView"];
        [sugg setData:array];
        self.codePickerPopover = [[UIPopoverController alloc]
                                  initWithContentViewController:sugg];
        
        [self.codePickerPopover presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }

}
-(void)loadWords{
    self.words = [NSMutableArray new];
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* fullPath = [[bundle bundlePath] stringByAppendingPathComponent:@"words.txt"];
    
    NSError* error;
    NSString* words = [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:&error];
    [self.words addObjectsFromArray:[words componentsSeparatedByString:@"\n"]];
}
- (IBAction)buildTree:(id)sender {
    if (self.words == nil) {
        [self loadWords];
    }
    int index = arc4random()%([self.words count]-1);
    [self.valueField setText:[self.words objectAtIndex:index]];
    [self.words removeObjectAtIndex:index];
    [self addValue:nil];
    [self.valueField setText:@""];


    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.root;
}
- (void)viewDidUnload {
    [self setSuggestionField:nil];
    [super viewDidUnload];
}
@end
