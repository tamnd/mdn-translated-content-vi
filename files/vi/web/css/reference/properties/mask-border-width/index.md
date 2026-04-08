---
title: mask-border-width
slug: Web/CSS/Reference/Properties/mask-border-width
page-type: css-property
browser-compat: css.properties.mask-border-width
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-border-width`** thiết lập độ rộng của [viền mặt nạ](/vi/docs/Web/CSS/Reference/Properties/mask-border) của một phần tử.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-border-width: auto;

/* Giá trị <length> */
mask-border-width: 1rem;

/* Giá trị <percentage> */
mask-border-width: 25%;

/* Giá trị <number> */
mask-border-width: 3;

/* trên và dưới | trái và phải */
mask-border-width: 2em 3em;

/* trên | trái và phải | dưới */
mask-border-width: 5% 15% 10%;

/* trên | phải | dưới | trái */
mask-border-width: 5% 2em 10% auto;

/* Giá trị toàn cục */
mask-border-width: inherit;
mask-border-width: initial;
mask-border-width: revert;
mask-border-width: revert-layer;
mask-border-width: unset;
```

Thuộc tính `mask-border-width` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị được chọn từ danh sách giá trị bên dưới.

- Khi chỉ định **một** giá trị, nó áp dụng cùng một độ rộng cho **tất cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, độ rộng đầu tiên áp dụng cho **trên và dưới**, giá trị thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, độ rộng đầu tiên áp dụng cho **trên**, giá trị thứ hai cho **trái và phải**, giá trị thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các độ rộng áp dụng cho **trên**, **phải**, **dưới**, và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- `<length-percentage>`
  - : Độ rộng của viền mặt nạ, được chỉ định dưới dạng {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Phần trăm tương đối với _chiều rộng_ của vùng viền cho các độ lệch ngang và _chiều cao_ của vùng viền cho các độ lệch dọc. Không được âm.
- `<number>`
  - : Độ rộng của viền mặt nạ, được chỉ định như một bội số của {{cssxref("border-width")}} tương ứng. Không được âm.
- `auto`
  - : Độ rộng của viền mặt nạ được đặt bằng chiều rộng hoặc chiều cao nội tại (tùy điều kiện) của {{cssxref("mask-border-slice")}} tương ứng. Nếu hình ảnh không có kích thước nội tại cần thiết, thì `border-width` tương ứng được sử dụng thay thế.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản

`mask-border-width` xác định độ rộng của viền mặt nạ — đặt giá trị này khác với {{cssxref("mask-border-slice")}} sẽ làm cho các lát cắt được chia tỷ lệ để vừa với viền mặt nạ.

```css
/* Mặt nạ cuối cùng được thu nhỏ xuống 20px */
mask-border-slice: 30 fill;
mask-border-width: 20px;
```

Các trình duyệt dựa trên Chromium hỗ trợ phiên bản cũ của thuộc tính này — `mask-box-image-width` — với tiền tố:

```css
-webkit-mask-box-image-width: 20px;
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
- {{cssxref("mask-border-source")}}
