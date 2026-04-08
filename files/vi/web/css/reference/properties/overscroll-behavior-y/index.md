---
title: overscroll-behavior-y
slug: Web/CSS/Reference/Properties/overscroll-behavior-y
page-type: css-property
browser-compat: css.properties.overscroll-behavior-y
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overscroll-behavior-y`** xác định hành vi của trình duyệt khi ranh giới theo chiều dọc của vùng cuộn được chạm đến.

Xem {{cssxref("overscroll-behavior")}} để biết giải thích đầy đủ.

## Cú pháp

```css
/* Giá trị từ khóa */
overscroll-behavior-y: auto; /* default */
overscroll-behavior-y: contain;
overscroll-behavior-y: none;

/* Giá trị toàn cục */
overscroll-behavior-y: inherit;
overscroll-behavior-y: initial;
overscroll-behavior-y: revert;
overscroll-behavior-y: revert-layer;
overscroll-behavior-y: unset;
```

Thuộc tính `overscroll-behavior-y` được chỉ định là một từ khóa được chọn từ danh sách giá trị bên dưới.

### Giá trị

- `auto`
  - : Hành vi tràn cuộn mặc định xảy ra như bình thường.
- `contain`
  - : Hành vi tràn cuộn mặc định (ví dụ: hiệu ứng "nảy") được quan sát bên trong phần tử nơi giá trị này được đặt. Tuy nhiên, không có {{Glossary("Scroll_chaining", "chuỗi cuộn")}} nào xảy ra trên các vùng cuộn lân cận; các phần tử bên dưới sẽ không cuộn. Giá trị `contain` vô hiệu hóa điều hướng trình duyệt gốc, bao gồm cử chỉ kéo để làm mới theo chiều dọc và điều hướng vuốt theo chiều ngang.
- `none`
  - : Không có chuỗi cuộn nào xảy ra đến các vùng cuộn lân cận, và hành vi tràn cuộn mặc định bị ngăn chặn.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ngăn phần tử bên dưới cuộn theo chiều dọc

```css
.messages {
  height: 220px;
  overflow: auto;
  overscroll-behavior-y: contain;
}
```

Xem {{cssxref("overscroll-behavior")}} để biết ví dụ và giải thích đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("overscroll-behavior")}}
- {{cssxref("overscroll-behavior-x")}}
- {{cssxref("overscroll-behavior-inline")}}
- {{cssxref("overscroll-behavior-block")}}
- Mô-đun [CSS overscroll behavior](/vi/docs/Web/CSS/Guides/Overscroll_behavior)
