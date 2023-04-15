<h1 align="center">SVG to icon 🖍 </h1>

<h3 align="center">Stop using unnecessarily large libraries for just a few icons.</h3>

# Why?

Using a large library for just a few icons will increase the overall file size of our website, which in turn can slow down the page load time. This can have a negative impact on user experience, especially for users with slower internet connections or older devices. By using only the necessary icons and optimizing their delivery, we can make our website faster and more accessible to a wider audience.

## Description

This repository contains a simple [SCSS file](https://github.com/davidkolisek/svg-to-icon/blob/master/svg-to-icon.scss) for converting SVG images into icons. The file includes SASS functions and mixins that convert the provided SVGs into base64 format. Additionally, you can manipulate the converted icon by using css.

## Setup

### > Requirements
- [Sass](https://sass-lang.com/)

### > Installation

No need to run any npm installation. Just copy the [SCSS file](https://github.com/davidkolisek/svg-to-icon/blob/master/svg-to-icon.scss) and paste it into your project. It is up to you to decide how to organize the functions and mixins. 

## Usage

### > How it works ? 

The best way is to define your SVG icon as a string variable. Then, in your SCSS file, use the mixin `@mixin create-icon()` as follows:
```
//you can define your icon in a variable. This step is optional.
$i-user: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z" /></svg>';

i {
    @include create-icon($i-user, 'yellow', null, 24px)
}
```

On your page, you will see a yellow user icon with a size of 24x24 pixels :) Of course, you must have the <i></i> tag in your HTML file.

Let's explain the individual parameters of the `@mixin create-icon($svg-icon, $fill-color: null, $curr-color: null, $size: null):`

| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   |      Description      |
|:---------------------------:|:-------------|
| **$svg-icon** |  expects a string of your SVG icon, which can be placed in a variable. |
| **$fill-color** |    specifies the color you want the icon to change to. It can be a color name such as `'pink'` or a color code such as `'#f2f'`   |
| **$curr-color** | if your SVG does not contain a fill attribute, simply put `null` as the $fill-color parameter. However, if the SVG has a color specified in the fill attribute, such as `orange`, you must put this color in the $fill-color parameter as a string (f.e.`'orange'`). |
| **$size** |  $size is optional and can be used to specify the size of the icon. It is optional because some icons may have a different shape than a square or cube and specifying a fixed size may not be appropriate |

The mixin also contains `@content`. Therefore, if you want to make some CSS changes, simply write properties with their respective values like this
```
i {
    @include create-icon($i-some-rectangle-icon, '#f2f', null, null) {
        width: 200px;
        height: 50px;
        transition: all ease 400ms;
        ...
    }
}
```

### > Examples

- Codepen [demo](https://codepen.io/davidkolisek/pen/BaqNGRM)
