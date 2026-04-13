---
title: "DOMPointReadOnly: DOMPointReadOnly() constructor"
short-title: DOMPointReadOnly()
slug: Web/API/DOMPointReadOnly/DOMPointReadOnly
page-type: web-api-constructor
browser-compat: api.DOMPointReadOnly.DOMPointReadOnly
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMPointReadOnly()`** trả về một đối tượng {{domxref("DOMPointReadOnly")}} mới đại diện cho một điểm trong không gian 2D hoặc 3D, tùy chọn với phối cảnh, mà các giá trị của nó không thể thay đổi bằng mã script.

## Cú pháp

```js-nolint
new DOMPointReadOnly()
new DOMPointReadOnly(x)
new DOMPointReadOnly(x, y)
new DOMPointReadOnly(x, y, z)
new DOMPointReadOnly(x, y, z, w)
```

### Tham số

- `x` {{optional_inline}}
  - : Giá trị của tọa độ ngang x, dưới dạng số thực dấu phẩy động. Giá trị mặc định là 0.
- `y` {{optional_inline}}
  - : Giá trị của tọa độ dọc y, dưới dạng số thực dấu phẩy động. Giá trị mặc định là 0.
- `z` {{optional_inline}}
  - : Giá trị của tọa độ độ sâu z, dưới dạng số thực dấu phẩy động. Giá trị mặc định là 0.
- `w` {{optional_inline}}
  - : Giá trị của phối cảnh w, dưới dạng số thực dấu phẩy động. Giá trị mặc định là 1.

> [!NOTE]
> Mỗi giá trị này là một số _không bị giới hạn_. Ngoài bất kỳ giá trị dấu phẩy động hữu hạn nào, bạn có thể sử dụng các giá trị đặc biệt như ±{{jsxref("Infinity")}} và {{jsxref("NaN")}}.

### Giá trị trả về

Một đối tượng {{domxref("DOMPointReadOnly")}} mới đại diện cho vị trí đã chỉ định trong không gian.

## Ví dụ

Đoạn code sau đây minh họa việc tạo cả điểm 2D và 3D.

```js
const point2D = new DOMPointReadOnly(50, 25);
const point3D = new DOMPointReadOnly(50, 0, 10);
const perspectivePoint3D = new DOMPointReadOnly(50, 50, 25, 0.5);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
