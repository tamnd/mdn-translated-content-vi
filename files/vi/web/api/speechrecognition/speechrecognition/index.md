---
title: "SpeechRecognition: Bộ khởi tạo SpeechRecognition()"
short-title: SpeechRecognition()
slug: Web/API/SpeechRecognition/SpeechRecognition
page-type: web-api-constructor
browser-compat: api.SpeechRecognition.SpeechRecognition
---

{{APIRef("Web Speech API")}}

Bộ khởi tạo **`SpeechRecognition()`** tạo một thể hiện đối tượng {{domxref("SpeechRecognition")}} mới.

## Cú pháp

```js-nolint
new SpeechRecognition()
```

### Tham số

Không có.

## Ví dụ

Đoạn mã này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng ta.

```js
const recognition = new SpeechRecognition();
recognition.lang = "en-US";
recognition.interimResults = false;
recognition.maxAlternatives = 1;

// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
