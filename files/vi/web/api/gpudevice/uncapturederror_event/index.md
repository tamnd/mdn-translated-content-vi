---
title: "GPUDevice: sự kiện uncapturederror"
short-title: uncapturederror
slug: Web/API/GPUDevice/uncapturederror_event
page-type: web-api-event
browser-compat: api.GPUDevice.uncapturederror_event
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện **`uncapturederror`** của giao diện {{domxref("GPUDevice")}} được kích hoạt khi có lỗi được ném ra nhưng không bị một GPU error scope nào quan sát, nhằm cung cấp cách báo cáo các lỗi bất ngờ.

## Ví dụ

```js
device.addEventListener("uncapturederror", (event) => {
  console.error(event.error);
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
