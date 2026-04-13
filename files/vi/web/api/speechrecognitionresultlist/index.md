---
title: SpeechRecognitionResultList
slug: Web/API/SpeechRecognitionResultList
page-type: web-api-interface
browser-compat: api.SpeechRecognitionResultList
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechRecognitionResultList`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho danh sách các đối tượng {{domxref("SpeechRecognitionResult")}}, hoặc một đối tượng duy nhất nếu các kết quả đang được chụp ở chế độ {{domxref("SpeechRecognition.continuous","non-continuous")}}.

## Thuộc tính phiên bản

- {{domxref("SpeechRecognitionResultList.length")}} {{ReadOnlyInline}}
  - : Trả về độ dài của "mảng" — số lượng đối tượng {{domxref("SpeechRecognitionResult")}} trong danh sách.

## Phương thức phiên bản

- {{domxref("SpeechRecognitionResultList.item")}}
  - : Một getter tiêu chuẩn cho phép truy cập các đối tượng {{domxref("SpeechRecognitionResult")}} trong danh sách qua cú pháp mảng.

## Ví dụ

Code này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

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
