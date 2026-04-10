---
title: "SpeechRecognition: Thuộc tính processLocally"
short-title: processLocally
slug: Web/API/SpeechRecognition/processLocally
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SpeechRecognition.processLocally
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Thuộc tính **`processLocally`** của giao diện {{domxref("SpeechRecognition")}} chỉ định việc nhận dạng giọng nói phải được thực hiện cục bộ trên thiết bị của người dùng.

Xem [Nhận dạng giọng nói trên thiết bị](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) để biết thêm thông tin.

## Giá trị

Một giá trị boolean.

- Nếu được thiết lập thành `true`, việc nhận dạng giọng nói thông qua đối tượng `SpeechRecognition` phải được thực hiện cục bộ.
- Nếu được thiết lập thành `false` (mặc định), tác nhân người dùng có thể chọn việc xử lý cục bộ hay từ xa.

## Ví dụ

### Sử dụng cơ bản

Đoạn mã sau tạo một thể hiện đối tượng `SpeechRecognition` mới bằng cách sử dụng bộ khởi tạo {{domxref("SpeechRecognition.SpeechRecognition", "SpeechRecognition()")}}, sau đó chỉ định rằng nó nên sử dụng xử lý cục bộ bằng cách thiết lập `processLocally` thành `true`:

```js
const recognition = new SpeechRecognition();
recognition.processLocally = true;
```

Đoạn mã này được trích từ ví dụ [on-device speech color changer](https://github.com/mdn/dom-examples/tree/main/web-speech-api/on-device-speech-color-changer) ([chạy demo trực tiếp](https://mdn.github.io/dom-examples/web-speech-api/on-device-speech-color-changer/)). Xem [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API) để biết giải thích đầy đủ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
