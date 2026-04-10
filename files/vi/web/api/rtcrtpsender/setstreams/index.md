---
title: "Phương thức setStreams() của RTCRtpSender"
short-title: setStreams()
slug: Web/API/RTCRtpSender/setStreams
page-type: web-api-instance-method
browser-compat: api.RTCRtpSender.setStreams
---

{{APIRef("WebRTC")}}

Phương thức **`setStreams()`** của {{domxref("RTCRtpSender")}} liên kết {{domxref("RTCRtpSender.track", "track")}} của sender với các đối tượng {{domxref("MediaStream")}} được chỉ định.

## Cú pháp

```js-nolint
setStreams()
setStreams(mediaStream1)
setStreams(mediaStream1, mediaStream2)
setStreams(mediaStream1, mediaStream2, /* …, */ mediaStreamN)
```

### Tham số

- `mediaStreamN` {{optional_inline}}
  - : Một số tùy ý các đối tượng {{domxref("MediaStream")}} được chỉ định làm đối số, xác định các luồng mà {{domxref("RTCRtpSender.track", "track")}} của `RTCRtpSender` thuộc về.
    Nếu tham số này không được chỉ định, không có luồng mới nào sẽ được liên kết với track.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu kết nối của sender đã đóng.

## Mô tả

`setStreams()` hoàn toàn có tính chất bổ sung. Phương thức này không xóa track khỏi bất kỳ luồng nào; nó thêm track vào các luồng mới.
Nếu bạn chỉ định các luồng mà track đã thuộc về, luồng đó không bị ảnh hưởng.

Sau khi track đã được thêm vào tất cả các luồng, việc đàm phán lại kết nối sẽ được kích hoạt bởi sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} được gửi đến {{domxref("RTCPeerConnection")}} mà sender thuộc về.

## Ví dụ

Ví dụ này thêm tất cả các track của một {{domxref("RTCPeerConnection")}} vào luồng được chỉ định.

```js
function addTracksToStream(stream) {
  let senders = pc.getSenders();

  senders.forEach((sender) => {
    if (sender.track && sender.transport.state === connected) {
      sender.setStreams(stream);
    }
  });
}
```

Sau khi gọi phương thức {{domxref("RTCPeerConnection")}} {{domxref("RTCPeerConnection.getSenders", "getSenders()")}} để lấy danh sách các sender của kết nối, hàm `addTracksToStream()` lặp qua danh sách.
Đối với mỗi sender, nếu track của sender khác null và trạng thái transport của sender là `connected`, chúng ta gọi `setStreams()` để thêm track vào `stream` được chỉ định.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
