---
title: "CaptureController: sự kiện zoomlevelchange"
short-title: zoomlevelchange
slug: Web/API/CaptureController/zoomlevelchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.CaptureController.zoomlevelchange_event
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}

Sự kiện **`zoomlevelchange`** của giao diện {{domxref("CaptureController")}} được phát ra khi mức thu phóng của bề mặt hiển thị đang được chụp thay đổi.

Cụ thể, điều này xảy ra khi:

- Các phương thức {{domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()")}}, {{domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()")}}, hoặc {{domxref("CaptureController.resetZoomLevel", "resetZoomLevel()")}} được gọi trên một controller đang chủ động điều khiển một bề mặt hiển thị đang được chụp.
- Người dùng thay đổi mức thu phóng trong bề mặt đang được chụp.
- Người dùng thay đổi bề mặt hiển thị đang được chụp sang một bề mặt khác có mức thu phóng khác.

## Syntax

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("zoomlevelchange", (event) => { })

onzoomlevelchange = (event) => { }
```

## Event type

Một {{domxref("Event")}} chung.

## Examples

### Cách dùng `zoomlevelchange` cơ bản

Khi mức thu phóng của một bề mặt hiển thị đang được chụp thay đổi, một sự kiện `zoomlevelchange` sẽ phát ra trên controller, và có thể được dùng để chạy một trình xử lý sự kiện như sau. Đoạn mã này ghi mức thu phóng đã cập nhật vào một phần tử output nào đó.

```js
// Create controller and start capture
const controller = new CaptureController();
videoElem.srcObject = await navigator.mediaDevices.getDisplayMedia({
  controller,
});

// ...

controller.addEventListener(
  "zoomlevelchange",
  () => (outputElem.textContent = `${controller.zoomLevel}%`),
);
```

Xem [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) để có ví dụ đầy đủ đang hoạt động.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
