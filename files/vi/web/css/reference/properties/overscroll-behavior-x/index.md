---
title: overscroll-behavior-x
slug: Web/CSS/Reference/Properties/overscroll-behavior-x
page-type: css-property
browser-compat: css.properties.overscroll-behavior-x
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overscroll-behavior-x`** xác định hành vi của trình duyệt khi ranh giới theo chiều ngang của vùng cuộn được chạm đến.

Xem {{cssxref("overscroll-behavior")}} để biết giải thích đầy đủ.

## Cú pháp

```css
/* Giá trị từ khóa */
overscroll-behavior-x: auto; /* default */
overscroll-behavior-x: contain;
overscroll-behavior-x: none;

/* Giá trị toàn cục */
overscroll-behavior-x: inherit;
overscroll-behavior-x: initial;
overscroll-behavior-x: revert;
overscroll-behavior-x: revert-layer;
overscroll-behavior-x: unset;
```

Thuộc tính `overscroll-behavior-x` được chỉ định là một từ khóa được chọn từ danh sách giá trị bên dưới.

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

### Ngăn phần tử bên dưới cuộn theo chiều ngang

Trong [ví dụ overscroll-behavior-x](https://mdn.github.io/css-examples/overscroll-behavior/overscroll-behavior-x) của chúng ta (xem thêm [mã nguồn](https://github.com/mdn/css-examples/blob/main/overscroll-behavior/overscroll-behavior-x.html)), chúng ta có hai hộp cấp khối, một nằm trong hộp kia. Hộp ngoài có {{cssxref("width")}} lớn được đặt để trang cuộn theo chiều ngang. Hộp trong có chiều rộng nhỏ (và {{cssxref("height")}}) để nó nằm gọn trong viewport, nhưng nội dung của nó có `width` lớn nên nó sẽ cuộn theo chiều ngang.

Theo mặc định, khi hộp trong được cuộn và ranh giới cuộn được chạm đến, toàn bộ trang sẽ bắt đầu cuộn, điều này có thể không mong muốn. Để tránh điều này, bạn có thể đặt `overscroll-behavior-x: contain` trên hộp trong:

```css
main > div {
  height: 300px;
  width: 500px;
  overflow: auto;
  position: relative;
  top: 100px;
  left: 100px;
  overscroll-behavior-x: contain;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("overscroll-behavior")}}
- {{cssxref("overscroll-behavior-y")}}
- {{cssxref("overscroll-behavior-inline")}}
- {{cssxref("overscroll-behavior-block")}}
- Mô-đun [CSS overscroll behavior](/vi/docs/Web/CSS/Guides/Overscroll_behavior)
