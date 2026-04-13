---
title: GPUDeviceLostInfo
slug: Web/API/GPUDeviceLostInfo
page-type: web-api-interface
browser-compat: api.GPUDeviceLostInfo
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUDeviceLostInfo`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho đối tượng được trả về khi {{jsxref("Promise")}} {{domxref("GPUDevice.lost")}} được giải quyết. Nó cung cấp thông tin về lý do tại sao thiết bị bị mất.

Xem trang {{domxref("GPUDevice.lost")}} để biết thêm thông tin về trạng thái "bị mất".

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUDeviceLostInfo.message", "message")}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp thông báo có thể đọc được bởi con người giải thích lý do tại sao thiết bị bị mất.
- {{domxref("GPUDeviceLostInfo.reason", "reason")}} {{ReadOnlyInline}}
  - : Giá trị được liệt kê xác định lý do thiết bị bị mất theo cách máy có thể đọc được.

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

  // Create a GPUDevice
  let device = await adapter.requestDevice(descriptor);

  // Use lost to handle lost devices
  device.lost.then((info) => {
    console.error(`WebGPU device was lost: ${info.message}`);
    device = null;
    if (info.reason !== "destroyed") {
      init();
    }
  });
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
