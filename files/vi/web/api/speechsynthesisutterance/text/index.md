---
title: "SpeechSynthesisUtterance: text property"
short-title: text
slug: Web/API/SpeechSynthesisUtterance/text
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisUtterance.text
---

{{APIRef("Web Speech API")}}

Thuộc tính **`text`** của giao diện {{domxref("SpeechSynthesisUtterance")}} lấy và đặt văn bản sẽ được tổng hợp khi yêu cầu phát âm được nói.

Văn bản có thể được cung cấp dưới dạng văn bản thuần túy, hoặc một tài liệu [SSML](https://www.w3.org/TR/speech-synthesis/) hợp lệ.
Các thẻ SSML sẽ bị loại bỏ bởi các thiết bị không hỗ trợ SSML.

## Giá trị

Một chuỗi đại diện cho văn bản cần được tổng hợp.
Độ dài tối đa của văn bản có thể được nói trong mỗi lần phát âm là 32.767 ký tự.

## Ví dụ

```js
const synth = window.speechSynthesis;

const inputForm = document.querySelector("form");
const inputTxt = document.querySelector("input");
const voiceSelect = document.querySelector("select");

const voices = synth.getVoices();

// …

inputForm.onsubmit = (event) => {
  event.preventDefault();

  const utterThis = new SpeechSynthesisUtterance(inputTxt.value);
  const selectedOption =
    voiceSelect.selectedOptions[0].getAttribute("data-name");
  for (const voice of voices) {
    if (voice.name === selectedOption) {
      utterThis.voice = voice;
    }
  }
  console.log(utterThis.text);
  synth.speak(utterThis);
  inputTxt.blur();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
