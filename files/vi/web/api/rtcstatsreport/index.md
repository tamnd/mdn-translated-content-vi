---
title: RTCStatsReport
slug: Web/API/RTCStatsReport
page-type: web-api-interface
browser-compat: api.RTCStatsReport
---

{{APIRef("WebRTC")}}

Giao diện **`RTCStatsReport`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp báo cáo thống kê cho {{domxref("RTCPeerConnection")}}, {{domxref("RTCRtpSender")}}, hoặc {{domxref("RTCRtpReceiver")}}.

Một thể hiện `RTCStatsReport` là một [đối tượng giống `Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) chỉ đọc, trong đó mỗi khóa là một định danh cho đối tượng đang được báo cáo thống kê, và giá trị tương ứng là một đối tượng từ điển cung cấp các thống kê đó.

## Thuộc tính thể hiện

- {{domxref("RTCStatsReport.size")}}
  - : Trả về số lượng mục trong đối tượng `RTCStatsReport`.

## Phương thức thể hiện

- {{domxref("RTCStatsReport.entries()")}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa một mảng hai phần tử `[id, statistic-dictionary]` cho mỗi phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.
- {{domxref("RTCStatsReport.forEach()")}}
  - : Gọi `callbackFn` một lần cho mỗi cặp key-value có trong đối tượng `RTCStatsReport`, theo thứ tự chèn.
    Nếu tham số `thisArg` được cung cấp cho `forEach`, nó sẽ được dùng làm giá trị `this` cho mỗi callback.
- {{domxref("RTCStatsReport.get()")}}
  - : Trả về từ điển thống kê gắn với `id` được truyền vào, hoặc `undefined` nếu không có.
- {{domxref("RTCStatsReport.has()")}}
  - : Trả về giá trị boolean cho biết `RTCStatsReport` có chứa một từ điển thống kê gắn với `id` đã chỉ định hay không.
- {{domxref("RTCStatsReport.keys()")}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các khóa (ID) cho mỗi phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.
- {{domxref("RTCStatsReport.values()")}}
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa các giá trị (đối tượng thống kê) cho mỗi phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.
- [`RTCStatsReport[Symbol.iterator]()`](/en-US/docs/Web/API/RTCStatsReport/Symbol.iterator)
  - : Trả về một đối tượng [Iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới chứa một mảng hai phần tử `[id, statistic-dictionary]` cho mỗi phần tử trong đối tượng `RTCStatsReport`, theo thứ tự chèn.

## Mô tả

Một {{jsxref("Promise")}} phân giải thành `RTCStatsReport` được trả về từ các phương thức {{domxref("RTCRtpReceiver.getStats()")}}, {{domxref("RTCRtpSender.getStats()")}} và {{domxref("RTCPeerConnection.getStats()")}}.
Gọi `getStats()` trên một {{domxref("RTCPeerConnection")}} cho phép bạn chỉ định xem bạn muốn lấy thống kê đầu ra, thống kê đầu vào hay thống kê cho toàn bộ kết nối.
Các phiên bản `getStats()` của {{domxref("RTCRtpReceiver")}} và {{domxref("RTCRtpSender")}} chỉ trả về thống kê đầu vào và đầu ra tương ứng.

Báo cáo thống kê là một đối tượng [`Map`-like](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) chỉ đọc: một dictionary có thứ tự, trong đó các thuộc tính là các chuỗi `id` xác định duy nhất đối tượng WebRTC đã được kiểm tra để tạo ra một bộ thống kê cụ thể, và giá trị là một đối tượng dictionary chứa các thống kê đó.
`RTCStatsReport` có thể được lặp và dùng theo cùng cách như một `Map` chỉ đọc.

Báo cáo có thể chứa nhiều nhóm thống kê khác nhau, bao gồm thống kê đầu vào và đầu ra cho cả đầu hiện tại và đầu từ xa của peer connection, thông tin về codec, chứng chỉ và media đang dùng, v.v.
Mỗi nhóm thống kê được cung cấp trong một kiểu đối tượng dictionary thống kê khác nhau, có thể nhận biết từ thuộc tính [`type`](#type) của nó.

### Thuộc tính thể hiện chung

Tất cả các kiểu dictionary đều có các thuộc tính sau:

- `id`
  - : Một chuỗi xác định duy nhất đối tượng đã được giám sát để tạo ra bộ thống kê.
    Giá trị này được giữ qua các báo cáo trong ít nhất vòng đời của kết nối.
    Lưu ý rằng với một số thống kê, ID có thể khác nhau giữa các trình duyệt và cho các kết nối tiếp theo, ngay cả khi kết nối đến cùng một peer.
- `timestamp`
  - : Một đối tượng dấu thời gian độ phân giải cao ({{domxref("DOMHighResTimeStamp")}}) cho biết thời điểm mẫu được lấy.
    Nhiều thống kê được báo cáo là các giá trị tích lũy; timestamp cho phép tính tốc độ và trung bình giữa bất kỳ hai báo cáo nào, ở tần suất báo cáo mong muốn.
- `type`
  - : Một chuỗi có giá trị cho biết kiểu thống kê mà đối tượng chứa, như `candidate-pair`, `inbound-rtp`, `certificate`, v.v.
    [Các kiểu thống kê và đối tượng tương ứng](#the_statistic_types) được liệt kê bên dưới.

Người dùng thường duyệt một `RTCStatsReport` bằng cách dùng vòng lặp {{domxref("RTCStatsReport.forEach()", "forEach()")}} hoặc [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of), rồi chọn các thống kê quan tâm bằng thuộc tính `type`.
Khi đã xác định được một đối tượng thống kê cụ thể bằng `type` của nó, thuộc tính `id` có thể tiếp tục được dùng với {{domxref("RTCStatsReport.get()", "get()")}} để lấy cùng báo cáo thống kê đó ở một thời điểm khác.

Timestamp có thể được dùng để tính giá trị trung bình cho các thống kê tích lũy trong suốt vòng đời của kết nối.

### Các kiểu thống kê

Các giá trị `type` của thống kê và các dictionary tương ứng được liệt kê dưới đây.

| type                  | Dictionary                                                                 | Mô tả                                                                                                                                                                                                         |
| --------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `candidate-pair`      | {{domxref("RTCIceCandidatePairStats")}}                                    | Thống kê mô tả sự thay đổi từ một {{domxref("RTCIceTransport")}} sang một cái khác, chẳng hạn trong lúc [ICE restart](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#ice_restart).                           |
| `certificate`         | {{domxref("RTCCertificateStats")}}                                         | Thống kê về một chứng chỉ đang được {{domxref("RTCIceTransport")}} sử dụng.                                                                                                                                   |
| `codec`               | {{domxref("RTCCodecStats")}}                                               | Thống kê về một codec cụ thể đang được các luồng gửi hoặc nhận bởi kết nối này sử dụng.                                                                                                                       |
| `data-channel`        | {{domxref("RTCDataChannelStats")}}                                         | Thống kê liên quan đến một {{domxref("RTCDataChannel")}} trên kết nối.                                                                                                                                        |
| `inbound-rtp`         | {{domxref("RTCInboundRtpStreamStats")}}                                    | Thống kê mô tả trạng thái của một trong các luồng dữ liệu đầu vào của kết nối.                                                                                                                                |
| `local-candidate`     | {{domxref("RTCIceCandidateStats")}}                                        | Thống kê về một ICE candidate cục bộ được liên kết với các {{domxref("RTCIceTransport")}} của kết nối.                                                                                                        |
| `media-source`        | {{domxref("RTCAudioSourceStats")}} hoặc {{domxref("RTCVideoSourceStats")}} | Thống kê về media được tạo ra bởi {{domxref("MediaStreamTrack")}} gắn với một RTP sender. Dictionary mà khóa này ánh xạ tới phụ thuộc vào `kind` của track, qua {{domxref("MediaStreamTrack.kind", "kind")}}. |
| `outbound-rtp`        | {{domxref("RTCOutboundRtpStreamStats")}}                                   | Thống kê mô tả trạng thái của một trong các luồng dữ liệu đầu ra trên kết nối này.                                                                                                                            |
| `peer-connection`     | {{domxref("RTCPeerConnectionStats")}}                                      | Thống kê mô tả trạng thái của {{domxref("RTCPeerConnection")}}.                                                                                                                                               |
| `remote-candidate`    | {{domxref("RTCIceCandidateStats")}}                                        | Thống kê về một ICE candidate từ xa được liên kết với các {{domxref("RTCIceTransport")}} của kết nối.                                                                                                         |
| `remote-inbound-rtp`  | {{domxref("RTCRemoteInboundRtpStreamStats")}}                              | Thống kê mô tả trạng thái của luồng dữ liệu đầu vào từ góc nhìn của peer từ xa.                                                                                                                               |
| `remote-outbound-rtp` | {{domxref("RTCRemoteOutboundRtpStreamStats")}}                             | Thống kê mô tả trạng thái của luồng dữ liệu đầu ra từ góc nhìn của peer từ xa.                                                                                                                                |
| `transport`           | {{domxref("RTCTransportStats")}}                                           | Thống kê về một transport được kết nối sử dụng.                                                                                                                                                               |

## Ví dụ

### Duyệt báo cáo từ RTCPeerConnection bằng vòng lặp forEach

Ví dụ này cho thấy cách bạn có thể ghi lại thống kê liên quan đến video cho {{domxref("RTCRtpReceiver")}} cục bộ chịu trách nhiệm nhận media đang được phát.

Giả sử có biến `myPeerConnection`, là một thể hiện của `RTCPeerConnection`, mã dùng `await` để chờ báo cáo thống kê, rồi duyệt nó bằng {{domxref("RTCStatsReport.forEach()")}}.
Sau đó nó lọc các dictionary chỉ còn những báo cáo có `type` là `inbound-rtp` và `kind` là `video`.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "inbound-rtp" && report.kind === "video") {
    // Ghi log tốc độ khung hình
    console.log(report.framesPerSecond);
  }
});
```

### Duyệt báo cáo từ RTCRtpSender bằng vòng lặp for...of

Ví dụ này cho thấy cách bạn có thể duyệt thống kê đầu ra từ một {{domxref("RTCRtpSender")}}.

Mã làm theo mẫu tương tự ví dụ trước, nhưng duyệt bằng vòng lặp `for...of` trên {{domxref("RTCStatsReport.values()")}}, và lọc theo `type` là `outbound-rtp`.
Ví dụ giả định rằng bạn đã có một đối tượng `RTCRtpSender` tên là "sender".

```js
const stats = await sender.getStats();

for (const stat of stats.values()) {
  if (stat.type !== "outbound-rtp") continue;
  Object.keys(stat).forEach((statName) => {
    console.log(`${statName}: ${stat[statName]}`);
  });
}
```

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCPeerConnection.getStats()")}}, {{domxref("RTCRtpReceiver.getStats()")}}, và {{domxref("RTCRtpSender.getStats()")}}
