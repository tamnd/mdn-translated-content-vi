---
title: "SpeechRecognition: Phương thức abort()"
short-title: abort()
slug: Web/API/SpeechRecognition/abort
page-type: web-api-instance-method
browser-compat: api.SpeechRecognition.abort
---

{{APIRef("Web Speech API")}}

Phương thức **`abort()`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) dừng dịch vụ nhận dạng giọng nói không nghe audio đến, và không cố gắng trả về {{domxref("SpeechRecognitionResult")}}.

## Cú pháp

```js-nolint
abort()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const recognition = new SpeechRecognition();

const diagnostic = document.querySelector(".output");
const bg = document.querySelector("html");
const startBtn = document.querySelector(".start");
const abortBtn = document.querySelector(".abort");

startBtn.onclick = () => {
  recognition.start();
  console.log("Ready to receive a color command.");
};

abortBtn.onclick = () => {
  recognition.abort();
  console.log("Speech recognition aborted.");
};

recognition.onspeechend = () => {
  recognition.stop();
  console.log("Speech recognition has stopped.");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
