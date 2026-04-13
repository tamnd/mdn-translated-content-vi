---
title: "RTCRtpScriptTransformer: thuộc tính readable"
short-title: readable
slug: Web/API/RTCRtpScriptTransformer/readable
page-type: web-api-instance-property
browser-compat: api.RTCRtpScriptTransformer.readable
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("RTCRtpScriptTransformer")}} trả về một phiên bản {{domxref("ReadableStream")}} là nguồn cho các khung phương tiện được mã hóa.

Khi {{domxref("RTCRtpScriptTransform")}} tương ứng được chèn vào các đường ống gửi và nhận WebRTC, stream này có thể được xếp vào hàng đợi với các khung phương tiện được mã hóa đến hoặc đi ({{domxref("RTCEncodedVideoFrame")}} hoặc {{domxref("RTCEncodedAudioFrame")}}).
Một WebRTC encoded transform có thể đọc các khung, sửa đổi chúng khi cần thiết, và sau đó gửi chúng trở lại đường ống WebRTC bằng cách ghi chúng vào {{domxref("RTCRtpScriptTransformer.writable")}}.
Một cách phổ biến để thực hiện thao tác này là pipe các khung qua một {{domxref("TransformStream")}}.

## Giá trị

Một {{domxref("ReadableStream")}}.

## Ví dụ

Ví dụ sau cho thấy cách `readable` được piped qua một {{domxref("TransformStream")}} đến {{domxref("RTCRtpScriptTransformer.writable")}}.

```js
addEventListener("rtctransform", (event) => {
  let transform;
  // Select a transform based on passed options
  if (event.transformer.options.name === "senderTransform")
    transform = createSenderTransform(); // A TransformStream
  else if (event.transformer.options.name === "receiverTransform")
    transform = createReceiverTransform(); // A TransformStream
  else return;

  // Pipe frames from the readable to writeable through TransformStream
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Mã triển khai một hàm xử lý cho sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}, được kích hoạt tại đối tượng worker toàn cục khi xây dựng {{domxref("RTCRtpScriptTransform")}} tương ứng, và khi các khung mới được xếp vào hàng đợi để xử lý.
`event.transformer` là {{domxref("RTCRtpScriptTransformer")}} có thuộc tính `readable` và `writable`.

Một {{domxref("TransformStream")}} khác được tạo để xử lý các khung đi và đến, sử dụng `createSenderTransform()` hoặc `createReceiverTransform()`, tương ứng (triển khai không được hiển thị).
Hàm xử lý sự kiện chọn transform stream đúng để sử dụng dựa trên các tùy chọn được truyền từ [hàm khởi tạo `RTCRtpScriptTransform`](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform) và gán cho `transform`.

Mã gọi {{domxref("ReadableStream.pipeThrough()")}} trên `readable` để pipe các khung được mã hóa qua `TransformStream` đã chọn, sau đó {{domxref("ReadableStream.pipeTo()")}} để pipe chúng đến {{domxref("RTCRtpScriptTransformer.writable")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
