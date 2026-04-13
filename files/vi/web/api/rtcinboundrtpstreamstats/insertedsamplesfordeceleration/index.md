---
title: "RTCInboundRtpStreamStats: thuộc tính insertedSamplesForDeceleration"
short-title: insertedSamplesForDeceleration
slug: Web/API/RTCInboundRtpStreamStats/insertedSamplesForDeceleration
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.insertedSamplesForDeceleration
---

{{APIRef("WebRTC")}}

Thuộc tính **`insertedSamplesForDeceleration`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} tích lũy sự chênh lệch giữa số mẫu nhận được và số mẫu phát ra từ {{glossary("jitter","bộ đệm jitter")}} trong khi tốc độ phát âm thanh bị làm chậm.

Bộ đệm jitter WebRTC đặt mức độ trễ phát mục tiêu sao cho lưu lượng vào và ra của bộ đệm jitter xấp xỉ nhau.
Nếu bộ đệm jitter bị cạn quá nhanh, mẫu âm thanh tiếp theo sẽ "sớm hơn lịch", và bộ đệm jitter có thể làm chậm tốc độ phát.
Nếu bộ đệm jitter làm chậm tốc độ phát bằng cách chèn thêm mẫu âm thanh, thuộc tính này cho biết tổng số mẫu được thêm vào như vậy.

Việc làm chậm và/hoặc tăng tốc âm thanh (được theo dõi bằng {{domxref("RTCInboundRtpStreamStats.removedSamplesForAcceleration","removedSamplesForAcceleration")}}) có thể gây ra tiếng rè hoặc méo tiếng có thể nghe thấy.
Tổng số ở cuối cuộc gọi cũng cho biết có bao nhiêu mẫu hoặc giây bị ảnh hưởng, và `insertedSamplesForDeceleration` có thể được so sánh với {{domxref("RTCInboundRtpStreamStats/totalSamplesReceived","totalSamplesReceived")}} để đo lường tương đối mức độ giảm tốc.
Ghi lại `insertedSamplesForDeceleration` và `removedSamplesForAcceleration` theo các khoảng thời gian có thể hữu ích để xác định thời điểm xảy ra vấn đề, từ đó có thể tương quan với các chỉ số khác trong cùng khoảng thời gian để xác định nguyên nhân có thể.

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.removedSamplesForAcceleration","removedSamplesForAcceleration")}}
