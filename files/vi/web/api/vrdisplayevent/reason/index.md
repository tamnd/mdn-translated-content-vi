---
title: "VRDisplayEvent: thuộc tính reason"
short-title: reason
slug: Web/API/VRDisplayEvent/reason
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplayEvent.reason
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`reason`** của giao diện {{domxref("VRDisplayEvent")}} trả về lý do con người có thể đọc được tại sao sự kiện được kích hoạt.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một chuỗi đại diện cho lý do tại sao sự kiện được kích hoạt. Các lý do có sẵn được định nghĩa trong enum [`VRDisplayEventReason`](https://w3c.github.io/webvr/spec/1.1/#interface-vrdisplayeventreason), và như sau:

- `mounted` — {{domxref("VRDisplay")}} đã phát hiện người dùng đã đeo nó vào (hoặc nó đã được kích hoạt theo cách khác).
- `navigation` — Trang đã được điều hướng từ ngữ cảnh cho phép trang này bắt đầu trình bày ngay lập tức, chẳng hạn từ trang khác đã ở chế độ trình bày VR.
- `requested` — Tác nhân người dùng đã yêu cầu bắt đầu chế độ trình bày VR. Điều này cho phép các tác nhân người dùng bao gồm UI nhất quán để vào VR trên các trang khác nhau.
- `unmounted` — {{domxref("VRDisplay")}} đã phát hiện người dùng đã tháo nó ra (hoặc nó đã được đặt ở chế độ ngủ/chờ).

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
