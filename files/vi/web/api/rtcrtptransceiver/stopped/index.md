---
title: "RTCRtpTransceiver: stopped property"
short-title: stopped
slug: Web/API/RTCRtpTransceiver/stopped
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.RTCRtpTransceiver.stopped
---

{{APIRef("WebRTC")}}{{deprecated_header}}

> [!NOTE]
> Thay vì dùng thuộc tính đã bị loại bỏ này, hãy so sánh {{domxref("RTCRtpTransceiver.currentDirection", "currentDirection")}} với `"stopped"`.

Thuộc tính chỉ đọc **`stopped`** trên giao diện {{domxref("RTCRtpTransceiver")}} cho biết sender và receiver đi kèm với transceiver đã bị dừng hay chưa.

Transceiver bị dừng nếu phương thức {{domxref("RTCRtpTransceiver.stop", "stop()")}} đã được gọi hoặc nếu một thay đổi đối với local description hay remote description khiến transceiver bị dừng vì một lý do nào đó.

## Giá trị

Một giá trị Boolean là `true` nếu {{domxref("RTCRtpTransceiver.sender", "sender")}} của transceiver sẽ không còn gửi dữ liệu nữa, và {{domxref("RTCRtpTransceiver.receiver", "receiver")}} của nó cũng sẽ không còn nhận dữ liệu nữa. Nếu một trong hai hoặc cả hai vẫn đang hoạt động, kết quả là `false`.

## Tiêu chuẩn

Tính năng này không thuộc bất kỳ tiêu chuẩn hiện hành nào. Nó không còn nằm trong lộ trình trở thành một tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
