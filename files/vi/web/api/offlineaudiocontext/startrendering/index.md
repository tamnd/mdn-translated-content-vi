---
title: "OfflineAudioContext: phương thức startRendering()"
short-title: startRendering()
slug: Web/API/OfflineAudioContext/startRendering
page-type: web-api-instance-method
browser-compat: api.OfflineAudioContext.startRendering
---

{{ APIRef("Web Audio API") }}

Phương thức `startRendering()` của giao diện {{ domxref("OfflineAudioContext") }} bắt đầu render đồ thị âm thanh, có tính đến các kết nối hiện tại và các thay đổi đã được lên lịch.

Sự kiện {{domxref("OfflineAudioContext/complete_event", "complete")}} (có kiểu {{domxref("OfflineAudioCompletionEvent")}}) được phát ra khi render kết thúc, chứa {{domxref("AudioBuffer")}} kết quả trong thuộc tính `renderedBuffer` của nó.

Các trình duyệt hiện hỗ trợ hai phiên bản của phương thức `startRendering()`, một phiên bản cũ dựa trên sự kiện và một phiên bản mới hơn dựa trên promise. Phiên bản cũ cuối cùng sẽ bị xóa, nhưng hiện tại cả hai cơ chế đều được cung cấp vì lý do kế thừa.

## Cú pháp

```js-nolint
startRendering()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với một {{domxref("AudioBuffer")}}.

## Ví dụ

### Phát âm thanh với một offline audio context

Trong ví dụ này, chúng ta khai báo cả một đối tượng {{domxref("AudioContext")}} và một đối tượng `OfflineAudioContext`. Chúng ta sử dụng `AudioContext` để tải một track âm thanh bằng {{domxref("Window/fetch", "fetch()")}}, sau đó sử dụng `OfflineAudioContext` để render âm thanh vào một {{domxref("AudioBufferSourceNode")}} và phát track. Sau khi đồ thị âm thanh offline được thiết lập, chúng ta render nó thành một {{domxref("AudioBuffer")}} bằng `OfflineAudioContext.startRendering()`.

Khi promise `startRendering()` được giải quyết, quá trình render đã hoàn thành và `AudioBuffer` đầu ra được trả về từ promise.

Tại thời điểm này, chúng ta tạo một audio context khác, tạo một {{domxref("AudioBufferSourceNode")}} bên trong nó và đặt buffer của nó bằng với promise `AudioBuffer`. Sau đó nó được phát như một phần của đồ thị âm thanh tiêu chuẩn đơn giản.

> [!NOTE]
> Bạn có thể [chạy ví dụ đầy đủ trực tiếp](https://mdn.github.io/webaudio-examples/offline-audio-context-promise/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/offline-audio-context-promise).

```js
// Define both online and offline audio contexts
let audioCtx; // Must be initialized after a user interaction
const offlineCtx = new OfflineAudioContext(2, 44100 * 40, 44100);

// Define constants for dom nodes
const play = document.querySelector("#play");

function getData() {
  // Fetch an audio track, decode it and stick it in a buffer.
  // Then we put the buffer into the source and can play it.
  fetch("viper.ogg")
    .then((response) => response.arrayBuffer())
    .then((downloadedBuffer) => audioCtx.decodeAudioData(downloadedBuffer))
    .then((decodedBuffer) => {
      console.log("File downloaded successfully.");
      const source = new AudioBufferSourceNode(offlineCtx, {
        buffer: decodedBuffer,
      });
      source.connect(offlineCtx.destination);
      return source.start();
    })
    .then(() => offlineCtx.startRendering())
    .then((renderedBuffer) => {
      console.log("Rendering completed successfully.");
      play.disabled = false;
      const song = new AudioBufferSourceNode(audioCtx, {
        buffer: renderedBuffer,
      });
      song.connect(audioCtx.destination);

      // Start the song
      song.start();
    })
    .catch((err) => {
      console.error(`Error encountered: ${err}`);
    });
}

// Activate the play button
play.onclick = () => {
  play.disabled = true;
  // We can initialize the context as the user clicked.
  audioCtx = new AudioContext();

  // Fetch the data and start the song
  getData();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
