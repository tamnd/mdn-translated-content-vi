---
title: SpeechRecognitionAlternative
slug: Web/API/SpeechRecognitionAlternative
page-type: web-api-interface
browser-compat: api.SpeechRecognitionAlternative
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechRecognitionAlternative`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho một từ duy nhất đã được dịch vụ nhận dạng giọng nói nhận ra.

## Thuộc tính phiên bản

- {{domxref("SpeechRecognitionAlternative.transcript")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa bản ghi của từ được nhận ra.
- {{domxref("SpeechRecognitionAlternative.confidence")}} {{ReadOnlyInline}}
  - : Trả về ước tính số trong khoảng 0 đến 1 về mức độ tự tin của hệ thống nhận dạng giọng nói rằng việc nhận dạng là đúng.

## Ví dụ

Code này được trích từ ví dụ
[Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Nhận được kết quả: ${color}.`;
  bg.style.backgroundColor = color;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
