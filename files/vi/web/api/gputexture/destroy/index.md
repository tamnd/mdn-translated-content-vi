---
title: "GPUTexture: destroy() method"
short-title: destroy()
slug: Web/API/GPUTexture/destroy
page-type: web-api-instance-method
browser-compat: api.GPUTexture.destroy
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`destroy()`** của giao diện {{domxref("GPUTexture")}} hủy `GPUTexture`.

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
// …

const depthTexture = device.createTexture({
  size: [canvas.width, canvas.height],
  format: "depth24plus",
  usage: GPUTextureUsage.RENDER_ATTACHMENT,
});

// some time later

depthTexture.destroy();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
