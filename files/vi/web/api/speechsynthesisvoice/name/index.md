---
title: "SpeechSynthesisVoice: thuộc tính name"
short-title: name
slug: Web/API/SpeechSynthesisVoice/name
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisVoice.name
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("SpeechSynthesisVoice")}} trả về một tên dễ đọc đại diện cho giọng nói.

## Giá trị

Một chuỗi đại diện cho tên của giọng nói.

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
