---
title: "AnimationTimeline: thuộc tính currentTime"
short-title: currentTime
slug: Web/API/AnimationTimeline/currentTime
page-type: web-api-instance-property
browser-compat: api.AnimationTimeline.currentTime
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`currentTime`** của giao diện {{domxref("AnimationTimeline")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về thời gian hiện tại của timeline tính bằng mili giây, hoặc `null` nếu timeline đang không hoạt động.

## Giá trị

Một số biểu diễn thời gian hiện tại của timeline tính bằng mili giây, hoặc `null` nếu timeline đang không hoạt động.

## Độ chính xác thời gian bị giảm

Để bảo vệ khỏi tấn công dựa trên thời gian và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `animationTimeline.currentTime` có thể bị làm tròn tùy theo thiết lập trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, khi đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian bị giảm, kết quả của `animationTimeline.currentTime` sẽ luôn là bội số của 0.002, hoặc bội số của 0.1 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi bật `privacy.resistFingerprinting`.

```js
// reduced time precision (2ms) in Firefox 60
animationTimeline.currentTime;
// Might be:
// 23.404
// 24.192
// 25.514
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
animationTimeline.currentTime;
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
- {{domxref("AnimationTimeline")}}
- {{domxref("DocumentTimeline")}} kế thừa thuộc tính này
- {{domxref("Document.timeline")}} trả về một đối tượng timeline kế thừa thuộc tính này
