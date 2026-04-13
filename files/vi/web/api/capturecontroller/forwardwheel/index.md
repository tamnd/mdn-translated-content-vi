---
title: "CaptureController: phương thức forwardWheel()"
short-title: forwardWheel()
slug: Web/API/CaptureController/forwardWheel
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CaptureController.forwardWheel
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`forwardWheel()`** của giao diện {{domxref("CaptureController")}} bắt đầu chuyển tiếp các sự kiện {{domxref("Element.wheel_event", "wheel")}} phát ra trên phần tử được tham chiếu tới viewport của bề mặt hiển thị đang được chụp có liên kết.

Phương thức `forwardWheel()` phải được gọi thông qua [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation). Cụ thể, chỉ các sự kiện `click` và `input` mới có thể gọi nó thành công. Ngoài ra, người dùng sẽ được hỏi quyền chia sẻ tab khi lần đầu cố gắng chụp màn hình; nếu người dùng cấp quyền, điều này cũng bao gồm quyền cuộn các tab đang được chụp. Nếu quyền liên quan đã ở trạng thái `"granted"` thì không cần kích hoạt tạm thời.

## Syntax

```js-nolint
forwardWheel(element)
```

### Parameters

- `element`
  - : Tham chiếu tới phần tử có các sự kiện `wheel` mà bạn muốn chuyển tiếp tới bề mặt hiển thị đang được chụp có liên kết.

### Return value

Một {{jsxref("Promise")}} hoàn tất với {{jsxref("undefined")}}.

### Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra khi:
    - {{domxref("MediaStream")}} dùng để chụp do lời gọi {{domxref("MediaDevices.getDisplayMedia()")}} ban đầu trả về không còn chụp nữa, ví dụ vì các đối tượng {{domxref("MediaStreamTrack")}} liên kết đã bị gọi {{domxref("MediaStreamTrack.stop", "stop()")}}.
    - Ứng dụng đang tự chụp chính nó.
    - Có một nỗ lực gọi `forwardWheel()` mà không có kích hoạt tạm thời, trong khi người dùng chưa cấp quyền dùng tính năng đó.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi:
    - [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) `{{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}}` của trang không cho phép trang sử dụng Captured Surface Control API.
    - Người dùng đã từ chối rõ ràng quyền chụp bề mặt hiển thị.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Kiểu bề mặt đang được chụp không phải là tab trình duyệt.

## Examples

### Cách dùng `forwardWheel()` cơ bản

Trong bản demo trực tiếp của chúng tôi, được giải thích trong [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control), chúng tôi gọi một hàm tên là `startForwarding()` sau khi promise chụp `getDisplayMedia()` hoàn tất:

```js
// Create controller and start capture
const controller = new CaptureController();
videoElem.srcObject = await navigator.mediaDevices.getDisplayMedia({
  controller,
});

// ...

startForwarding();
```

Hàm này gọi phương thức `forwardWheel()`, truyền vào đó tham chiếu tới phần tử `<video>` mà luồng đã chụp đang được hiển thị trong đó:

```js
async function startForwarding() {
  try {
    await controller.forwardWheel(videoElem);
  } catch (e) {
    console.log(e);
  }
}
```

Kết quả là các sự kiện {{domxref("Element.wheel_event", "wheel")}} phát ra trên phần tử được tham chiếu sẽ được chuyển tiếp tới bề mặt hiển thị đang được chụp, cho phép ứng dụng chụp cuộn bề mặt đó.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
