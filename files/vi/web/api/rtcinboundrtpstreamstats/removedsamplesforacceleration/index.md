---
title: "RTCInboundRtpStreamStats: thuộc tính removedSamplesForAcceleration"
short-title: removedSamplesForAcceleration
slug: Web/API/RTCInboundRtpStreamStats/removedSamplesForAcceleration
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_inbound-rtp.removedSamplesForAcceleration
---

{{APIRef("WebRTC")}}

Thuộc tính **`removedSamplesForAcceleration`** của từ điển {{domxref("RTCInboundRtpStreamStats")}} tích lũy sự chênh lệch giữa số mẫu phát ra từ {{glossary("jitter","bộ đệm jitter")}} và số mẫu nhận được trong khi tốc độ phát âm thanh bị tăng nhanh.

Bộ đệm jitter WebRTC đặt mức độ trễ phát mục tiêu sao cho lưu lượng vào và ra của bộ đệm jitter xấp xỉ nhau.
Nếu bộ đệm jitter cạn quá chậm, mẫu âm thanh tiếp theo sẽ "trễ hơn lịch", và bộ máy có thể tăng tốc độ phát để bắt kịp.
Nếu bộ máy tăng tốc độ phát bằng cách loại bỏ một số mẫu âm thanh, thuộc tính này cho biết tổng số mẫu bị loại bỏ như vậy.

Việc tăng tốc hoặc làm chậm âm thanh (được theo dõi bằng {{domxref("RTCInboundRtpStreamStats.insertedSamplesForDeceleration","insertedSamplesForDeceleration")}}) có thể gây ra tiếng rè hoặc méo tiếng có thể nghe thấy.
Tổng số ở cuối cuộc gọi cũng cho biết có bao nhiêu mẫu hoặc giây bị ảnh hưởng, và `removedSamplesForAcceleration` có thể được so sánh với {{domxref("RTCInboundRtpStreamStats/totalSamplesReceived","totalSamplesReceived")}} để đo lường tương đối mức độ tăng tốc.
Ghi lại `insertedSamplesForDeceleration` và `removedSamplesForAcceleration` theo các khoảng thời gian có thể hữu ích để xác định thời điểm xảy ra vấn đề và từ đó có thể tương quan với các chỉ số khác trong cùng khoảng thời gian để xác định nguyên nhân có thể.

> [!NOTE]
> Giá trị này không xác định đối với luồng video.

## Giá trị

Một số nguyên dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCInboundRtpStreamStats.insertedSamplesForDeceleration","insertedSamplesForDeceleration")}}
