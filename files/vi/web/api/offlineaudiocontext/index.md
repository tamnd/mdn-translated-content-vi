---
title: OfflineAudioContext
slug: Web/API/OfflineAudioContext
page-type: web-api-interface
browser-compat: api.OfflineAudioContext
---

{{APIRef("Web Audio API")}}

Giao diện `OfflineAudioContext` là một giao diện {{domxref("AudioContext")}} đại diện cho một đồ thị xử lý âm thanh được xây dựng từ các {{domxref("AudioNode")}} được liên kết với nhau. Trái ngược với {{domxref("AudioContext")}} tiêu chuẩn, `OfflineAudioContext` không render âm thanh ra thiết bị phần cứng; thay vào đó, nó tạo ra âm thanh nhanh nhất có thể và xuất kết quả ra một {{domxref("AudioBuffer")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("OfflineAudioContext.OfflineAudioContext()", "OfflineAudioContext()")}}
  - : Tạo một phiên bản `OfflineAudioContext` mới.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("BaseAudioContext")}}._

- {{domxref('OfflineAudioContext.length')}} {{ReadOnlyInline}}
  - : Một số nguyên đại diện cho kích thước của bộ đệm tính bằng sample-frame.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("BaseAudioContext")}}._

- {{domxref("OfflineAudioContext.suspend()")}}
  - : Lên lịch tạm dừng tiến trình thời gian trong audio context vào thời điểm được chỉ định và trả về một promise.
- {{domxref("OfflineAudioContext.startRendering()")}}
  - : Bắt đầu render âm thanh, có tính đến các kết nối hiện tại và các thay đổi đã được lên lịch. Trang này bao gồm cả phiên bản dựa trên sự kiện và phiên bản dựa trên promise.

### Các phương thức đã lỗi thời

- {{domxref("OfflineAudioContext.resume()")}}
  - : Tiếp tục tiến trình thời gian trong một audio context đã bị tạm dừng trước đó.

> [!NOTE]
> Phương thức `resume()` vẫn còn có sẵn, hiện được định nghĩa trong giao diện {{domxref("BaseAudioContext")}} (xem {{domxref("AudioContext.resume")}}) và do đó có thể được truy cập bởi cả giao diện {{domxref("AudioContext")}} và `OfflineAudioContext`.

## Sự kiện

Lắng nghe các sự kiện này bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán một trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này:

- [`complete`](/en-US/docs/Web/API/OfflineAudioContext/complete_event)
  - : Được kích hoạt khi việc render của một offline audio context hoàn thành.

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
