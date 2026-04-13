---
title: "RTCRtpScriptTransformer: phương thức sendKeyFrameRequest()"
short-title: sendKeyFrameRequest()
slug: Web/API/RTCRtpScriptTransformer/sendKeyFrameRequest
page-type: web-api-instance-method
browser-compat: api.RTCRtpScriptTransformer.sendKeyFrameRequest
---

{{APIRef("WebRTC")}}

Phương thức **`sendKeyFrameRequest()`** của giao diện {{domxref("RTCRtpScriptTransformer")}} có thể được gọi bởi một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) đang xử lý các khung video được mã hóa đến, để yêu cầu khung chính từ người gửi.

Phương thức chỉ có thể được gọi khi nhận các khung _video_ (không phải audio) và nếu, vì bất kỳ lý do gì, người nhận sẽ không thể giải mã video mà không có khung chính mới.
Lưu ý rằng user agent có thể quyết định rằng yêu cầu khung chính là không cần thiết, trong trường hợp đó promise được trả về sẽ được giải quyết ngay cả khi yêu cầu thực sự không được gửi.

> [!NOTE]
> Ví dụ, nó có thể được gọi khi một người dùng mới tham gia cuộc gọi WebRTC, để giảm thời gian trước khi họ nhận được khung chính và do đó có thể bắt đầu hiển thị video.
> Để biết thêm thông tin, xem [Triggering a key frame](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms#triggering_a_key_frame) trong Using WebRTC Encoded Transforms.

## Cú pháp

```js-nolint
sendKeyFrameRequest()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined` sau khi yêu cầu được gửi, hoặc user agent quyết định rằng không cần thiết.

### Ngoại lệ

- `InvalidStateError`
  - : De-packetizer không xử lý các gói video, hoặc là `undefined`.

## Ví dụ

Ví dụ bên dưới cho thấy cách luồng chính của ứng dụng WebRTC đang nhận video được mã hóa có thể truyền khóa giải mã đến transform nhận, và yêu cầu người gửi phát ra khung chính.

Lưu ý rằng luồng chính không có quyền truy cập trực tiếp vào đối tượng {{domxref("RTCRtpScriptTransformer")}}, vì vậy nó cần truyền khóa đến worker.
Ở đây chúng ta thực hiện điều đó với một `MessageChannel`, transfer cổng thứ hai đến mã transformer chạy trong worker.
Mã giả định đã có một peer connection, và `videoReceiver` là một {{domxref("RTCRtpReceiver")}}.

```js
const worker = new Worker("worker.js");
const channel = new MessageChannel();

videoReceiver.transform = new RTCRtpScriptTransform(
  worker,
  { name: "receiverTransform", port: channel.port2 },
  [channel.port2],
);

// Post new key to the receiver
channel.port1.start();
channel.port1.postMessage({
  key: "93ae0927a4f8e527f1gce6d10bc6ab6c",
});
```

Trình xử lý sự kiện {{domxref("DedicatedWorkerGlobalScope/rtctransform_event", "rtctransform")}} trong worker lấy cổng là `event.transformer.options.port`.
Đoạn mã bên dưới cho thấy cách nó được sử dụng để lắng nghe các sự kiện `message` trên kênh.
Nếu nhận được sự kiện, hàm xử lý lấy `key`, sau đó gọi `sendKeyFrameRequest()` trên transformer.

```js
event.transformer.options.port.onmessage = (event) => {
  const { key } = event.data;
  // key is used by the transformer to decrypt frames (not shown)

  // Request sender to emit a key frame.
  // Here 'rcEvent' is the rtctransform event.
  rcEvent.transformer.sendKeyFrameRequest();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{DOMxRef("RTCRtpScriptTransformer")}}
