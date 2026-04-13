---
title: "SpeechSynthesisVoice: thuộc tính default"
short-title: default
slug: Web/API/SpeechSynthesisVoice/default
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisVoice.default
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`default`** của giao diện {{domxref("SpeechSynthesisVoice")}} trả về một giá trị boolean cho biết liệu giọng nói có phải là giọng nói mặc định cho ứng dụng hiện tại (`true`) hay không (`false`).

> [!NOTE]
> Đối với một số thiết bị, đây có thể là giọng nói mặc định cho ngôn ngữ của giọng nói. Thông số kỹ thuật không rõ ràng về điều đó nên một số triển khai có thể khác nhau.

## Giá trị

Một giá trị boolean.

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
