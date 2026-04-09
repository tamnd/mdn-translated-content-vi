---
title: "CaptureController: phương thức getSupportedZoomLevels()"
short-title: getSupportedZoomLevels()
slug: Web/API/CaptureController/getSupportedZoomLevels
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CaptureController.getSupportedZoomLevels
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getSupportedZoomLevels()`** của giao diện {{domxref("CaptureController")}} trả về các mức thu phóng khác nhau mà bề mặt hiển thị đang được chụp hỗ trợ.

## Syntax

```js-nolint
getSupportedZoomLevels()
```

### Parameters

Không có.

### Return value

Một mảng số biểu diễn các mức thu phóng khác nhau mà bề mặt hiển thị đang được chụp hỗ trợ.

### Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : {{domxref("MediaStream")}} dùng để chụp do lời gọi {{domxref("MediaDevices.getDisplayMedia()")}} ban đầu trả về không còn chụp nữa, ví dụ vì các đối tượng {{domxref("MediaStreamTrack")}} liên kết đã bị gọi {{domxref("MediaStreamTrack.stop", "stop()")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Kiểu bề mặt đang được chụp không phải là tab trình duyệt.

## Examples

### Cách dùng `getSupportedZoomLevels()` cơ bản

Trong bản demo trực tiếp của chúng tôi, được trình bày trong [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control), chúng tôi lấy các mức thu phóng được hỗ trợ của bề mặt hiển thị đang được chụp bằng cách chạy `getSupportedZoomLevels()`, lưu mảng kết quả vào biến tên là `zoomLevels`:

```js
const zoomLevels = controller.getSupportedZoomLevels();
```

Giá trị này về sau được dùng trong một hàm tên là `updateZoomButtonState()`. Vấn đề mà điều này giải quyết là nếu bạn cố thu nhỏ xuống dưới mức thu phóng tối thiểu được hỗ trợ, hoặc phóng to vượt mức tối đa được hỗ trợ, thì {{domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()")}}/{{domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()")}} sẽ ném ra `InvalidStateError` {{domxref("DOMException")}}.

> [!NOTE]
> Nhìn chung, cách làm tốt nhất là gọi `decreaseZoomLevel()` và `increaseZoomLevel()` bên trong khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) vì mức thu phóng có thể bị thay đổi không đồng bộ bởi một thực thể khác ngoài ứng dụng, điều này có thể dẫn đến ngoại lệ được ném ra. Ví dụ, người dùng có thể tương tác trực tiếp với bề mặt đang được chụp để phóng to hoặc thu nhỏ.

Hàm `updateZoomButtonState()` tránh vấn đề này bằng cách trước tiên bảo đảm cả hai nút "Zoom out" và "Zoom in" đều được bật. Sau đó nó thực hiện hai lần kiểm tra:

- Nếu mức thu phóng hiện tại bằng mức thu phóng tối thiểu được hỗ trợ (lưu ở giá trị đầu tiên của mảng `zoomLevels`), chúng tôi vô hiệu hóa nút "Zoom out" để người dùng không thể thu nhỏ thêm nữa.
- Nếu mức thu phóng hiện tại bằng mức thu phóng tối đa được hỗ trợ (lưu ở giá trị cuối cùng của mảng `zoomLevels`), chúng tôi vô hiệu hóa nút "Zoom in" để người dùng không thể phóng to thêm nữa.

```js
function updateZoomButtonState() {
  decBtn.disabled = false;
  incBtn.disabled = false;
  if (controller.zoomLevel === zoomLevels[0]) {
    decBtn.disabled = true;
  } else if (controller.zoomLevel === zoomLevels[zoomLevels.length - 1]) {
    incBtn.disabled = true;
  }
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
