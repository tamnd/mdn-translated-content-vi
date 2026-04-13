---
title: "GPUQuerySet: destroy() method"
short-title: destroy()
slug: Web/API/GPUQuerySet/destroy
page-type: web-api-instance-method
browser-compat: api.GPUQuerySet.destroy
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`destroy()`** của giao diện {{domxref("GPUQuerySet")}} hủy `GPUQuerySet`.

## Cú pháp

```js-nolint
destroy()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

```js
const querySet = device.createQuerySet({
  type: "occlusion",
  count: 32,
});

// Some time later

querySet.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
