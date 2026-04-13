---
title: "SpeechSynthesisVoice: thuộc tính lang"
short-title: lang
slug: Web/API/SpeechSynthesisVoice/lang
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisVoice.lang
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`lang`** của giao diện {{domxref("SpeechSynthesisVoice")}} trả về một {{glossary("BCP 47 language tag")}} cho biết ngôn ngữ của giọng nói.

## Giá trị

Một chuỗi đại diện cho ngôn ngữ của thiết bị.

## Ví dụ

```js
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
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
