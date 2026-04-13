---
title: RTCTransformEvent
slug: Web/API/RTCTransformEvent
page-type: web-api-interface
browser-compat: api.RTCTransformEvent
---

{{APIRef("WebRTC")}}

**`RTCTransformEvent`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) đại diện cho một sự kiện được kích hoạt trong một dedicated worker khi một khung được mã hóa đã được xếp vào hàng đợi để xử lý bởi một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

Giao diện có một thuộc tính {{domxref("RTCTransformEvent.transformer","transformer")}} hiển thị một readable stream và một writable stream.
Một worker nên đọc các khung được mã hóa từ `transformer.readable`, chỉnh sửa chúng khi cần, và ghi chúng vào `transformer.writable` theo cùng thứ tự mà không có bất kỳ sự trùng lặp nào.

Tại thời điểm viết, chỉ có một sự kiện dựa trên `RTCTransformEvent`: {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Vì `RTCTransformEvent` dựa trên {{domxref("Event")}}, các thuộc tính của nó cũng có sẵn._

- {{domxref("RTCTransformEvent.transformer")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("RTCRtpScriptTransformer")}} liên kết với sự kiện.

## Các loại sự kiện transform

Chỉ có một loại sự kiện transform.

### `rtctransform`

Sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}} được kích hoạt tại phạm vi toàn cục của worker khi xây dựng một {{domxref("RTCRtpScriptTransform")}} liên kết, và bất cứ khi nào một khung video hoặc âm thanh được mã hóa mới được xếp vào hàng đợi để xử lý.

Bạn có thể thêm trình lắng nghe sự kiện `rtctransform` để được thông báo khi khung mới có sẵn bằng cách dùng {{domxref("EventTarget.addEventListener", "DedicatedWorkerGlobalScope.addEventListener()")}} hoặc thuộc tính xử lý sự kiện `onrtctransform`.

## Ví dụ

Ví dụ này tạo một trình lắng nghe sự kiện cho sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}.

Ví dụ giả định chúng ta có một {{domxref("TransformStream")}} với một đối tượng `options` được truyền từ hàm khởi tạo {{domxref("RTCRtpScriptTransform")}} trong luồng chính.
Mã ở cuối cho thấy cách stream được dẫn qua transform stream từ `readable` đến `writable`.

```js
addEventListener("rtctransform", (event) => {
  let transform;
  // Select a transform based on passed options
  if (event.transformer.options.name === "senderTransform") {
    transform = createSenderTransform(); // A TransformStream (not shown)
  } else if (event.transformer.options.name === "receiverTransform") {
    transform = createReceiverTransform(); // A TransformStream (not shown)
  }
  // Pipe frames from the readable to writeable through TransformStream
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Lưu ý rằng mã này là một phần của ví dụ đầy đủ hơn được cung cấp trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("TransformStream")}}
