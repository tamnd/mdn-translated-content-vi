---
title: "SpeechSynthesisVoice: thuộc tính localService"
short-title: localService
slug: Web/API/SpeechSynthesisVoice/localService
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisVoice.localService
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`localService`** của giao diện {{domxref("SpeechSynthesisVoice")}} trả về một giá trị boolean cho biết liệu giọng nói có được cung cấp bởi dịch vụ tổng hợp giọng nói cục bộ (`true`) hay dịch vụ tổng hợp giọng nói từ xa (`false`).

Thuộc tính này được cung cấp để cho phép phân biệt trong trường hợp một số tùy chọn giọng nói được cung cấp bởi dịch vụ từ xa; có thể các giọng nói từ xa có độ trễ, băng thông hoặc chi phí thêm liên quan, vì vậy sự phân biệt đó có thể hữu ích.

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

  console.log(voice.localService);

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
