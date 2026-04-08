---
title: Resizing background images with background-size
short-title: Resizing background images
slug: Web/CSS/Guides/Backgrounds_and_borders/Resizing_background_images
page-type: guide
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **{{cssxref("background-size")}}** cho phép bạn thay đổi kích thước hình ảnh nền của một phần tử, ghi đè hành vi mặc định là lặp lại hình ảnh ở kích thước đầy đủ bằng cách chỉ định chiều rộng và/hoặc chiều cao của hình ảnh. Bằng cách này, bạn có thể phóng to hoặc thu nhỏ hình ảnh theo ý muốn.

## Lặp lại một hình ảnh lớn

Hãy xem xét một hình ảnh lớn — một hình logo Firefox 2982x2808 pixel. Chúng ta muốn (vì một lý do nào đó liên quan đến thiết kế trang web rất tệ) lặp lại bốn bản sao của hình ảnh này vào một phần tử 300x300 pixel. Để làm điều này, chúng ta có thể sử dụng giá trị `background-size` cố định là 150 pixel.

### HTML

```html
<div class="tiledBackground"></div>
```

### CSS

```css
.tiledBackground {
  background-image: url("https://www.mozilla.org/media/img/logos/firefox/logo-quantum.9c5e96634f92.png");
  background-size: 150px;
  width: 300px;
  height: 300px;
  border: 2px solid;
  color: pink;
}
```

### Kết quả

{{EmbedLiveSample("Tiling_a_large_image", 340, 340)}}

## Kéo giãn một hình ảnh

Bạn cũng có thể chỉ định cả kích thước ngang và dọc của hình ảnh, như sau:

```css
background-size: 300px 150px;
```

Kết quả trông như thế này:

![Firefox logo stretched](stretched_firefox_logo.png)

## Phóng to một hình ảnh

Ở chiều ngược lại, bạn có thể phóng to một hình ảnh trong nền. Ở đây chúng ta phóng to một favicon 32x32 pixel lên 300x300 pixel:

![MDN Logo scaled](scaled_mdn_logo.png)

```css
.square2 {
  background-image: url("favicon.png");
  background-size: 300px;
  width: 300px;
  height: 300px;
  border: 2px solid;
  text-shadow: white 0px 0px 2px;
  font-size: 16px;
}
```

Như bạn thấy, CSS thực ra về cơ bản là giống hệt nhau, ngoại trừ tên của tệp hình ảnh.

## Các giá trị đặc biệt: `contain` và `cover`

Ngoài các giá trị {{cssxref("&lt;length&gt;")}}, thuộc tính CSS {{cssxref("background-size")}} còn cung cấp hai giá trị kích thước đặc biệt là `contain` và `cover`. Hãy cùng xem xét những giá trị này.

### `contain`

Giá trị `contain` chỉ định rằng, bất kể kích thước của hộp chứa, hình ảnh nền nên được thu/phóng sao cho mỗi cạnh lớn nhất có thể mà không vượt quá chiều dài của cạnh tương ứng của vùng chứa. Hãy thử thay đổi kích thước ví dụ bên dưới để thấy điều này hoạt động.

#### HTML

```html
<div class="bgSizeContain">
  <p>Try resizing this element!</p>
</div>
```

#### CSS

```css
.bgSizeContain {
  background-image: url("https://www.mozilla.org/media/img/logos/firefox/logo-quantum.9c5e96634f92.png");
  background-size: contain;
  width: 160px;
  height: 160px;
  border: 2px solid;
  resize: both;
  overflow: scroll;
}
```

#### Kết quả

{{EmbedLiveSample('contain', 250, 250)}}

### `cover`

Giá trị `cover` chỉ định rằng hình ảnh nền nên được điều chỉnh kích thước để nhỏ nhất có thể trong khi vẫn đảm bảo cả hai chiều đều lớn hơn hoặc bằng kích thước tương ứng của vùng chứa. Hãy thử thay đổi kích thước ví dụ bên dưới để thấy điều này hoạt động.

#### HTML

```html
<div class="bgSizeCover">
  <p>Try resizing this element!</p>
</div>
```

#### CSS

```css
.bgSizeCover {
  background-image: url("https://www.mozilla.org/media/img/logos/firefox/logo-quantum.9c5e96634f92.png");
  background-size: cover;
  width: 160px;
  height: 160px;
  border: 2px solid;
  resize: both;
  overflow: scroll;
}
```

#### Kết quả

{{EmbedLiveSample('cover', 250, 250)}}

## Xem thêm

- {{cssxref("background-size")}}
- {{cssxref("background")}}
- Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Scaling SVG backgrounds](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Scaling_SVG_backgrounds)
