---
title: "GPUAdapter: info property"
short-title: info
slug: Web/API/GPUAdapter/info
page-type: web-api-instance-property
browser-compat: api.GPUAdapter.info
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`info`** của giao diện {{domxref("GPUAdapter")}} trả về một đối tượng {{domxref("GPUAdapterInfo")}} chứa thông tin nhận diện về bộ điều hợp.

## Giá trị

Một phiên bản đối tượng {{domxref("GPUAdapterInfo")}}.

## Ví dụ

### Sử dụng info cơ bản

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.vendor);
console.log(adapterInfo.architecture);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
