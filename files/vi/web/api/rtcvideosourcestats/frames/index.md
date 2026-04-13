---
title: "RTCVideoSourceStats: frames property"
short-title: frames
slug: Web/API/RTCVideoSourceStats/frames
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.frames
---

{{APIRef("WebRTC")}}

Thuộc tính **`frames`** của từ điển {{domxref("RTCVideoSourceStats")}} cho biết tổng số khung hình xuất phát từ nguồn video này trong suốt vòng đời của nó.

## Giá trị

Một số cho biết tổng số khung hình xuất phát từ nguồn này.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua đối tượng thống kê trả về từ `RTCRtpSender.getStats()` để lấy thống kê nguồn video, rồi trích xuất `frames`.

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

const frames = videoSourceStats?.frames;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
