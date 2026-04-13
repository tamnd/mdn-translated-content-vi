---
title: "SpeechRecognitionEvent: hàm khởi tạo SpeechRecognitionEvent()"
short-title: SpeechRecognitionEvent()
slug: Web/API/SpeechRecognitionEvent/SpeechRecognitionEvent
page-type: web-api-constructor
browser-compat: api.SpeechRecognitionEvent.SpeechRecognitionEvent
---

{{APIRef("Web Speech API")}}

Hàm khởi tạo **`SpeechRecognitionEvent()`** tạo phiên bản đối tượng {{domxref("SpeechRecognitionEvent")}} mới.

## Cú pháp

```js-nolint
new SpeechRecognitionEvent(type, init)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện. Sẽ là `result` hoặc `nomatch`, tùy thuộc vào sự kiện tạo ra phiên bản này.
- `init`
  - : Đối tượng khởi tạo chứa các thuộc tính:
    - `resultIndex` {{optional_inline}}
      - : Số đại diện cho giá trị chỉ số kết quả thấp nhất trong phiên bản {{domxref("SpeechRecognitionResultList")}} đã thực sự thay đổi.
    - `results`
      - : Đối tượng {{domxref("SpeechRecognitionResultList")}} đại diện cho tất cả kết quả nhận dạng giọng nói được trả về trong sự kiện liên quan.

## Ví dụ

Bạn hiếm khi phải tạo phiên bản `SpeechRecognitionEvent` thủ công. Các phiên bản như vậy có sẵn dưới dạng đối tượng sự kiện bên trong các hàm xử lý sự kiện `result` và `nomatch`.

Ví dụ:

```js
recognition.addEventListener("result", (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
  console.log(`Confidence: ${event.results[0][0].confidence}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
