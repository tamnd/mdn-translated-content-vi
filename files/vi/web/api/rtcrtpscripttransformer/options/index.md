---
title: "RTCRtpScriptTransformer: thuộc tính options"
short-title: options
slug: Web/API/RTCRtpScriptTransformer/options
page-type: web-api-instance-property
browser-compat: api.RTCRtpScriptTransformer.options
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`options`** của giao diện {{domxref("RTCRtpScriptTransformer")}} trả về đối tượng (tùy chọn) được truyền làm tham số thứ hai [trong quá trình xây dựng](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform) của {{domxref("RTCRtpScriptTransform")}} tương ứng.

## Giá trị

Một đối tượng.

## Mô tả

Cách sử dụng đơn giản nhất của options là để luồng chính chỉ ra liệu {{domxref("RTCRtpScriptTransform")}} tương ứng có được thêm vào đường ống gửi hay nhận WebRTC hay không. Điều này quan trọng nếu cùng một worker được sử dụng để xử lý cả các khung được mã hóa đến và đi, vì nó cho phép mã xác định transform nào nên được áp dụng cho các khung.

Options cũng có thể được sử dụng để gửi/transfer cổng thứ hai của [message channel](/en-US/docs/Web/API/Channel_Messaging_API) đến transform phía worker.
Kênh này sau đó có thể được sử dụng để gửi thông tin động đến transform stream, chẳng hạn khi khóa mã hóa được thay đổi hoặc thêm vào.
Lưu ý rằng bạn cũng có thể gửi tin nhắn đến transform bằng {{domxref("Worker.postMessage()")}}, nhưng sau đó bạn phải chuyển hướng tin nhắn một cách thích hợp nếu worker được sử dụng trong các bối cảnh khác nhau (trong khi tùy chọn cổng tin nhắn cung cấp một kênh trực tiếp cho một transform cụ thể).

## Ví dụ

### Cách chỉ ra đường ống WebRTC hiện tại

{{domxref("RTCRtpScriptTransform")}} được xây dựng với một {{domxref("Worker")}} cụ thể và các tùy chọn, và sau đó được chèn vào đường ống đi hoặc đến WebRTC bằng cách gán nó cho {{domxref("RTCRtpSender.transform")}} hoặc {{domxref("RTCRtpReceiver.transform")}}, tương ứng.
Nếu cùng một worker được sử dụng trong các transform cho đường ống đến và đi, thì bạn cần cung cấp các tùy chọn trong hàm khởi tạo để chỉ ra liệu các khung được mã hóa cần transform là đến hay đi.

Ví dụ bên dưới cho thấy điều này có thể được thực hiện như thế nào cho `RTCRtpScriptTransform` được thêm vào đường ống gửi sau khi thêm một track vào peer connection ({{domxref("RTCPeerConnection")}}), và sau đó thêm một transform khác vào đường ống nhận khi một track được nhận.

```js
// videoSender is an RTCRtpSender.
const videoSender = peerConnection.addTrack(track, mediaStream);
videoSender.transform = new RTCRtpScriptTransform(worker, {
  name: "senderTransform",
});
```

```js
peerConnection.ontrack = (event) => {
  // event.receiver is an RTCRtpReceiver
  event.receiver.transform = new RTCRtpScriptTransform(worker, {
    someOption: "receiverTransform",
  });
};
```

Trong mỗi trường hợp ở trên, chúng ta cung cấp một đối tượng với giá trị khác nhau cho thuộc tính `name` của đối tượng tùy chọn, chỉ ra đường ống mà transform được thêm vào.
Lưu ý rằng tên và giá trị của các thuộc tính trong `options` là tùy ý: điều quan trọng là cả luồng chính và luồng worker đều biết các thuộc tính và giá trị nào được sử dụng.

Đoạn mã sau cho thấy cách các tùy chọn được truyền được sử dụng trong worker.
Đầu tiên chúng ta triển khai một hàm xử lý cho sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}, được kích hoạt tại đối tượng worker toàn cục khi xây dựng {{domxref("RTCRtpScriptTransform")}} tương ứng, và khi các khung mới được xếp vào hàng đợi để xử lý.
`event.transformer` là {{domxref("RTCRtpScriptTransformer")}} có thuộc tính `readable`, `writable`, và `options`.

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

Mã tạo một {{domxref("TransformStream")}} khác để xử lý các khung đi và đến, sử dụng `createSenderTransform()` hoặc `createReceiverTransform()`, dựa trên các tùy chọn được truyền (sau đó pipe các khung từ `readable`, qua `TransformStream` đã chọn, đến `writable`).

### Truyền cổng tin nhắn đến transform

Ví dụ này cho thấy cách tạo [message channel](/en-US/docs/Web/API/Channel_Messaging_API) và transfer một trong các cổng của nó đến WebRTC encoded transform chạy trong worker. Luồng chính sau đó có thể gửi và transfer các đối tượng và tin nhắn đến transformer chạy trong worker sau khi xây dựng, và ngược lại.

Đoạn mã bên dưới đầu tiên tạo một {{domxref("MessageChannel")}} và sau đó xây dựng `RTCRtpScriptTransform` truyền giá trị {{domxref("MessageChannel.port2","port2")}} như một thuộc tính trong tham số đối tượng options.
Cổng cũng được bao gồm trong mảng được truyền làm tham số thứ ba của hàm khởi tạo, để nó được transfer vào bối cảnh worker.

```js
const channel = new MessageChannel();

const transform = new RTCRtpScriptTransform(
  worker,
  { purpose: "encrypter", port: channel.port2 },
  [channel.port2],
);
```

Worker sau đó có thể lấy cổng từ sự kiện `rtctransform` được kích hoạt tại đối tượng worker toàn cục.

```js
let messagePort;
addEventListener("rtctransform", (event) => {
  messagePort = event.transformer.options.port;
  // … other transformer code
});
```

Mã ở mỗi đầu của kênh có thể gửi và transfer các đối tượng đến đầu kia bằng {{domxref("MessagePort.postMessage()")}}, và lắng nghe các tin nhắn đến bằng sự kiện {{domxref("MessagePort/message_event", "message")}} của nó.

Ví dụ, giả sử chúng ta có một khóa mã hóa trong một typed array {{jsxref("Uint8Array")}} có tên `encryptionKey`, chúng ta có thể transfer nó từ luồng chính đến worker như sau:

```js
const encryptionKeyBuffer = encryptionKey.buffer;
channel.port1.postMessage(encryptionKeyBuffer, [encryptionKeyBuffer]);
```

Worker sẽ lắng nghe sự kiện `message` để lấy khóa:

```js
messagePort.addEventListener("message", (event) => {
  const encryptionKeyBuffer = event.data;
  // … Use the encryptionKeyBuffer for encryption or any other purpose
});
```

Xem [message channel](/en-US/docs/Web/API/Channel_Messaging_API) để biết thêm thông tin và ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
