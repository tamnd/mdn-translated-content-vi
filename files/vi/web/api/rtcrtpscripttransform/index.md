---
title: RTCRtpScriptTransform
slug: Web/API/RTCRtpScriptTransform
page-type: web-api-interface
browser-compat: api.RTCRtpScriptTransform
---

{{APIRef("WebRTC")}}

Giao diện **`RTCRtpScriptTransform`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được dùng để chèn một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) (một {{domxref("TransformStream")}} chạy trong một luồng worker) vào các pipeline gửi và nhận của WebRTC.

## Hàm khởi tạo

- {{DOMxRef("RTCRtpScriptTransform.RTCRtpScriptTransform", "RTCRtpScriptTransform()")}}
  - : Tạo một phiên bản mới của đối tượng `RTCRtpScriptTransform`.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

Không có.

## Mô tả

Các phiên bản **`RTCRtpScriptTransform`** được khởi tạo với một {{domxref("Worker")}}, trong đó mã transform stream sẽ chạy, cùng với một đối tượng `options` (tùy chọn) và một mảng [đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) sẽ được truyền cho worker.
Chúng sau đó được thêm vào các pipeline RTC đến và đi bằng cách gán chúng cho {{domxref("RTCRtpReceiver.transform")}} và {{domxref("RTCRtpSender.transform")}} tương ứng.

Khi xây dựng đối tượng này, và bất cứ khi nào một khung được mã hóa đến, sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}} được kích hoạt trên đối tượng toàn cục worker.
Thuộc tính `transformer` của sự kiện là một {{DOMxRef("RTCRtpScriptTransformer")}}, đối tác phía worker của `RTCRtpScriptTransform` phía luồng chính.
Nó có các thuộc tính `readable` ({{domxref("ReadableStream")}}) và `writable` ({{domxref("WritableStream")}}) đã được chia sẻ từ `RTCRtpScriptTransform` phía luồng chính, nơi chúng không công khai.
Nếu `RTCRtpScriptTransform` tương ứng được sử dụng với `RTCRtpReceiver`, thì `readable` xếp hàng các khung âm thanh hoặc video được mã hóa đến từ bộ tháo gói.
Nếu nó được sử dụng với `RTCRtpSender` thì `readable` chứa các khung đến từ một codec.

Trình xử lý sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}} của luồng worker định nghĩa một [chuỗi pipe](/en-US/docs/Web/API/Streams_API/Concepts#pipe_chains).
Điều này dẫn các khung được mã hóa từ `event.transformer.readable`, qua một {{DOMxRef("TransformStream")}} định nghĩa hàm biến đổi, đến `event.transformer.writable`.
`event.transformer` cũng có đối tượng `options` được truyền từ hàm khởi tạo `RTCRtpScriptTransform` (nếu được định nghĩa) có thể được dùng để xác định nguồn của sự kiện, và do đó xác định {{DOMxRef("TransformStream")}} cụ thể để thêm vào chuỗi.

## Ví dụ

Lưu ý rằng những ví dụ này cho thấy cách `RTCRtpScriptTransform` được định nghĩa và sử dụng.
Mã transform của luồng worker được đề cập như là một phần của ví dụ đầy đủ hơn trong [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

### Thêm transform cho các khung gửi đi

Ví dụ này cho thấy cách bạn có thể stream video từ webcam của người dùng qua WebRTC, thêm một WebRTC encoded transform để chỉnh sửa các stream gửi đi.
Mã giả định có một {{domxref("RTCPeerConnection")}} gọi là `peerConnection` đã được kết nối với một peer từ xa.

Đầu tiên chúng ta lấy một {{domxref("MediaStreamTrack")}}, dùng {{domxref("MediaDevices/getUserMedia", "getUserMedia()")}} để lấy video {{domxref("MediaStream")}} từ một thiết bị phương tiện, rồi dùng phương thức {{domxref("MediaStream.getTracks()")}} để lấy {{domxref("MediaStreamTrack")}} đầu tiên trong stream.

Track được thêm vào peer connection bằng {{domxref("RTCPeerConnection/addTrack()", "addTrack()")}} và gửi đi.
Phương thức `addTrack()` trả về {{domxref("RTCRtpSender")}} đang được dùng để gửi track.

```js
// Get Video stream and MediaTrack
const stream = await navigator.mediaDevices.getUserMedia({ video: true });
const [track] = stream.getTracks();
const videoSender = peerConnection.addTrack(track, stream);
```

Sau đó một `RTCRtpScriptTransform` được xây dựng với một worker script định nghĩa transform, và một đối tượng tùy chọn có thể được dùng để truyền các thông điệp tùy ý cho worker (trong trường hợp này chúng ta đã dùng một thuộc tính `name` với giá trị "senderTransform" để cho worker biết rằng transform này sẽ được thêm vào stream gửi đi).
Chúng ta sau đó thêm transform vào sender bằng cách gán nó cho thuộc tính {{domxref("RTCRtpSender.transform")}}.

```js
// Create a worker containing a TransformStream
const worker = new Worker("worker.js");
videoSender.transform = new RTCRtpScriptTransform(worker, {
  name: "senderTransform",
});
```

Lưu ý rằng bạn có thể thêm transform bất cứ lúc nào.
Tuy nhiên, bằng cách thêm nó ngay sau khi gọi `addTrack()`, transform sẽ nhận được khung được mã hóa đầu tiên được gửi.

### Thêm transform cho các khung đến

Ví dụ này cho thấy cách bạn thêm một WebRTC encoded transform để chỉnh sửa một stream đến.
Mã giả định có một {{domxref("RTCPeerConnection")}} gọi là `peerConnection` đã được kết nối với một peer từ xa.

Đầu tiên chúng ta thêm một trình xử lý sự kiện [`track`](/en-US/docs/Web/API/RTCPeerConnection/track_event) của `RTCPeerConnection` để bắt sự kiện khi một track mới được stream.
Trong trình xử lý chúng ta xây dựng một `RTCRtpScriptTransform` và thêm nó vào `event.receiver.transform` (`event.receiver` là một {{domxref("RTCRtpReceiver")}}).
Như trong ví dụ trước, hàm khởi tạo nhận một đối tượng với thuộc tính `name`: nhưng ở đây chúng ta sử dụng `receiverTransform` làm giá trị để cho worker biết rằng các khung đến từ bộ tháo gói.

```js
peerConnection.ontrack = (event) => {
  const worker = new Worker("worker.js");
  event.receiver.transform = new RTCRtpScriptTransform(worker, {
    name: "receiverTransform",
  });
  receivedVideo.srcObject = event.streams[0];
};
```

Lưu ý rằng bạn có thể thêm transform stream bất cứ lúc nào.
Tuy nhiên bằng cách thêm nó trong trình xử lý sự kiện `track`, stream transform sẽ nhận được khung được mã hóa đầu tiên cho track.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("TransformStream")}}
- {{domxref("RTCRtpScriptTransformer")}}
