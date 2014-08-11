# Angular Smooth Scroll

Smooth scroll to frag IDs on a page. Vanilla JS and jQuery directives available. Visit https://github.com/durated/angular-scroll for a fully featured Angular scroll directive.

Original work here: https://github.com/arnaudbreton/angular-smoothscroll

[DEMO](http://fixate.github.io/angular-smooth-scroll/demo/)

## Installation
Bower:

```
bower install https://github.com/fixate/angular-smooth-scroll.git#master
```

## Usage

```javascript
angular.module('myApp', ['smoothScroll']);
```

### Without jQuery

```html
<a href="#my-id" smooth-scroll>scroll to #my-id</a>

<a href="#my-id" smooth-scroll="#my-other-id">scroll to #my-other-id</a>

<a href="#my-id" smooth-scroll offset="100">scroll with offset</a>
```

### Without jQuery

```html
<a href="#my-id" smooth-scroll>scroll to #my-id</a>

<a href="#my-id" smooth-scroll="#my-other-id">scroll to #my-other-id</a>

<a href="#my-id" smooth-scroll speed="2000">scroll for 2000ms</a>

<a href="#my-id" smooth-scroll offset="100">scroll with offset</a>
```


## License

MIT: http://fixate.mit-license.org/
