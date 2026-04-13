---
title: "AudioContext: phương thức createMediaStreamDestination()"
short-title: createMediaStreamDestination()
slug: Web/API/AudioContext/createMediaStreamDestination
page-type: web-api-instance-method
browser-compat: api.AudioContext.createMediaStreamDestination
---

{{ APIRef("Web Audio API") }}

Phương thức `createMediaStreamDestination()` của giao diện {{ domxref("AudioContext") }} được dùng để tạo một đối tượng {{domxref("MediaStreamAudioDestinationNode")}} mới gắn với một {{domxref("MediaStream")}} [WebRTC](/en-US/docs/Web/API/WebRTC_API) biểu diễn một luồng âm thanh, có thể được lưu vào tệp cục bộ hoặc gửi tới máy tính khác.

{{domxref("MediaStream")}} được tạo ra khi nút được tạo và có thể truy cập thông qua thuộc tính `stream` của {{domxref("MediaStreamAudioDestinationNode")}}. Luồng này có thể được dùng tương tự như một `MediaStream` nhận được qua {{domxref("navigator.getUserMedia") }}. Ví dụ, nó có thể được gửi tới một peer ở xa bằng phương thức `addStream()` của `RTCPeerConnection`.

Để biết thêm chi tiết về các media stream destination node, hãy xem trang tham chiếu {{domxref("MediaStreamAudioDestinationNode")}}.

## Cú pháp

```js-nolint
createMediaStreamDestination()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("MediaStreamAudioDestinationNode")}}.

## Ví dụ

Trong ví dụ đơn giản sau, chúng ta tạo một {{domxref("MediaStreamAudioDestinationNode")}}, một {{ domxref("OscillatorNode") }} và một {{ domxref("MediaRecorder") }} (vì vậy ví dụ hiện tại chỉ hoạt động trong Firefox và Chrome). `MediaRecorder` được thiết lập để ghi thông tin từ `MediaStreamDestinationNode`.

Khi nhấn nút, oscillator bắt đầu chạy và `MediaRecorder` được khởi động. Khi nút dừng được nhấn, cả oscillator lẫn `MediaRecorder` đều dừng. Việc dừng `MediaRecorder` khiến sự kiện `dataavailable` được kích hoạt, và dữ liệu sự kiện được đưa vào mảng `chunks`. Sau đó sự kiện `stop` được kích hoạt, một `blob` mới kiểu opus được tạo ra, chứa dữ liệu trong mảng `chunks`, rồi một cửa sổ (tab) mới được mở trỏ tới một URL được tạo từ blob.

Từ đây, bạn có thể phát và lưu tệp opus.

```html
<button>Make sine wave</button> <audio controls></audio>
```

```js
const b = document.querySelector("button");
let clicked = false;
const chunks = [];
const ac = new AudioContext();
const osc = ac.createOscillator();
const dest = ac.createMediaStreamDestination();
const mediaRecorder = new MediaRecorder(dest.stream);
osc.connect(dest);

b.addEventListener("click", (e) => {
  if (!clicked) {
    mediaRecorder.start();
    osc.start(0);
    e.target.textContent = "Stop recording";
    clicked = true;
  } else {
    mediaRecorder.stop();
    osc.stop(0);
    e.target.disabled = true;
  }
});

mediaRecorder.ondataavailable = (evt) => {
  // Push each chunk (blobs) in an array
  chunks.push(evt.data);
};

mediaRecorder.onstop = (evt) => {
  // Make blob out of our blobs, and open it.
  const blob = new Blob(chunks, { type: "audio/ogg; codecs=opus" });
  document.querySelector("audio").src = URL.createObjectURL(blob);
};
```

> [!NOTE]
> Bạn có thể [xem ví dụ này trực tiếp](https://mdn.github.io/webaudio-examples/create-media-stream-destination/index.html), hoặc [nghiên cứu mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/create-media-stream-destination/index.html) trên GitHub.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
