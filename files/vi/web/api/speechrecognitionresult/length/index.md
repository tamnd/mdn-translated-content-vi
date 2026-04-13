---
title: "SpeechRecognitionResult: thuộc tính length"
short-title: length
slug: Web/API/SpeechRecognitionResult/length
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionResult.length
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("SpeechRecognitionResult")}} trả về độ dài của "mảng", tức là số lượng đối tượng {{domxref("SpeechRecognitionAlternative")}} có trong kết quả (còn được gọi là "n phương án tốt nhất").

Số lượng phương án có trong kết quả phụ thuộc vào giá trị của thuộc tính {{domxref("SpeechRecognition.maxAlternatives")}} được đặt khi bắt đầu nhận dạng giọng nói.

## Giá trị

Một số.

## Ví dụ

Đoạn mã này được trích từ ví dụ [Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;

  console.log(event.results[0].length);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
