---
title: "SpeechSynthesisUtterance: lang property"
short-title: lang
slug: Web/API/SpeechSynthesisUtterance/lang
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisUtterance.lang
---

{{APIRef("Web Speech API")}}

Thuộc tính **`lang`** của giao diện {{domxref("SpeechSynthesisUtterance")}} lấy và đặt ngôn ngữ của yêu cầu phát âm.

Nếu không được đặt, ngôn ngữ của ứng dụng (tức là giá trị [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của {{htmlelement("html")}}) sẽ được dùng, hoặc mặc định của tác nhân người dùng nếu giá trị đó cũng không được đặt.

## Giá trị

Một chuỗi đại diện cho {{glossary("BCP 47 language tag")}}.

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
  utterThis.lang = "en-US";
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
