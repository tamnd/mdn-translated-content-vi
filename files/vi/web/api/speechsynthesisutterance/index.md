---
title: SpeechSynthesisUtterance
slug: Web/API/SpeechSynthesisUtterance
page-type: web-api-interface
browser-compat: api.SpeechSynthesisUtterance
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechSynthesisUtterance`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) đại diện cho một yêu cầu phát âm.
Nó chứa nội dung mà dịch vụ giọng nói cần đọc và các thông tin về cách đọc (ví dụ: ngôn ngữ, cao độ và âm lượng).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SpeechSynthesisUtterance.SpeechSynthesisUtterance", "SpeechSynthesisUtterance()")}}
  - : Trả về một đối tượng `SpeechSynthesisUtterance` mới.

## Thuộc tính phiên bản

_`SpeechSynthesisUtterance` cũng kế thừa các thuộc tính từ giao diện cha của nó là {{domxref("EventTarget")}}._

- {{domxref("SpeechSynthesisUtterance.lang")}}
  - : Lấy và đặt ngôn ngữ của yêu cầu phát âm.
- {{domxref("SpeechSynthesisUtterance.pitch")}}
  - : Lấy và đặt cao độ mà yêu cầu phát âm sẽ được nói.
- {{domxref("SpeechSynthesisUtterance.rate")}}
  - : Lấy và đặt tốc độ mà yêu cầu phát âm sẽ được nói.
- {{domxref("SpeechSynthesisUtterance.text")}}
  - : Lấy và đặt văn bản sẽ được tổng hợp khi yêu cầu phát âm được nói.
- {{domxref("SpeechSynthesisUtterance.voice")}}
  - : Lấy và đặt giọng nói sẽ được dùng để đọc yêu cầu phát âm.
- {{domxref("SpeechSynthesisUtterance.volume")}}
  - : Lấy và đặt âm lượng mà yêu cầu phát âm sẽ được nói.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán một trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

- [`boundary`](/en-US/docs/Web/API/SpeechSynthesisUtterance/boundary_event)
  - : Kích hoạt khi yêu cầu phát âm đang được nói đến ranh giới từ hoặc câu.
    Cũng có thể truy cập qua thuộc tính `onboundary`.
- [`end`](/en-US/docs/Web/API/SpeechSynthesisUtterance/end_event)
  - : Kích hoạt khi yêu cầu phát âm đã kết thúc.
    Cũng có thể truy cập qua thuộc tính `onend`.
- [`error`](/en-US/docs/Web/API/SpeechSynthesisUtterance/error_event)
  - : Kích hoạt khi xảy ra lỗi ngăn yêu cầu phát âm được nói thành công.
    Cũng có thể truy cập qua thuộc tính `onerror`.
- [`mark`](/en-US/docs/Web/API/SpeechSynthesisUtterance/mark_event)
  - : Kích hoạt khi yêu cầu phát âm đang được nói đến thẻ SSML "mark" được đặt tên.
    Cũng có thể truy cập qua thuộc tính `onmark`.
- [`pause`](/en-US/docs/Web/API/SpeechSynthesisUtterance/pause_event)
  - : Kích hoạt khi yêu cầu phát âm bị tạm dừng giữa chừng.
    Cũng có thể truy cập qua thuộc tính `onpause`.
- [`resume`](/en-US/docs/Web/API/SpeechSynthesisUtterance/resume_event)
  - : Kích hoạt khi yêu cầu phát âm đã bị tạm dừng được tiếp tục.
    Cũng có thể truy cập qua thuộc tính `onresume`.
- [`start`](/en-US/docs/Web/API/SpeechSynthesisUtterance/start_event)
  - : Kích hoạt khi yêu cầu phát âm bắt đầu được nói.
    Cũng có thể truy cập qua thuộc tính `onstart`.

## Ví dụ

Trong bản demo cơ bản [Speech synthesizer demo](https://mdn.github.io/dom-examples/web-speech-api/speak-easy-synthesis/), trước tiên chúng ta lấy tham chiếu đến bộ điều khiển SpeechSynthesis bằng cách sử dụng `window.speechSynthesis`.
Sau khi định nghĩa một số biến cần thiết, chúng ta lấy danh sách các giọng nói có sẵn bằng {{domxref("SpeechSynthesis.getVoices()")}} và điền vào menu select để người dùng có thể chọn giọng nói mình muốn.

Bên trong trình xử lý `inputForm.onsubmit`, chúng ta ngăn form gửi đi bằng {{domxref("Event.preventDefault","preventDefault()")}}, dùng {{domxref("SpeechSynthesisUtterance.SpeechSynthesisUtterance()", "hàm khởi tạo")}} để tạo một đối tượng utterance mới chứa văn bản từ {{htmlelement("input")}}, đặt {{domxref("SpeechSynthesisUtterance.voice","voice")}} của utterance thành giọng nói đã chọn trong phần tử {{htmlelement("select")}}, và bắt đầu phát âm qua phương thức {{domxref("SpeechSynthesis.speak()")}}.

```js
const synth = window.speechSynthesis;

const inputForm = document.querySelector("form");
const inputTxt = document.querySelector("input");
const voiceSelect = document.querySelector("select");

let voices;

function loadVoices() {
  voices = synth.getVoices();
  for (const [i, voice] of voices.entries()) {
    const option = document.createElement("option");
    option.textContent = `${voice.name} (${voice.lang})`;
    option.value = i;
    voiceSelect.appendChild(option);
  }
}

// in Google Chrome the voices are not ready on page load
if ("onvoiceschanged" in synth) {
  synth.onvoiceschanged = loadVoices;
} else {
  loadVoices();
}

inputForm.onsubmit = (event) => {
  event.preventDefault();

  const utterThis = new SpeechSynthesisUtterance(inputTxt.value);
  utterThis.voice = voices[voiceSelect.value];
  synth.speak(utterThis);
  inputTxt.blur();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
