---
title: "GPUAdapterInfo: thuộc tính architecture"
short-title: architecture
slug: Web/API/GPUAdapterInfo/architecture
page-type: web-api-instance-property
browser-compat: api.GPUAdapterInfo.architecture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`architecture`** của giao diện {{domxref("GPUAdapterInfo")}} trả về tên của họ hoặc lớp GPU mà adapter thuộc về, hoặc chuỗi rỗng nếu không có sẵn.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.architecture);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
