---
title: "GPUAdapter: isFallbackAdapter property"
short-title: isFallbackAdapter
slug: Web/API/GPUAdapter/isFallbackAdapter
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.GPUAdapter.isFallbackAdapter
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}{{deprecated_header}}{{non-standard_header}}

Thuộc tính chỉ đọc **`isFallbackAdapter`** của giao diện {{domxref("GPUAdapter")}} trả về `true` nếu bộ điều hợp là [fallback adapter](/en-US/docs/Web/API/GPU/requestAdapter#fallback_adapters), và `false` nếu không.

Thuộc tính này đã bị xóa khỏi nền tảng web. Hãy dùng {{domxref("GPUAdapterInfo.isFallbackAdapter")}} thay thế.

## Giá trị

Giá trị boolean.

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

  const isFallback = adapter.isFallbackAdapter;
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
