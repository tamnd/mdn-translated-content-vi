---
title: "CaptureController: thuộc tính zoomLevel"
short-title: zoomLevel
slug: Web/API/CaptureController/zoomLevel
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CaptureController.zoomLevel
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`zoomLevel`** của giao diện {{domxref("CaptureController")}} trả về mức thu phóng hiện tại của bề mặt hiển thị đang được chụp.

## Value

Một số biểu diễn mức thu phóng hiện tại của bề mặt hiển thị đang được chụp.

## Examples

### Cách dùng `zoomLevel` cơ bản

Trong bản demo trực tiếp của chúng tôi, được trình bày trong [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control), chúng tôi dùng thuộc tính `zoomLevel` bên trong hàm xử lý sự kiện cho sự kiện {{domxref("CaptureController.zoomlevelchange_event", "zoomlevelchange")}} của controller. Khi sự kiện phát ra, giá trị `zoomLevel` đã cập nhật sẽ được ghi vào một phần tử `<output>`.

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
