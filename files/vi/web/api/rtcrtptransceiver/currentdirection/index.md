---
title: "RTCRtpTransceiver: currentDirection property"
short-title: currentDirection
slug: Web/API/RTCRtpTransceiver/currentDirection
page-type: web-api-instance-property
browser-compat: api.RTCRtpTransceiver.currentDirection
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc {{domxref("RTCRtpTransceiver")}} **`currentDirection`** là một chuỗi cho biết hướng đã được thương lượng hiện tại của transceiver.

Hướng này cho biết transceiver có sẽ đề nghị gửi và/hoặc nhận dữ liệu {{Glossary("RTP")}} hay không, hoặc nó đang không hoạt động hay đã dừng và sẽ không gửi hoặc nhận dữ liệu.

Hướng _mong muốn_ của transceiver có thể được đặt và đọc bằng thuộc tính {{domxref("RTCRtpTransceiver.direction", "direction")}}.
Việc thay đổi `direction` sẽ kích hoạt thương lượng lại, và cuối cùng có thể làm `currentDirection` thay đổi theo.

## Giá trị

Giá trị ban đầu là `null`, trước khi thương lượng bằng offer/answer.

Sau khi thương lượng, giá trị là một chuỗi với một trong các giá trị sau:

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
    - `RTCRtpSender`: Không _đề nghị_ gửi dữ liệu RTP và sẽ không gửi.
    - `RTCRtpReceiver`: Không _đề nghị_ nhận dữ liệu RTP và sẽ không nhận.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpTransceiver.direction")}}
