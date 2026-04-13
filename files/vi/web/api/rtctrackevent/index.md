---
title: RTCTrackEvent
slug: Web/API/RTCTrackEvent
page-type: web-api-interface
browser-compat: api.RTCTrackEvent
---

{{APIRef("WebRTC")}}

Giao diện **`RTCTrackEvent`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) đại diện cho sự kiện {{domxref("RTCPeerConnection.track_event", "track")}}, được gửi khi một {{domxref("MediaStreamTrack")}} mới được thêm vào {{domxref("RTCRtpReceiver")}} là một phần của {{domxref("RTCPeerConnection")}}.

Đích là đối tượng `RTCPeerConnection` mà track đang được thêm vào.

Sự kiện này được gửi bởi lớp WebRTC đến trang web hoặc ứng dụng, vì vậy thông thường bạn sẽ không cần tự khởi tạo một `RTCTrackEvent`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("RTCTrackEvent.RTCTrackEvent", "RTCTrackEvent()")}}
  - : Tạo và trả về một đối tượng `RTCTrackEvent` mới. Bạn có thể sẽ không cần tự tạo các track event mới, vì chúng thường được tạo bởi cơ sở hạ tầng WebRTC và gửi đến trình xử lý sự kiện {{domxref("RTCPeerConnection.track_event", "ontrack")}} của kết nối.

## Thuộc tính phiên bản

_Vì `RTCTrackEvent` dựa trên {{domxref("Event")}}, các thuộc tính của nó cũng có sẵn._

- {{domxref("RTCTrackEvent.receiver", "receiver")}} {{ReadOnlyInline}}
  - : {{domxref("RTCRtpReceiver")}} được sử dụng bởi track đã được thêm vào `RTCPeerConnection`.
- {{domxref("RTCTrackEvent.streams", "streams")}} {{ReadOnlyInline}} {{optional_inline}}
  - : Một mảng các đối tượng {{domxref("MediaStream")}}, mỗi đối tượng đại diện cho một trong các media stream mà {{domxref("RTCTrackEvent.track", "track")}} được thêm vào thuộc về. Theo mặc định, mảng rỗng, cho biết một track không có stream.
- {{domxref("RTCTrackEvent.track", "track")}} {{ReadOnlyInline}}
  - : {{domxref("MediaStreamTrack")}} đã được thêm vào kết nối.
- {{domxref("RTCTrackEvent.transceiver", "transceiver")}} {{ReadOnlyInline}}
  - : {{domxref("RTCRtpTransceiver")}} đang được sử dụng bởi track mới.

## Các loại sự kiện track

Chỉ có một loại sự kiện track.

### `track`

Sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} được gửi đến {{domxref("RTCPeerConnection")}} khi một track mới được thêm vào kết nối. Vào thời điểm sự kiện `track` được gửi đến trình xử lý {{domxref("RTCPeerConnection.track_event", "ontrack")}} của `RTCPeerConnection`, phương tiện mới đã hoàn thành quá trình thương lượng cho một {{domxref("RTCRtpReceiver")}} cụ thể (được chỉ định bởi thuộc tính {{domxref("RTCTrackEvent.receiver", "receiver")}} của sự kiện).

Ngoài ra, {{domxref("MediaStreamTrack")}} được chỉ định bởi {{domxref("RTCRtpReceiver.track", "track")}} của receiver giống với track được chỉ định bởi {{domxref("RTCTrackEvent.track", "track")}} của sự kiện, và track đã được thêm vào bất kỳ đối tượng {{domxref("MediaStream")}} từ xa liên kết nào.

Bạn có thể thêm trình lắng nghe sự kiện `track` để được thông báo khi track mới có sẵn để bạn có thể, ví dụ, gắn phương tiện của nó vào phần tử {{HTMLElement("video")}}, bằng cách sử dụng {{domxref("EventTarget.addEventListener", "RTCPeerConnection.addEventListener()")}} hoặc thuộc tính trình xử lý sự kiện `ontrack`.

> [!NOTE]
> Có thể hữu ích khi nhớ rằng bạn nhận được sự kiện `track` khi một track đến mới được thêm vào kết nối của bạn, và bạn gọi {{domxref("RTCPeerConnection.addTrack", "addTrack()")}} để thêm một track vào đầu xa của kết nối, qua đó kích hoạt một sự kiện `track` trên peer từ xa.

## Ví dụ

Ví dụ đơn giản này tạo một trình lắng nghe sự kiện cho sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} để đặt {{domxref("HTMLMediaElement.srcObject", "srcObject")}} của phần tử {{HTMLElement("video")}} có ID `video-box` thành stream đầu tiên trong danh sách được truyền trong mảng {{domxref("RTCTrackEvent.streams", "streams")}} của sự kiện.

```js
peerConnection.addEventListener("track", (e) => {
  let videoElement = document.getElementById("video-box");
  videoElement.srcObject = e.streams[0];
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
