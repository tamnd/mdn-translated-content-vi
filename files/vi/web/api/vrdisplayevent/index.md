---
title: VRDisplayEvent
slug: Web/API/VRDisplayEvent
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayEvent
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VRDisplayEvent`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho đối tượng sự kiện của các sự kiện liên quan đến WebVR (xem [danh sách phần mở rộng cửa sổ WebVR](/en-US/docs/Web/API/WebVR_API#window_events)).

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Hàm khởi tạo

- {{domxref("VRDisplayEvent.VRDisplayEvent", "VRDisplayEvent()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Tạo phiên bản đối tượng `VRDisplayEvent`.

## Thuộc tính phiên bản

_`VRDisplayEvent` cũng kế thừa các thuộc tính từ đối tượng cha {{domxref("Event")}}._

- {{domxref("VRDisplayEvent.display")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : {{domxref("VRDisplay")}} liên quan đến sự kiện này.
- {{domxref("VRDisplayEvent.reason")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Lý do con người có thể đọc được tại sao sự kiện được kích hoạt.

## Ví dụ

```js
window.addEventListener("vrdisplaypresentchange", (e) => {
  console.log(
    `Display ${e.display.displayId} presentation has changed. Reason given: ${e.reason}.`,
  );
});
```

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
