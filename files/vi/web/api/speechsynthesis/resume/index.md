---
title: "SpeechSynthesis: phương thức resume()"
short-title: resume()
slug: Web/API/SpeechSynthesis/resume
page-type: web-api-instance-method
browser-compat: api.SpeechSynthesis.resume
---

{{APIRef("Web Speech API")}}

Phương thức **`resume()`** của giao diện {{domxref("SpeechSynthesis")}} đưa đối tượng `SpeechSynthesis` vào trạng thái không tạm dừng: tiếp tục nếu trước đó nó đang tạm dừng.

## Cú pháp

```js-nolint
resume()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
let synth = window.speechSynthesis;

let utterance1 = new SpeechSynthesisUtterance(
  "How about we say this now? This is quite a long sentence to say.",
);
let utterance2 = new SpeechSynthesisUtterance(
  "We should say another sentence too, just to be on the safe side.",
);

synth.speak(utterance1);
synth.speak(utterance2);

synth.pause(); // pauses utterances being spoken
synth.resume(); // resumes speaking
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
