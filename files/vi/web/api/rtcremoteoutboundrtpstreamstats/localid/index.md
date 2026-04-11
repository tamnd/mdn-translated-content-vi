---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính localId"
short-title: localId
slug: Web/API/RTCRemoteOutboundRtpStreamStats/localId
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.localId
---

{{APIRef("WebRTC")}}

Thuộc tính **`localId`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} là một chuỗi có thể được sử dụng để xác định đối tượng {{domxref("RTCInboundRtpStreamStats")}} mà {{domxref("RTCInboundRtpStreamStats.remoteId", "remoteId")}} của nó khớp với giá trị này.

Cùng nhau, hai đối tượng này cung cấp thống kê về phía đến và đi của cùng một nguồn đồng bộ (SSRC).

## Giá trị

Chuỗi có thể được so sánh với giá trị của thuộc tính {{domxref("RTCInboundRtpStreamStats.remoteId", "remoteId")}} của đối tượng {{domxref("RTCInboundRtpStreamStats")}} để xem liệu hai đối tượng đó có đại diện cho thống kê của mỗi phía của cùng một tập dữ liệu được nhận bởi đối tác cục bộ hay không.

## Ghi chú sử dụng

Bạn có thể nghĩ về các góc nhìn cục bộ và từ xa của cùng một luồng RTP như các cặp, mỗi cặp có tham chiếu trở lại cái kia.
Do đó, nếu một {{domxref("RTCStatsReport")}} bao gồm đối tượng thống kê `remote-outbound-rtp` (loại `RTCRemoteOutboundRtpStreamStats`), nó cũng nên có đối tượng `inbound-rtp` tương ứng.
Cả hai đều cung cấp thông tin về cùng một loạt gói tin được truyền từ đối tác từ xa đến thiết bị cục bộ.

Sự khác biệt là `remote-outbound-rtp` mô tả thống kê về dữ liệu được gửi bởi đối tác từ xa từ góc nhìn của đối tác từ xa, trong khi `inbound-rtp` cung cấp thống kê về dữ liệu đến từ góc nhìn của đối tác cục bộ.

## Ví dụ

Trong ví dụ này, chúng ta có một cặp hàm: hàm đầu tiên, `networkTestStart()`, lấy báo cáo ban đầu và hàm thứ hai, `networkTestStop()`, lấy báo cáo thứ hai.
Hàm thứ hai sử dụng hai báo cáo để xuất ra một số thông tin về điều kiện mạng.

### networkTestStart()

Hàm này gọi phương thức {{domxref("RTCPeerConnection.getStats", "getStats()")}} của {{domxref("RTCPeerConnection")}} để yêu cầu {{domxref("RTCStatsReport")}} và lưu trữ nó trong biến `startReport`.

```js
let startReport;

async function networkTestStart(pc) {
  if (pc) {
    startReport = await pc.getStats();
  }
}
```

Cho một {{domxref("RTCPeerConnection")}}, `pc`, hàm này gọi phương thức {{domxref("RTCPeerConnection.getStats", "getStats()")}} của nó để lấy đối tượng báo cáo thống kê, lưu vào `startReport` để sử dụng khi dữ liệu cuối kiểm tra đã được thu thập bởi `networkTestStop()`.

### networkTestStop()

Hàm `networkTestStop()` lấy báo cáo thứ hai, `endReport`, sau đó tính toán và xuất ra kết quả.

#### Tìm thống kê được ghép đôi

Mỗi bản ghi thống kê có {{domxref("RTCRemoteOutboundRtpStreamStats.type", "type")}} `remote-outbound-rtp` (mô tả thống kê của đối tác từ xa về việc gửi dữ liệu đến đối tác cục bộ) có một bản ghi tương ứng kiểu `inbound-rtp` mô tả góc nhìn của đối tác cục bộ về cùng dữ liệu được di chuyển giữa hai đối tác.
Hãy tạo một hàm tiện ích để giúp tìm giá trị của một khóa trong đối tượng thống kê được ghép đôi.

Hàm `findReportEntry()` được hiển thị bên dưới kiểm tra một {{domxref("RTCStatsReport")}}, trả về bản ghi thống kê dựa trên {{domxref("RTCStatsReport")}} chứa `key` được chỉ định và có giá trị bằng `value` được chỉ định.
Nếu không tìm thấy kết quả phù hợp hoặc báo cáo thống kê không có bản ghi tương ứng với danh mục thống kê được chỉ định bởi `key`.

```js
function findReportEntry(report, key, value) {
  for (const stats of report.values()) {
    if (stats[key] === value) {
      return stats;
    }
  }
  return null;
}
```

Vì `RTCStatsReport` là một [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) JavaScript, chúng ta có thể lặp qua [`values()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/values) của map để kiểm tra mỗi bản ghi thống kê dựa trên `RTCStats` trong báo cáo cho đến khi tìm thấy một bản ghi có thuộc tính `key` với `value` được chỉ định.
Khi tìm thấy kết quả phù hợp, đối tượng thống kê được trả về.

Nếu không tìm thấy kết quả phù hợp, hàm trả về `null`.

#### Hàm networkTestStop() chính

Bây giờ hãy xem hàm `networkTestStop()` chính. Nó nhận {{domxref("RTCPeerConnection")}} đang được kiểm tra làm đầu vào, gọi `getStats()` để lấy `RTCStatsReport` mới với thống kê hiện tại, sau đó tính toán kết quả đang tìm kiếm, xuất kết quả đó thích hợp cho người dùng bằng cách thêm HTML thích hợp vào nội dung của phần tử {{HTMLElement("div")}} có lớp là `stats-box`.

```js
async function networkTestStop(pc) {
  if (pc) {
    const statsBox = document.querySelector(".stats-box");
    const endReport = await pc.getStats();

    for (const endRemoteOutbound of endReport.values()) {
      if (endRemoteOutbound.type === "remote-outbound-rtp") {
        const startRemoteOutbound = startReport.get(endRemoteOutbound.id);

        if (startRemoteOutbound) {
          const startInboundStats = findReportEntry(
            startReport,
            "remoteId",
            startRemoteOutbound.id,
          );
          const endInboundStats = findReportEntry(
            endReport,
            "remoteId",
            endRemoteOutbound.id,
          );
          // Thời gian đã trôi qua tính bằng giây
          const elapsedTime =
            (endRemoteOutbound.timestamp - startRemoteOutbound.timestamp) /
            1000;
          const packetsSent =
            endRemoteOutbound.packetsSent - startRemoteOutbound.packetsSent;
          const bytesSent =
            endRemoteOutbound.bytesSent - startRemoteOutbound.bytesSent;
          const framesDecoded =
            endInboundStats.framesDecoded - startInboundStats.framesDecoded;
          const frameRate = framesDecoded / elapsedTime;

          let timeString = "";
          if (!isNaN(elapsedTime)) {
            timeString = ` representing ${elapsedTime}s`;
          }

          let frameString = "";
          if (!isNaN(framesDecoded)) {
            frameString = `Decoded ${framesDecoded} frames for a frame rate of ${frameRate.toFixed(
              2,
            )} FPS.<br>`;
          }

          const logEntry =
            `<div class="stats-entry"><h2>Report ID: ${endRemoteOutbound.id}</h2>` +
            `Remote peer sent ${packetsSent} packets ${timeString}.<br>` +
            `${frameString}` +
            `Data size: ${bytesSent} bytes.</div>`;
          statsBox.innerHTML += logEntry;
        } else {
          statsBox.innerHTML += `<div class="stats-error">Unable to find initial statistics for ID ${endRemoteOutbound.id}.</div>`;
        }
      }

      statsBox.scrollTo(0, statsBox.scrollHeight);
    }
  }
}
```

Đây là những gì xảy ra trong hàm `networkTestStop()`: sau khi gọi phương thức {{domxref("RTCPeerConnection.getStats", "getStats()")}} của {{domxref("RTCPeerConnection")}} để lấy báo cáo thống kê mới nhất cho kết nối và lưu nó vào `endReport`.
Đây là đối tượng {{domxref("RTCStatsReport")}}, ánh xạ chuỗi sang đối tượng của loại dựa trên {{domxref("RTCStatsReport")}} tương ứng.

Bây giờ chúng ta có thể bắt đầu xử lý kết quả, bắt đầu với thống kê kết thúc được tìm thấy trong `endReport`.
Trong trường hợp này, chúng ta đang tìm kiếm các bản ghi thống kê có `type` là `remote-outbound-rtp`, vì vậy chúng ta lặp qua các mục trong báo cáo thống kê cho đến khi tìm thấy một mục có loại đó.
Đối tượng này, cụ thể là loại {{domxref("RTCRemoteOutboundRtpStreamStats")}}, cung cấp thống kê về trạng thái mọi thứ _từ góc nhìn của đối tác từ xa_.
Bản ghi thống kê này được lưu vào `endRemoteOutbound`.

Sau khi tìm thấy bản ghi `remote-outbound-rtp` kết thúc, chúng ta sử dụng thuộc tính {{domxref("RTCRemoteOutboundRtpStreamStats.id", "id")}} của nó để lấy ID.
Với thông tin đó, chúng ta có thể tra cứu bản ghi `remote-outbound-rtp` trong bản ghi thống kê bắt đầu (`startReport`), lưu vào `startRemoteOutbound`.

Bây giờ chúng ta lấy thống kê `inbound-rtp` tương ứng với hai bản ghi `remote-outbound-rtp` này bằng cách tìm thuộc tính `remoteId` trong chúng có giá trị là ID của bản ghi `remote-outbound-rtp`.
Chúng ta sử dụng hàm `findReportEntry()` được mô tả trong phần trước cho điều đó, lưu các bản ghi `inbound-rtp` được xác định vào `startInboundStats` và `endInboundStats`.

Bây giờ chúng ta có tất cả thống kê thô cần thiết để tính toán thông tin chúng ta muốn hiển thị, vì vậy chúng ta thực hiện:

- Chúng ta tính lượng thời gian `elapsedTime` đã trôi qua giữa hai báo cáo được gửi bằng cách trừ {{domxref("RTCRemoteOutboundRtpStreamStats.timestamp", "timestamp")}} `startReport` từ của `endReport`.
  Sau đó chúng ta chia cho 1000 để chuyển kết quả từ mili giây sang giây.
- Chúng ta tính số gói được gửi trong khoảng thời gian này `packetsSent` bằng cách trừ các giá trị của hai báo cáo cho thuộc tính {{domxref("RTCSentRtpStreamStats.packetsSent", "packetsSent")}}.
- Tương tự, số byte được gửi trong khoảng thời gian này `bytesSent` được tính bằng cách trừ thuộc tính {{domxref("RTCSentRtpStreamStats.bytesSent", "bytesSent")}} của đối tượng thống kê bắt đầu từ đối tượng kết thúc.
- Số khung được giải mã trong khoảng thời gian này `framesDecoded` được xác định bằng cách trừ {{domxref("RTCInboundRtpStreamStats.framesDecoded", "framesDecoded")}} của `startRecord` từ `endRecord.framesDecoded`.
- Cuối cùng, tốc độ khung trong khoảng thời gian đã trôi qua được tính bằng cách chia `framesDecoded` cho `elapsedTime`.

Phần còn lại của hàm `networkTestStop()` xây dựng HTML được sử dụng để hiển thị đầu ra của các kết quả đã thu thập và tính toán cho người dùng, sau đó thêm nó vào phần tử `statsBox`.

Nhật ký đầu ra, với các kiểu dáng được sử dụng trong ví dụ, trông như thế này:

![Ảnh chụp màn hình của ví dụ hiển thị thống kê đã ghi từ các bản ghi thống kê remote-outbound-rtp và inbound-rtp được ghép đôi](rtc-log-screenshot.png)

Trong ảnh chụp màn hình, chúng ta thấy tiêu đề theo sau bởi {{HTMLElement("div")}} có thể cuộn mà chúng ta gọi là `statsBox`.
Hộp chứa một số mục nhật ký, một số mục cuối cùng đang hiển thị.
Mỗi mục đại diện khoảng một giây thời gian (vì đó là khoảng thời gian chúng ta đang chờ giữa khi gọi `networkTestStart()` và `networkTestStop()`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
