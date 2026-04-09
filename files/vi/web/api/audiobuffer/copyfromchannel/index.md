---
title: "AudioBuffer: phương thức copyFromChannel()"
short-title: copyFromChannel()
slug: Web/API/AudioBuffer/copyFromChannel
page-type: web-api-instance-method
browser-compat: api.AudioBuffer.copyFromChannel
---

{{APIRef("Web Audio API")}}

Phương thức **`copyFromChannel()`** của giao diện {{domxref("AudioBuffer")}} sao chép dữ liệu mẫu âm thanh từ kênh được chỉ định của `AudioBuffer` sang một {{jsxref("Float32Array")}} được chỉ định.

## Cú pháp

```js-nolint
copyFromChannel(destination, channelNumber, startInChannel)
```

### Tham số

- `destination`
  - : Một {{jsxref("Float32Array")}} để sao chép các mẫu của kênh vào.
- `channelNumber`
  - : Số thứ tự kênh của `AudioBuffer` hiện tại để sao chép dữ liệu kênh từ đó.
- `startInChannel` {{optional_inline}}
  - : Độ lệch tùy chọn vào bộ đệm của kênh nguồn, từ đó bắt đầu sao chép các mẫu. Nếu không chỉ định, giá trị mặc định được giả định là 0 (đầu bộ đệm).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `indexSizeError`
  - : Một trong các tham số đầu vào có giá trị nằm ngoài phạm vi chấp nhận:
    - Giá trị của `channelNumber` chỉ định một số kênh không tồn tại (tức là lớn hơn hoặc bằng giá trị {{domxref("AudioBuffer.numberOfChannels", "numberOfChannels")}} của bộ đệm).
    - Giá trị của `startInChannel` nằm ngoài phạm vi mẫu hiện có trong bộ đệm nguồn; tức là lớn hơn {{domxref("AudioBuffer.length", "length")}} hiện tại của nó.

## Ví dụ

Ví dụ này tạo một bộ đệm âm thanh mới, sau đó sao chép các mẫu từ một kênh khác vào đó.

```js
const myArrayBuffer = audioCtx.createBuffer(2, frameCount, audioCtx.sampleRate);
const anotherArray = new Float32Array(length);
myArrayBuffer.copyFromChannel(anotherArray, 1, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
