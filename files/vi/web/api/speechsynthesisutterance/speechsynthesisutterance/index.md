---
title: "SpeechSynthesisUtterance: SpeechSynthesisUtterance() constructor"
short-title: SpeechSynthesisUtterance()
slug: Web/API/SpeechSynthesisUtterance/SpeechSynthesisUtterance
page-type: web-api-constructor
browser-compat: api.SpeechSynthesisUtterance.SpeechSynthesisUtterance
---

{{APIRef("Web Speech API")}}

Hàm khởi tạo `SpeechSynthesisUtterance()` của giao diện {{domxref("SpeechSynthesisUtterance")}} trả về một đối tượng `SpeechSynthesisUtterance` mới.

## Cú pháp

```js-nolint
new SpeechSynthesisUtterance(text)
```

### Tham số

- `text`
  - : Một chuỗi chứa văn bản sẽ được tổng hợp khi yêu cầu phát âm được nói.

## Ví dụ

Đoạn mã sau được trích từ [Speech synthesizer demo](https://github.com/mdn/dom-examples/tree/main/web-speech-api/speak-easy-synthesis).

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
