---
title: "RTCRtpTransceiver: direction property"
short-title: direction
slug: Web/API/RTCRtpTransceiver/direction
page-type: web-api-instance-property
browser-compat: api.RTCRtpTransceiver.direction
---

{{APIRef("WebRTC")}}

Thuộc tính {{domxref("RTCRtpTransceiver")}} **`direction`** là một chuỗi cho biết hướng _mong muốn_ của transceiver.

Hướng này cho biết transceiver có sẽ đề nghị gửi và/hoặc nhận dữ liệu {{Glossary("RTP")}} hay không, hoặc nó đang không hoạt động hay đã bị dừng (terminated).
Khi đặt hướng của transceiver, giá trị không được áp dụng ngay lập tức.
Hướng _hiện tại_ được biểu thị bởi thuộc tính {{domxref("RTCRtpTransceiver.currentDirection", "currentDirection")}}.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"sendrecv"`
  - : Transceiver đề nghị gửi và nhận dữ liệu RTP:
    - `RTCRtpSender`: Đề nghị gửi dữ liệu RTP, và sẽ thực hiện nếu phía từ xa chấp nhận kết nối và ít nhất một encoding của sender đang hoạt động.
    - `RTCRtpReceiver`: Đề nghị nhận dữ liệu RTP, và sẽ làm như vậy nếu phía từ xa chấp nhận.
- `"sendonly"`
  - : Transceiver đề nghị chỉ gửi chứ không nhận dữ liệu RTP:
    - `RTCRtpSender`: Đề nghị gửi dữ liệu RTP, và sẽ thực hiện nếu phía từ xa chấp nhận kết nối và ít nhất một encoding của sender đang hoạt động.
    - `RTCRtpReceiver`: Không _đề nghị_ nhận dữ liệu RTP và sẽ không nhận.
- `"recvonly"`
  - : Transceiver đề nghị nhận nhưng không đề nghị gửi dữ liệu RTP:
    - `RTCRtpSender`: Không _đề nghị_ gửi dữ liệu RTP và sẽ không gửi.
    - `RTCRtpReceiver`: Đề nghị nhận dữ liệu RTP, và sẽ làm như vậy nếu phía từ xa đề nghị.
- `"inactive"`
  - : Transceiver không hoạt động:
    - `RTCRtpSender`: Không _đề nghị_ gửi dữ liệu RTP và sẽ không gửi.
    - `RTCRtpReceiver`: Không _đề nghị_ nhận dữ liệu RTP và sẽ không nhận.
- `"stopped"`
  - : Đây là trạng thái cuối cùng của transceiver.
    Transceiver đã bị dừng và sẽ không gửi hoặc nhận dữ liệu RTP, cũng không đề nghị làm như vậy.
    Việc đặt giá trị này khi transceiver chưa dừng sẽ ném `TypeError`.
    - `RTCRtpSender`: Không _đề nghị_ gửi dữ liệu RTP và sẽ không gửi.
    - `RTCRtpReceiver`: Không _đề nghị_ nhận dữ liệu RTP và sẽ không nhận.

### Ngoại lệ

Khi đặt giá trị cho `direction`, có thể xảy ra các ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Receiver's {{domxref("RTCPeerConnection")}} đã đóng hoặc {{domxref("RTCRtpReceiver")}} đã dừng.
- `TypeError`
  - : Giá trị đang được đặt thành `stopped` trong khi giá trị hiện tại không phải `stopped`.

## Mô tả

Thuộc tính **`direction`** có thể được dùng để đặt hoặc lấy hướng _mong muốn_ của transceiver.

Việc cập nhật hướng không có hiệu lực ngay lập tức.
Nếu giá trị mới của `direction` khác với giá trị hiện có, cần thương lượng lại kết nối, vì vậy một sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} sẽ được gửi đến {{domxref("RTCPeerConnection")}}.
Giá trị `direction` (khác `stopped`) sau đó được {{domxref("RTCPeerConnection.createOffer()")}} hoặc {{domxref("RTCPeerConnection.createAnswer()")}} dùng để tạo thông điệp {{glossary("SDP")}} do các phương thức này sinh ra.
Ví dụ, nếu `direction` được chỉ định là `"sendrecv"`, a-line SDP tương ứng sẽ cho biết hướng:

```plain
a=sendrecv
```

Hướng mới sẽ có hiệu lực sau khi quá trình thương lượng hoàn tất và session description mới được áp dụng thành công.

Hướng _hiện tại_ của transceiver được biểu thị bởi thuộc tính {{domxref("RTCRtpTransceiver.currentDirection", "currentDirection")}}.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpTransceiver.currentDirection")}}
