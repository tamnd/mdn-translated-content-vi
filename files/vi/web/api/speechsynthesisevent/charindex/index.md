---
title: "SpeechSynthesisEvent: charIndex property"
short-title: charIndex
slug: Web/API/SpeechSynthesisEvent/charIndex
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisEvent.charIndex
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`charIndex`** của giao diện {{domxref("SpeechSynthesisUtterance")}} trả về vị trí chỉ mục của ký tự trong {{domxref("SpeechSynthesisUtterance.text")}} đang được nói khi sự kiện được kích hoạt.

## Giá trị

Một số.

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
