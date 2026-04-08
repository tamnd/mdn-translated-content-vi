---
title: mask-border-outset
slug: Web/CSS/Reference/Properties/mask-border-outset
page-type: css-property
browser-compat: css.properties.mask-border-outset
sidebar: cssref
---

Thuộc tính **`mask-border-outset`** trong [CSS](/en-US/docs/Web/CSS) xác định khoảng cách mà [mặt nạ viền](/en-US/docs/Web/CSS/Reference/Properties/mask-border) của một phần tử được đặt ra ngoài so với hộp viền của nó.

## Cú pháp

```css
/* Giá trị <length> */
mask-border-outset: 1rem;

/* Giá trị <number> */
mask-border-outset: 1.5;

/* trên và dưới | trái và phải */
mask-border-outset: 1 1.2;

/* trên | trái và phải | dưới */
mask-border-outset: 30px 2 45px;

/* trên | phải | dưới | trái */
mask-border-outset: 7px 12px 14px 5px;

/* Giá trị toàn cục */
mask-border-outset: inherit;
mask-border-outset: initial;
mask-border-outset: revert;
mask-border-outset: revert-layer;
mask-border-outset: unset;
```

Thuộc tính `mask-border-outset` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị. Mỗi giá trị là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;number&gt;")}}. Giá trị âm không hợp lệ.

- Khi chỉ định **một** giá trị, nó áp dụng cùng một khoảng outset cho **tất cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, giá trị outset đầu tiên áp dụng cho **trên và dưới**, giá trị thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, giá trị outset đầu tiên áp dụng cho **trên**, giá trị thứ hai cho **trái và phải**, giá trị thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các outset áp dụng cho **trên**, **phải**, **dưới**, và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của outset mặt nạ viền dưới dạng một kích thước.
- {{cssxref("&lt;number&gt;")}}
  - : Kích thước của outset mặt nạ viền dưới dạng bội số của {{cssxref("border-width")}} tương ứng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Thuộc tính này hiện chưa được hỗ trợ ở bất kỳ đâu. Khi được hỗ trợ, nó sẽ dùng để đẩy mặt nạ ra ngoài cạnh bên trong của hộp viền phần tử, cho phép bắt đầu mặt nạ từ giữa viền thay vì từ bên trong.

```css
mask-border-outset: 1rem;
```

Các trình duyệt dựa trên Chromium hỗ trợ phiên bản cũ của thuộc tính này là `mask-box-image-outset` với tiền tố:

```css
-webkit-mask-box-image-outset: 1rem;
```

> [!NOTE]
> Trang {{cssxref("mask-border")}} có ví dụ hoạt động (sử dụng các thuộc tính mặt nạ viền có tiền tố lỗi thời được Chromium hỗ trợ), để bạn có thể hình dung được hiệu ứng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask-border")}}
- {{cssxref("mask-border-mode")}}
- {{cssxref("mask-border-repeat")}}
- {{cssxref("mask-border-source")}}
- {{cssxref("mask-border-width")}}
