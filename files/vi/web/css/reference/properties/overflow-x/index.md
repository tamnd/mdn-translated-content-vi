---
title: overflow-x
slug: Web/CSS/Reference/Properties/overflow-x
page-type: css-property
browser-compat: css.properties.overflow-x
sidebar: cssref
---

Thuộc tính **`overflow-x`** trong [CSS](/en-US/docs/Web/CSS) xác định nội dung hiển thị như thế nào khi nội dung tràn ra ngoài cạnh trái và phải của một phần tử cấp khối. Thuộc tính này cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("overflow")}}.

{{InteractiveExample("CSS Demo: overflow-x")}}

```css interactive-example-choice
overflow-x: visible;
```

```css interactive-example-choice
overflow-x: hidden;
```

```css interactive-example-choice
overflow-x: clip;
```

```css interactive-example-choice
overflow-x: scroll;
```

```css interactive-example-choice
overflow-x: auto;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">
    The value of Pi is 3.1415926535897932384626433832795029. The value of e is
    2.7182818284590452353602874713526625.
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 15em;
  height: 9em;
  border: medium dotted;
  padding: 0.75em;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-x: visible;
overflow-x: hidden;
overflow-x: clip;
overflow-x: scroll;
overflow-x: auto;

/* Giá trị toàn cục */
overflow-x: inherit;
overflow-x: initial;
overflow-x: revert;
overflow-x: revert-layer;
overflow-x: unset;
```

Nếu {{cssxref("overflow-y")}} là `hidden`, `scroll`, hoặc `auto`, và `overflow-x` là `visible` (mặc định), giá trị sẽ được tính ngầm là `auto`.

### Các giá trị

- `visible`
  - : Nội dung tràn không bị cắt và có thể hiển thị bên ngoài hộp padding.
- `hidden`
  - : Nội dung tràn bị cắt nếu cần để vừa theo chiều ngang. Không có thanh cuộn nào.
- `clip`
  - : Nội dung tràn bị cắt tại cạnh clip được xác định bởi {{cssxref("overflow-clip-margin")}}. Cấm tất cả các thao tác cuộn.
- `scroll`
  - : Nội dung tràn bị cắt. Trình duyệt luôn hiển thị thanh cuộn ngang.
- `auto`
  - : Nội dung tràn bị cắt. Trình duyệt chỉ hiển thị thanh cuộn khi nội dung thực sự tràn.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<ul>
  <li>
    <code>overflow-x:hidden</code> — ẩn văn bản bên ngoài hộp
    <div id="div1">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>
  <li>
    <code>overflow-x:scroll</code> — luôn thêm thanh cuộn
    <div id="div2">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>
  <li>
    <code>overflow-x:visible</code> — hiển thị văn bản bên ngoài nếu cần
    <div id="div3">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>
  <li>
    <code>overflow-x:auto</code> — tương đương scroll trên hầu hết trình duyệt
    <div id="div4">ABCDEFGHIJKLMOPQRSTUVWXYZABCDEFGHIJKLMOPQRSTUVWXYZ</div>
  </li>
</ul>
```

### CSS

```css
#div1,
#div2,
#div3,
#div4 {
  border: 1px solid black;
  width: 250px;
  margin-bottom: 12px;
}

#div1 {
  overflow-x: hidden;
}
#div2 {
  overflow-x: scroll;
}
#div3 {
  overflow-x: visible;
}
#div4 {
  overflow-x: auto;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", "270")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("clip")}}, {{Cssxref("display")}}, {{cssxref("text-overflow")}}, {{cssxref("white-space")}}
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
