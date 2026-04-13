---
title: "RTCOutboundRtpStreamStats: qualityLimitationReason property"
short-title: qualityLimitationReason
slug: Web/API/RTCOutboundRtpStreamStats/qualityLimitationReason
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_outbound-rtp.qualityLimitationReason
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`qualityLimitationReason`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là một chuỗi cho biết lý do tại sao codec hiện đang giảm chất lượng phương tiện trong luồng trong quá trình mã hóa, hoặc `none` nếu không có giảm chất lượng nào đang được thực hiện.

Việc giảm chất lượng này có thể bao gồm các thay đổi như giảm tốc độ khung hình hoặc độ phân giải, hoặc tăng hệ số nén. Lưu ý rằng tác nhân người dùng báo cáo yếu tố giới hạn nhất. Nếu không thể xác định yếu tố giới hạn nhất, kết quả sẽ được báo cáo theo thứ tự ưu tiên: "bandwidth", "cpu", "other".

Lượng thời gian phương tiện được mã hóa đã bị giảm chất lượng theo từng cách có thể được tìm thấy trong {{domxref("RTCOutboundRtpStreamStats.qualityLimitationDurations", "qualityLimitationDurations")}}.

> [!NOTE]
> Thuộc tính này không xác định cho các luồng âm thanh.

## Giá trị

Chuỗi có một trong các giá trị sau:

- `none`
  - : Chất lượng không bị giới hạn.
- `cpu`
  - : Chất lượng bị giới hạn chủ yếu do tải CPU.
- `bandwidth`
  - : Chất lượng bị giới hạn chủ yếu do các tín hiệu tắc nghẽn trong quá trình ước tính băng thông, chẳng hạn như thời gian đến giữa các gói và thời gian khứ hồi.
- `other`
  - : Chất lượng bị giới hạn chủ yếu vì lý do khác ngoài những lý do trên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
