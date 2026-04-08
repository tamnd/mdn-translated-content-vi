---
title: mask-border-repeat
slug: Web/CSS/Reference/Properties/mask-border-repeat
page-type: css-property
browser-compat: css.properties.mask-border-repeat
sidebar: cssref
---

Thuộc tính **`mask-border-repeat`** trong [CSS](/en-US/docs/Web/CSS) xác định cách các hình ảnh cho các cạnh và phần giữa của [hình ảnh mặt nạ viền](/en-US/docs/Web/CSS/Reference/Properties/mask-border) được co giãn và lát.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-border-repeat: stretch;
mask-border-repeat: repeat;
mask-border-repeat: round;
mask-border-repeat: space;

/* trên và dưới | trái và phải */
mask-border-repeat: round stretch;

/* Giá trị toàn cục */
mask-border-repeat: inherit;
mask-border-repeat: initial;
mask-border-repeat: revert;
mask-border-repeat: revert-layer;
mask-border-repeat: unset;
```

Thuộc tính `mask-border-repeat` có thể được chỉ định bằng một hoặc hai giá trị chọn từ danh sách giá trị bên dưới.

- Khi chỉ định **một** giá trị, nó áp dụng cùng một hành vi cho **tất cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, giá trị đầu tiên áp dụng cho **trên và dưới**, giá trị thứ hai áp dụng cho **trái và phải**.

### Giá trị

- `stretch`
  - : Các vùng cạnh của hình ảnh nguồn được kéo dài để lấp đầy khoảng trống giữa mỗi viền.
- `repeat`
  - : Các vùng cạnh của hình ảnh nguồn được lát (lặp lại) để lấp đầy khoảng trống giữa mỗi viền. Các ô có thể bị cắt để đạt được kích thước phù hợp.
- `round`
  - : Các vùng cạnh của hình ảnh nguồn được lát (lặp lại) để lấp đầy khoảng trống giữa mỗi viền. Các ô có thể được kéo dài để đạt được kích thước phù hợp.
- `space`
  - : Các vùng cạnh của hình ảnh nguồn được lát (lặp lại) để lấp đầy khoảng trống giữa mỗi viền. Khoảng trắng thêm sẽ được phân phối đều giữa các ô để đạt được kích thước phù hợp.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Thuộc tính này hiện chưa được hỗ trợ ở bất kỳ đâu. Khi được hỗ trợ, nó sẽ xác định cách lát mặt nạ viền lặp lại xung quanh viền: lặp đơn thuần, co giãn nhẹ để vừa một số nguyên lát, hay kéo dài để một lát vừa khít?

```css
mask-border-repeat: round;
```

Các trình duyệt dựa trên Chromium hỗ trợ phiên bản cũ của thuộc tính này là `mask-box-image-repeat` với tiền tố:

```css
-webkit-mask-box-image-repeat: round;
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
- {{cssxref("mask-border-outset")}}
- {{cssxref("mask-border-source")}}
- {{cssxref("mask-border-width")}}
