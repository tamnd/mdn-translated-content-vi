---
title: OffscreenCanvas.getContext()
slug: Web/API/OffscreenCanvas/getContext
page-type: web-api-instance-method
browser-compat: api.OffscreenCanvas.getContext
---

{{APIRef("Canvas API")}}

Phương thức **`getContext()`** của {{domxref("OffscreenCanvas")}} trả về ngữ cảnh kết xuất của canvas ngoài màn hình.

## Cú pháp

```js-nolint
getContext(contextType)
getContext(contextType, contextAttributes)
```

### Tham số

- `contextType`
  - : Một chuỗi chỉ kiểu ngữ cảnh mong muốn, chẳng hạn `"2d"` hoặc `"webgl"`.
- `contextAttributes`
  - : Một đối tượng tùy chọn chứa các thuộc tính ngữ cảnh.

### Giá trị trả về

Đối tượng ngữ cảnh thích hợp, hoặc `null` nếu kiểu ngữ cảnh không được hỗ trợ.

## Ví dụ

```js
const offscreen = new OffscreenCanvas(256, 256);
const ctx = offscreen.getContext("2d");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
