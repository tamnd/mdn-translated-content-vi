---
title: "SpeechSynthesisEvent: charLength property"
short-title: charLength
slug: Web/API/SpeechSynthesisEvent/charLength
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisEvent.charLength
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`charLength`** của giao diện {{DOMxRef("SpeechSynthesisEvent")}} trả về số ký tự còn lại cần được nói sau ký tự tại vị trí {{DOMxRef("SpeechSynthesisEvent.charIndex", "charIndex")}}.

Nếu công cụ đọc không xác định được, nó trả về 0.

## Giá trị

Một số nguyên.

## Ví dụ

```js
utterThis.onpause = (event) => {
  const char = event.utterance.text.charAt(event.charIndex);
  const charLeft = event.charLength;
  if (charLeft) {
    console.log(
      `Speech paused. There are still ${charLeft} characters to be spoken.`,
    );
  } else {
    console.log(
      "Speech paused. The underlying speech engine can't tell how many characters are left.",
    );
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
