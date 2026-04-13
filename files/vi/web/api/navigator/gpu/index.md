---
title: "Navigator: thuộc tính gpu"
short-title: gpu
slug: Web/API/Navigator/gpu
page-type: web-api-instance-property
browser-compat: api.Navigator.gpu
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`Navigator.gpu`** trả về đối tượng {{domxref("GPU")}} cho ngữ cảnh duyệt hiện tại, đây là điểm vào cho {{domxref("WebGPU_API", "WebGPU API", "", "nocode")}}.

## Giá trị

Đối tượng {{domxref("GPU")}}.

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

  const device = await adapter.requestDevice();

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGPU_API", "WebGPU API", "", "nocode")}}
