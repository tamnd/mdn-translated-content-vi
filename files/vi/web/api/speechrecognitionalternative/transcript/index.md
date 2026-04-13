---
title: "SpeechRecognitionAlternative: thuộc tính transcript"
short-title: transcript
slug: Web/API/SpeechRecognitionAlternative/transcript
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionAlternative.transcript
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`transcript`** của giao diện {{domxref("SpeechRecognitionResult")}} trả về một chuỗi chứa bản ghi của (các) từ được nhận ra.

Đối với nhận dạng liên tục, khoảng trắng ở đầu hoặc cuối sẽ được bao gồm khi cần thiết để việc ghép nối các {{domxref("SpeechRecognitionResult")}} liên tiếp tạo ra bản ghi phiên đúng.

## Giá trị

Một chuỗi.

## Ví dụ

Code này được trích từ ví dụ
[Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

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
