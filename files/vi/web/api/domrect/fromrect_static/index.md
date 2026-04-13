---
title: "DOMRect: fromRect() static method"
short-title: fromRect()
slug: Web/API/DOMRect/fromRect_static
page-type: web-api-static-method
browser-compat: api.DOMRect.fromRect_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromRect()`** của đối tượng {{domxref("DOMRect")}} tạo một đối tượng `DOMRect` mới với vị trí và kích thước đã cho.

## Cú pháp

```js-nolint
DOMRect.fromRect()
DOMRect.fromRect(rectangle)
```

### Tham số

- `rectangle` {{optional_inline}}
  - : Một đối tượng chỉ định vị trí và kích thước của hình chữ nhật. Tất cả các thuộc tính mặc định là `0`. Các thuộc tính bao gồm:
    - `x`: Tọa độ của cạnh trái hình chữ nhật.
    - `y`: Tọa độ của cạnh trên hình chữ nhật.
    - `width`: Chiều rộng của hình chữ nhật.
    - `height`: Chiều cao của hình chữ nhật.

### Giá trị trả về

Một phiên bản {{domxref("DOMRect")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
