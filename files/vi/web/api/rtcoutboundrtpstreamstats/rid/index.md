---
title: "RTCOutboundRtpStreamStats: rid property"
short-title: rid
slug: Web/API/RTCOutboundRtpStreamStats/rid
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.rid
---

{{APIRef("WebRTC")}}

Thuộc tính **`rid`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là một chuỗi xác định ID luồng RTP, nếu được định nghĩa.

Thuộc tính này chỉ được định nghĩa nếu `rid` đã được đặt cho {{domxref("RTCRtpSender")}} tương ứng. Nếu được đặt, giá trị này sẽ có mặt bất kể phần mở rộng header RTP RID có được đàm phán hay không.

## Giá trị

Giá trị của đối số [`encodings.rid`](/en-US/docs/Web/API/RTCRtpSender/setParameters#rid) được truyền vào {{domxref("RTCRtpSender.setParameters()")}}, nếu có, khi transceiver tương ứng được tạo. Thuộc tính không xác định nếu ID luồng không được đặt.

> [!NOTE]
> Thuộc tính này không xác định cho các luồng âm thanh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
