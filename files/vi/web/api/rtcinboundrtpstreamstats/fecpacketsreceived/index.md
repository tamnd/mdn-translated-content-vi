---
title: "RTCInboundRtpStreamStats: thuộc tính fecPacketsReceived"
short-title: fecPacketsReceived
slug: Web/API/RTCInboundRtpStreamStats/fecPacketsReceived
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.fecPacketsReceived
---

{{APIRef("WebRTC")}}

Thuộc tính **`fecPacketsReceived`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} cho biết bộ nhận RTP này đã nhận được bao nhiêu gói Forward Error Correction (FEC) từ peer từ xa.

Gói FEC cung cấp thông tin chẵn lẻ có thể dùng để cố gắng tái tạo các gói dữ liệu RTP bị hỏng trong quá trình truyền.

## Giá trị

Một số nguyên dương.

## Mô tả

Thuộc tính này cho biết tổng số gói FEC đã được nhận từ peer từ xa trong phiên RTP này.

Forward Error Correction sử dụng phương pháp XOR để thực hiện kiểm tra chẵn lẻ trên dữ liệu được nhận.
Bằng cách sử dụng thông tin chẵn lẻ FEC để cố gắng tái tạo các gói bị hỏng, có thể tránh được nhu cầu truyền lại các gói bị hỏng, từ đó giúp giảm độ trễ hoặc không cần bỏ qua hoàn toàn các khung hình bị hỏng.

> [!NOTE]
> Bộ đếm này cũng có thể tăng khi các gói FEC đến cùng với nội dung media; điều này có thể xảy ra với Opus chẳng hạn.

Có thể một tập hợp các gói FEC đã được nhận sẽ bị bỏ qua thay vì được sử dụng.
Điều này có thể xảy ra nếu các gói được bao phủ bởi gói FEC đã được nhận thành công hoặc đã được tái tạo bằng một gói FEC đã nhận trước đó.
Điều này cũng có thể xảy ra nếu gói FEC đến ngoài cửa sổ thời gian mà máy khách sẽ cố gắng sử dụng nó.

Nếu muốn biết bao nhiêu gói đã nhận bị bỏ qua, bạn có thể kiểm tra giá trị của {{domxref("RTCInboundRtpStreamStats.fecPacketsDiscarded", "fecPacketsDiscarded")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{RFC(5109)}} (RTP Payload Format for Generic Forward Error Correction)
