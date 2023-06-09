<h1 align="center">SVG to Web Icon Converter 🖍 </h1>

<h3 align="center">Stop using unnecessarily large libraries for just a few icons. </h3>

---
This lightweight SCSS file enables easy conversion of SVG images to base64 icons, which can be used as background images for HTML elements. With simple CSS modifications, you can adjust the color, size, and other visual properties of the icons to fit your needs.

# Why?

Using a large library for just a few icons will increase the overall file size of our website, which in turn can slow down the page load time. This can have a negative impact on user experience, especially for users with slower internet connections or older devices. By using only the necessary icons and optimizing their delivery, we can make our website faster and more accessible to a wider audience.

## Table of Contents
- [Description](#-description)
- [Setup](#-setup)
- [Usage](#-usage)
- [FAQ](#-faq)
- [Example](#-example--others)
- [License](#-license)

## 📙 Description

This repository contains a simple [SCSS file](https://github.com/davidkolisek/svg-to-icon/blob/master/_index.scss) for converting SVG images into icons. The file includes SASS functions and mixins that convert the provided SVGs into base64 format. Additionally, you can manipulate the converted icon by using css.

## ⚙ Setup

### > Requirements
- [Sass](https://sass-lang.com/)

### > Installation

Run:

```
npm i @davidkolisek/svg-to-icon
```

And then simply import 'svg-to-icon' into your SCSS file.

```
@import '../node_modules/@davidkolisek/svg-to-icon';
```

That's it :)

**Second option - copy&paste :)**

If you prefer not to run any npm installations, you can copy the [SCSS file](https://github.com/davidkolisek/svg-to-icon/blob/master/_index.scss) and paste it into your project. It is up to you to decide how to organize the functions and mixins.

## 💥 Usage

### > How it works ? 

The best way is to define your SVG icon as a string variable. Then, in your SCSS file, use the mixin `@mixin create-icon()` as follows:
```
//optional
$i-user: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z" /></svg>';

i {
    &:before {
        content: '';
        @include create-icon($i-user, 'yellow', null, 24px)
    }
}
```

On your page, you will see a yellow user icon with a size of 24x24 pixels :) Of course, you must have the `<i></i>` tag in your HTML file. It doesn't have to be a `<i></i>` tag; it can be any HTML tag.

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
    &:before {
        content: '';
        @include create-icon($i-some-rectangle-icon, '#f2f', null, null) {
            width: 200px;
            height: 50px;
            transition: all ease 400ms;
            ...
        }
    }
}
```
## ❓ FAQ 


### 1. Why is it better to use icons in this way?

When I started working on this functionality, I created a two simple websites with 10 icons to compare the website's loading speed and the size of individual files. Here are the approximate results (in incognito mode & first load):

| Website   |  Loadspeed  |  Size  |
|:---------------------------:|:-------------|:-------------|
| svg-to-icon |  200-220 ms | 30 kB|
| external library |  500-530 ms | 373 kB|

I suggest trying it out yourself to form your own opinion.

### 2. Are there any other dependencies?

No, svg-to-icon is created in pure SCSS. There is no JavaScript or any frameworks involved.

### 3. Which type of svg icon i should use? 
If you want to manipulate the converted SVG icon, you should use an SVG with **one color**. That's why we defined `$curr-color` as an 3rd
as the 3rd parameter in the mixin. However, it has also been tested with **Doubletone** icons (f.e. [battery-full](https://fontawesome.com/icons/battery-full?f=classic&s=duotone&sc=%231E3050)) which are provided by Font Awesome.

### 4. What about multi-colored SVG icons like [this](https://www.tutorialbrain.com/editor_html/img/Vector-based_2D_Example.svg?is-pending-load=1)? If I cannot dynamically change the color of those icons, can I at least convert them?
Yes, simply use the mixin like this, and you can use all CSS properties that manipulate the background image:

```
@mixin create-icon($i-my-multicolor-icon) {
    width: 80px;
    height: 80px;
    ...
}
```

example with the `$size` parameter:
```
@mixin create-icon($i-my-multicolor-icon, null, null, 80px);
```

It's up to you :)

### 5. Is it necessary to use a mixin function wrapped in pseudo-elements like ::before or ::after?
No, svg-to-icon converts the supplied SVG to base64 and then renders it as a background-image to the parent selector. Therefore, you have the freedom to choose where and how to use it.


## 🔗 Example & others

- [codepen demo](https://codepen.io/davidkolisek/pen/BaqNGRM)
- [npmjs](https://www.npmjs.com/package/@davidkolisek/svg-to-icon)


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/davidkolisek/svg-to-icon/blob/master/LICENSE) file for details.

