---
title: widows
slug: Web/CSS/Reference/Properties/widows
page-type: css-property
browser-compat: css.properties.widows
sidebar: cssref
---

Thuộc tính **`widows`** của [CSS](/vi/docs/Web/CSS) đặt số dòng tối thiểu trong một bộ chứa khối phải được hiển thị ở _đầu_ [trang](/vi/docs/Web/CSS/Guides/Paged_media), vùng, hoặc [cột](/vi/docs/Web/CSS/Guides/Multicol_layout).

Trong ngành xuất bản, _widow_ (dòng mồ côi cuối) là dòng cuối cùng của đoạn văn xuất hiện một mình ở đầu trang. (Đoạn văn được tiếp nối từ trang trước.)

## Cú pháp

```css
/* Giá trị <integer> */
widows: 2;
widows: 3;

/* Giá trị toàn cục */
widows: inherit;
widows: initial;
widows: revert;
widows: revert-layer;
widows: unset;
```

### Giá trị

- {{cssxref("&lt;integer&gt;")}}
  - : Số dòng tối thiểu có thể đứng một mình ở đầu một đoạn mới sau khi ngắt phân mảnh. Giá trị phải là số dương.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Kiểm soát widows trong cột

#### HTML

```html
<div>
  <p>Đây là đoạn đầu tiên chứa một số văn bản.</p>
  <p>
    Đây là đoạn thứ hai chứa nhiều văn bản hơn đoạn đầu tiên.
    Nó được dùng để minh họa cách widows hoạt động.
  </p>
  <p>
    Đây là đoạn thứ ba. Nó có nhiều văn bản hơn một chút so với đoạn đầu tiên.
  </p>
</div>
```

#### CSS

```css
div {
  background-color: #8cffa0;
  columns: 3;
  widows: 2;
}

p {
  background-color: #8ca0ff;
}

p:first-child {
  margin-top: 0;
}
```

#### Kết quả

{{EmbedLiveSample("Controlling_column_widows", 400, 160)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("orphans")}}
- [Phương tiện phân trang](/vi/docs/Web/CSS/Guides/Paged_media)
