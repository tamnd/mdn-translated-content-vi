---
title: "DOMRectReadOnly: phương thức tĩnh fromRect()"
short-title: fromRect()
slug: Web/API/DOMRectReadOnly/fromRect_static
page-type: web-api-static-method
browser-compat: api.DOMRectReadOnly.fromRect_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromRect()`** của đối tượng {{domxref("DOMRectReadOnly")}} tạo một đối tượng `DOMRectReadOnly` mới với vị trí và kích thước cho trước.

## Cú pháp

```js-nolint
DOMRectReadOnly.fromRect()
DOMRectReadOnly.fromRect(rectangle)
```

### Tham số

- `rectangle` {{optional_inline}}
  - : Một đối tượng xác định vị trí và kích thước của một hình chữ nhật. Tất cả các thuộc tính mặc định là `0`. Các thuộc tính bao gồm:
    - `x`: Tọa độ cạnh trái của hình chữ nhật.
    - `y`: Tọa độ cạnh trên của hình chữ nhật.
    - `width`: Chiều rộng của hình chữ nhật.
    - `height`: Chiều cao của hình chữ nhật.

### Giá trị trả về

Một thực thể của {{domxref("DOMRectReadOnly")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
