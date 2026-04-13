---
title: "SpeechRecognitionResult: thuộc tính isFinal"
short-title: isFinal
slug: Web/API/SpeechRecognitionResult/isFinal
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionResult.isFinal
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`isFinal`** của giao diện {{domxref("SpeechRecognitionResult")}} là một giá trị boolean cho biết kết quả này có phải là kết quả cuối cùng (`true`) hay không (`false`). Nếu có, đây là lần cuối cùng kết quả này được trả về; nếu không, thì đây là kết quả tạm thời và có thể được cập nhật sau này.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}.`;
  bg.style.backgroundColor = color;

  console.log(event.results[0].isFinal);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
