---
title: "SpeechSynthesis: phương thức pause()"
short-title: pause()
slug: Web/API/SpeechSynthesis/pause
page-type: web-api-instance-method
browser-compat: api.SpeechSynthesis.pause
---

{{APIRef("Web Speech API")}}

Phương thức **`pause()`** của giao diện {{domxref("SpeechSynthesis")}} đưa đối tượng `SpeechSynthesis` vào trạng thái tạm dừng.

## Cú pháp

```js-nolint
pause()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

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

synth.pause(); // pauses utterances being spoken
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
