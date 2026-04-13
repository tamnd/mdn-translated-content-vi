---
title: "SpeechRecognition: Thuộc tính continuous"
short-title: continuous
slug: Web/API/SpeechRecognition/continuous
page-type: web-api-instance-property
browser-compat: api.SpeechRecognition.continuous
---

{{APIRef("Web Speech API")}}

Thuộc tính **`continuous`** của giao diện {{domxref("SpeechRecognition")}} kiểm soát việc trả về kết quả liên tục cho mỗi lần nhận dạng, hay chỉ một kết quả duy nhất.

Mặc định là kết quả duy nhất (`false`).

## Giá trị

Một giá trị boolean biểu diễn trạng thái continuous hiện tại của `SpeechRecognition`. `true` nghĩa là liên tục, và `false` nghĩa là không liên tục (mỗi lần một kết quả duy nhất).

## Ví dụ

Đoạn mã này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng ta.

```js
const recognition = new SpeechRecognition();
recognition.continuous = false;
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
