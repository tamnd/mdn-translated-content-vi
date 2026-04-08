---
title: orphans
slug: Web/CSS/Reference/Properties/orphans
page-type: css-property
browser-compat: css.properties.orphans
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`orphans`** đặt số dòng tối thiểu trong một container khối phải được hiển thị ở _cuối_ một [trang](/en-US/docs/Web/CSS/Guides/Paged_media), vùng hoặc [cột](/en-US/docs/Web/CSS/Guides/Multicol_layout).

Trong nghề in ấn, _orphan_ (dòng mồ côi đầu) là dòng đầu tiên của một đoạn văn xuất hiện một mình ở cuối trang. (Đoạn văn tiếp tục ở trang kế tiếp.)

## Cú pháp

```css
/* Giá trị <integer> */
orphans: 2;
orphans: 3;

/* Giá trị toàn cục */
orphans: inherit;
orphans: initial;
orphans: revert;
orphans: revert-layer;
orphans: unset;
```

### Giá trị

- {{cssxref("&lt;integer&gt;")}}
  - : Số dòng tối thiểu có thể ở lại một mình ở cuối đoạn trước khi ngắt phân mảnh. Giá trị phải dương.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước orphan tối thiểu là ba dòng

#### HTML

```html
<div>
  <p>This is the first paragraph containing some text.</p>
  <p>
    This is the second paragraph containing some more text than the first one.
    It is used to demonstrate how orphans work.
  </p>
  <p>
    This is the third paragraph. It has a little bit more text than the first
    one.
  </p>
</div>
```

#### CSS

```css
div {
  background-color: #8cffa0;
  height: 150px;
  columns: 3;
  orphans: 3;
}

p {
  background-color: #8ca0ff;
}

p:first-child {
  margin-top: 0;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_a_minimum_orphan_size_of_three_lines", 380, 150)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("widows")}}
- [Paged media](/en-US/docs/Web/CSS/Guides/Paged_media)
