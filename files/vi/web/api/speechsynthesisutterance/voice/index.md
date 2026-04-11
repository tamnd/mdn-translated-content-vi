---
title: "SpeechSynthesisUtterance: voice property"
short-title: voice
slug: Web/API/SpeechSynthesisUtterance/voice
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisUtterance.voice
---

{{APIRef("Web Speech API")}}

Thuộc tính **`voice`** của giao diện {{domxref("SpeechSynthesisUtterance")}} lấy và đặt giọng nói sẽ được dùng để đọc yêu cầu phát âm.

Giá trị này nên được đặt thành một trong các đối tượng {{domxref("SpeechSynthesisVoice")}} được trả về bởi {{domxref("SpeechSynthesis.getVoices()")}}.
Nếu không được đặt khi yêu cầu phát âm bắt đầu, giọng nói mặc định phù hợp nhất có sẵn cho cài đặt {{domxref("SpeechSynthesisUtterance.lang","lang")}} của yêu cầu phát âm sẽ được sử dụng.

## Giá trị

Một đối tượng {{domxref("SpeechSynthesisVoice")}}.

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
