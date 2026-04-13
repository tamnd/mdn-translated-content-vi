---
title: RTCRtpScriptTransformer
slug: Web/API/RTCRtpScriptTransformer
page-type: web-api-interface
browser-compat: api.RTCRtpScriptTransformer
---

{{APIRef("WebRTC")}}

Giao diện **`RTCRtpScriptTransformer`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp một giao diện [Stream API](/en-US/docs/Web/API/Streams_API) ở phía worker mà một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) có thể sử dụng để sửa đổi các khung phương tiện được mã hóa trong các đường ống WebRTC đến và đi.

> [!NOTE]
> Tính năng này có sẵn trong [_Dedicated_ Web Workers](/en-US/docs/Web/API/Web_Workers_API#worker_types).

## Thuộc tính phiên bản

- {{domxref("RTCRtpScriptTransformer.readable")}} {{ReadOnlyInline}}
  - : Một {{domxref("ReadableStream")}} trên đó các khung được mã hóa từ các đường ống gửi hoặc nhận WebRTC có thể được xếp vào hàng đợi.
- {{domxref("RTCRtpScriptTransformer.writable")}} {{ReadOnlyInline}}
  - : Một {{domxref("WritableStream")}} mà các khung được mã hóa nên được piped đến.
- {{domxref("RTCRtpScriptTransformer.options")}} {{ReadOnlyInline}}
  - : Các tùy chọn được truyền từ [hàm khởi tạo `RTCRtpScriptTransform`](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform), được sử dụng để cấu hình mã transform dựa trên việc các khung đến hay đi đang được xử lý.

## Phương thức phiên bản

- {{domxref("RTCRtpScriptTransformer.generateKeyFrame()")}}
  - : Yêu cầu bộ mã hóa video tạo một khung chính. Có thể được gọi bởi một transformer trong đường ống gửi khi xử lý các khung đi.
- {{domxref("RTCRtpScriptTransformer.sendKeyFrameRequest()")}}
  - : Yêu cầu người gửi gửi một khung chính. Có thể được gọi bởi một transformer trong đường ống nhận khi xử lý các khung video đến được mã hóa.

## Mô tả

Một phiên bản `RTCRtpScriptTransformer` được tạo như một phần của việc xây dựng {{DOMxRef("RTCRtpScriptTransform")}} liên quan, chỉ định worker mà transformer được tạo và các tùy chọn sẽ được truyền cho nó.

Transformer được cung cấp cho worker thông qua thuộc tính `transformer` của sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}.
Sự kiện này được kích hoạt khi xây dựng {{DOMxRef("RTCRtpScriptTransform")}} liên quan và khi một khung được mã hóa được xếp vào hàng đợi trên {{domxref("RTCRtpScriptTransformer.readable")}} từ một codec (đi) hoặc từ packetizer (đến).

Transformer cung cấp một luồng {{domxref("RTCRtpScriptTransformer.readable","readable")}} và {{domxref("RTCRtpScriptTransformer.writable","writable")}} vào worker, cùng với một đối tượng {{domxref("RTCRtpScriptTransformer.options", "options")}} được cung cấp cho {{DOMxRef("RTCRtpScriptTransform")}} khi xây dựng.
Khi `RTCRtpScriptTransform` liên kết được gán cho {{DOMxRef("RTCRtpSender")}} hoặc {{DOMxRef("RTCRtpReceiver")}}, các khung phương tiện được mã hóa từ các đường ống gửi hoặc nhận WebRTC được xếp vào hàng đợi trên luồng `readable`.

Một WebRTC Encoded Transform phải đọc các khung được mã hóa từ `transformer.readable`, sửa đổi chúng khi cần thiết, và ghi chúng vào `transformer.writable` theo cùng thứ tự, và không có bất kỳ sự trùng lặp nào.
{{domxref("RTCRtpScriptTransformer.options","transformer.options")}} cho phép sử dụng hàm transform thích hợp, dựa trên việc các khung phương tiện được mã hóa là đến hay đi.
Transform thường được triển khai bằng cách piping các khung từ `readable` qua một hoặc nhiều phiên bản {{DOMxRef("TransformStream")}} đến `writable`, transform chúng khi cần.

Giao diện cũng cung cấp các phương thức để người gửi tạo khung chính mới từ bộ mã hóa video, hoặc để người nhận yêu cầu khung chính mới từ bộ mã hóa của người gửi (các bộ mã hóa video thường gửi một khung chính chứa đầy đủ thông tin cần thiết để tái tạo một hình ảnh, và sau đó gửi nhiều "delta frame" nhỏ hơn nhiều chỉ mã hóa những thay đổi kể từ khung trước đó).

Các phương thức này được yêu cầu trong các trường hợp mà người nhận sẽ không thể giải mã các khung đến cho đến khi họ nhận được khung chính mới.
Ví dụ, một người nhận mới tham gia cuộc gọi hội nghị sẽ không thể xem video cho đến khi họ nhận được khung chính mới, vì các delta frame chỉ có thể được giải mã nếu bạn có khung chính cuối cùng và tất cả các delta frame tiếp theo.
Tương tự, nếu các khung được mã hóa cho người nhận, họ chỉ có thể giải mã các khung sau khi nhận được khung chính được mã hóa đầu tiên của họ.

## Ví dụ

Ví dụ này cho thấy mã cho một WebRTC Encoded Transform chạy trong một worker.

Mã sử dụng `addEventListener()` để đăng ký hàm xử lý cho sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}, cung cấp **`RTCRtpScriptTransformer`** là `event.transformer`.

Hàm xử lý tạo một {{DOMxRef("TransformStream")}} và pipe các khung từ `event.transformer.readable` qua nó đến `event.transformer.writable`.
Triển khai `transform()` của transform stream được gọi cho mỗi khung được mã hóa xếp hàng trên stream: nó có thể đọc dữ liệu từ khung và trong trường hợp này phủ định các byte và sau đó xếp khung có thể sửa đổi vào stream.

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    start() {}, // Called on startup.
    flush() {}, // Called when the stream is about to be closed.
    async transform(encodedFrame, controller) {
      // Reconstruct the original frame.
      const view = new DataView(encodedFrame.data);

      // Construct a new buffer
      const newData = new ArrayBuffer(encodedFrame.data.byteLength);
      const newView = new DataView(newData);

      // Negate all bits in the incoming frame
      for (let i = 0; i < encodedFrame.data.byteLength; ++i) {
        newView.setInt8(i, ~view.getInt8(i));
      }

      encodedFrame.data = newData;
      controller.enqueue(encodedFrame);
    },
  });
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Điều duy nhất đặc biệt cần lưu ý về {{DOMxRef("TransformStream")}} ở trên là nó xếp hàng đợi các khung phương tiện được mã hóa ({{domxref("RTCEncodedVideoFrame")}} hoặc {{domxref("RTCEncodedAudioFrame")}}) thay vì các "chunk" tùy ý, và `writableStrategy` và `readableStrategy` không được định nghĩa (vì chiến lược xếp hàng hoàn toàn được quản lý bởi user agent).

Một transform có thể chạy trong đường ống WebRTC đến hoặc đi.
Điều này không quan trọng trong mã trên, vì cùng một thuật toán có thể được sử dụng trong người gửi để phủ định các khung, và trong người nhận để đảo ngược chúng.
Nếu các đường ống gửi và nhận cần áp dụng một thuật toán transform khác thì thông tin về đường ống hiện tại phải được truyền từ luồng chính.
Điều này được thực hiện bằng cách đặt tham số `options` trong [hàm khởi tạo `RTCRtpScriptTransform`](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform#options) tương ứng, sau đó được cung cấp cho worker trong {{domxref("RTCRtpScriptTransformer.options")}}.

Bên dưới chúng ta sử dụng `transformer.options` để chọn transform người gửi hoặc transform người nhận.
Lưu ý rằng các thuộc tính của đối tượng là tùy ý (miễn là các giá trị có thể được serialize) và cũng có thể transfer một {{domxref("MessageChannel")}} và sử dụng nó để [giao tiếp với transform tại runtime](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms#runtime_communication_with_the_transform) để chia sẻ khóa mã hóa chẳng hạn.

```js
// Code to instantiate transform and attach them to sender/receiver pipelines.
onrtctransform = (event) => {
  let transform;
  if (event.transformer.options.name === "senderTransform")
    transform = createSenderTransform();
  // returns a TransformStream (not shown)
  else if (event.transformer.options.name === "receiverTransform")
    transform = createReceiverTransform();
  // returns a TransformStream (not shown)
  else return;
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
};
```

Lưu ý rằng đoạn mã trên là một phần của các ví dụ đầy đủ hơn được cung cấp trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("TransformStream")}}
