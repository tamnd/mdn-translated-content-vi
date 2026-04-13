---
title: "SpeechSynthesisVoice: thuộc tính voiceURI"
short-title: voiceURI
slug: Web/API/SpeechSynthesisVoice/voiceURI
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisVoice.voiceURI
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`voiceURI`** của giao diện {{domxref("SpeechSynthesisVoice")}} trả về loại URI và vị trí của dịch vụ tổng hợp giọng nói cho giọng nói này.

## Giá trị

Một chuỗi đại diện cho URI của giọng nói. Đây là một URI chung và có thể trỏ đến các dịch vụ cục bộ hoặc từ xa, ví dụ: nó có thể là một URN độc quyền của hệ thống hoặc một URL đến dịch vụ từ xa.

## Ví dụ

```js
for (const voice of voices) {
  const option = document.createElement("option");
  option.textContent = `${voice.name} (${voice.lang})`;

  if (voice.default) {
    option.textContent += " — DEFAULT";
  }

  console.log(voice.voiceURI);
  // On Mac, this returns URNs, for example 'urn:moz-tts:osx:com.apple.speech.synthesis.voice.daniel'

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
