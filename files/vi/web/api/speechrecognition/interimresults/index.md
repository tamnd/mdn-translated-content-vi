---
title: "SpeechRecognition: Thuộc tính interimResults"
short-title: interimResults
slug: Web/API/SpeechRecognition/interimResults
page-type: web-api-instance-property
browser-compat: api.SpeechRecognition.interimResults
---

{{APIRef("Web Speech API")}}

Thuộc tính **`interimResults`** của giao diện {{domxref("SpeechRecognition")}} kiểm soát việc có trả về các kết quả trung gian hay không (`true`) hoặc không (`false`). Kết quả trung gian là các kết quả chưa phải là kết quả cuối cùng (ví dụ: thuộc tính {{domxref("SpeechRecognitionResult.isFinal")}} là `false`).

Giá trị mặc định của **`interimResults`** là `false`.

## Giá trị

Một giá trị boolean biểu diễn trạng thái của các kết quả trung gian của `SpeechRecognition` hiện tại. `true` nghĩa là các kết quả trung gian được trả về, và `false` nghĩa là chúng không được trả về.

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
