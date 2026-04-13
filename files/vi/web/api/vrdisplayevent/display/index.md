---
title: "VRDisplayEvent: thuộc tính display"
short-title: display
slug: Web/API/VRDisplayEvent/display
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayEvent.display
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`display`** của giao diện {{domxref("VRDisplayEvent")}} trả về {{domxref("VRDisplay")}} liên quan đến sự kiện này.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một đối tượng {{domxref("VRDisplay")}}.

## Ví dụ

```js
window.addEventListener("vrdisplaypresentchange", (e) => {
  console.log(
    `Display ${e.display.displayId} presentation has changed. Reason given: ${e.reason}.`,
  );
});
```

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
