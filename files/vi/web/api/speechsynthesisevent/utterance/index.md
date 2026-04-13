---
title: "SpeechSynthesisEvent: utterance property"
short-title: utterance
slug: Web/API/SpeechSynthesisEvent/utterance
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisEvent.utterance
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`utterance`** của giao diện {{domxref("SpeechSynthesisUtterance")}} trả về thực thể {{domxref("SpeechSynthesisUtterance")}} mà sự kiện được kích hoạt trên đó.

## Giá trị

Một đối tượng {{domxref("SpeechSynthesisUtterance")}}.

## Ví dụ

```js
utterThis.onpause = (event) => {
  const char = event.utterance.text.charAt(event.charIndex);
  console.log(
    `Speech paused at character ${event.charIndex} of "${event.utterance.text}", which is "${char}".`,
  );
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
