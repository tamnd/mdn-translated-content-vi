---
title: "XRInputSourcesChangeEvent: added property"
short-title: added
slug: Web/API/XRInputSourcesChangeEvent/added
page-type: web-api-instance-property
browser-compat: api.XRInputSourcesChangeEvent.added
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc `added` của {{domxref("XRInputSourcesChangeEvent")}} là danh sách không hoặc nhiều nguồn đầu vào, mỗi nguồn được xác định bằng một đối tượng {{domxref("XRInputSource")}}, đã được làm cho có sẵn để sử dụng.

## Giá trị

Một {{jsxref("Array")}} gồm không hoặc nhiều đối tượng {{domxref("XRInputSource")}}, mỗi đối tượng biểu diễn một thiết bị đầu vào được thêm vào hệ thống XR.

## Ví dụ

Ví dụ dưới đây tạo một trình xử lý cho sự kiện {{domxref("XRSession.inputsourceschange_event", "inputsourceschange")}} xử lý các danh sách thiết bị được thêm vào và xóa khỏi hệ thống WebXR. Nó tìm kiếm các thiết bị mới và bị xóa có {{domxref("XRInputSource.targetRayMode", "targetRayMode")}} là `tracked-pointer`.

```js
xrSession.oninputsourcescchange = (event) => {
  for (const input of event.added) {
    if (input.targetRayMode === "tracked-pointer") {
      addedPointerDevice(input);
    }
  }
  for (const input of event.removed) {
    if (input.targetRayMode === "tracked-pointer") {
      removedPointerDevice(input);
    }
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
