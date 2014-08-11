# Angular Smooth Scroll

Smooth scroll to frag IDs on a page.

Vanilla JS and jQuery directives.

## Installation
Bower:

```
bower install angular-smooth-scroll
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

## Build
npm install
grunt build


## License

MIT: http://fixate.mit-license.org/
