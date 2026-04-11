---
title: "RTCRemoteInboundRtpStreamStats: thuộc tính fractionLost"
short-title: fractionLost
slug: Web/API/RTCRemoteInboundRtpStreamStats/fractionLost
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-inbound-rtp.fractionLost
---

{{APIRef("WebRTC")}}

Thuộc tính **`fractionLost`** của từ điển {{domxref("RTCRemoteInboundRtpStreamStats")}} cung cấp giá trị có thể được dùng để xác định tỷ lệ gói bị mất cho [nguồn đồng bộ hóa (SSRC)](/en-US/docs/Web/API/RTCRemoteInboundRtpStreamStats/ssrc) này trong khoảng thời gian báo cáo gần nhất.

Để chuyển đổi giá trị thành phần trăm, chia cho 256 và nhân với 100.
Ví dụ, giá trị 20 cho biết tỷ lệ mất gói là 7,8%.

Lưu ý rằng giá trị có thể không hoàn toàn chính xác do cách tính, nhưng nó cung cấp một thước đo nhanh và tiện lợi về chất lượng kết nối.

## Giá trị

Một số đưa ra tỷ lệ mất gói trong khoảng thời gian báo cáo gần nhất, được nhân với 256.
Giá trị là 0 nếu tỷ lệ mất gói được tính toán là âm.

> [!NOTE]
> Giá trị đến từ trường `fraction lost` 8-bit của Sender Report (SR) hoặc Receiver Report (RR) RTCP cuối cùng.
> Thuật toán tính giá trị được định nghĩa trong [RFC 3550, Appendix A.3: Determining Number of Packets Expected and Lost](https://datatracker.ietf.org/doc/html/rfc3550#appendix-A.3).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{rfc("3550","SR: Sender Report RTCP Packet", "6.4.1")}}
- {{rfc("3550","RR: Receiver Report RTCP Packet", "6.4.2")}}
