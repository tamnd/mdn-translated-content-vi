---
title: "RTCInboundRtpStreamStats: thuộc tính totalAudioEnergy"
short-title: totalAudioEnergy
slug: Web/API/RTCInboundRtpStreamStats/totalAudioEnergy
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.totalAudioEnergy
---

{{APIRef("WebRTC")}}

Thuộc tính **`totalAudioEnergy`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} đại diện cho tổng năng lượng âm thanh của track âm thanh được nhận trong suốt vòng đời của đối tượng thống kê này.

Tổng năng lượng trong một khoảng thời gian cụ thể có thể được xác định bằng cách trừ giá trị của thuộc tính này được trả về bởi hai lần gọi `getStats()` khác nhau.

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số được tạo ra bằng cách tổng hợp năng lượng của mỗi mẫu trong suốt vòng đời của đối tượng thống kê này.

Năng lượng của mỗi mẫu được tính bằng cách chia giá trị mẫu cho giá trị có thể mã hóa cao nhất, bình phương kết quả, và sau đó nhân với thời lượng mẫu tính bằng giây.

Lưu ý rằng nếu sử dụng nhiều kênh âm thanh, năng lượng âm thanh của mẫu đề cập đến năng lượng cao nhất của bất kỳ kênh nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCAudioSourceStats.totalAudioEnergy")}} đối với năng lượng âm thanh của track cục bộ (đang được gửi đi)
