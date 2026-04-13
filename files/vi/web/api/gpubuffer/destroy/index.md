---
title: "GPUBuffer: destroy() method"
short-title: destroy()
slug: Web/API/GPUBuffer/destroy
page-type: web-api-instance-method
browser-compat: api.GPUBuffer.destroy
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`destroy()`** của giao diện {{domxref("GPUBuffer")}} hủy `GPUBuffer`.

## Cú pháp

```js-nolint
destroy()
```

### Tham số

Không có.

### Giá trị trả về

None ({{jsxref("Undefined")}}).

## Ví dụ

```js
const output = device.createBuffer({
  size: 1000,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
});

// some time later

output.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
