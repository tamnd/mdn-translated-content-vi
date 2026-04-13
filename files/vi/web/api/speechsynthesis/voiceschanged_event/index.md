---
title: "SpeechSynthesis: sự kiện voiceschanged"
short-title: voiceschanged
slug: Web/API/SpeechSynthesis/voiceschanged_event
page-type: web-api-event
browser-compat: api.SpeechSynthesis.voiceschanged_event
---

{{APIRef("Web Speech API")}}

Sự kiện **`voiceschanged`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) được kích hoạt khi danh sách các đối tượng {{domxref("SpeechSynthesisVoice")}} mà phương thức {{domxref("SpeechSynthesis.getVoices()")}} trả về đã thay đổi (khi sự kiện `voiceschanged` được phát ra.)

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("voiceschanged", (event) => { })

onvoiceschanged = (event) => { }
```

## Kiểu sự kiện

Một {{DOMxRef("Event")}} tổng quát không có thuộc tính bổ sung.

## Ví dụ

Điều này có thể được dùng để điền lại danh sách voice mà người dùng có thể chọn khi sự kiện được kích hoạt. Bạn có thể dùng sự kiện `voiceschanged` trong phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const synth = window.speechSynthesis;

synth.addEventListener("voiceschanged", () => {
  const voices = synth.getVoices();
  for (const voice of voices) {
    const option = document.createElement("option");
    option.textContent = `${voice.name} (${voice.lang})`;
    option.setAttribute("data-lang", voice.lang);
    option.setAttribute("data-name", voice.name);
    voiceSelect.appendChild(option);
  }
});
```

Hoặc dùng thuộc tính trình xử lý sự kiện `onvoiceschanged`:

```js
const synth = window.speechSynthesis;
synth.onvoiceschanged = () => {
  const voices = synth.getVoices();
  for (const voice of voices) {
    const option = document.createElement("option");
    option.textContent = `${voice.name} (${voice.lang})`;
    option.setAttribute("data-lang", voice.lang);
    option.setAttribute("data-name", voice.name);
    voiceSelect.appendChild(option);
  }
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
