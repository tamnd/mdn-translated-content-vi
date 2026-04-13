---
title: "GPUAdapterInfo: thuộc tính device"
short-title: device
slug: Web/API/GPUAdapterInfo/device
page-type: web-api-instance-property
browser-compat: api.GPUAdapterInfo.device
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`device`** của giao diện {{domxref("GPUAdapterInfo")}} trả về mã định danh dành riêng cho nhà cung cấp của adapter, hoặc chuỗi rỗng nếu không có sẵn.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.device);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
