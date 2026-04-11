---
title: MediaSource
slug: Web/API/MediaSource
page-type: web-api-interface
browser-compat: api.MediaSource
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`MediaSource`** của {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}} đại diện cho một nguồn dữ liệu media cho đối tượng {{domxref("HTMLMediaElement")}}. Một đối tượng `MediaSource` có thể được gắn vào {{domxref("HTMLMediaElement")}} để trình duyệt phát.

{{InheritanceDiagram}}

## Constructor

- {{domxref("MediaSource.MediaSource", "MediaSource()")}}
  - : Khởi tạo và trả về một đối tượng `MediaSource` mới không có source buffer nào được liên kết.

## Thuộc tính thể hiện

- {{domxref("MediaSource.activeSourceBuffers")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SourceBufferList")}} chứa một tập con các đối tượng {{domxref("SourceBuffer")}} nằm trong {{domxref("MediaSource.sourceBuffers")}} - danh sách các đối tượng cung cấp track video đã chọn, các track âm thanh đã bật, và các track văn bản đang được hiển thị/ẩn.
- {{domxref("MediaSource.duration")}}
  - : Lấy và đặt thời lượng của media hiện đang được trình bày.
- {{domxref("MediaSource.handle")}} {{ReadOnlyInline}}
  - : Bên trong dedicated worker, trả về một đối tượng {{domxref("MediaSourceHandle")}}, là proxy cho `MediaSource` có thể được chuyển từ worker trở lại luồng chính và gắn vào media element thông qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}}.
- {{domxref("MediaSource.readyState")}} {{ReadOnlyInline}}
  - : Trả về một enum biểu thị trạng thái hiện tại của `MediaSource`, cho biết nó chưa được gắn vào media element (`closed`), đã được gắn và sẵn sàng nhận các đối tượng {{domxref("SourceBuffer")}} (`open`), hay đã được gắn nhưng luồng đã kết thúc thông qua {{domxref("MediaSource.endOfStream()")}} (`ended`).
- {{domxref("MediaSource.sourceBuffers")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SourceBufferList")}} chứa danh sách các đối tượng {{domxref("SourceBuffer")}} được liên kết với `MediaSource` này.

## Thuộc tính tĩnh

- {{domxref("MediaSource.canConstructInDedicatedWorker_static", "MediaSource.canConstructInDedicatedWorker")}} {{ReadOnlyInline}}
  - : Giá trị boolean; trả về `true` nếu đã triển khai hỗ trợ `MediaSource` trong worker, cung cấp một cơ chế phát hiện tính năng độ trễ thấp.

## Phương thức thể hiện

_Kế thừa phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("MediaSource.addSourceBuffer()")}}
  - : Tạo một {{domxref("SourceBuffer")}} mới với MIME type đã cho và thêm nó vào danh sách {{domxref("MediaSource.sourceBuffers")}}.
- {{domxref("MediaSource.clearLiveSeekableRange()")}}
  - : Xóa một vùng có thể tua đã được đặt trước đó bằng lời gọi `setLiveSeekableRange()`.
- {{domxref("MediaSource.endOfStream()")}}
  - : Báo hiệu kết thúc của luồng.
- {{domxref("MediaSource.removeSourceBuffer()")}}
  - : Xóa `SourceBuffer` đã cho khỏi danh sách {{domxref("MediaSource.sourceBuffers")}}.
- {{domxref("MediaSource.setLiveSeekableRange()")}}
  - : Đặt vùng mà người dùng có thể tua đến trong media element.

## Phương thức tĩnh

- {{domxref("MediaSource.isTypeSupported_static", "MediaSource.isTypeSupported()")}}
  - : Trả về một giá trị boolean cho biết MIME type đã cho có được user agent hiện tại hỗ trợ hay không - tức là nó có thể tạo thành công các đối tượng {{domxref("SourceBuffer")}} cho MIME type đó.

## Sự kiện

- {{domxref("MediaSource.sourceclose_event", "sourceclose")}}
  - : Phát ra khi thực thể `MediaSource` không còn được gắn vào media element nữa.
- {{domxref("MediaSource.sourceended_event", "sourceended")}}
  - : Phát ra khi thực thể `MediaSource` vẫn được gắn vào media element, nhưng {{domxref("MediaSource.endOfStream", "endOfStream()")}} đã được gọi.
- {{domxref("MediaSource.sourceopen_event", "sourceopen")}}
  - : Phát ra khi thực thể `MediaSource` đã được mở bởi media element và sẵn sàng để dữ liệu được thêm vào các đối tượng {{domxref("SourceBuffer")}} trong {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}}.

## Ví dụ

### Ví dụ cơ bản hoàn chỉnh

Ví dụ đơn giản sau tải một video bằng {{domxref("XMLHttpRequest")}}, phát ngay khi có thể. Ví dụ này do Nick Desaulniers viết và có thể [xem trực tiếp tại đây](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html) (bạn cũng có thể [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
const video = document.querySelector("video");

const assetURL = "frag_bunny.mp4";
// Need to be specific for Blink regarding codecs
// ./mp4info frag_bunny.mp4 | grep Codec
const mimeCodec = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"';
let mediaSource;

if ("MediaSource" in window && MediaSource.isTypeSupported(mimeCodec)) {
  mediaSource = getMediaSource();
  console.log(mediaSource.readyState); // closed
  video.src = URL.createObjectURL(mediaSource);
  mediaSource.addEventListener("sourceopen", sourceOpen);
} else {
  console.error("Unsupported MIME type or codec: ", mimeCodec);
}

function sourceOpen() {
  console.log(this.readyState); // open
  const sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
  fetchAB(assetURL, (buf) => {
    sourceBuffer.addEventListener("updateend", () => {
      mediaSource.endOfStream();
      video.play();
      console.log(mediaSource.readyState); // ended
    });
    sourceBuffer.appendBuffer(buf);
  });
}

function fetchAB(url, cb) {
  console.log(url);
  const xhr = new XMLHttpRequest();
  xhr.open("get", url);
  xhr.responseType = "arraybuffer";
  xhr.onload = () => {
    cb(xhr.response);
  };
  xhr.send();
}
```

### Tạo `MediaSource` trong dedicated worker và chuyển nó sang luồng chính

Thuộc tính {{domxref("MediaSource.handle", "handle")}} có thể được truy cập bên trong một dedicated worker và đối tượng {{domxref("MediaSourceHandle")}} thu được sau đó được chuyển sang luồng đã tạo worker đó (trong trường hợp này là luồng chính) thông qua lời gọi {{domxref("DedicatedWorkerGlobalScope.postMessage()", "postMessage()")}}:

```js
// Inside dedicated worker
let mediaSource = new MediaSource();
let handle = mediaSource.handle;
// Transfer the handle to the context that created the worker
postMessage({ arg: handle }, [handle]);

mediaSource.addEventListener("sourceopen", () => {
  // Await sourceopen on MediaSource before creating SourceBuffers
  // and populating them with fetched media — MediaSource won't
  // accept creation of SourceBuffers until it is attached to the
  // HTMLMediaElement and its readyState is "open"
});
```

Ở phía luồng chính, ta nhận handle qua trình xử lý sự kiện {{domxref("Worker.message_event", "message")}}, gắn nó vào một {{htmlelement("video")}} thông qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}}, và phát video bằng {{domxref("HTMLMediaElement.play()", "play")}}:

```js
worker.addEventListener("message", (msg) => {
  let mediaSourceHandle = msg.data.arg;
  video.srcObject = mediaSourceHandle;
  video.play();
});
```

> [!NOTE]
> {{domxref("MediaSourceHandle")}} không thể được chuyển thành công vào hoặc qua shared worker hoặc service worker.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SourceBuffer")}}
- {{domxref("SourceBufferList")}}
