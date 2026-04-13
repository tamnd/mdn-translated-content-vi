---
title: "RTCVideoSourceStats: framesPerSecond property"
short-title: framesPerSecond
slug: Web/API/RTCVideoSourceStats/framesPerSecond
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_media-source.framesPerSecond
---

{{APIRef("WebRTC")}}

Thuộc tính **`framesPerSecond`** của từ điển {{domxref("RTCVideoSourceStats")}} cho biết số khung hình xuất phát từ nguồn video này trong giây vừa qua.

Thuộc tính này không được định nghĩa trên đối tượng thống kê trong giây đầu tiên tồn tại của nó.

## Giá trị

Một số cho biết số khung hình xuất phát từ nguồn này trong giây vừa qua.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua đối tượng thống kê trả về từ `RTCRtpSender.getStats()` để lấy thống kê nguồn video, rồi trích xuất `framesPerSecond`.

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
const fps = videoSourceStats?.framesPerSecond;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
