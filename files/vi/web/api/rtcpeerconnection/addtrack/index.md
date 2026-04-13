---
title: "RTCPeerConnection: phương thức addTrack()"
short-title: addTrack()
slug: Web/API/RTCPeerConnection/addTrack
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.addTrack
---

{{APIRef("WebRTC")}}

Phương thức **`addTrack()`** của giao diện {{domxref("RTCPeerConnection")}} thêm một media track mới vào tập các track sẽ được truyền tới máy ngang hàng còn lại.

> [!NOTE]
> Việc thêm một track vào kết nối sẽ kích hoạt thương lượng lại bằng cách gửi sự kiện {{DOMxRef("RTCPeerConnection/negotiationneeded_event", "negotiationneeded")}}.
> Xem [Bắt đầu thương lượng](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling#starting_negotiation) để biết chi tiết.

## Cú pháp

```js-nolint
addTrack(track)
addTrack(track, stream1)
addTrack(track, stream1, stream2)
addTrack(track, stream1, stream2, /* …, */ streamN)
```

### Tham số

- `track`
  - : Một đối tượng {{domxref("MediaStreamTrack")}} biểu diễn media track cần thêm vào kết nối ngang hàng.
- `stream1`, …, `streamN` {{optional_inline}}
  - : Một hoặc nhiều đối tượng {{domxref("MediaStream")}} cục bộ mà track nên được thêm vào.

Track được chỉ định không nhất thiết đã phải là một phần của bất kỳ `stream` nào được chỉ định.
Thay vào đó, các `stream` là cách để nhóm các track ở đầu nhận của kết nối, bảo đảm chúng được đồng bộ hóa.
Bất kỳ track nào được thêm vào cùng một stream ở đầu cục bộ của kết nối sẽ nằm trong cùng một stream ở đầu từ xa.

### Giá trị trả về

Đối tượng {{domxref("RTCRtpSender")}} sẽ được dùng để truyền dữ liệu media.

> [!NOTE]
> Mỗi `RTCRtpSender` được ghép với một {{domxref("RTCRtpReceiver")}} để tạo thành một {{domxref("RTCRtpTransceiver")}}.
> Bộ nhận liên quan sẽ ở trạng thái tắt tiếng cho tới khi và trừ khi một hay nhiều stream được máy ngang hàng từ xa thêm vào bộ nhận.

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném ra nếu track được chỉ định (hoặc tất cả các stream nền của nó) đã là một phần của {{domxref("RTCPeerConnection")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("RTCPeerConnection")}} đã đóng.

## Ghi chú sử dụng

### Thêm track vào nhiều stream

Sau tham số `track`, bạn có thể tùy chọn chỉ định một hoặc nhiều đối tượng {{domxref("MediaStream")}} để thêm track vào.
Chỉ các track được gửi từ một máy ngang hàng sang máy ngang hàng khác, không phải stream.
Vì stream là riêng cho từng máy ngang hàng, việc chỉ định một hay nhiều stream có nghĩa là máy ngang hàng còn lại sẽ tự động tạo một stream tương ứng ở đầu kia của kết nối, rồi tự động thêm track đã nhận vào các stream đó.

#### Track không gắn stream

Nếu không chỉ định stream nào, track sẽ là **không gắn stream**.
Điều đó hoàn toàn chấp nhận được, dù máy ngang hàng từ xa sẽ phải tự quyết định gắn track vào stream nào, nếu có.
Đây là cách dùng `addTrack()` rất phổ biến khi xây dựng nhiều kiểu ứng dụng đơn giản, nơi chỉ cần một stream.
Ví dụ, nếu tất cả những gì bạn chia sẻ với máy ngang hàng từ xa là một stream duy nhất gồm một audio track và một video track, bạn không cần phải quản lý track nào thuộc stream nào, nên cứ để transceiver xử lý hộ.

Ví dụ sau cho thấy một hàm dùng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} để lấy stream từ camera và microphone của người dùng, rồi thêm từng track từ stream đó vào kết nối ngang hàng mà không chỉ định stream cho mỗi track:

```js
async function openCall(pc) {
  const gumStream = await navigator.mediaDevices.getUserMedia({
    video: true,
    audio: true,
  });
  for (const track of gumStream.getTracks()) {
    pc.addTrack(track);
  }
}
```

Kết quả là một tập các track được gửi tới máy ngang hàng từ xa, mà không có liên kết stream nào.
Trình xử lý cho sự kiện {{DOMxRef("RTCPeerConnection/track_event", "track")}} ở máy ngang hàng từ xa sẽ chịu trách nhiệm quyết định track nào cần được thêm vào stream nào, ngay cả khi điều đó có nghĩa là thêm tất cả vào cùng một stream.
Trình xử lý {{domxref("RTCPeerConnection.track_event", "ontrack")}} có thể trông như sau:

```js
let inboundStream = null;

pc.ontrack = (ev) => {
  if (ev.streams && ev.streams[0]) {
    videoElem.srcObject = ev.streams[0];
  } else {
    if (!inboundStream) {
      inboundStream = new MediaStream();
      videoElem.srcObject = inboundStream;
    }
    inboundStream.addTrack(ev.track);
  }
};
```

Ở đây, trình xử lý sự kiện `track` sẽ thêm track vào stream đầu tiên được sự kiện chỉ định, nếu có.
Nếu không, lần đầu `ontrack` được gọi, một stream mới sẽ được tạo và gắn vào phần tử video, rồi track được thêm vào stream mới.
Từ đó trở đi, các track mới sẽ được thêm vào stream đó.

Bạn cũng có thể chỉ tạo một stream mới cho mỗi track nhận được:

```js
pc.ontrack = (ev) => {
  if (ev.streams && ev.streams[0]) {
    videoElem.srcObject = ev.streams[0];
  } else {
    let inboundStream = new MediaStream(ev.track);
    videoElem.srcObject = inboundStream;
  }
};
```

#### Track gắn stream

Để thêm track vào một stream cụ thể trên máy ngang hàng từ xa, hãy chỉ định các stream mà track sẽ được gắn vào khi gọi `addTrack()`.
Đây là cách làm tương đối đơn giản để nhóm track khi gửi chúng cho máy ngang hàng:

```js
async function openCall(pc) {
  const gumStream = await navigator.mediaDevices.getUserMedia({
    video: true,
    audio: true,
  });
  for (const track of gumStream.getTracks()) {
    pc.addTrack(track, gumStream);
  }
}
```

Máy ngang hàng từ xa sau đó có thể dùng trình xử lý sự kiện {{DOMxRef("RTCPeerConnection/track_event", "track")}} như sau:

```js
pc.ontrack = ({ streams: [stream] }) => (videoElem.srcObject = stream);
```

Điều này đặt stream hiện tại của phần tử video thành stream chứa track vừa được thêm vào kết nối.

### Sender được tái sử dụng

Phương thức này trả về một `RTCRtpSender` mới hoặc một thể hiện hiện có để tái sử dụng.
Một thể hiện `RTCRtpSender` chỉ có thể được tái sử dụng nếu nó đáp ứng các tiêu chí sau:

- Không có track nào hiện đã được gắn với sender.
- {{domxref("RTCRtpTransceiver")}} gắn với sender có một {{domxref("RTCRtpReceiver")}} mà thuộc tính {{domxref("RTCRtpReceiver.track", "track")}} của nó chỉ định một {{domxref("MediaStreamTrack")}} có {{domxref("MediaStreamTrack.kind", "kind")}} giống với `kind` của tham số `track` được chỉ định khi gọi `RTCPeerConnection.addTrack()`.
- Thuộc tính {{domxref("RTCRtpTransceiver.currentDirection")}} không phải `"stopped"`.
- `RTCRtpSender` đang được xét chưa từng được dùng để gửi dữ liệu.
  Nếu {{domxref("RTCRtpTransceiver.currentDirection", "currentDirection")}} của transceiver từng là `"sendrecv"` hoặc `"sendonly"`, sender không thể được tái sử dụng.

Nếu tất cả các tiêu chí đó đều được đáp ứng, sender sẽ được tái sử dụng và các thay đổi sau sẽ xảy ra với `RTCRtpSender` và `RTCRtpTransceiver` hiện có:

- {{domxref("RTCRtpSender.track", "track")}} của `RTCRtpSender` được đặt thành track được chỉ định.
- Tập các stream gắn với sender được đặt thành danh sách stream được truyền vào phương thức này, `stream1`, …, `streamN`.
- {{domxref("RTCRtpTransceiver")}} liên quan có `currentDirection` được cập nhật để thể hiện rằng nó đang gửi;
  nếu giá trị hiện tại của nó là `"recvonly"`, nó sẽ trở thành `"sendrecv"`, và nếu giá trị hiện tại là `"inactive"`, nó sẽ trở thành `"sendonly"`.

### Sender mới

Nếu không có sender hiện có nào có thể tái sử dụng, một sender mới sẽ được tạo. Việc này cũng tạo ra các đối tượng liên quan cần tồn tại. Quá trình tạo sender mới tạo ra các thay đổi sau:

- `RTCRtpSender` mới được tạo với track được chỉ định và tập stream được chỉ định.
- Một {{domxref("RTCRtpReceiver")}} mới được tạo với một {{domxref("MediaStreamTrack")}} _mới_ làm thuộc tính {{domxref("RTCRtpReceiver.track", "track")}} của nó (không phải track được chỉ định khi gọi `addTrack()`).
  {{domxref("MediaStreamTrack.kind", "kind")}} của track này được đặt cho khớp với `kind` của track được truyền vào như tham số đầu vào.
- Một {{domxref("RTCRtpTransceiver")}} mới được tạo và gắn với sender và receiver mới.
- {{domxref("RTCRtpTransceiver.direction", "direction")}} của transceiver mới được đặt thành `"sendrecv"`.
- Transceiver mới được thêm vào tập transceiver của `RTCPeerConnection`.

## Ví dụ

Ví dụ này được rút ra từ mã trình bày trong bài viết [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling) và mã mẫu đi kèm.
Nó đến từ phương thức `handleVideoOfferMsg()` ở đó, được gọi khi nhận được thông điệp offer từ máy ngang hàng từ xa.

```js
const mediaConstraints = {
  audio: true, // Chúng ta muốn có một audio track
  video: true, // Và chúng ta muốn có một video track
};

const desc = new RTCSessionDescription(sdp);

pc.setRemoteDescription(desc)
  .then(() => navigator.mediaDevices.getUserMedia(mediaConstraints))
  .then((stream) => {
    previewElement.srcObject = stream;

    stream.getTracks().forEach((track) => pc.addTrack(track, stream));
  });
```

Mã này lấy SDP đã nhận từ máy ngang hàng từ xa và tạo một {{domxref("RTCSessionDescription")}} mới để truyền vào {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}.
Khi thao tác đó thành công, nó dùng {{domxref("MediaDevices.getUserMedia()")}} để lấy quyền truy cập vào webcam và microphone cục bộ.

Nếu thành công, stream thu được sẽ được gán làm nguồn cho phần tử {{HTMLElement("video")}} được tham chiếu bởi biến `previewElement`.

Bước cuối cùng là bắt đầu gửi video cục bộ qua kết nối ngang hàng tới bên gọi.
Việc này được thực hiện bằng cách thêm từng track trong stream bằng cách lặp qua danh sách được trả về bởi {{domxref("MediaStream.getTracks()")}} và truyền chúng cho `addTrack()` cùng với `stream` mà chúng là một thành phần.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Giới thiệu về Giao thức truyền tải thời gian thực (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- {{DOMxRef("RTCPeerConnection/track_event", "track")}}
