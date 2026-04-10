---
title: "Thuộc tính transform của RTCRtpSender"
short-title: transform
slug: Web/API/RTCRtpSender/transform
page-type: web-api-instance-property
browser-compat: api.RTCRtpSender.transform
---

{{APIRef("WebRTC")}}

Thuộc tính **`transform`** của đối tượng {{domxref("RTCRtpSender")}} được sử dụng để chèn một transform stream ({{domxref("TransformStream")}}) chạy trong một worker thread vào pipeline của sender.
Điều này cho phép áp dụng các biến đổi stream cho các khung video và âm thanh đã mã hóa sau khi chúng được xuất ra bởi codec và trước khi chúng được gửi đi.

Transform được thêm vào được định nghĩa bằng cách sử dụng một {{domxref("RTCRtpScriptTransform")}} và {{domxref("Worker")}} liên kết của nó.
Nếu transform được đặt đồng bộ ngay sau khi tạo `RTCRtpSender`, nó sẽ nhận được khung đầy đủ đầu tiên được tạo ra bởi bộ mã hóa của sender.

## Giá trị

Một {{domxref("RTCRtpScriptTransform")}}<!-- hoặc {{domxref("SFrameTransform")}} -->, hoặc `null` nếu sender không có transform stream liên kết.

## Ví dụ

Ví dụ này cho thấy cách bạn có thể truyền video từ camera web của người dùng qua WebRTC, thêm một transform mã hóa WebRTC để sửa đổi các luồng outgoing.
Lưu ý rằng đây là một phần của ví dụ lớn hơn trong chủ đề hướng dẫn [Sử dụng WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

Mã giả định rằng có một {{domxref("RTCPeerConnection")}} tên là `peerConnection` đã được kết nối với một peer từ xa.
Đầu tiên, mã lấy một {{domxref("MediaStreamTrack")}}, sử dụng {{domxref("MediaDevices/getUserMedia", "getUserMedia()")}} để lấy một {{domxref("MediaStream")}} video từ một thiết bị media, và sau đó phương thức {{domxref("MediaStream.getTracks()")}} để lấy {{domxref("MediaStreamTrack")}} đầu tiên trong luồng.

Track được thêm vào kết nối peer bằng cách sử dụng {{domxref("RTCPeerConnection/addTrack()", "addTrack()")}}.
Phương thức này trả về một {{domxref("RTCRtpSender")}} mới sẽ được sử dụng để gửi nó.

```js
const mediaStream = await navigator.mediaDevices.getUserMedia({ video: true });
const [track] = mediaStream.getTracks();
const videoSender = peerConnection.addTrack(track, mediaStream);
```

Mã ở trên thiết lập kết nối và bắt đầu gửi track.
Để thêm một transform stream vào pipeline, chúng ta cần xây dựng một {{domxref("RTCRtpScriptTransform")}} và gán nó cho thuộc tính `transform` của sender.
Vì transform được xây dựng ngay sau khi tạo {{domxref("RTCRtpSender")}}, nó sẽ nhận được khung đã mã hóa đầu tiên được gửi.

```js
const worker = new Worker("worker.js");
videoSender.transform = new RTCRtpScriptTransform(worker, {
  name: "senderTransform",
});
```

Lưu ý rằng bạn có thể thêm transform bất kỳ lúc nào.
Tuy nhiên, bằng cách thêm nó ngay sau khi gọi `addTrack()`, transform sẽ nhận được khung đã mã hóa đầu tiên được gửi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("RTCRtpReceiver.transform")}}
