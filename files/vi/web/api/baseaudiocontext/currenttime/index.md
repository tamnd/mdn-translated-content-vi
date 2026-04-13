---
title: "BaseAudioContext: thuộc tính currentTime"
short-title: currentTime
slug: Web/API/BaseAudioContext/currentTime
page-type: web-api-instance-property
browser-compat: api.BaseAudioContext.currentTime
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc `currentTime` của giao diện {{ domxref("BaseAudioContext") }}
trả về một số double biểu diễn dấu thời gian phần cứng tính bằng giây, luôn tăng dần, có thể được dùng để lập lịch phát âm thanh, trực quan hóa dòng thời gian, v.v. Giá trị bắt đầu từ 0.

## Giá trị

Một số dấu phẩy động.

## Ví dụ

```js
const audioCtx = new AudioContext();
// Các trình duyệt webkit/blink cũ yêu cầu tiền tố

// …

console.log(audioCtx.currentTime);
```

## Giảm độ chính xác thời gian

Để bảo vệ khỏi các cuộc tấn công định thời và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `audioCtx.currentTime` có thể bị làm tròn tùy theo cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`; khi đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, khi giảm độ chính xác thời gian, kết quả của `audioCtx.currentTime` sẽ luôn là bội số của 0,002, hoặc là bội số của 0,1 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi `privacy.resistFingerprinting` được bật.

```js
// độ chính xác thời gian bị giảm (2ms) trong Firefox 60
audioCtx.currentTime;
// Có thể là:
// 23.404
// 24.192
// 25.514
// …

// độ chính xác thời gian bị giảm khi `privacy.resistFingerprinting` được bật
audioCtx.currentTime;
// Có thể là:
// 49.8
// 50.6
// 51.7
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
