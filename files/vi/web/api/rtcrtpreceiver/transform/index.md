---
title: "RTCRtpReceiver: thuộc tính transform"
short-title: transform
slug: Web/API/RTCRtpReceiver/transform
page-type: web-api-instance-property
browser-compat: api.RTCRtpReceiver.transform
---

{{APIRef("WebRTC")}}

Thuộc tính **`transform`** của đối tượng {{domxref("RTCRtpReceiver")}} được dùng để chèn một luồng biến đổi ({{domxref("TransformStream")}}) chạy trong worker thread vào pipeline của bộ nhận.
Điều này cho phép áp dụng các biến đổi luồng lên các khung video và âm thanh được mã hóa khi chúng đi vào từ packetizer.

Transform được thêm vào được định nghĩa bằng một {{domxref("RTCRtpScriptTransform")}} và {{domxref("Worker")}} liên quan.
Nếu transform được đặt trong trình xử lý sự kiện [`track`](/en-US/docs/Web/API/RTCPeerConnection/track_event) của peer connection, luồng transform sẽ nhận khung đầu vào đầy đủ đầu tiên cho track đó.

## Giá trị

Một {{domxref("RTCRtpScriptTransform")}}<!-- or {{domxref("SFrameTransform")}} -->, hoặc `null` nếu bộ nhận không có luồng transform liên kết.

## Ví dụ

Lưu ý rằng phần này thuộc về một ví dụ lớn hơn trong chủ đề hướng dẫn [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms).

### Thêm transform cho các khung đến

Ví dụ này cho thấy cách thêm một WebRTC encoded transform để sửa đổi một luồng đầu vào.
Mã giả định rằng có một {{domxref("RTCPeerConnection")}} tên `peerConnection` đã được kết nối với một peer từ xa.

Để thêm một luồng transform vào pipeline cho các khung đến, chúng ta cần tạo một {{domxref("RTCRtpScriptTransform")}} và gán nó cho thuộc tính `transform` của receiver.
Ta có thể làm việc này trong trình xử lý sự kiện [`track`](/en-US/docs/Web/API/RTCPeerConnection/track_event) như minh họa.
Sự kiện này được phát trên peer connection bất cứ khi nào đầu kia gửi một track.
Thuộc tính `event.receiver` là một {{domxref("RTCRtpReceiver")}}.

```js
const worker = new Worker("worker.js");
peerConnection.ontrack = (event) => {
  event.receiver.transform = new RTCRtpScriptTransform(worker, {
    someOption: "receiverTransform",
  });
};
```

Vì transform được tạo ngay sau khi {{domxref("RTCRtpReceiver")}} được tạo, nó sẽ nhận khung đến đầu tiên.
Đối tượng được truyền làm tham số thứ hai trong hàm khởi tạo {{domxref("RTCRtpScriptTransform")}} được gửi tới worker thread, và worker code có thể dùng nó để cung cấp một transform khác cho các khung đến so với khung đi ra.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("RTCRtpSender.transform")}}
