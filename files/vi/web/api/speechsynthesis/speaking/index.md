---
title: "SpeechSynthesis: thuộc tính speaking"
short-title: speaking
slug: Web/API/SpeechSynthesis/speaking
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesis.speaking
---

{{APIRef("Web Speech API")}}

Thuộc tính **`speaking`** chỉ đọc của giao diện {{domxref("SpeechSynthesis")}} là một giá trị boolean trả về `true` nếu một utterance hiện đang trong quá trình được phát ra lời nói, ngay cả khi `SpeechSynthesis` đang ở trạng thái {{domxref("SpeechSynthesis/pause()","paused")}}.

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

const amISpeaking = synth.speaking; // will return true if utterance 1 or utterance 2 are currently being spoken
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
