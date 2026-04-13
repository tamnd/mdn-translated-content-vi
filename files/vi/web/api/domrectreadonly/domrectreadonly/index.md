---
title: "DOMRectReadOnly: hàm khởi tạo DOMRectReadOnly()"
short-title: DOMRectReadOnly()
slug: Web/API/DOMRectReadOnly/DOMRectReadOnly
page-type: web-api-constructor
browser-compat: api.DOMRectReadOnly.DOMRectReadOnly
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMRectReadOnly()`** tạo một đối tượng {{domxref("DOMRectReadOnly")}} mới.

## Cú pháp

```js-nolint
new DOMRectReadOnly(x, y, width, height)
```

### Tham số

- `x`
  - : Tọa độ `x` của gốc tọa độ `DOMRectReadOnly`.
- `y`
  - : Tọa độ `y` của gốc tọa độ `DOMRectReadOnly`.
- `width`
  - : Chiều rộng của `DOMRectReadOnly`.
- `height`
  - : Chiều cao của `DOMRectReadOnly`.

## Ví dụ

Để tạo một `DOMRectReadOnly` mới, bạn có thể chạy dòng mã như sau:

```js
const myDOMRect = new DOMRectReadOnly(0, 0, 100, 100);
// Chạy 'myDOMRect' trong bảng điều khiển sẽ trả về
// DOMRectReadOnly { x: 0, y: 0, width: 100, height: 100, top: 0, right: 100, bottom: 100, left: 0 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}
- {{domxref("DOMRect")}}
