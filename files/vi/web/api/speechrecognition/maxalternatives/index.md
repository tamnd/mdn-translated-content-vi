---
title: "SpeechRecognition: Thuộc tính maxAlternatives"
short-title: maxAlternatives
slug: Web/API/SpeechRecognition/maxAlternatives
page-type: web-api-instance-property
browser-compat: api.SpeechRecognition.maxAlternatives
---

{{APIRef("Web Speech API")}}

Thuộc tính **`maxAlternatives`** của giao diện {{domxref("SpeechRecognition")}} thiết lập số lượng tối đa {{domxref("SpeechRecognitionAlternative")}} được cung cấp cho mỗi {{domxref("SpeechRecognitionResult")}}.

Giá trị mặc định là 1.

## Giá trị

Một số biểu diễn số lượng phương án thay thế tối đa được trả về cho mỗi kết quả.

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
