---
title: "XRSessionEvent: thuộc tính session"
short-title: session
slug: Web/API/XRSessionEvent/session
page-type: web-api-instance-property
browser-compat: api.XRSessionEvent.session
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`session`** của giao diện {{domxref("XRSessionEvent")}} cho biết {{domxref("XRSession")}} nào mà sự kiện liên quan đến.

## Giá trị

Một đối tượng {{domxref("XRSession")}} cho biết phiên WebXR mà sự kiện tham chiếu đến.

## Ví dụ

Trong ví dụ này, thuộc tính `session` được sử dụng để lấy đối tượng phiên để quản lý khi nhận được sự kiện.

```js
xrSession.addEventListener("visibilitychange", (e) => {
  switch (e.session.visibilityState) {
    case "hidden":
      myEnableRendering(true);
      break;
    case "visible":
    case "visible-blurred":
      myEnableRendering(false);
      break;
  }
});
```

Điều này gọi một hàm phản ứng với sự thay đổi trạng thái hiển thị của phiên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
