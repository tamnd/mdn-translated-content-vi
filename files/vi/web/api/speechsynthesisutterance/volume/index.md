---
title: "SpeechSynthesisUtterance: volume property"
short-title: volume
slug: Web/API/SpeechSynthesisUtterance/volume
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisUtterance.volume
---

{{APIRef("Web Speech API")}}

Thuộc tính **`volume`** của giao diện {{domxref("SpeechSynthesisUtterance")}} lấy và đặt âm lượng mà yêu cầu phát âm sẽ được nói.

Nếu không được đặt, giá trị mặc định là 1 sẽ được dùng.

## Giá trị

Một số thực đại diện cho giá trị âm lượng, trong khoảng từ 0 (thấp nhất) đến 1 (cao nhất).

Nếu [SSML](https://www.w3.org/TR/speech-synthesis/) được sử dụng, giá trị này sẽ bị ghi đè bởi [các thẻ prosody](https://www.w3.org/TR/speech-synthesis/#S3.2.4) trong markup.

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
  utterThis.volume = 0.5;
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
