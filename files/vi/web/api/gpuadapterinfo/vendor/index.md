---
title: "GPUAdapterInfo: thuộc tính vendor"
short-title: vendor
slug: Web/API/GPUAdapterInfo/vendor
page-type: web-api-instance-property
browser-compat: api.GPUAdapterInfo.vendor
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`vendor`** của giao diện {{domxref("GPUAdapterInfo")}} trả về tên của nhà cung cấp adapter, hoặc chuỗi rỗng nếu không có sẵn.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.vendor);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
