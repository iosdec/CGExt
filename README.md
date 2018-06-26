# CGExt

CGExt adds an extension for CGRect. Easily change the origins, widths, heights without having to add in all the frame information.

  - Easy to use
  - Saves time
  - Easily modified

#### Example usage:

Let's say we want to change the Y origin of any UIView object.. 
We could easily do that by just doing the following:

```objc
UIView *myView;
[myView sameRectWithNewY:200];
```

This saves so much time and it looks a lot better than doing:
```objc
myView.frame = CGRectMake(myView.frame.origin.x, 200, myView.frame.size.width, myView.frame.size.height);
```

# CGeometry

CGeometry hold view calculation functions for when you want to find the height a string that match up to a width and font. Also has functions for easily resizing a view based on the height of a UILabel or UITextView inside the view.

  - Easily resize views
  - Easily find the height of a UILabel / string

#### Example usage:

Let's say you have a view - which contains a UILabel.. you've just fetched some json information that contains the following string:

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec convallis libero, ac ultricies elit. Vivamus suscipit nunc et turpis varius, non sodales ex accumsan. Ut quis lacus ac leo dapibus suscipit.

We could do either 2 things after setting the label text (myLabel.text = jsonString):

 - Calculate the height of the label

```objc
CGFloat label_height = [CGeometry findHeightForText:jsonString havingWidth:myLabel.frame.size.width andFont:myLabel.font];
```

 - Calculate the height of the view
 
 ```objc
CGFloat min_height = 22;
CGFloat view_height = [CGeometry recalculatedViewHeight:myViewContainingLabel label:myLabel minHeight:min_height];
```

### Installation

Drop both the **CGExt.h** and **CGExt.m** files into your project and import them when needed like so:

```objc
#import "CGExt.h"
```

### Development

##### Declan Land
