---
title: -webkit-mask-composite
slug: Web/CSS/Reference/Properties/-webkit-mask-composite
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-mask-composite
sidebar: cssref
---

{{Non-standard_header}}

Thuộc tính **`-webkit-mask-composite`** xác định cách thức nhiều hình ảnh mặt nạ được áp dụng cho cùng một phần tử được kết hợp với nhau. Các hình ảnh mặt nạ được kết hợp theo thứ tự ngược với thứ tự khai báo trong thuộc tính {{CSSxRef("mask-image", "-webkit-mask-image")}}.

> [!NOTE]
> Có một thuộc tính {{CSSxRef("mask-composite")}} tiêu chuẩn bao gồm các phần của thuộc tính không chuẩn này sử dụng các từ khóa khác nhau.

## Cú pháp

```css
/* Giá trị từ khóa */
-webkit-mask-composite: clear;
-webkit-mask-composite: copy;
-webkit-mask-composite: source-over;
-webkit-mask-composite: source-in;
-webkit-mask-composite: source-out;
-webkit-mask-composite: source-atop;
-webkit-mask-composite: destination-over;
-webkit-mask-composite: destination-in;
-webkit-mask-composite: destination-out;
-webkit-mask-composite: destination-atop;
-webkit-mask-composite: xor;

/* Giá trị toàn cục */
-webkit-mask-composite: inherit;
-webkit-mask-composite: initial;
-webkit-mask-composite: revert;
-webkit-mask-composite: revert-layer;
-webkit-mask-composite: unset;
```

### Giá trị

- `clear`
  - : Các pixel chồng chéo trong hình ảnh mặt nạ nguồn và hình ảnh mặt nạ đích bị xóa.
- `copy`
  - : Hình ảnh mặt nạ nguồn thay thế hình ảnh mặt nạ đích.
- `source-over`
  - : Hình ảnh mặt nạ nguồn được hiển thị trên hình ảnh mặt nạ đích.
- `source-in`
  - : Các pixel chồng chéo trong hình ảnh mặt nạ nguồn và hình ảnh mặt nạ đích được thay thế bằng các pixel của hình ảnh mặt nạ nguồn; tất cả các pixel còn lại bị xóa.
- `source-out`
  - : Các pixel chồng chéo trong hình ảnh mặt nạ nguồn và hình ảnh mặt nạ đích bị xóa; tất cả các pixel còn lại của hình ảnh mặt nạ nguồn được hiển thị.
- `source-atop`
  - : Các pixel của hình ảnh mặt nạ đích được hiển thị. Các pixel của hình ảnh mặt nạ nguồn chỉ được hiển thị nếu chúng chồng lên một phần không trong suốt của hình ảnh mặt nạ đích. Điều này khiến hình ảnh mặt nạ nguồn không có hiệu lực.
- `destination-over`
  - : Hình ảnh mặt nạ đích được hiển thị trên hình ảnh mặt nạ nguồn.
- `destination-in`
  - : Các pixel chồng chéo trong hình ảnh mặt nạ nguồn và hình ảnh mặt nạ đích vẫn là các pixel của hình ảnh mặt nạ đích; tất cả các pixel còn lại bị xóa.
- `destination-out`
  - : Các pixel chồng chéo trong hình ảnh mặt nạ nguồn và hình ảnh mặt nạ đích bị xóa; tất cả các pixel còn lại của hình ảnh mặt nạ nguồn được hiển thị.
- `destination-atop`
  - : Các pixel của hình ảnh mặt nạ nguồn được hiển thị. Các pixel của hình ảnh mặt nạ đích chỉ được hiển thị nếu chúng chồng lên một phần không trong suốt của hình ảnh mặt nạ đích. Điều này khiến hình ảnh mặt nạ đích không có hiệu lực.
- `xor`
  - : Các pixel chồng chéo trong hình ảnh mặt nạ nguồn và hình ảnh mặt nạ đích trở nên hoàn toàn trong suốt nếu cả hai đều hoàn toàn mờ đục.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-mask-composite = <composite-style>#`)}}

## Ví dụ

### Kết hợp với XOR

```css
.example {
  -webkit-mask-image: url("mask1.png"), url("mask2.png");
  -webkit-mask-composite: xor, source-over;
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào. Thuộc tính này được quy định trong {{CSSxRef("mask-composite")}} sử dụng các giá trị khác nhau.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("mask-composite")}}
