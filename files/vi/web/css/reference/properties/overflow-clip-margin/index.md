---
title: overflow-clip-margin
slug: Web/CSS/Reference/Properties/overflow-clip-margin
page-type: css-property
browser-compat: css.properties.overflow-clip-margin
sidebar: cssref
---

Thuộc tính CSS **`overflow-clip-margin`** xác định khoảng cách bao xa bên ngoài ranh giới của một phần tử có [`overflow: clip`](/en-US/docs/Web/CSS/Reference/Properties/overflow) có thể được vẽ trước khi bị cắt xén. Ranh giới được xác định bởi thuộc tính này được gọi là _cạnh cắt tràn_ của hộp.

## Cú pháp

```css
/* Giá trị <length> */
overflow-clip-margin: 20px;
overflow-clip-margin: 1em;

/* <visual-box> | <length> */
overflow-clip-margin: content-box 5px;

/* Giá trị toàn cục */
overflow-clip-margin: inherit;
overflow-clip-margin: initial;
overflow-clip-margin: revert;
overflow-clip-margin: revert-layer;
overflow-clip-margin: unset;
```

Giá trị `<visual-box>`, mặc định là `padding-box`, xác định cạnh hộp được dùng làm gốc cho cạnh cắt tràn. Giá trị {{cssxref("&lt;length&gt;")}} được chỉ định trong `overflow-clip-margin` phải không âm.

> [!NOTE]
> Nếu phần tử không có `overflow: clip` thì thuộc tính này sẽ bị bỏ qua.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<div class="box">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
  consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
  cillum dolore eu fugiat nulla pariatur.
</div>
```

### CSS

```css
.box {
  border: 3px solid black;
  width: 250px;
  height: 100px;
  overflow: clip;
  overflow-clip-margin: 20px;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", "280")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan: {{cssxref("text-overflow")}}, {{cssxref("white-space")}}, {{Cssxref("overflow")}}, {{Cssxref("overflow-inline")}}, {{Cssxref("overflow-x")}}, {{Cssxref("overflow-y")}}, {{Cssxref("clip")}}, {{Cssxref("display")}}
