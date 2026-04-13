---
title: "RTCOutboundRtpStreamStats: qualityLimitationDurations property"
short-title: qualityLimitationDurations
slug: Web/API/RTCOutboundRtpStreamStats/qualityLimitationDurations
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_outbound-rtp.qualityLimitationDurations
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`qualityLimitationDurations`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} là bản đồ các lý do mà codec đã giảm chất lượng của luồng phương tiện trong quá trình mã hóa, cùng với thời gian chất lượng bị giảm cho mỗi lý do.

Việc giảm chất lượng này có thể bao gồm các thay đổi như giảm tốc độ khung hình hoặc độ phân giải, hoặc tăng hệ số nén. Thông tin này có thể được sử dụng để chẩn đoán các vấn đề về thông lượng và tối ưu hóa hiệu suất.

> [!NOTE]
> Thuộc tính này chỉ tồn tại cho phương tiện video.

## Giá trị

{{jsxref("Map")}} ánh xạ các lý do giới hạn chất lượng sang số biểu thị thời gian tính bằng giây mà luồng đã bị giới hạn chất lượng vì lý do đó.

Các giá trị lý do giới hạn chất lượng được phép là các chuỗi:

- `none`
  - : Chất lượng không bị giới hạn.
- `cpu`
  - : Chất lượng bị giới hạn chủ yếu do tải CPU.
- `bandwidth`
  - : Chất lượng bị giới hạn chủ yếu do các tín hiệu tắc nghẽn trong quá trình ước tính băng thông, chẳng hạn như thời gian đến giữa các gói và thời gian khứ hồi.
- `other`
  - : Chất lượng bị giới hạn chủ yếu vì lý do khác ngoài những lý do trên.

## Ví dụ

### Lấy tổng thời gian luồng bị giới hạn chất lượng

Tổng của tất cả các mục trừ `qualityLimitationDurations["none"]` cho thấy tổng thời gian luồng bị giới hạn.

```js
// Get the outbound RTP stream stats
pc.getStats().then((stats) => {
  stats.forEach((report) => {
    if (report.type === "outbound-rtp") {
      const qualityLimitations = report.qualityLimitationDurations;
      if (qualityLimitations) {
        let totalTimeLimited = 0;

        console.log("Quality Limitations:");
        qualityLimitations.forEach((duration, reason) => {
          console.log(`- ${reason}: ${duration} seconds`);
          if (reason !== "none") {
            totalTimeLimited += duration;
          }
        });
        console.log(`Total time limited: ${totalTimeLimited}`);
      }
    }
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
