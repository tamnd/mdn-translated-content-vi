---
title: "BaseAudioContext: phương thức decodeAudioData()"
short-title: decodeAudioData()
slug: Web/API/BaseAudioContext/decodeAudioData
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.decodeAudioData
---

{{ APIRef("Web Audio API") }}

Phương thức `decodeAudioData()` của {{ domxref("BaseAudioContext") }}
được dùng để giải mã bất đồng bộ dữ liệu tệp âm thanh chứa trong một
{{jsxref("ArrayBuffer")}} được tải từ {{domxref("Window/fetch", "fetch()")}},
{{domxref("XMLHttpRequest")}}, hoặc {{domxref("FileReader")}}. Đối tượng
{{domxref("AudioBuffer")}} đã giải mã được lấy mẫu lại theo tốc độ lấy mẫu của
{{domxref("AudioContext")}}, rồi được truyền cho callback hoặc promise.

Đây là phương thức được ưu tiên để tạo một nguồn âm thanh cho Web Audio API từ một
track âm thanh. Phương thức này chỉ hoạt động với dữ liệu tệp hoàn chỉnh, không hoạt động với các mảnh dữ liệu của tệp âm thanh.

Hàm này triển khai hai cách thay thế nhau để trả về bất đồng bộ dữ liệu âm thanh hoặc thông báo lỗi: nó trả về một {{jsxref("Promise")}} được thực hiện với dữ liệu âm thanh, đồng thời cũng chấp nhận các đối số callback để xử lý thành công hoặc thất bại. Cách giao tiếp chính với hàm này là thông qua giá trị trả về Promise, còn các tham số callback được cung cấp vì lý do tương thích cũ.

## Cú pháp

```js-nolint
// Cú pháp dựa trên Promise trả về một Promise:
decodeAudioData(arrayBuffer)

// Cú pháp callback không có giá trị trả về:
decodeAudioData(arrayBuffer, successCallback)
decodeAudioData(arrayBuffer, successCallback, errorCallback)
```

### Tham số

- `arrayBuffer`
  - : Một ArrayBuffer chứa dữ liệu âm thanh cần giải mã, thường được lấy từ
    {{domxref("Window/fetch", "fetch()")}}, {{domxref("XMLHttpRequest")}} hoặc {{domxref("FileReader")}}.
- `successCallback` {{optional_inline}}
  - : Một hàm callback sẽ được gọi khi quá trình giải mã hoàn tất thành công. Đối số duy nhất của callback này là một {{domxref("AudioBuffer")}} biểu diễn _decodedData_ (dữ liệu âm thanh PCM đã giải mã). Thông thường bạn sẽ muốn đưa dữ liệu đã giải mã vào một {{domxref("AudioBufferSourceNode")}}, từ đó nó có thể được phát và thao tác theo ý muốn.
- `errorCallback` {{optional_inline}}
  - : Một callback lỗi tùy chọn, sẽ được gọi nếu xảy ra lỗi khi dữ liệu âm thanh đang được giải mã.

### Giá trị trả về

Một đối tượng {{jsxref("Promise") }} được thực hiện với _decodedData_. Nếu bạn dùng cú pháp XHR thì bạn sẽ bỏ qua giá trị trả về này và sử dụng hàm callback thay vào đó.

## Ví dụ

Trong phần này, trước hết chúng ta sẽ đề cập tới cú pháp dựa trên promise, sau đó là cú pháp callback.

### Cú pháp dựa trên Promise

Trong ví dụ này, `loadAudio()` dùng {{domxref("Window/fetch", "fetch()")}} để lấy một tệp âm thanh và giải mã nó thành một {{domxref("AudioBuffer")}}. Sau đó nó lưu `audioBuffer` vào biến toàn cục `buffer` để phát lại về sau.

> [!NOTE]
> Bạn có thể [chạy ví dụ đầy đủ trực tiếp](https://mdn.github.io/webaudio-examples/decode-audio-data/promise/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/decode-audio-data/promise).

```js
let audioCtx;
let buffer;
let source;

async function loadAudio() {
  try {
    // Tải một tệp âm thanh
    const response = await fetch("viper.mp3");
    // Giải mã nó
    buffer = await audioCtx.decodeAudioData(await response.arrayBuffer());
  } catch (err) {
    console.error(`Unable to fetch the audio file. Error: ${err.message}`);
  }
}
```

### Cú pháp callback

Trong ví dụ này, `loadAudio()` dùng {{domxref("Window/fetch", "fetch()")}} để lấy một tệp âm thanh và giải mã nó thành một {{domxref("AudioBuffer")}} bằng phiên bản dựa trên callback của `decodeAudioData()`. Trong callback, nó phát bộ đệm đã giải mã.

> [!NOTE]
> Bạn có thể [chạy ví dụ đầy đủ trực tiếp](https://mdn.github.io/webaudio-examples/decode-audio-data/callback/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/decode-audio-data/callback).

```js
let audioCtx;
let source;

function playBuffer(buffer) {
  source = audioCtx.createBufferSource();
  source.buffer = buffer;
  source.connect(audioCtx.destination);
  source.loop = true;
  source.start();
}

async function loadAudio() {
  try {
    // Tải một tệp âm thanh
    const response = await fetch("viper.mp3");
    // Giải mã nó
    audioCtx.decodeAudioData(await response.arrayBuffer(), playBuffer);
  } catch (err) {
    console.error(`Unable to fetch the audio file. Error: ${err.message}`);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
