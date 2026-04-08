---
title: <shape>
slug: Web/CSS/Reference/Values/shape
page-type: css-type
status:
  - deprecated
browser-compat: css.types.shape
sidebar: cssref
---

{{deprecated_header}}

Kiểu dữ liệu **`<shape>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) xác định hình dạng cụ thể (shape) của một vùng. Vùng này đại diện cho phần của phần tử mà thuộc tính {{cssxref("clip")}} áp dụng.

> [!NOTE]
> `<shape>` và `rect()` hoạt động kết hợp với {{cssxref("clip")}}, đã bị phản đối để ủng hộ {{cssxref("clip-path")}}. Khi có thể, hãy sử dụng `clip-path` và kiểu dữ liệu {{cssxref("basic-shape")}} thay thế.

## Cú pháp

Kiểu dữ liệu `<shape>` được chỉ định bằng hàm `rect()`, tạo ra một vùng ở dạng hình chữ nhật.

`rect()`

```css
rect(top, right, bottom, left)
```

### Giá trị

![Biểu đồ hiển thị top, right, bottom, và left, như mô tả bên dưới. Những giá trị này xác định hình dạng của hình chữ nhật. Góc trên bên trái được xác định bởi các giá trị top và left. Góc dưới bên phải được xác định bởi các giá trị bottom và right.](rect.png)

- _top_
  - : Là {{cssxref("length")}} đại diện cho độ dịch chuyển cho cạnh trên của hình chữ nhật tương đối với viền trên của hộp phần tử.
- _right_
  - : Là {{cssxref("length")}} đại diện cho độ dịch chuyển cho cạnh phải của hình chữ nhật tương đối với viền trái của hộp phần tử.
- _bottom_
  - : Là {{cssxref("length")}} đại diện cho độ dịch chuyển cho cạnh dưới của hình chữ nhật tương đối với viền trên của hộp phần tử.
- _left_
  - : Là {{cssxref("length")}} đại diện cho độ dịch chuyển cho cạnh trái của hình chữ nhật tương đối với viền trái của hộp phần tử.

## Nội suy

Khi được hoạt hình, các giá trị của kiểu dữ liệu `<shape>` được nội suy theo các thành phần `top`, `right`, `bottom`, và `left` của chúng, mỗi thành phần được xử lý như một số thực dấu phẩy động. Tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) liên quan đến hoạt hình.

## Ví dụ

### Ví dụ minh họa cách sử dụng đúng hàm rect()

```css
img.clip04 {
  clip: rect(10px, 20px, 20px, 10px);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS liên quan: {{ cssxref("clip") }}
