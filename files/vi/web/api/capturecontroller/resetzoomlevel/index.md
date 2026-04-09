---
title: "CaptureController: phương thức resetZoomLevel()"
short-title: resetZoomLevel()
slug: Web/API/CaptureController/resetZoomLevel
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CaptureController.resetZoomLevel
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`resetZoomLevel()`** của giao diện {{domxref("CaptureController")}} đặt lại mức thu phóng của bề mặt hiển thị đang được chụp về mức ban đầu là `100`.

Phương thức `resetZoomLevel()` phải được gọi thông qua [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation). Ngoài ra, người dùng sẽ được hỏi quyền chia sẻ tab khi lần đầu cố gắng chụp màn hình; nếu người dùng từ chối cấp quyền thì mức thu phóng sẽ không thể thay đổi ngay cả khi có kích hoạt tạm thời.

## Syntax

```js-nolint
resetZoomLevel()
```

### Parameters

Không có.

### Return value

Một {{jsxref("Promise")}} hoàn tất với {{jsxref("undefined")}}.

### Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Có một nỗ lực gọi `resetZoomLevel()` mà không có kích hoạt tạm thời.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi:
    - [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) `{{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}}` của trang không cho phép trang sử dụng Captured Surface Control API.
    - Người dùng đã từ chối rõ ràng quyền chụp bề mặt hiển thị.

## Examples

### Cách dùng `resetZoomLevel()` cơ bản

Đoạn mã sau thêm một trình lắng nghe sự kiện vào một nút để khi nút được nhấn, hàm `resetZoom()` được gọi. Hàm này sẽ gọi phương thức `resetZoomLevel()`, đặt lại mức thu phóng của bề mặt đang được chụp về `100`.

```js
// Create controller and start capture
const controller = new CaptureController();
videoElem.srcObject = await navigator.mediaDevices.getDisplayMedia({
  controller,
});

// ...

resetBtn.addEventListener("click", resetZoom);

async function resetZoom() {
  await controller.resetZoomLevel();
}
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
