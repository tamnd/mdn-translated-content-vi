---
title: RTCVideoSourceStats
slug: Web/API/RTCVideoSourceStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_media-source
spec-urls: https://w3c.github.io/webrtc-stats/#dom-rtcvideosourcestats
---

{{APIRef("WebRTC")}}

Từ điển **`RTCVideoSourceStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp thông tin thống kê về một video track ({{domxref("MediaStreamTrack")}}) đang được gắn với một hoặc nhiều sender ({{domxref("RTCRtpSender")}}).

Có thể lấy các thống kê này bằng cách duyệt qua {{domxref("RTCStatsReport")}} trả về bởi {{domxref("RTCRtpSender.getStats()")}} hoặc {{domxref("RTCPeerConnection.getStats()")}} cho đến khi tìm được một báo cáo có [`type`](/en-US/docs/Web/API/RTCVideoSourceStats/type) là `media-source` và [`kind`](/en-US/docs/Web/API/RTCVideoSourceStats/kind) là `video`.

> [!NOTE]
> Để lấy thông tin video về các track được nhận từ xa, hãy xem {{domxref("RTCInboundRtpStreamStats")}}.

## Thuộc tính phiên bản

- {{domxref("RTCVideoSourceStats.frames", "frames")}} {{optional_inline}}
  - : Một số dương cho biết tổng số khung hình xuất phát từ nguồn video này.
- {{domxref("RTCVideoSourceStats.framesPerSecond", "framesPerSecond")}} {{optional_inline}}
  - : Một số dương cho biết số khung hình xuất phát từ nguồn video này trong giây vừa qua.
    Thuộc tính này không được định nghĩa trên đối tượng thống kê này trong giây đầu tiên tồn tại của nó.
- {{domxref("RTCVideoSourceStats.height", "height")}} {{optional_inline}}
  - : Một số cho biết chiều cao, tính bằng pixel, của khung hình cuối cùng xuất phát từ nguồn này.
    Thuộc tính này không được định nghĩa trên đối tượng thống kê này cho đến khi khung hình đầu tiên được tạo ra.
- {{domxref("RTCVideoSourceStats.width", "width")}} {{optional_inline}}
  - : Một số cho biết chiều rộng, tính bằng pixel, của khung hình gần nhất xuất phát từ nguồn này.
    Thuộc tính này không được định nghĩa trên đối tượng thống kê này cho đến khi khung hình đầu tiên được tạo ra.

### Thuộc tính media-source chung

Các thuộc tính sau có mặt trong cả `RTCVideoSourceStats` và {{domxref("RTCAudioSourceStats")}}: <!-- RTCMediaSourceStats  -->

- {{domxref("RTCVideoSourceStats.trackIdentifier", "trackIdentifier")}}
  - : Một chuỗi chứa giá trị [`id`](/en-US/docs/Web/API/MediaStreamTrack/id) của [`MediaStreamTrack`](/en-US/docs/Web/API/MediaStreamTrack) liên kết với nguồn video.
- {{domxref("RTCVideoSourceStats.kind", "kind")}}
  - : Một chuỗi cho biết đối tượng này đại diện cho thống kê của nguồn video hay nguồn media. Với `RTCVideoSourceStats`, giá trị này luôn là `video`.

### Thuộc tính phiên bản chung

Các thuộc tính sau là chung cho tất cả các đối tượng thống kê. <!-- RTCStats -->

- {{domxref("RTCVideoSourceStats.id", "id")}}
  - : Một chuỗi định danh duy nhất cho đối tượng đang được theo dõi để tạo ra tập thống kê này.
- {{domxref("RTCVideoSourceStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu dữ liệu được lấy cho đối tượng thống kê này.
- {{domxref("RTCVideoSourceStats.type", "type")}}
  - : Một chuỗi có giá trị `"media-source"`, cho biết đối tượng là một phiên bản của {{domxref("RTCAudioSourceStats")}} hoặc `RTCVideoSourceStats`.

## Mô tả

Giao diện này cung cấp thống kê về một nguồn media video đang được gắn với một hoặc nhiều sender.
Thông tin bao gồm mã định danh cho `MediaStreamTrack` liên quan, cùng với chiều cao và chiều rộng của khung hình cuối cùng được gửi từ nguồn, số khung hình đã gửi từ nguồn và tốc độ khung hình.

## Ví dụ

Ví dụ này cho thấy cách duyệt qua đối tượng thống kê trả về từ `RTCRtpSender.getStats()` để lấy thống kê media-source dành riêng cho video.

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

// videoSourceStats will be null if the report did not include video source stats
const frames = videoSourceStats?.frames;
const fps = videoSourceStats?.framesPerSecond;
const width = videoSourceStats?.width;
const height = videoSourceStats?.height;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
