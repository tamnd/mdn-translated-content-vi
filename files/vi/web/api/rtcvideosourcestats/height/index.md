---
title: "RTCVideoSourceStats: height property"
short-title: height
slug: Web/API/RTCVideoSourceStats/height
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.height
---

{{APIRef("WebRTC")}}

Thuộc tính **`height`** của từ điển {{domxref("RTCVideoSourceStats")}} cho biết chiều cao, tính bằng pixel, của khung hình cuối cùng xuất phát từ nguồn này.

Thuộc tính này không được định nghĩa trên đối tượng thống kê cho đến khi khung hình đầu tiên được tạo ra.

## Giá trị

Một số dương cho biết chiều cao, tính bằng pixel.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua đối tượng thống kê trả về từ `RTCRtpSender.getStats()` để lấy thống kê nguồn video, rồi trích xuất `height`.

```js
// where sender is an RTCRtpSender
const stats = await sender.getStats();
let videoSourceStats = null;

stats.forEach((report) => {
  if (report.type === "media-source" && report.kind==="video") {
    videoSourceStats = report;
    break;
  }
});

// Note, test is conditional in case the stats object
// does not include video source stats
const height = videoSourceStats?.height;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
