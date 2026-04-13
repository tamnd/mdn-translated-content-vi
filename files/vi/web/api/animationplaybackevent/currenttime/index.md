---
title: "AnimationPlaybackEvent: thuộc tính currentTime"
short-title: currentTime
slug: Web/API/AnimationPlaybackEvent/currentTime
page-type: web-api-instance-property
browser-compat: api.AnimationPlaybackEvent.currentTime
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`currentTime`** của giao diện {{domxref("AnimationPlaybackEvent")}} biểu diễn thời gian hiện tại của hoạt ảnh đã tạo ra sự kiện tại thời điểm sự kiện được đưa vào hàng đợi. Giá trị này sẽ chưa được giải quyết nếu hoạt ảnh ở trạng thái `idle` tại thời điểm sự kiện được tạo.

## Giá trị

Một số biểu diễn thời gian hiện tại tính bằng mili giây, hoặc `null`.

## Độ chính xác thời gian bị giảm

Để bảo vệ khỏi tấn công dựa trên thời gian và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `playbackEvent.currentTime` có thể bị làm tròn tùy theo thiết lập trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, khi đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian bị giảm, kết quả của `playbackEvent.currentTime` sẽ luôn là bội số của 0.002, hoặc bội số của 0.1 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi bật `privacy.resistFingerprinting`.

```js
// reduced time precision (2ms) in Firefox 60
playbackEvent.currentTime;
// Might be:
// 23.404
// 24.192
// 25.514
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
playbackEvent.currentTime;
// Might be:
// 49.8
// 50.6
// 51.7
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationPlayBackEvent")}}
