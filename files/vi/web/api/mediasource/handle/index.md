---
title: "MediaSource: handle property"
short-title: handle
slug: Web/API/MediaSource/handle
page-type: web-api-instance-property
browser-compat: api.MediaSource.handle
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("dedicated")}}

Thuộc tính chỉ đọc **`handle`** của giao diện {{domxref("MediaSource")}} trả về một đối tượng {{domxref("MediaSourceHandle")}}, là proxy cho `MediaSource` có thể được chuyển từ một dedicated worker trở lại luồng chính và gắn vào media element thông qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}}.

> [!NOTE]
> `handle` chỉ hiển thị trên các thực thể {{domxref("MediaSource")}} bên trong dedicated workers.

Mỗi đối tượng `MediaSource` được tạo bên trong một dedicated worker đều có đối tượng `MediaSourceHandle` riêng biệt của nó. Getter `handle` sẽ luôn trả về thực thể `MediaSourceHandle` cụ thể cho thực thể `MediaSource` của dedicated worker liên quan. Nếu handle đã được chuyển sang luồng chính bằng {{domxref("DedicatedWorkerGlobalScope.postMessage()", "postMessage()")}}, thì thực thể handle trong worker về mặt kỹ thuật đã bị tách rời và không thể được chuyển lại nữa.

## Giá trị

Một thực thể đối tượng {{domxref("MediaSourceHandle")}}.

## Ví dụ

Thuộc tính `handle` có thể được truy cập bên trong một dedicated worker và đối tượng {{domxref("MediaSourceHandle")}} thu được sau đó được chuyển sang luồng đã tạo worker đó (trong trường hợp này là luồng chính) thông qua lời gọi {{domxref("DedicatedWorkerGlobalScope.postMessage()", "postMessage()")}}:

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [MSE-in-Workers Demo by Matt Wolenetz](https://wolenetz.github.io/mse-in-workers-demo/mse-in-workers-demo.html)
- {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}}
- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
