---
title: "RTCAudioSourceStats: thuộc tính totalAudioEnergy"
short-title: totalAudioEnergy
slug: Web/API/RTCAudioSourceStats/totalAudioEnergy
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_media-source.totalAudioEnergy
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`totalAudioEnergy`** của từ điển {{domxref("RTCAudioSourceStats")}} đại diện cho tổng năng lượng âm thanh của nguồn media trong suốt vòng đời của đối tượng thống kê này.

Tổng năng lượng trong một khoảng thời gian cụ thể có thể được xác định bằng cách trừ giá trị của thuộc tính này được trả về từ hai lần gọi `getStats()` khác nhau.

> [!NOTE]
> Để biết năng lượng âm thanh của các track được lấy từ xa, xem {{domxref("RTCInboundRtpStreamStats.totalAudioEnergy")}}.

## Giá trị

Một số được tạo ra bằng cách cộng năng lượng của mỗi mẫu trong suốt vòng đời của đối tượng thống kê này.

Năng lượng của mỗi mẫu được tính bằng cách chia giá trị của mẫu cho giá trị mã hóa cao nhất, bình phương kết quả, rồi nhân với thời lượng của mẫu tính bằng giây. Điều này được thể hiện bằng phương trình dưới đây:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>duration</mi><mo>×</mo><msup><mrow><mo>(</mo><mfrac><mi>sample_level</mi><mi>max_level</mi></mfrac><mo>)</mo></mrow><mn>2</mn></msup></mrow><annotation encoding="TeX">duration \times⁢ \left(\left(\right. \frac{sample{\_}level}{max{\_}level} \left.\right)\right)^{2}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Lưu ý rằng nếu nhiều kênh âm thanh được sử dụng, năng lượng âm thanh của một mẫu là năng lượng cao nhất của bất kỳ kênh nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
