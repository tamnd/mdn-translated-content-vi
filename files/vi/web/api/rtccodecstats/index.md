---
title: RTCCodecStats
slug: Web/API/RTCCodecStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_codec
---

{{APIRef("WebRTC")}}

Từ điển **`RTCCodecStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp thống kê về một codec được sử dụng bởi các luồng {{Glossary("RTP")}} đang được gửi hoặc nhận bởi đối tượng {{domxref("RTCPeerConnection")}} liên quan.

Có thể lấy các thống kê này bằng cách duyệt qua đối tượng {{domxref("RTCStatsReport")}} trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi tìm được một mục có [`type`](/en-US/docs/Web/API/RTCCodecStats/type) là `codec`.

Thống kê codec có thể được liên kết với thống kê luồng inbound hoặc outbound (cả local và remote) bằng cách khớp thuộc tính `codecId` của chúng với `id` của codec.
Ví dụ, nếu [`RTCInboundRtpStreamStats.codecId`](/en-US/docs/Web/API/RTCInboundRtpStreamStats/codecId) khớp với [`RTCCodecStats.id`](/en-US/docs/Web/API/RTCCodecStats/id) trong cùng một báo cáo, thì ta biết codec đó đang được sử dụng trên luồng inbound của peer connection này.
Nếu không có `codecId` nào trong luồng tham chiếu đến một đối tượng thống kê codec, thì đối tượng thống kê codec đó sẽ bị xóa; nếu codec được sử dụng lại, đối tượng thống kê sẽ được tạo lại với cùng `id`.

Các đối tượng codec có thể được tham chiếu bởi nhiều luồng RTP trong các phần media sử dụng cùng một transport.
Trên thực tế, các user agent được kỳ vọng sẽ hợp nhất thông tin thành một mục "codec" duy nhất theo payload type theo transport (trừ khi [sdpFmtpLine](/en-US/docs/Web/API/RTCCodecStats/sdpFmtpLine) khác nhau khi gửi hoặc nhận, trong trường hợp đó sẽ cần các codec khác nhau để mã hóa và giải mã).
Lưu ý rằng các transport khác sẽ sử dụng các đối tượng `RTCCodecStats` riêng biệt của chúng.

## Thuộc tính phiên bản

- {{domxref("RTCCodecStats.channels", "channels")}} {{optional_inline}}
  - : Một số dương cho biết số kênh được hỗ trợ bởi codec.
- {{domxref("RTCCodecStats.clockRate", "clockRate")}} {{optional_inline}}
  - : Một số dương chứa tốc độ lấy mẫu media.
- {{domxref("RTCCodecStats.mimeType", "mimeType")}}
  - : Một chuỗi chứa loại MIME/subtype của media, chẳng hạn như video/VP8.
- {{domxref("RTCCodecStats.payloadType", "payloadType")}}
  - : Một số nguyên dương trong khoảng từ 0 đến 127 cho biết payload type được sử dụng trong mã hóa hoặc giải mã RTP.
- {{domxref("RTCCodecStats.sdpFmtpLine", "sdpFmtpLine")}} {{optional_inline}}
  - : Một chuỗi chứa các tham số dành riêng cho định dạng của dòng `"a=fmtp"` trong {{Glossary("SDP")}} của codec (nếu có).
- {{domxref("RTCCodecStats.transportId", "transportId")}}
  - : Một chuỗi chứa mã định danh duy nhất của transport mà codec này đang được sử dụng.
    Có thể dùng để khớp với đối tượng {{domxref("RTCTransportStats")}} tương ứng.

### Thuộc tính phiên bản chung

Các thuộc tính sau là chung cho tất cả đối tượng thống kê WebRTC (xem [`RTCStatsReport`](/en-US/docs/Web/API/RTCStatsReport#common_instance_properties) để biết thêm thông tin):

<!-- RTCStats -->

- {{domxref("RTCCodecStats.id", "id")}}
  - : Một chuỗi định danh duy nhất cho đối tượng đang được theo dõi để tạo ra tập thống kê này.
- {{domxref("RTCCodecStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu dữ liệu được lấy cho đối tượng thống kê này.
- {{domxref("RTCCodecStats.type", "type")}}
  - : Một chuỗi có giá trị `"codec"`, cho biết loại thống kê mà đối tượng chứa.

## Ví dụ

Cho một biến `myPeerConnection` là một phiên bản của {{domxref("RTCPeerConnection")}}, đoạn code dưới đây sử dụng `await` để chờ báo cáo thống kê, rồi duyệt qua nó bằng `RTCStatsReport.forEach()`.
Sau đó lọc các từ điển chỉ lấy những báo cáo có type là `codec` và in kết quả.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "codec") {
    // Log the codec information
    console.log(report);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCStatsReport")}}
- Tùy chọn `codecs` trong tham số truyền vào {{domxref("RTCRtpTransceiver.setCodecPreferences()")}} và {{domxref("RTCRtpSender.setParameters()()")}}.
- Thuộc tính `codecs` trong đối tượng trả về bởi {{domxref("RTCRtpSender.getParameters()")}} và {{domxref("RTCRtpReceiver.getParameters()")}}.
