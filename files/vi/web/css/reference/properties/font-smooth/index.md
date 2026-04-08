---
title: font-smooth
slug: Web/CSS/Reference/Properties/font-smooth
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.font-smooth
sidebar: cssref
---

{{ Non-standard_header }}

Thuộc tính **`font-smooth`** [CSS](/en-US/docs/Web/CSS) kiểm soát việc áp dụng khử răng cưa khi hiển thị phông chữ.

## Cú pháp

```css
/* Giá trị từ khóa */
font-smooth: auto;
font-smooth: never;
font-smooth: always;

/* Giá trị <length> */
font-smooth: 2em;

/* Giá trị toàn cục */
font-smooth: inherit;
font-smooth: initial;
font-smooth: revert;
font-smooth: revert-layer;
font-smooth: unset;
```

> [!NOTE]
> WebKit triển khai một thuộc tính tương tự, nhưng với các giá trị khác nhau: **`-webkit-font-smoothing`**. Nó chỉ hoạt động trên macOS.
>
> - `auto` - Để trình duyệt quyết định (Sử dụng khử răng cưa subpixel khi có sẵn; đây là giá trị mặc định)
> - `none` - Tắt làm mịn phông chữ; hiển thị văn bản với các cạnh sắc nét.
> - `antialiased` - Làm mịn phông chữ ở cấp độ pixel, trái với subpixel. Chuyển từ hiển thị subpixel sang khử răng cưa cho văn bản sáng trên nền tối làm cho nó trông nhạt hơn.
> - `subpixel-antialiased` - Trên hầu hết các màn hình không phải retina, điều này sẽ cho văn bản sắc nét nhất.

> [!NOTE]
> Firefox triển khai một thuộc tính tương tự, nhưng với các giá trị khác nhau: **`-moz-osx-font-smoothing`**. Nó chỉ hoạt động trên macOS.
>
> - `auto` - Cho phép trình duyệt chọn tối ưu hóa cho làm mịn phông chữ, thường là `grayscale`.
> - `grayscale` - Hiển thị văn bản với khử răng cưa thang độ xám, trái với subpixel. Chuyển từ hiển thị subpixel sang khử răng cưa cho văn bản sáng trên nền tối làm cho nó trông nhạt hơn.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{CSSSyntaxRaw(`font-smooth = auto | never | always | <absolute-size> | <length>`)}}

## Ví dụ

### Ví dụ sử dụng cơ bản

Ví dụ sau đây cho thấy các tương đương Safari/Chromium và Firefox bật làm mịn phông chữ trên macOS. Trong cả hai trường hợp, phông chữ được làm mịn sẽ trông hơi nhạt hơn về trọng lượng.

Đối với những người không dùng hệ thống macOS, đây là ảnh chụp màn hình (phiên bản trực tiếp xuất hiện sau):

![Two texts examples one with the font-smooth property and another one without](smoothing.png)

#### HTML

```html
<p>Without font smoothing</p>

<p class="smoothed">With font smoothing</p>
```

#### CSS

```css
html {
  background-color: black;
  color: white;
  font-size: 3rem;
}

p {
  text-align: center;
}

.smoothed {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_usage_example', '100%', 260)}}

## Đặc tả

Không phải là một phần của bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Please Stop "Fixing" Font Smoothing](https://usabilitypost.com/2012/11/05/stop-fixing-font-smoothing/) của Dmitry Fadeyev (2012)
- [Laissez-faire font smoothing and anti-aliasing](https://www.zachleat.com/web/font-smooth/) của Zach Leatherman (2017)
- [Improve text rendering (A Modern CSS Reset)](https://www.joshwcomeau.com/css/custom-css-reset/#five-improve-text-rendering-6) của Josh W. Comeau (2021)
- [What's the deal with WebKit Font Smoothing?](https://dbushell.com/2024/11/05/webkit-font-smoothing/) của David Bushell (2024)
