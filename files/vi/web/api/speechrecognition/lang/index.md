---
title: "SpeechRecognition: Thuộc tính lang"
short-title: lang
slug: Web/API/SpeechRecognition/lang
page-type: web-api-instance-property
browser-compat: api.SpeechRecognition.lang
---

{{APIRef("Web Speech API")}}

Thuộc tính **`lang`** của giao diện {{domxref("SpeechRecognition")}} trả về và thiết lập ngôn ngữ của `SpeechRecognition` hiện tại. Nếu không được chỉ định, giá trị mặc định là thuộc tính HTML [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang), hoặc cài đặt ngôn ngữ của tác nhân người dùng nếu thuộc tính đó cũng không được thiết lập.

## Giá trị

Một chuỗi biểu diễn ngôn ngữ cho `SpeechRecognition` hiện tại. Giá trị phải là một {{glossary("BCP 47 language tag")}} hợp lệ.

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
