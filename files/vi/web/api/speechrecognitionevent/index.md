---
title: SpeechRecognitionEvent
slug: Web/API/SpeechRecognitionEvent
page-type: web-api-interface
browser-compat: api.SpeechRecognitionEvent
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechRecognitionEvent`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho đối tượng sự kiện cho các sự kiện {{domxref("SpeechRecognition.result_event", "result")}} và {{domxref("SpeechRecognition.nomatch_event", "nomatch")}}, và chứa tất cả dữ liệu liên quan đến kết quả nhận dạng giọng nói tạm thời hoặc cuối cùng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SpeechRecognitionEvent.SpeechRecognitionEvent", "SpeechRecognitionEvent()")}}
  - : Tạo đối tượng `SpeechRecognitionEvent` mới.

## Thuộc tính phiên bản

_`SpeechRecognitionEvent` cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("SpeechRecognitionEvent.resultIndex")}} {{ReadOnlyInline}}
  - : Trả về giá trị chỉ số kết quả thấp nhất trong "mảng" {{domxref("SpeechRecognitionResultList")}} đã thực sự thay đổi.
- {{domxref("SpeechRecognitionEvent.results")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("SpeechRecognitionResultList")}} đại diện cho tất cả kết quả nhận dạng giọng nói cho phiên hiện tại.

## Ví dụ

Mã này được trích xuất từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
