---
title: -webkit-mask-box-image
slug: Web/CSS/Reference/Properties/-webkit-mask-box-image
page-type: css-shorthand-property
status:
  - non-standard
browser-compat: css.properties.-webkit-mask-box-image
sidebar: cssref
---

{{ Non-standard_header() }}

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) không chuẩn có tiền tố **`-webkit-mask-box-image`** thiết lập hình ảnh mặt nạ cho hộp đường viền của một phần tử.

> [!NOTE]
> Thuộc tính này không phải là tiêu chuẩn và không thuộc bất kỳ lộ trình tiêu chuẩn nào. Hãy cân nhắc sử dụng thuộc tính {{CSSXref("mask-border")}} thay thế.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("mask-border-source", "-webkit-mask-border-source")}}
- {{cssxref("mask-border-outset", "-webkit-mask-border-outset")}}
- {{cssxref("mask-border-repeat", "-webkit-mask-border-repeat")}}

Các giá trị bao gồm `<image>` được dùng làm đường viền mặt nạ, và tùy chọn bốn giá trị khoảng cách đường viền và tối đa hai kiểu lặp đường viền.

## Cú pháp

```css
/* mặc định */
-webkit-mask-box-image: none;

/* hình ảnh */
-webkit-mask-box-image: url("image.png");

/* hình ảnh khoảng-cạnh-biên */
-webkit-mask-box-image: url("image.png") 10 20 20 10;
-webkit-mask-box-image: url("image.png") 10px 20px 20px 10px;

/* hình ảnh kiểu-lặp */
-webkit-mask-box-image: url("image.png") space repeat;

/* hình ảnh khoảng-cạnh-biên kiểu-lặp */
-webkit-mask-box-image: url("image.png") 10px 20px 20px 10px space repeat;

/* Giá trị toàn cục */
-webkit-mask-box-image: inherit;
-webkit-mask-box-image: initial;
-webkit-mask-box-image: revert;
-webkit-mask-box-image: revert-layer;
-webkit-mask-box-image: unset;
```

### Giá trị

- {{cssxref("image")}}
  - : Vị trí của tài nguyên hình ảnh được dùng làm hình ảnh mặt nạ, {{cssxref("gradient")}}, hoặc giá trị {{cssxref("image")}} khác.
- `none`
  - : Dùng để chỉ định rằng hộp đường viền không có hình ảnh mặt nạ.
- {{cssxref("length")}}
  - : Kích thước độ lệch của hình ảnh mặt nạ. Xem {{cssxref("&lt;length&gt;")}} để biết các đơn vị có thể dùng.
- {{cssxref("percentage")}}
  - : Độ lệch của hình ảnh mặt nạ có giá trị phần trăm tương đối với kích thước tương ứng (chiều rộng hoặc chiều cao) của khu vực padding đường viền.
- {{cssxref("number")}}
  - : Kích thước độ lệch của hình ảnh mặt nạ tính bằng pixel.
- `repeat`
  - : Hình ảnh mặt nạ được lặp lại bao nhiêu lần cần thiết để bao phủ hộp đường viền. Có thể bao gồm hình ảnh một phần nếu hình ảnh mặt nạ không chia đều vào hộp đường viền.
- `stretch`
  - : Hình ảnh mặt nạ được kéo giãn để bao phủ chính xác hộp đường viền.
- `round`
  - : Hình ảnh mặt nạ được kéo giãn một chút và lặp lại sao cho không có hình ảnh mặt nạ một phần ở cuối hộp đường viền.
- `space`
  - : Hình ảnh mặt nạ được lặp lại nhiều lần nhất có thể mà không kéo giãn. Không có hình ảnh mặt nạ một phần ở cuối hộp đường viền.

Các giá trị khoảng cách cạnh biên định nghĩa khoảng cách từ các cạnh trên, phải, dưới và trái của hình ảnh, theo thứ tự đó. Các giá trị có thể được đặt dưới dạng {{cssxref("length")}}, {{cssxref("number")}}, hoặc {{cssxref("percentage")}}, với các số được hiểu là độ dài pixel.

Kiểu lặp đường viền, khi được thêm vào, được hiểu theo thứ tự `<repeat-x> <repeat-y>`. Nếu chỉ khai báo một giá trị, giá trị đó sẽ áp dụng cho cả hai trục. Mặc dù tương tự {{cssxref("background-repeat")}}, các giá trị `cover` và `contain` không được hỗ trợ.

## Định nghĩa hình thức

- [Giá trị ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value): `none`
- Áp dụng cho: tất cả các phần tử
- [Kế thừa](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance): không
- [Giá trị tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value): như được chỉ định

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-mask-box-image = <mask-image-source> [ <mask-image-offset>{4} <mask-border-repeat>{1,2} ]`)}}

## Ví dụ

### Đặt một hình ảnh

```css
.example-one {
  -webkit-mask-box-image: url("mask.png");
}
```

### Dịch chuyển và lấp đầy hình ảnh

```css
.example-two {
  -webkit-mask-box-image: url("logo.png") 100px 100px 0px 0px round round;
}
```

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{ cssxref("mask-border") }}
- Thuộc tính CSS {{ cssxref("border-image") }}
- [Tài liệu tham khảo Safari CSS: `-webkit-mask-box-image`](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/StandardCSSProperties.html#//apple_ref/doc/uid/TP30001266-SW14)
