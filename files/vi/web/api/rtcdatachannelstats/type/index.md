---
title: "RTCDataChannelStats: thuộc tính type"
short-title: type
slug: Web/API/RTCDataChannelStats/type
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_data-channel.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`type`** của từ điển {{domxref("RTCDataChannelStats")}} là một chuỗi có giá trị `"data-channel"`.

Các thống kê khác nhau được lấy bằng cách lặp qua đối tượng {{domxref("RTCStatsReport")}} được trả về bởi lần gọi {{domxref("RTCPeerConnection.getStats()")}}.
Kiểu cho biết tập hợp thống kê có sẵn thông qua đối tượng trong một bước lặp cụ thể.
Giá trị `"data-channel"` cho biết rằng các thống kê có sẵn trong bước hiện tại là những thống kê được định nghĩa trong {{domxref("RTCDataChannelStats")}}.

## Giá trị

Chuỗi có giá trị `"data-channel"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
