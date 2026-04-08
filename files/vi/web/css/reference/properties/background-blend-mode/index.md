---
title: background-blend-mode
slug: Web/CSS/Reference/Properties/background-blend-mode
page-type: css-property
browser-compat: css.properties.background-blend-mode
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-blend-mode`** xác định cách các ảnh nền của một phần tử được pha trộn với nhau và với màu nền của phần tử đó.

Các chế độ pha trộn phải được khai báo theo cùng thứ tự như thuộc tính {{cssxref("background-image")}}. Nếu độ dài danh sách chế độ pha trộn và ảnh nền không bằng nhau, danh sách sẽ được lặp lại và/hoặc cắt bớt cho đến khi độ dài khớp nhau.

{{InteractiveExample("CSS Demo: background-blend-mode")}}

```css interactive-example-choice
background-blend-mode: normal;
```

```css interactive-example-choice
background-blend-mode: multiply;
```

```css interactive-example-choice
background-blend-mode: hard-light;
```

```css interactive-example-choice
background-blend-mode: difference;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element"></div>
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: green;
  background-image: url("/shared-assets/images/examples/balloon.jpg");
  width: 250px;
  height: 305px;
}
```

## Cú pháp

```css
/* Một giá trị */
background-blend-mode: normal;

/* Hai giá trị, một cho mỗi ảnh nền */
background-blend-mode: darken, luminosity;

/* Giá trị toàn cục */
background-blend-mode: inherit;
background-blend-mode: initial;
background-blend-mode: revert;
background-blend-mode: revert-layer;
background-blend-mode: unset;
```

### Giá trị

- {{cssxref("&lt;blend-mode&gt;")}}
  - : Chế độ pha trộn được áp dụng. Có thể có nhiều giá trị, phân cách bằng dấu phẩy.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

```css
.item {
  width: 300px;
  height: 300px;
  background: url("image1.png"), url("image2.png");
  background-blend-mode: screen;
}
```

### Thử các chế độ pha trộn khác nhau

```html hidden
<div id="div"></div>
<select id="select">
  <option>normal</option>
  <option>multiply</option>
  <option selected>screen</option>
  <option>overlay</option>
  <option>darken</option>
  <option>lighten</option>
  <option>color-dodge</option>
  <option>color-burn</option>
  <option>hard-light</option>
  <option>soft-light</option>
  <option>difference</option>
  <option>exclusion</option>
  <option>hue</option>
  <option>saturation</option>
  <option>color</option>
  <option>luminosity</option>
</select>
```

```css hidden
#div {
  width: 300px;
  height: 300px;
  background: url("br.png"), url("tr.png");
  background-blend-mode: screen;
}
```

```js hidden
document.getElementById("select").onchange = (event) => {
  document.getElementById("div").style.backgroundBlendMode =
    document.getElementById("select").selectedOptions[0].innerHTML;
};
console.log(document.getElementById("div"));
```

{{ EmbedLiveSample('try_out_different_blend_modes', "330", "350") }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;blend-mode&gt;")}}
- {{cssxref("mix-blend-mode")}}
