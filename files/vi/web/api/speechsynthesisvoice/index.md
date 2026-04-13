---
title: SpeechSynthesisVoice
slug: Web/API/SpeechSynthesisVoice
page-type: web-api-interface
browser-compat: api.SpeechSynthesisVoice
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechSynthesisVoice`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho một giọng nói mà hệ thống hỗ trợ.
Mỗi `SpeechSynthesisVoice` có dịch vụ giọng nói riêng bao gồm thông tin về ngôn ngữ, tên và URI.

## Thuộc tính phiên bản

- {{domxref("SpeechSynthesisVoice.default")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết liệu giọng nói có phải là giọng nói mặc định cho ngôn ngữ ứng dụng hiện tại (`true`) hay không (`false`).
- {{domxref("SpeechSynthesisVoice.lang")}} {{ReadOnlyInline}}
  - : Trả về một {{glossary("BCP 47 language tag")}} cho biết ngôn ngữ của giọng nói.
- {{domxref("SpeechSynthesisVoice.localService")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết liệu giọng nói có được cung cấp bởi dịch vụ tổng hợp giọng nói cục bộ (`true`) hay dịch vụ tổng hợp giọng nói từ xa (`false`).
- {{domxref("SpeechSynthesisVoice.name")}} {{ReadOnlyInline}}
  - : Trả về một tên dễ đọc đại diện cho giọng nói.
- {{domxref("SpeechSynthesisVoice.voiceURI")}} {{ReadOnlyInline}}
  - : Trả về loại URI và vị trí của dịch vụ tổng hợp giọng nói cho giọng nói này.

## Ví dụ

Đoạn mã sau được trích từ [Speech synthesizer demo](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speak-easy-synthesis/script.js).

```js
const synth = window.speechSynthesis;
function populateVoiceList() {
  voices = synth.getVoices();

  for (const voice of voices) {
    const option = document.createElement("option");
    option.textContent = `${voice.name} (${voice.lang})`;

    if (voice.default) {
      option.textContent += " — DEFAULT";
    }

    option.setAttribute("data-lang", voice.lang);
    option.setAttribute("data-name", voice.name);
    voiceSelect.appendChild(option);
  }
}

populateVoiceList();
if (speechSynthesis.onvoiceschanged !== undefined) {
  speechSynthesis.onvoiceschanged = populateVoiceList;
}

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
  utterThis.pitch = pitch.value;
  utterThis.rate = rate.value;
  synth.speak(utterThis);

  utterThis.onpause = (event) => {
    const char = event.utterance.text.charAt(event.charIndex);
    console.log(
      `Speech paused at character ${event.charIndex} of "${event.utterance.text}", which is "${char}".`,
    );
  };

  inputTxt.blur();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
