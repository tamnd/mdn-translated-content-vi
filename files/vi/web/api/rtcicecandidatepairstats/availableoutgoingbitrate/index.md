---
title: "RTCIceCandidatePairStats: availableOutgoingBitrate property"
short-title: availableOutgoingBitrate
slug: Web/API/RTCIceCandidatePairStats/availableOutgoingBitrate
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.availableOutgoingBitrate
---

{{APIRef("WebRTC")}}

Thuộc tính **`availableOutgoingBitrate`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết băng thông đi khả dụng của kết nối mạng được biểu diễn bởi cặp ứng viên. Giá trị càng cao, băng thông khả dụng cho dữ liệu đi càng lớn.

Bạn có thể lấy tốc độ bit đến khả dụng từ {{domxref("RTCIceCandidatePairStats.availableIncomingBitrate", "availableIncomingBitrate")}}.

## Giá trị

Một số xấp xỉ lượng băng thông khả dụng cho dữ liệu đi trên kết nối mạng được mô tả bởi `RTCIceCandidatePair`. Giá trị được tính theo bit mỗi giây và được tính trong khoảng thời gian 1 giây.

Giá trị trả về là `undefined` trong mỗi trường hợp sau:

- Hiện thực bên dưới không hỗ trợ tính toán ước tính tốc độ bit đi từ phía gửi.
- {{domxref("RTCIceCandidatePair")}} được mô tả bởi đối tượng này chưa bao giờ được sử dụng.
- Cặp ứng viên đã từng được sử dụng nhưng hiện không còn được dùng nữa.

Giá trị trả về được tính bằng cách cộng tốc độ bit khả dụng cho mỗi luồng {{Glossary("RTP")}} sử dụng kết nối được mô tả bởi cặp ứng viên này. Giá trị trả về không tính đến overhead được đưa ra bởi các giao thức bên dưới, bao gồm IP, UDP hoặc TCP.

> [!NOTE]
> Giá trị trả về được tính bằng phương pháp tương tự nhưng không giống hệt với Transport Independent Application Specific Maximum (TIAS) được mô tả trong {{RFC(3890, "", "6.2")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
