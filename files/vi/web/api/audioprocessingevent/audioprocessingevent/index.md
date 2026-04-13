---
title: "AudioProcessingEvent: AudioProcessingEvent() constructor"
short-title: AudioProcessingEvent()
slug: Web/API/AudioProcessingEvent/AudioProcessingEvent
page-type: web-api-constructor
status:
  - deprecated
browser-compat: api.AudioProcessingEvent.AudioProcessingEvent
---

{{APIRef("Web Audio API")}}{{Deprecated_header}}

Bộ khởi tạo **`AudioProcessingEvent()`** tạo một đối tượng {{domxref("AudioProcessingEvent")}} mới.

> [!NOTE]
> Thông thường, mã của bạn sẽ không gọi trực tiếp bộ khởi tạo này, vì trình duyệt sẽ tự tạo các đối tượng này và cung cấp chúng cho trình xử lý sự kiện.

## Cú pháp

```js-nolint
new AudioProcessingEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Giá trị này phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó là `audioprocess`.
- `options`
  - : Một đối tượng có các thuộc tính sau:
    - `playbackTime`
      - : Một số biểu diễn thời điểm âm thanh sẽ được phát.
    - `inputBuffer`
      - : Một {{domxref("AudioBuffer")}} chứa dữ liệu âm thanh đầu vào.
    - `outputBuffer`
      - : Một {{domxref("AudioBuffer")}} nơi dữ liệu âm thanh đầu ra sẽ được ghi vào.

### Giá trị trả về

Một {{domxref("AudioProcessingEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioProcessingEvent")}}
- {{domxref("ScriptProcessorNode")}}
