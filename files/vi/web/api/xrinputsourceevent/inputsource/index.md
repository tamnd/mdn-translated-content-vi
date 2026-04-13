---
title: "XRInputSourceEvent: thuộc tính inputSource"
short-title: inputSource
slug: Web/API/XRInputSourceEvent/inputSource
page-type: web-api-instance-property
browser-compat: api.XRInputSourceEvent.inputSource
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`inputSource`** của giao diện {{domxref("XRInputSourceEvent")}} chỉ định {{domxref("XRInputSource")}} đã tạo ra sự kiện đầu vào. Thông tin này cho phép bạn xử lý sự kiện phù hợp với các đặc điểm cụ thể của thiết bị đầu vào người dùng đang được thao tác.

## Giá trị

Một đối tượng {{domxref("XRInputSource")}} xác định nguồn gốc của sự kiện đầu vào người dùng. Sự kiện này cho biết một hành động người dùng đã thực hiện bằng bộ điều khiển đầu vào WebXR, chẳng hạn như bộ điều khiển cầm tay, thiết bị cảm biến chuyển động, hoặc thiết bị đầu vào khác.

## Ví dụ

Đoạn mã dưới đây hiển thị trình xử lý cho sự kiện {{domxref("XRSession.select_event", "select")}} tìm kiếm cụ thể các sự kiện xảy ra trên các thiết bị đầu vào `gaze`. Loại thiết bị được xác định bằng cách xem {{domxref("XRInputSource")}} trong `inputSource` và thuộc tính {{domxref("XRInputSource.targetRayMode", "targetRayMode")}} của nó.

```js
xrSession.onselect = (event) => {
  let source = event.inputSource;

  if (source.targetRayMode === "gaze") {
    /* handle selection using a gaze input */
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
