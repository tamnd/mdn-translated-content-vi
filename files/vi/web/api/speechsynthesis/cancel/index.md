---
title: "SpeechSynthesis: phương thức cancel()"
short-title: cancel()
slug: Web/API/SpeechSynthesis/cancel
page-type: web-api-instance-method
browser-compat: api.SpeechSynthesis.cancel
---

{{APIRef("Web Speech API")}}

Phương thức **`cancel()`** của giao diện {{domxref("SpeechSynthesis")}} xóa tất cả utterance khỏi hàng đợi utterance.

Nếu một utterance đang được phát, việc nói sẽ dừng ngay lập tức.

## Cú pháp

```js-nolint
cancel()
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

synth.cancel(); // utterance1 stops being spoken immediately, and both are removed from the queue
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
