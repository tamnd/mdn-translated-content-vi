---
title: "SpeechRecognitionAlternative: thuộc tính confidence"
short-title: confidence
slug: Web/API/SpeechRecognitionAlternative/confidence
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionAlternative.confidence
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`confidence`** của giao diện {{domxref("SpeechRecognitionResult")}} trả về ước tính số về mức độ tự tin của hệ thống nhận dạng giọng nói rằng việc nhận dạng là đúng.

> [!NOTE]
> Triển khai `confidence` của Mozilla vẫn đang được xử lý — hiện tại, nó luôn dường như trả về 1.

## Giá trị

Một số trong khoảng 0 đến 1.

## Ví dụ

Code này được trích từ ví dụ
[Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Nhận được kết quả: ${color}.`;
  bg.style.backgroundColor = color;
  console.log(`Độ tin cậy: ${event.results[0][0].confidence}`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
