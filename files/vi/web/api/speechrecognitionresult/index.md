---
title: SpeechRecognitionResult
slug: Web/API/SpeechRecognitionResult
page-type: web-api-interface
browser-compat: api.SpeechRecognitionResult
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechRecognitionResult`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho một kết quả nhận dạng đơn lẻ, có thể chứa nhiều đối tượng {{domxref("SpeechRecognitionAlternative")}}.

## Thuộc tính phiên bản

- {{domxref("SpeechRecognitionResult.isFinal")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết kết quả này có phải là kết quả cuối cùng hay không (true) hoặc không (false). Nếu có, đây là lần cuối cùng kết quả này được trả về; nếu không, thì đây là kết quả tạm thời và có thể được cập nhật sau này.
- {{domxref("SpeechRecognitionResult.length")}} {{ReadOnlyInline}}
  - : Trả về độ dài của "mảng", tức là số lượng đối tượng {{domxref("SpeechRecognitionAlternative")}} có trong kết quả (còn được gọi là "n phương án tốt nhất").

## Phương thức phiên bản

- {{domxref("SpeechRecognitionResult.item")}}
  - : Một getter tiêu chuẩn cho phép truy cập các đối tượng {{domxref("SpeechRecognitionAlternative")}} trong kết quả thông qua cú pháp mảng.

## Ví dụ

Đoạn mã này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

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
