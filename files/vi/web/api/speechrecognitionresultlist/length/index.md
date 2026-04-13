---
title: "SpeechRecognitionResultList: thuộc tính length"
short-title: length
slug: Web/API/SpeechRecognitionResultList/length
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionResultList.length
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`length`** của giao diện
{{domxref("SpeechRecognitionResultList")}} trả về độ dài của
"mảng" — số lượng đối tượng {{domxref("SpeechRecognitionResult")}} trong
danh sách.

## Giá trị

Một số.

## Ví dụ

Code này được trích từ ví dụ
[Speech color changer](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speech-color-changer/script.js) của chúng tôi.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Nhận được kết quả: ${color}.`;
  bg.style.backgroundColor = color;

  console.log(event.results.length);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
