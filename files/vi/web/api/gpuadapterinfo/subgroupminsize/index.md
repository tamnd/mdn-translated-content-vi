---
title: "GPUAdapterInfo: thuộc tính subgroupMinSize"
short-title: subgroupMinSize
slug: Web/API/GPUAdapterInfo/subgroupMinSize
page-type: web-api-instance-property
browser-compat: api.GPUAdapterInfo.subgroupMinSize
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`subgroupMinSize`** của giao diện {{domxref("GPUAdapterInfo")}} trả về kích thước [subgroup](https://gpuweb.github.io/gpuweb/wgsl/#subgroup-size) tối thiểu được hỗ trợ cho {{domxref("GPUAdapter")}}. Thuộc tính này có thể được sử dụng cùng với tính năng `subgroups` của [GPUSupportedFeatures](/en-US/docs/Web/API/GPUSupportedFeatures).

## Giá trị

Một số.

## Ví dụ

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.subgroupMinSize);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
