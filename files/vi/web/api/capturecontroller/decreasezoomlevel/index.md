---
title: "CaptureController: phương thức decreaseZoomLevel()"
short-title: decreaseZoomLevel()
slug: Web/API/CaptureController/decreaseZoomLevel
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CaptureController.decreaseZoomLevel
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`decreaseZoomLevel()`** của giao diện {{domxref("CaptureController")}} giảm mức thu phóng của bề mặt hiển thị đang được chụp xuống một nấc.

Phương thức `decreaseZoomLevel()` phải được gọi thông qua [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation). Ngoài ra, người dùng sẽ được hỏi quyền chia sẻ tab khi lần đầu cố gắng chụp màn hình; nếu người dùng từ chối cấp quyền thì mức thu phóng sẽ không thể thay đổi ngay cả khi có kích hoạt tạm thời.

## Syntax

```js-nolint
decreaseZoomLevel()
```

### Parameters

Không có.

### Return value

Một {{jsxref("Promise")}} hoàn tất với {{jsxref("undefined")}}.

### Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra khi:
    - Bề mặt hiển thị đang được chụp đã ở mức thu phóng tối thiểu mà nó hỗ trợ.
    - Có một nỗ lực gọi `decreaseZoomLevel()` mà không có kích hoạt tạm thời.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi:
    - [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) `{{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}}` của trang không cho phép trang sử dụng Captured Surface Control API.
    - Người dùng đã từ chối rõ ràng quyền chụp bề mặt hiển thị.

## Examples

### Cách dùng `decreaseZoomLevel()` cơ bản

Đoạn mã sau thêm một trình lắng nghe sự kiện vào một nút để khi nút được nhấn, hàm `decreaseZoom()` được gọi. Hàm này sẽ gọi phương thức `decreaseZoomLevel()`, làm thu nhỏ bề mặt đang được chụp.

```js
// Create controller and start capture
const controller = new CaptureController();
videoElem.srcObject = await navigator.mediaDevices.getDisplayMedia({
  controller,
});

// ...

decBtn.addEventListener("click", decreaseZoom);

async function decreaseZoom() {
  try {
    await controller.decreaseZoomLevel();
  } catch (e) {
    console.log(e);
  }
}
```

Nhìn chung, cách làm tốt nhất là gọi `decreaseZoomLevel()` bên trong khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) vì mức thu phóng có thể bị thay đổi không đồng bộ bởi một thực thể khác ngoài ứng dụng, điều này có thể dẫn đến ngoại lệ được ném ra. Ví dụ, người dùng có thể tương tác trực tiếp với bề mặt đang được chụp để phóng to hoặc thu nhỏ.

Xem [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) để có ví dụ đầy đủ đang hoạt động.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
