---
title: SpeechSynthesisErrorEvent
slug: Web/API/SpeechSynthesisErrorEvent
page-type: web-api-interface
browser-compat: api.SpeechSynthesisErrorEvent
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechSynthesisErrorEvent`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) chứa thông tin về bất kỳ lỗi nào xảy ra trong khi xử lý các đối tượng {{domxref("SpeechSynthesisUtterance")}} trong dịch vụ giọng nói.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SpeechSynthesisErrorEvent.SpeechSynthesisErrorEvent", "SpeechSynthesisErrorEvent()")}}
  - : Tạo một `SpeechSynthesisErrorEvent` mới.

## Thuộc tính phiên bản

_`SpeechSynthesisErrorEvent` mở rộng giao diện {{domxref("SpeechSynthesisEvent")}}, kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("SpeechSynthesisErrorEvent.error")}} {{ReadOnlyInline}}
  - : Trả về mã lỗi cho biết điều gì đã xảy ra không ổn với một lần thử tổng hợp giọng nói.

## Phương thức phiên bản

_`SpeechSynthesisErrorEvent` mở rộng giao diện {{domxref("SpeechSynthesisEvent")}}, kế thừa các phương thức từ giao diện cha của nó, {{domxref("Event")}}._

## Ví dụ

```js
const synth = window.speechSynthesis;

const inputForm = document.querySelector("form");
const inputTxt = document.querySelector("input");
const voiceSelect = document.querySelector("select");

const voices = synth.getVoices();

// …

inputForm.onsubmit = (event) => {
  event.preventDefault();

  const utterThis = new SpeechSynthesisUtterance(inputTxt.value);
  const selectedOption =
    voiceSelect.selectedOptions[0].getAttribute("data-name");
  for (const voice of voices) {
    if (voice.name === selectedOption) {
      utterThis.voice = voice;
    }
  }

  synth.speak(utterThis);

  utterThis.onerror = (event) => {
    console.log(`Đã xảy ra lỗi với tổng hợp giọng nói: ${event.error}`);
  };

  inputTxt.blur();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
