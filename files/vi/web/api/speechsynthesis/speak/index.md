---
title: "SpeechSynthesis: phương thức speak()"
short-title: speak()
slug: Web/API/SpeechSynthesis/speak
page-type: web-api-instance-method
browser-compat: api.SpeechSynthesis.speak
---

{{APIRef("Web Speech API")}}

Phương thức **`speak()`** của giao diện {{domxref("SpeechSynthesis")}} thêm một {{domxref("SpeechSynthesisUtterance", "utterance")}} vào hàng đợi utterance; nó sẽ được nói khi mọi utterance khác đã được xếp trước nó được nói xong.

## Cú pháp

```js-nolint
speak(utterance)
```

### Tham số

- `utterance`
  - : Một đối tượng {{domxref("SpeechSynthesisUtterance")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đoạn mã này được trích từ [Speech synthesizer demo](https://github.com/mdn/dom-examples/blob/main/web-speech-api/speak-easy-synthesis/script.js) của chúng tôi ([xem trực tiếp](https://mdn.github.io/dom-examples/web-speech-api/speak-easy-synthesis/)). Khi một form chứa văn bản mà chúng ta muốn nói được gửi đi, chúng ta, trong số các việc khác, tạo một utterance mới chứa văn bản này, rồi nói nó bằng cách truyền nó vào `speak()` như một tham số.

```js
const synth = window.speechSynthesis;

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
  inputTxt.blur();
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
