---
title: "AudioParam: phương thức cancelScheduledValues()"
short-title: cancelScheduledValues()
slug: Web/API/AudioParam/cancelScheduledValues
page-type: web-api-instance-method
browser-compat: api.AudioParam.cancelScheduledValues
---

{{ APIRef("Web Audio API") }}

Phương thức `cancelScheduledValues()` của giao diện {{ domxref("AudioParam") }} hủy mọi thay đổi trong tương lai đã được lên lịch cho `AudioParam`.

## Cú pháp

```js-nolint
cancelScheduledValues(startTime)
```

### Tham số

- `startTime`
  - : Một số thực kép biểu diễn thời điểm (tính bằng giây) kể từ sau khi {{ domxref("AudioContext") }} được tạo lần đầu, sau đó mọi thay đổi đã lên lịch sẽ bị hủy.

### Giá trị trả về

Tham chiếu đến đối tượng `AudioParam` này. Trong một số cách triển khai cũ hơn, phương thức này trả về {{jsxref('undefined')}}.

## Ví dụ

```js
const gainNode = audioCtx.createGain();
gainNode.gain.setValueCurveAtTime(waveArray, audioCtx.currentTime, 2); // 'gain' là AudioParam
gainNode.gain.cancelScheduledValues(audioCtx.currentTime);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
