---
title: "SpeechSynthesis: thuộc tính pending"
short-title: pending
slug: Web/API/SpeechSynthesis/pending
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesis.pending
---

{{APIRef("Web Speech API")}}

Thuộc tính **`pending`** chỉ đọc của giao diện {{domxref("SpeechSynthesis")}} là một giá trị boolean trả về `true` nếu hàng đợi utterance còn chứa các utterance chưa được nói.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const synth = window.speechSynthesis;

const utterance1 = new SpeechSynthesisUtterance(
  "How about we say this now? This is quite a long sentence to say.",
);
const utterance2 = new SpeechSynthesisUtterance(
  "We should say another sentence too, just to be on the safe side.",
);

synth.speak(utterance1);
synth.speak(utterance2);

const amIPending = synth.pending; // will return true if utterance 1 is still being spoken and utterance 2 is in the queue
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
