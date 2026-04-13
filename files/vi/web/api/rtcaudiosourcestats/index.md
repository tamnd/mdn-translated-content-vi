---
title: RTCAudioSourceStats
slug: Web/API/RTCAudioSourceStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_media-source
spec-urls: https://w3c.github.io/webrtc-stats/#dom-rtcaudiosourcestats
---

{{APIRef("WebRTC")}}

Từ điển **`RTCAudioSourceStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp thông tin thống kê về một audio track ({{domxref("MediaStreamTrack")}}) được gắn với một hoặc nhiều bộ gửi ({{domxref("RTCRtpSender")}}).

Thông tin thống kê này có thể thu được bằng cách duyệt qua {{domxref("RTCStatsReport")}} được trả về từ {{domxref("RTCRtpSender.getStats()")}} hoặc {{domxref("RTCPeerConnection.getStats()")}} cho đến khi tìm thấy một báo cáo có [`type`](/en-US/docs/Web/API/RTCAudioSourceStats/type) là `media-source` và [`kind`](/en-US/docs/Web/API/RTCAudioSourceStats/kind) là `audio`.

> [!NOTE]
> Để biết thông tin âm thanh về các track được lấy từ xa (đang được nhận), xem {{domxref("RTCInboundRtpStreamStats")}}.

## Thuộc tính phiên bản

- {{domxref("RTCAudioSourceStats.audioLevel", "audioLevel")}} {{Experimental_Inline}}{{optional_inline}}
  - : Một số đại diện cho mức âm thanh của nguồn media.
- {{domxref("RTCAudioSourceStats.totalAudioEnergy", "totalAudioEnergy")}} {{Experimental_Inline}}{{optional_inline}}
  - : Một số đại diện cho tổng năng lượng âm thanh của nguồn media trong suốt vòng đời của đối tượng thống kê.
- {{domxref("RTCAudioSourceStats.totalSamplesDuration", "totalSamplesDuration")}} {{Experimental_Inline}}{{optional_inline}}
  - : Một số đại diện cho tổng thời lượng của tất cả các mẫu được tạo ra bởi nguồn media trong suốt vòng đời của đối tượng thống kê.

### Thuộc tính media-source chung

Các thuộc tính sau có trong cả `RTCAudioSourceStats` và {{domxref("RTCVideoSourceStats")}}: <!-- RTCMediaSourceStats  -->

- {{domxref("RTCAudioSourceStats.trackIdentifier", "trackIdentifier")}}
  - : Một chuỗi chứa giá trị [`id`](/en-US/docs/Web/API/MediaStreamTrack/id) của [`MediaStreamTrack`](/en-US/docs/Web/API/MediaStreamTrack) liên quan đến nguồn âm thanh.
- {{domxref("RTCAudioSourceStats.kind", "kind")}}
  - : Một chuỗi cho biết đối tượng này đại diện cho thống kê của nguồn video hay nguồn media. Với `RTCAudioSourceStats`, giá trị này luôn là `audio`.

### Thuộc tính phiên bản chung

Các thuộc tính sau phổ biến với tất cả các đối tượng thống kê. <!-- RTCStats -->

- {{domxref("RTCAudioSourceStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được theo dõi để tạo ra bộ thống kê này.
- {{domxref("RTCAudioSourceStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu này được lấy cho đối tượng thống kê này.
- {{domxref("RTCAudioSourceStats.type", "type")}}
  - : Một chuỗi với giá trị `"media-source"`, cho biết đối tượng là một thực thể của `RTCAudioSourceStats` hoặc {{domxref("RTCVideoSourceStats")}}.

## Mô tả

Giao diện cung cấp thống kê về nguồn media âm thanh được gắn với một hoặc nhiều bộ gửi. Thông tin bao gồm mức âm thanh hiện tại, được tính trung bình trong một khoảng thời gian ngắn (phụ thuộc vào triển khai).

Thống kê cũng bao gồm tổng năng lượng và tổng thời lượng mẫu tích lũy tại một dấu thời gian cụ thể. Các tổng số này có thể được sử dụng để xác định mức âm thanh trung bình trong suốt vòng đời của đối tượng thống kê. Bạn có thể tính giá trị căn bậc hai trung bình (RMS) theo cùng đơn vị như `audioLevel` bằng công thức sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><msqrt><mfrac><mi>totalAudioEnergy</mi><mi>totalSamplesDuration</mi></mfrac></msqrt><annotation encoding="TeX">\sqrt{\frac{totalAudioEnergy}{totalSamplesDuration}}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Bạn cũng có thể sử dụng các tổng số tích lũy để tính mức âm thanh trung bình trong khoảng thời gian tùy ý.

Tổng năng lượng âm thanh của đối tượng thống kê được tích lũy bằng cách cộng năng lượng của mỗi mẫu trong suốt vòng đời của đối tượng thống kê, trong khi tổng thời lượng được tích lũy bằng cách cộng thời lượng của mỗi mẫu. Năng lượng của mỗi mẫu được xác định bằng công thức sau, trong đó `sample_level` là mức của mẫu, `max_level` là giá trị mã hóa cao nhất và `duration` là thời lượng của mẫu tính bằng giây:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mi>duration</mi><mo>×</mo><msup><mrow><mo>(</mo><mfrac><mi>sample_level</mi><mi>max_level</mi></mfrac><mo>)</mo></mrow><mn>2</mn></msup></mrow><annotation encoding="TeX">duration \times⁢ \left(\left(\right. \frac{sample{\_}level}{max{\_}level} \left.\right)\right)^{2}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Mức âm thanh trung bình giữa bất kỳ hai lần gọi `getStats()` khác nhau, trong bất kỳ khoảng thời gian nào, có thể được tính bằng phương trình sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><msqrt><mfrac><mrow><msub><mi>totalAudioEnergy</mi><mn>2</mn></msub><mo>-</mo><msub><mi>totalAudioEnergy</mi><mn>1</mn></msub></mrow><mrow><msub><mi>totalSamplesDuration</mi><mn>2</mn></msub><mo>-</mo><msub><mi>totalSamplesDuration</mi><mn>1</mn></msub></mrow></mfrac></msqrt><annotation encoding="TeX">\sqrt{\frac{\left(totalAudioEnergy\right)_{2} - \left(totalAudioEnergy\right)_{1}}{\left(totalSamplesDuration\right)_{2} - \left(totalSamplesDuration\right)_{1}}}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

## Ví dụ

Ví dụ này cho thấy cách duyệt qua đối tượng thống kê được trả về từ `RTCRtpSender.getStats()` để lấy thống kê nguồn âm thanh và trích xuất `audioLevel`.

```js
// where sender is an RTCRtpSender
const stats = await sender.getStats();
let audioSourceStats = null;

stats.forEach((report) => {
  if (report.type === "media-source" && report.kind==="audio") {
    audioSourceStats = report;
    break;
  }
});

const audioLevel = audioSourceStats?.audioLevel;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
