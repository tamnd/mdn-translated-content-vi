---
title: mask-border-source
slug: Web/CSS/Reference/Properties/mask-border-source
page-type: css-property
browser-compat: css.properties.mask-border-source
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-border-source`** thiết lập hình ảnh nguồn được sử dụng để tạo [viền mặt nạ](/vi/docs/Web/CSS/Reference/Properties/mask-border) của một phần tử.

Thuộc tính {{cssxref("mask-border-slice")}} được dùng để chia hình ảnh nguồn thành các vùng, sau đó được áp dụng động vào viền mặt nạ cuối cùng.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-border-source: none;

/* Giá trị <image> */
mask-border-source: url("image.jpg");
mask-border-source: linear-gradient(to top, red, yellow);

/* Giá trị toàn cục */
mask-border-source: inherit;
mask-border-source: initial;
mask-border-source: revert;
mask-border-source: revert-layer;
mask-border-source: unset;
```

### Giá trị

- `none`
  - : Không sử dụng viền mặt nạ.
- {{cssxref("image")}}
  - : Tham chiếu hình ảnh sử dụng cho viền mặt nạ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản

Thuộc tính này có vẻ chưa được hỗ trợ ở bất kỳ đâu. Khi cuối cùng được hỗ trợ, nó sẽ dùng để xác định nguồn của viền mặt nạ.

```css
mask-border-source: url("image.jpg");
```

Các trình duyệt dựa trên Chromium hỗ trợ phiên bản cũ của thuộc tính này — `mask-box-image-source` — với tiền tố:

```css
-webkit-mask-box-image-source: url("image.jpg");
```

> [!NOTE]
> Trang {{cssxref("mask-border")}} có một ví dụ hoạt động (sử dụng các thuộc tính viền mặt nạ có tiền tố lỗi thời được hỗ trợ trong Chromium), vì vậy bạn có thể hình dung được hiệu ứng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask-border")}}
- {{cssxref("mask-border-mode")}}
- {{cssxref("mask-border-outset")}}
- {{cssxref("mask-border-repeat")}}
- {{cssxref("mask-border-width")}}
