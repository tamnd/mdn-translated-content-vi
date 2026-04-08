---
title: line-height-step
slug: Web/CSS/Reference/Properties/line-height-step
page-type: css-property
status:
  - experimental
browser-compat: css.properties.line-height-step
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`line-height-step`** trong [CSS](/vi/docs/Web/CSS) thiết lập đơn vị bước cho chiều cao hộp dòng. Khi thuộc tính được đặt, chiều cao hộp dòng được làm tròn lên đến bội số gần nhất của đơn vị.

## Cú pháp

```css
/* Giá trị điểm */
line-height-step: 18pt;

/* Giá trị toàn cục */
line-height-step: inherit;
line-height-step: initial;
line-height-step: revert;
line-height-step: revert-layer;
line-height-step: unset;
```

Thuộc tính `line-height-step` được chỉ định là một trong những giá trị sau:

- một `<length>`.

### Giá trị

- `<length>`
  - : {{cssxref("&lt;length&gt;")}} được chỉ định được dùng trong tính toán bước chiều cao hộp dòng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập đơn vị bước cho chiều cao hộp dòng

Trong ví dụ sau, chiều cao hộp dòng trong mỗi đoạn văn được làm tròn lên đến đơn vị bước. Hộp dòng trong `<h1>` không vừa trong một đơn vị bước và do đó chiếm hai đơn vị, nhưng vẫn được căn giữa trong hai đơn vị bước.

```css
:root {
  font-size: 12pt;
  --my-grid: 18pt;
  line-height-step: var(--my-grid);
}
h1 {
  font-size: 20pt;
  margin-top: calc(2 * var(--my-grid));
}
```

Kết quả của các quy tắc này được hiển thị bên dưới trong ảnh chụp màn hình sau:

![How the line-height-step property affects the appearance of text.](line-grid-center.png)

## Thông số kỹ thuật

Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("font")}}
- {{Cssxref("font-size")}}
- {{Cssxref("line-height")}}
- Đặc tả [CSS Rhythmic Sizing](https://drafts.csswg.org/css-rhythm/)
