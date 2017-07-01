# ACScrollView
A subclass of `UIScrollView` which allows for fast loading and infinite scroll. 

`ACScrollView` is based on the observation that for paged scrollviews, all that is required to be loaded is the current page, and two surrounding pages.  There are only three pages loaded at a time in `ACScrollView`: 
	* *The center page*, showing the current page.
	* *The left page*, showing the previous page.
	* *The right page*, showing the next page.

When the user swipes from the center page to the left page, `ACScrollView` will reload three pages and jump the user to the center page, giving the illusion that the user is scrolling continuously. 


## Using ACScrollView
To use `ACScrollView` define the `ACScrollViewDataSource` methods:
	* `numPagesIn(scrollView: ACScrollView) -> Int` which specifies the number of pages in the scroll view.
	* `viewFor(page:Int, within scrollView:ACScrollView) -> UIView` which specifies a view to be shown in the scrollView for a specific page. 


`ACScrollView` also provides delegate methods to abstract the custom implementation:
	* `scrollViewDidScrollTo(location:CGPoint, within scrollView:ACScrollView)` which provides a current offset as if the scroll view was a normal `UIScrollView`.
	* `scrollViewDidScrollTo(page:Int, within scrollView:ACScrollView)` which provides a page number to the delegate when a new page is scrolled to. 


## To-Do:
	* Allow option for vertical scroll.
	* Allow two-dimensional scroll view which allows the user to scroll both vertically and horizontally. 
	* Allow option to disable infinite scroll.
