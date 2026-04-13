---
title: "GPUAdapterInfo: thuộc tính description"
short-title: description
slug: Web/API/GPUAdapterInfo/description
page-type: web-api-instance-property
browser-compat: api.GPUAdapterInfo.description
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`description`** của giao diện {{domxref("GPUAdapterInfo")}} trả về một chuỗi mô tả adapter có thể đọc được bởi con người, hoặc chuỗi rỗng nếu không có sẵn.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.description);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
