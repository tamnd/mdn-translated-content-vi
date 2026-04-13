---
title: "SpeechRecognition: Phương thức stop()"
short-title: stop()
slug: Web/API/SpeechRecognition/stop
page-type: web-api-instance-method
browser-compat: api.SpeechRecognition.stop
---

{{APIRef("Web Speech API")}}

Phương thức **`stop()`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) dừng dịch vụ nhận dạng giọng nói không nghe audio đến và cố gắng trả về {{domxref("SpeechRecognitionResult")}} dựa trên các kết quả đã ghi nhận được cho đến thời điểm đó.

## Cú pháp

```js-nolint
stop()
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
const startBtn = document.querySelector("button");

startBtn.onclick = () => {
  recognition.start();
  console.log("Ready to receive a color command.");
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
