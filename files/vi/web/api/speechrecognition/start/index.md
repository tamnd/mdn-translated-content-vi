---
title: "SpeechRecognition: Phương thức start()"
short-title: start()
slug: Web/API/SpeechRecognition/start
page-type: web-api-instance-method
browser-compat: api.SpeechRecognition.start
---

{{APIRef("Web Speech API")}}

Phương thức **`start()`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) khởi động dịch vụ nhận dạng giọng nói để nghe audio đến (từ micro hoặc track audio) và trả về kết quả của việc nhận dạng đó.

## Cú pháp

```js-nolint
start()
start(audioTrack)
```

### Tham số

- `audioTrack` {{optional_inline}} {{experimental_inline}}
  - : Một thể hiện {{domxref("MediaStreamTrack")}} để thực hiện nhận dạng giọng nói. Nếu không được chỉ định, dịch vụ sẽ cố gắng nhận dạng audio từ micro của người dùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu một `audioTrack` được chỉ định và một hoặc cả hai điều kiện sau đúng:
    - Thuộc tính {{domxref("MediaStreamTrack.kind", "kind")}} của track không phải là `audio`.
    - Thuộc tính {{domxref("MediaStreamTrack.readyState", "readyState")}} của track không phải là `live`.

## Ví dụ

### Nhận dạng giọng nói từ micro

Trong ví dụ [Speech color changer](https://mdn.github.io/dom-examples/web-speech-api/speech-color-changer/) của chúng ta, chúng ta tạo một thể hiện đối tượng `SpeechRecognition` mới bằng cách sử dụng bộ khởi tạo {{domxref("SpeechRecognition.SpeechRecognition", "SpeechRecognition()")}}. Sau đó, chúng ta tạo một trình xử lý sự kiện `click` trên một `<button>` để khi nó được nhấp, chúng ta khởi động dịch vụ nhận dạng giọng nói và chờ đầu vào audio từ micro của người dùng:

```js
const recognition = new SpeechRecognition();

const diagnostic = document.querySelector(".output");
const bg = document.querySelector("html");
const startBtn = document.querySelector("button");

startBtn.onclick = () => {
  recognition.start();
  console.log("Ready to receive a color command.");
};
```

Khi một kết quả đã được nhận dạng thành công, sự kiện {{domxref("SpeechRecognition.result_event", "result")}} được kích hoạt. Chúng ta trích xuất màu đã được đọc từ đối tượng sự kiện bằng cách lấy {{domxref("SpeechRecognitionAlternative.transcript", "transcript")}} của {{domxref("SpeechRecognitionAlternative")}} đầu tiên của {{domxref("SpeechRecognitionResult")}} đầu tiên trong danh sách {{domxref("SpeechRecognitionEvent.results", "results")}} được trả về. Sau đó chúng ta thiết lập màu nền cho phần tử {{htmlelement("html")}} thành màu đó.

```js
recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}`;
  bg.style.backgroundColor = color;
};
```

### Nhận dạng giọng nói từ track audio

Đoạn mã này (trích từ [demo nhận dạng track audio](https://mdn.github.io/dom-examples/web-speech-api/audio-track-recognition/) của chúng ta) minh họa cách nhận dạng giọng nói từ một track audio. Đầu tiên, chúng ta tạo một thể hiện {{domxref("SpeechRecognition")}} mới và thiết lập {{domxref("SpeechRecognition.lang", "lang")}} của nó thành `en-US`. Sau đó chúng ta lấy tham chiếu đến một phần tử {{htmlelement("button")}} và một phần tử {{htmlelement("p")}} để xuất kết quả và thông tin chẩn đoán.

```js
const recognition = new SpeechRecognition();
recognition.lang = "en-US";

const startBtn = document.querySelector("button");
const diagnostic = document.querySelector(".output");
```

Tiếp theo, chúng ta thêm một trình xử lý sự kiện `click` vào `<button>`. Khi nó được nhấp, chúng ta tạo một phần tử {{htmlelement("audio")}} mới bằng cách sử dụng bộ khởi tạo {{domxref("HTMLAudioElement.Audio", "Audio()")}} và tải một file MP3 vào đó. Khi MP3 sẵn sàng để phát (được xác định bởi sự kiện {{domxref("HTMLMediaElement.canplay_event", "canplay")}}), chúng ta nắm bắt nó dưới dạng một {{domxref("MediaStream")}} bằng cách sử dụng phương thức {{domxref("HTMLMediaElement.captureStream", "captureStream()")}}, sau đó trích xuất {{domxref("MediaStreamTrack")}} audio của nó bằng cách sử dụng {{domxref("MediaStream.getAudioTracks", "getAudioTracks()")}}.

Sau đó chúng ta phát audio (bắt buộc để việc nhận dạng diễn ra), và truyền `MediaStreamTrack` vào phương thức `start()` để bắt đầu nhận dạng.

```js
startBtn.addEventListener("click", () => {
  diagnostic.textContent = "";
  console.log("Loading audio track");
  const audioElement = new Audio("cheese-on-toast.mp3");
  audioElement.addEventListener("canplay", () => {
    const stream = audioElement.captureStream();
    const audioTrack = stream.getAudioTracks()[0];
    audioElement.play();
    recognition.start(audioTrack);
    console.log("Recognition started");
  });
});
```

Để xuất audio đã nhận dạng, chúng ta lắng nghe sự kiện {{domxref("SpeechRecognition.result_event", "result")}}. Khi sự kiện này được kích hoạt, chúng ta lấy {{domxref("SpeechRecognitionAlternative.transcript", "transcript")}} của {{domxref("SpeechRecognitionAlternative")}} đầu tiên của {{domxref("SpeechRecognitionResult")}} đầu tiên trong danh sách {{domxref("SpeechRecognitionEvent.results", "results")}} được trả về. Chúng ta xuất chính transcript đó ra `<p>` đầu ra và ghi nhận độ tin cậy của nó vào console.

```js
recognition.addEventListener("result", (event) => {
  const speech = event.results[0][0].transcript;
  diagnostic.textContent = `Speech recognized: ${speech}.`;
  console.log(`Confidence: ${event.results[0][0].confidence}`);
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
