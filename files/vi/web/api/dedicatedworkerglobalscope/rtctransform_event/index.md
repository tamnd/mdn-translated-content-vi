---
title: "DedicatedWorkerGlobalScope: rtctransform event"
short-title: rtctransform
slug: Web/API/DedicatedWorkerGlobalScope/rtctransform_event
page-type: web-api-event
browser-compat: api.DedicatedWorkerGlobalScope.rtctransform_event
---

{{APIRef("WebRTC")}}{{AvailableInWorkers("dedicated")}}

Sự kiện **`rtctransform`** được kích hoạt tại đối tượng {{domxref('DedicatedWorkerGlobalScope')}} của worker khi một khung video hoặc âm thanh đã mã hóa được đưa vào hàng đợi để xử lý bởi {{domxref("WebRTC API/Using Encoded Transforms", "WebRTC Encoded Transform", "", "nocode")}}.

Thuộc tính {{domxref("RTCTransformEvent.transformer","transformer")}} của sự kiện trả về một {{domxref("RTCRtpScriptTransformer")}} phơi bày {{domxref("ReadableStream")}} nơi khung được xếp hàng, và một {{domxref("WritableStream")}} nơi khung có thể được ghi vào để đưa nó trở lại pipeline WebRTC.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("rtctransform", (event) => { })

onrtctransform = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("RTCTransformEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("RTCTransformEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("RTCTransformEvent.transformer")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("RTCRtpScriptTransformer")}} được liên kết với sự kiện.

## Ví dụ

Đoạn mã sau cho thấy một bộ xử lý cho sự kiện `rtctransform` trong worker, được thêm vào phạm vi global bằng `addEventListener()`.
`event.transformer` là một {{domxref("RTCRtpScriptTransformer")}}, đối ứng phía worker của {{domxref("RTCRtpScriptTransform")}}.

```js
addEventListener("rtctransform", (event) => {
  let transform;
  // Chọn một transform dựa trên các tùy chọn được truyền vào
  if (event.transformer.options.name === "senderTransform")
    transform = createSenderTransform(); // Một TransformStream
  else if (event.transformer.options.name === "receiverTransform")
    transform = createReceiverTransform(); // Một TransformStream
  else return;

  // Đẩy các frame từ readable sang writable qua TransformStream
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Sự kiện `rtctransform` được kích hoạt khi một khung đã mã hóa được xếp hàng trên {{domxref("RTCRtpScriptTransformer")}} và chỉ một lần khi {{domxref("RTCRtpScriptTransformer")}} tương ứng của transformer được khởi tạo.
Mã trước tiên xác định transform nào sẽ áp dụng bằng giá trị `name` được truyền trong các tùy chọn (điều này cho phép các thể hiện {{domxref("RTCRtpScriptTransform")}} được thêm vào các pipeline WebRTC đầu vào và đầu ra dùng chung một worker).
Các khung đã mã hóa sau đó được dẫn từ readable, qua {{domxref("TransformStream")}} đã chọn, đến writable.
Mã transform thực tế không được hiển thị.

Lưu ý rằng mã này là một phần của ví dụ đầy đủ hơn được cung cấp trong {{domxref("WebRTC API/Using Encoded Transforms", "Using WebRTC Encoded Transforms", "", "nocode")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebRTC API/Using Encoded Transforms", "Using WebRTC Encoded Transforms", "", "nocode")}}
