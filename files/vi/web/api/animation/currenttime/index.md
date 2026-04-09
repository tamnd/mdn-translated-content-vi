---
title: "Animation: thuộc tính currentTime"
short-title: currentTime
slug: Web/API/Animation/currentTime
page-type: web-api-instance-property
browser-compat: api.Animation.currentTime
---

{{APIRef("Web Animations")}}

Thuộc tính **`Animation.currentTime`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về và đặt giá trị thời gian hiện tại của hoạt ảnh tính bằng mili giây, dù đang chạy hay đang tạm dừng.

Nếu hoạt ảnh không có {{domxref("AnimationTimeline", "timeline")}}, đang không hoạt động, hoặc chưa từng được phát, giá trị trả về của `currentTime` là `null`.

## Giá trị

Một số biểu diễn thời gian hiện tại tính bằng mili giây, hoặc `null` để vô hiệu hóa hoạt ảnh.

## Ví dụ

Trong trò chơi [Drink Me/Eat Me](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010), chiều cao của Alice được tạo hoạt ảnh để nó có thể chuyển từ nhỏ sang lớn hoặc từ lớn sang nhỏ. Ở đầu trò chơi, chiều cao của cô ấy được đặt vào giữa hai cực trị bằng cách đặt `currentTime` của hoạt ảnh bằng một nửa thời lượng của `KeyframeEffect`:

```js
aliceChange.currentTime = aliceChange.effect.timing.duration / 2;
```

Một cách tổng quát hơn để đưa hoạt ảnh tới mốc 50% là:

```js
animation.currentTime =
  animation.effect.getComputedTiming().delay +
  animation.effect.getComputedTiming().activeDuration / 2;
```

## Độ chính xác thời gian bị giảm

Để bảo vệ khỏi tấn công dựa trên thời gian và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `animation.currentTime` có thể bị làm tròn tùy theo thiết lập trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, khi đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian bị giảm, kết quả của `animation.currentTime` sẽ luôn là bội số của `0.002`, hoặc bội số của `0.1` (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi bật `privacy.resistFingerprinting`.

```js
// độ chính xác thời gian bị giảm (2ms) trong Firefox 60
animation.currentTime;
// Có thể là:
// 23.404
// 24.192
// 25.514
// …

// độ chính xác thời gian bị giảm với `privacy.resistFingerprinting` được bật
animation.currentTime;
// Có thể là:
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

- {{domxref("Animation")}} cho các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh của trang web.
- {{domxref("Animation.startTime")}} cho biết thời điểm hoạt ảnh được lên lịch bắt đầu.
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
