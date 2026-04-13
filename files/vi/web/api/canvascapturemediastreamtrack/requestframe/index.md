---
title: "CanvasCaptureMediaStreamTrack: phương thức requestFrame()"
short-title: requestFrame()
slug: Web/API/CanvasCaptureMediaStreamTrack/requestFrame
page-type: web-api-instance-method
browser-compat: api.CanvasCaptureMediaStreamTrack.requestFrame
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`requestFrame()`** của giao diện {{domxref("CanvasCaptureMediaStreamTrack")}} yêu cầu chụp một khung hình từ canvas và gửi nó tới luồng.

Những ứng dụng cần kiểm soát chặt chẽ thời điểm kết xuất và chụp khung hình có thể dùng `requestFrame()` để chỉ định trực tiếp khi nào cần chụp một khung hình.

Để ngăn việc tự động chụp khung hình, sao cho các khung hình chỉ được chụp khi `requestFrame()` được gọi, hãy chỉ định giá trị `0` cho phương thức {{domxref("HTMLCanvasElement.captureStream", "captureStream()")}} khi tạo luồng.

## Syntax

```js-nolint
requestFrame()
```

### Parameters

Không có.

### Return value

Không có ({{jsxref("undefined")}}).

## Usage notes

Hiện tại có một vấn đề đã được đánh dấu trong đặc tả chỉ ra rằng, ở thời điểm này, sẽ không có ngoại lệ nào được ném ra nếu canvas không phải là origin-clean. Điều này có thể thay đổi trong tương lai, vì vậy nên chuẩn bị trước và theo dõi các ngoại lệ như `SecurityError` (mặc dù lỗi cụ thể có thể được ném ra không được đề cập trong đặc tả, đây là một ứng viên có khả năng cao).

## Example

```js
// Find the canvas element to capture
const canvasElt = document.querySelector("canvas");

// Get the stream
const stream = canvasElt.captureStream(25); // 25 FPS

// Send the current state of the canvas as a frame to the stream
stream.getVideoTracks()[0].requestFrame();
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{domxref("CanvasCaptureMediaStreamTrack")}}, giao diện chứa phương thức này.
- {{HTMLElement("canvas")}}
