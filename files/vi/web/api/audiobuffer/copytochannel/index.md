---
title: "AudioBuffer: phương thức copyToChannel()"
short-title: copyToChannel()
slug: Web/API/AudioBuffer/copyToChannel
page-type: web-api-instance-method
browser-compat: api.AudioBuffer.copyToChannel
---

{{ APIRef("Web Audio API") }}

Phương thức `copyToChannel()` của giao diện {{ domxref("AudioBuffer") }} sao chép các mẫu từ mảng nguồn vào kênh được chỉ định của `AudioBuffer`.

## Cú pháp

```js-nolint
copyToChannel(source, channelNumber)
copyToChannel(source, channelNumber, startInChannel)
```

### Tham số

- `source`
  - : Một {{jsxref("Float32Array")}} mà dữ liệu kênh sẽ được sao chép từ đó.
- `channelNumber`
  - : Số thứ tự kênh của {{domxref("AudioBuffer")}} hiện tại để sao chép dữ liệu kênh vào. Nếu _channelNumber_ lớn hơn hoặc bằng {{domxref("AudioBuffer.numberOfChannels")}}, một `INDEX_SIZE_ERR` sẽ được ném ra.
- `startInChannel` {{optional_inline}}
  - : Độ lệch tùy chọn để sao chép dữ liệu vào. Nếu _startInChannel_ lớn hơn {{domxref("AudioBuffer.length")}}, một `INDEX_SIZE_ERR` sẽ được ném ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const myArrayBuffer = audioCtx.createBuffer(2, frameCount, audioCtx.sampleRate);
const anotherArray = new Float32Array();
// Sao chép dữ liệu kênh từ kênh thứ hai của myArrayBuffer.
myArrayBuffer.copyFromChannel(anotherArray, 1, 0);
// Sao chép dữ liệu từ anotherArray vào kênh đầu tiên của myArrayBuffer.
// Giờ đây cả hai kênh đều có cùng dữ liệu.
myArrayBuffer.copyToChannel(anotherArray, 0, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
