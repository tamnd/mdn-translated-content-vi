---
title: "Window: thuộc tính speechSynthesis"
short-title: speechSynthesis
slug: Web/API/Window/speechSynthesis
page-type: web-api-instance-property
browser-compat: api.Window.speechSynthesis
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc `speechSynthesis` của đối tượng Window trả về một đối tượng {{domxref("SpeechSynthesis")}}, đây là điểm vào để dùng chức năng tổng hợp giọng nói của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API).

## Giá trị

Một đối tượng {{domxref("SpeechSynthesis")}}.

## Ví dụ

Trong [Speech synthesizer demo](https://github.com/mdn/dom-examples/tree/main/web-speech-api/speak-easy-synthesis) cơ bản của chúng ta, trước tiên chúng ta lấy tham chiếu tới bộ điều khiển SpeechSynthesis bằng `window.speechSynthesis`.
Sau khi định nghĩa một số biến cần thiết, chúng ta lấy danh sách các voice có sẵn bằng {{domxref("SpeechSynthesis.getVoices()")}} và điền vào một menu chọn để người dùng có thể chọn voice họ muốn.

Bên trong trình xử lý `inputForm.onsubmit`, chúng ta chặn việc gửi form bằng [preventDefault()](/en-US/docs/Web/API/Event/preventDefault), tạo một thể hiện {{domxref("SpeechSynthesisUtterance")}} mới chứa văn bản từ {{htmlelement("input")}}, đặt voice của utterance thành voice được chọn trong phần tử {{htmlelement("select")}}, và bắt đầu phát utterance qua phương thức {{domxref("SpeechSynthesis.speak()")}}.

```js
const synth = window.speechSynthesis;

const inputForm = document.querySelector("form");
const inputTxt = document.querySelector("input");
const voiceSelect = document.querySelector("select");

function populateVoiceList() {
  voices = synth.getVoices();

  for (const voice of voices) {
    const option = document.createElement("option");
    option.textContent = `${voice.name} (${voice.lang})`;

    if (voice.default) {
      option.textContent += " — DEFAULT";
    }

    option.setAttribute("data-lang", voice.lang);
    option.setAttribute("data-name", voice.name);
    voiceSelect.appendChild(option);
  }
}

populateVoiceList();
if (speechSynthesis.onvoiceschanged !== undefined) {
  speechSynthesis.onvoiceschanged = populateVoiceList;
}

inputForm.onsubmit = (event) => {
  event.preventDefault();

  const utterThis = new SpeechSynthesisUtterance(inputTxt.value);
  const selectedOption =
    voiceSelect.selectedOptions[0].getAttribute("data-name");
  utterThis.voice = voices.find((v) => v.name === selectedOption);
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
