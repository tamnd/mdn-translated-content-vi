---
title: "SpeechSynthesis: thuộc tính paused"
short-title: paused
slug: Web/API/SpeechSynthesis/paused
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesis.paused
---

{{APIRef("Web Speech API")}}

Thuộc tính **`paused`** chỉ đọc của giao diện {{domxref("SpeechSynthesis")}} là một giá trị boolean trả về `true` nếu đối tượng `SpeechSynthesis` đang ở trạng thái tạm dừng, hoặc `false` nếu không.

Nó có thể được đặt thành {{domxref("SpeechSynthesis.pause()", "paused")}} ngay cả khi không có gì đang được phát qua nó. Nếu {{domxref("SpeechSynthesisUtterance","utterances")}} sau đó được thêm vào hàng đợi utterance, chúng sẽ không được nói cho đến khi đối tượng `SpeechSynthesis` được bỏ tạm dừng bằng {{domxref("SpeechSynthesis.resume()")}}.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const synth = window.speechSynthesis;

synth.pause();

const amIPaused = synth.paused; // will return true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
