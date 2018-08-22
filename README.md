Code Challenge

Overview:

The goal is to present images in a collection view and then when the user tap on a cell show an extended view of that particular image.

Requirements

```
-  It is required to use a soft in/out  scale transition from the collection view to the fullscreen view
- when tapping on the fullscreen view it should dismiss
- also when using the pinch gesture the fullscreen view shall be manipulated with it
- if the size is smaller than a given contain the fullscreen view should dismiss
```

Solutions

Basic Approach

Assuming that there is no other intention than just presenting the extend view of the image an architecture with a main view controller and a child subview should be enough. 

Advanced Approach

A more sophisticated solution would involve creating a secondary fullscreen view controller and driving the transition with a UIPercentDriven animation controlled by the pinch gesture




