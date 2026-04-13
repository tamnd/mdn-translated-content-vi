---
title: "GPUAdapterInfo: thuộc tính isFallbackAdapter"
short-title: isFallbackAdapter
slug: Web/API/GPUAdapterInfo/isFallbackAdapter
page-type: web-api-instance-property
browser-compat: api.GPUAdapterInfo.isFallbackAdapter
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`isFallbackAdapter`** của giao diện {{domxref("GPUAdapterInfo")}} trả về `true` nếu adapter là [fallback adapter](/en-US/docs/Web/API/GPU/requestAdapter#fallback_adapters), và `false` nếu không phải.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
async function init() {
  if (!navigator.gpu) {
    throw Error("WebGPU not supported.");
  }

  const adapter = await navigator.gpu.requestAdapter();
  if (!adapter) {
    throw Error("Couldn't request WebGPU adapter.");
  }

  const isFallback = adapter.info.isFallbackAdapter;
  console.log(isFallback);

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
