---
title: CaptureController
slug: Web/API/CaptureController
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CaptureController
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`CaptureController`** cung cấp các phương thức có thể dùng để thao tác thêm trên một bề mặt hiển thị đang được chụp lại (được chụp qua {{domxref("MediaDevices.getDisplayMedia()")}})

Một đối tượng `CaptureController` được liên kết với một bề mặt hiển thị đang được chụp bằng cách truyền nó vào lời gọi `getDisplayMedia()` làm giá trị của thuộc tính `controller` trong đối tượng tùy chọn.

## Constructor

- {{ domxref("CaptureController.CaptureController", "CaptureController()") }} {{Experimental_Inline}}
  - : Tạo một thể hiện đối tượng `CaptureController` mới.

## Instance properties

- {{ domxref("CaptureController.zoomLevel", "zoomLevel") }} {{Experimental_Inline}}
  - : Mức thu phóng hiện tại của bề mặt hiển thị đang được chụp.

## Instance methods

- {{ domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()") }} {{Experimental_Inline}}
  - : Giảm mức thu phóng của bề mặt hiển thị đang được chụp xuống một nấc.
- {{ domxref("CaptureController.forwardWheel", "forwardWheel()") }} {{Experimental_Inline}}
  - : Bắt đầu chuyển tiếp các sự kiện {{domxref("Element.wheel_event", "wheel")}} phát ra trên phần tử được tham chiếu tới viewport của một bề mặt hiển thị đang được chụp có liên kết.
- {{ domxref("CaptureController.getSupportedZoomLevels", "getSupportedZoomLevels()") }} {{Experimental_Inline}}
  - : Trả về các mức thu phóng khác nhau mà bề mặt hiển thị đang được chụp hỗ trợ.
- {{ domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()") }} {{Experimental_Inline}}
  - : Tăng mức thu phóng của bề mặt hiển thị đang được chụp lên một nấc.
- {{ domxref("CaptureController.resetZoomLevel", "resetZoomLevel()") }} {{Experimental_Inline}}
  - : Đặt lại mức thu phóng của bề mặt hiển thị đang được chụp về mức ban đầu là `100`.
- {{ domxref("CaptureController.setFocusBehavior", "setFocusBehavior()") }} {{Experimental_Inline}}
  - : Kiểm soát việc tab hoặc cửa sổ đang được chụp có được nhận tiêu điểm hay tiêu điểm sẽ vẫn nằm ở tab chứa ứng dụng chụp.

## Events

- {{ domxref("CaptureController.zoomlevelchange_event", "zoomlevelchange") }} {{Experimental_Inline}}
  - : Phát ra khi mức thu phóng của bề mặt hiển thị đang được chụp thay đổi.

## Examples

```js
// Create a new CaptureController instance
const controller = new CaptureController();

// Prompt the user to share a tab, window, or screen.
const stream = await navigator.mediaDevices.getDisplayMedia({ controller });

// Query the displaySurface value of the captured video track
const [track] = stream.getVideoTracks();
const displaySurface = track.getSettings().displaySurface;

if (displaySurface === "browser") {
  // Focus the captured tab.
  controller.setFocusBehavior("focus-captured-surface");
} else if (displaySurface === "window") {
  // Do not move focus to the captured window.
  // Keep the capturing page focused.
  controller.setFocusBehavior("no-focus-change");
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
- [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
- [Better screen sharing with Conditional Focus](https://developer.chrome.com/docs/web-platform/conditional-focus/)
