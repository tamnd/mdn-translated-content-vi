---
title: SpeechSynthesis
slug: Web/API/SpeechSynthesis
page-type: web-api-interface
browser-compat: api.SpeechSynthesis
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechSynthesis`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) là giao diện điều khiển cho dịch vụ giọng nói; nó có thể được dùng để truy xuất thông tin về các voice tổng hợp có sẵn trên thiết bị, bắt đầu và tạm dừng phát giọng nói, cùng các lệnh khác.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_`SpeechSynthesis` cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("SpeechSynthesis.paused")}} {{ReadOnlyInline}}
  - : Một giá trị boolean trả về `true` nếu đối tượng `SpeechSynthesis` đang ở trạng thái tạm dừng.
- {{domxref("SpeechSynthesis.pending")}} {{ReadOnlyInline}}
  - : Một giá trị boolean trả về `true` nếu hàng đợi utterance còn chứa các utterance chưa được nói.
- {{domxref("SpeechSynthesis.speaking")}} {{ReadOnlyInline}}
  - : Một giá trị boolean trả về `true` nếu một utterance hiện đang được phát ra lời nói, ngay cả khi `SpeechSynthesis` đang ở trạng thái tạm dừng.

## Phương thức thể hiện

_`SpeechSynthesis` cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("SpeechSynthesis.cancel()")}}
  - : Xóa tất cả utterance khỏi hàng đợi utterance.
- {{domxref("SpeechSynthesis.getVoices()")}}
  - : Trả về một danh sách các đối tượng {{domxref("SpeechSynthesisVoice")}} đại diện cho mọi voice có sẵn trên thiết bị hiện tại.
- {{domxref("SpeechSynthesis.pause()")}}
  - : Đưa đối tượng `SpeechSynthesis` vào trạng thái tạm dừng.
- {{domxref("SpeechSynthesis.resume()")}}
  - : Đưa đối tượng `SpeechSynthesis` vào trạng thái không tạm dừng: tiếp tục nếu trước đó nó đang tạm dừng.
- {{domxref("SpeechSynthesis.speak()")}}
  - : Thêm một {{domxref("SpeechSynthesisUtterance", "utterance")}} vào hàng đợi utterance; nó sẽ được nói khi mọi utterance khác được xếp trước nó đã được nói xong.

## Sự kiện

Lắng nghe sự kiện này bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán một trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

- [`voiceschanged`](/en-US/docs/Web/API/SpeechSynthesis/voiceschanged_event)
  - : Được kích hoạt khi danh sách các đối tượng {{domxref("SpeechSynthesisVoice")}} mà {{domxref("SpeechSynthesis.getVoices()")}} sẽ trả về đã thay đổi.
    Cũng có sẵn qua thuộc tính `onvoiceschanged`.

## Ví dụ

Trước hết, một ví dụ:

```js
let utterance = new SpeechSynthesisUtterance("Hello world!");
speechSynthesis.speak(utterance);
```

Tiếp theo là một ví dụ đầy đủ hơn. Trong [Speech synthesizer demo](https://github.com/mdn/dom-examples/tree/main/web-speech-api/speak-easy-synthesis), chúng ta trước tiên lấy tham chiếu tới bộ điều khiển SpeechSynthesis bằng `window.speechSynthesis`. Sau khi định nghĩa các biến cần thiết, chúng ta lấy danh sách các voice có sẵn bằng {{domxref("SpeechSynthesis.getVoices()")}} và điền chúng vào menu chọn để người dùng có thể chọn voice họ muốn.

Bên trong trình xử lý `inputForm.onsubmit`, chúng ta ngăn form gửi đi bằng [preventDefault()](/en-US/docs/Web/API/Event/preventDefault), tạo một thể hiện {{domxref("SpeechSynthesisUtterance")}} mới chứa văn bản từ thẻ {{htmlelement("input")}}, đặt voice của utterance thành voice được chọn trong phần tử {{htmlelement("select")}}, và bắt đầu phát utterance qua phương thức {{domxref("SpeechSynthesis.speak()")}}.

```js
const synth = window.speechSynthesis;

const inputForm = document.querySelector("form");
const inputTxt = document.querySelector(".txt");
const voiceSelect = document.querySelector("select");
const pitch = document.querySelector("#pitch");
const pitchValue = document.querySelector(".pitch-value");
const rate = document.querySelector("#rate");
const rateValue = document.querySelector(".rate-value");

let voices = [];

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
  for (const voice of voices) {
    if (voice.name === selectedOption) {
      utterThis.voice = voice;
    }
  }
  utterThis.pitch = pitch.value;
  utterThis.rate = rate.value;
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
