---
title: "XRCompositionLayer: destroy() method"
short-title: destroy()
slug: Web/API/XRCompositionLayer/destroy
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRCompositionLayer.destroy
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`destroy()`** của giao diện {{domxref("XRCompositionLayer")}} xóa các tham chiếu đến thư viện đồ họa bên dưới cho layer. Nó cũng đặt mảng texture màu sắc và mảng texture depth stencil thành mảng rỗng.

## Cú pháp

```js-nolint
destroy()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa một layer

Gọi `destroy()` để xóa một layer.

```js
myLayer.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
