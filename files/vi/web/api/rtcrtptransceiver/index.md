---
title: RTCRtpTransceiver
slug: Web/API/RTCRtpTransceiver
page-type: web-api-interface
browser-compat: api.RTCRtpTransceiver
---

{{APIRef("WebRTC")}}

Giao diện WebRTC **`RTCRtpTransceiver`** mô tả một cặp cố định gồm một {{domxref("RTCRtpSender")}} và một {{domxref("RTCRtpReceiver")}}, cùng với một số trạng thái dùng chung.

Mỗi mục phương tiện {{Glossary("SDP")}} mô tả một luồng SRTP hai chiều ("Secure Real Time Protocol") riêng biệt, ngoại trừ mục phương tiện cho {{domxref("RTCDataChannel")}} nếu có.
Việc ghép cặp luồng SRTP gửi và nhận này có ý nghĩa với một số ứng dụng, vì vậy `RTCRtpTransceiver` được dùng để biểu diễn cặp đó, cùng với các trạng thái quan trọng khác từ mục phương tiện.
Mỗi mục phương tiện SRTP không bị vô hiệu hóa luôn được biểu diễn bởi đúng một transceiver.

Một transceiver được nhận dạng duy nhất bằng thuộc tính {{domxref("RTCRtpTransceiver.mid", "mid")}}, thuộc tính này giống với media ID (`mid`) của m-line tương ứng. Một `RTCRtpTransceiver` được **liên kết** với một m-line nếu `mid` của nó khác `null`; nếu không thì nó được xem là không liên kết.

## Thuộc tính thể hiện

- {{domxref("RTCRtpTransceiver.currentDirection", "currentDirection")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ hướng được thương lượng hiện tại của transceiver, hoặc `null` nếu transceiver chưa từng tham gia trao đổi offer và answer.
    Để thay đổi hướng của transceiver, hãy đặt giá trị cho thuộc tính {{domxref("RTCRtpTransceiver.direction", "direction")}}.
- {{domxref("RTCRtpTransceiver.direction", "direction")}}
  - : Một chuỗi dùng để đặt hướng mong muốn của transceiver.
- {{domxref("RTCRtpTransceiver.mid", "mid")}} {{ReadOnlyInline}}
  - : Media ID của m-line được liên kết với transceiver này. Liên kết này được thiết lập, khi có thể, mỗi khi áp dụng local description hoặc remote description. Trường này là `null` nếu chưa áp dụng local description hoặc remote description nào, hoặc nếu m-line được liên kết bị từ chối bởi một remote offer hay bất kỳ answer nào.
- {{domxref("RTCRtpTransceiver.receiver", "receiver")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("RTCRtpReceiver")}} chịu trách nhiệm nhận và giải mã media đến.
- {{domxref("RTCRtpTransceiver.sender", "sender")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("RTCRtpSender")}} chịu trách nhiệm mã hóa và gửi dữ liệu đến phía từ xa.
- {{domxref("RTCRtpTransceiver.stopped", "stopped")}} {{Deprecated_Inline}}
  - : Cho biết việc gửi và nhận bằng cặp `RTCRtpSender` và `RTCRtpReceiver` đã bị vô hiệu hóa vĩnh viễn hay chưa, do SDP offer/answer hoặc do gọi {{domxref("RTCRtpTransceiver.stop", "stop()")}}.

## Phương thức thể hiện

- {{domxref("RTCRtpTransceiver.setCodecPreferences", "setCodecPreferences()")}}
  - : Cấu hình danh sách codec được ưu tiên của transceiver, ghi đè các thiết lập của {{Glossary("user agent")}}.
- {{domxref("RTCRtpTransceiver.stop", "stop()")}}
  - : Dừng vĩnh viễn `RTCRtpTransceiver`.
    Sender liên quan sẽ dừng gửi dữ liệu, và receiver liên quan cũng sẽ dừng nhận và giải mã dữ liệu đến.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- {{domxref("RTCPeerConnection.addTrack()")}} và {{domxref("RTCPeerConnection.addTransceiver()")}} đều tạo transceiver
- {{domxref("RTCRtpReceiver")}} và {{domxref("RTCRtpSender")}}
