---
title: "CaptureController: phương thức setFocusBehavior()"
short-title: setFocusBehavior()
slug: Web/API/CaptureController/setFocusBehavior
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CaptureController.setFocusBehavior
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`setFocusBehavior()`** của giao diện {{domxref("CaptureController")}} kiểm soát việc tab hoặc cửa sổ đang được chụp có được nhận tiêu điểm khi {{jsxref("Promise")}} của {{domxref("MediaDevices.getDisplayMedia()")}} liên kết hoàn tất hay không, hoặc tiêu điểm sẽ tiếp tục nằm ở tab chứa ứng dụng chụp.

Bạn có thể đặt hành vi này nhiều lần trước lời gọi {{domxref("MediaDevices.getDisplayMedia()")}}, hoặc một lần ngay sau khi `Promise` của nó được giải quyết. Sau thời điểm đó, hành vi tiêu điểm được coi là đã được chốt và không thể thay đổi nữa.

## Syntax

```js-nolint
setFocusBehavior(focusBehavior)
```

### Parameters

- `focusBehavior`
  - : Một giá trị liệt kê mô tả việc user agent nên chuyển tiêu điểm sang bề mặt hiển thị đang được chụp hay giữ tiêu điểm ở ứng dụng chụp. Các giá trị có thể là `focus-captured-surface` (chuyển tiêu điểm) và `no-focus-change` (giữ tiêu điểm ở ứng dụng chụp).

### Return value

Không có (`undefined`).

### Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Luồng chụp đã bị dừng.
    - Người dùng chọn chia sẻ một màn hình (kiểu {{domxref("MediaTrackSettings.displaySurface", "displaySurface")}} là `monitor`) thay vì tab `browser` hoặc `window`; bạn không thể đặt tiêu điểm cho một màn hình. Trong trường hợp này, ngoại lệ được ném ra sau khi `Promise` của {{domxref("MediaDevices.getDisplayMedia()")}} được giải quyết.
    - Đã trôi qua đủ thời gian sau khi `Promise` của {{domxref("MediaDevices.getDisplayMedia()")}} hoàn tất để hành vi tiêu điểm được chốt lại.

## Examples

### Cách dùng `setFocusBehavior()` cơ bản

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
- [Better screen sharing with Conditional Focus](https://developer.chrome.com/docs/web-platform/conditional-focus/)
