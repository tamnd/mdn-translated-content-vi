---
title: MediaSourceHandle
slug: Web/API/MediaSourceHandle
page-type: web-api-interface
browser-compat: api.MediaSourceHandle
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`MediaSourceHandle`** của {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}} là một proxy cho {{domxref("MediaSource")}} có thể được chuyển từ một dedicated worker trở lại luồng chính và gắn vào phần tử media thông qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}}. Các đối tượng `MediaSource` không thể chuyển được vì chúng là event target, do đó cần có `MediaSourceHandle`.

Nó có thể được truy cập thông qua thuộc tính {{domxref("MediaSource.handle")}}.

Mỗi đối tượng `MediaSource` được tạo bên trong một dedicated worker có `MediaSourceHandle` riêng biệt của nó. Getter `MediaSource.handle` sẽ luôn trả về thể hiện `MediaSourceHandle` cụ thể cho thể hiện `MediaSource` của dedicated worker liên quan.

`MediaSourceHandle` là [đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

Không có.

## Ví dụ

Thuộc tính {{domxref("MediaSource.handle", "handle")}} có thể được truy cập bên trong một dedicated worker và đối tượng `MediaSourceHandle` kết quả sau đó được chuyển qua luồng đã tạo worker thông qua lệnh gọi {{domxref("DedicatedWorkerGlobalScope.postMessage()", "postMessage()")}}:

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

Trong luồng chính, chúng ta nhận handle qua trình xử lý sự kiện {{domxref("Worker.message_event", "message")}}, gắn nó vào {{htmlelement("video")}} thông qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}} và phát video:

```js
worker.addEventListener("message", (msg) => {
  let mediaSourceHandle = msg.data.arg;
  video.srcObject = mediaSourceHandle;
  video.play();
});
```

> [!NOTE]
> `MediaSourceHandle` không thể được chuyển thành công vào hoặc qua shared worker hoặc service worker.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [MSE-in-Workers Demo by Matt Wolenetz](https://wolenetz.github.io/mse-in-workers-demo/mse-in-workers-demo.html)
- {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}}
- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
