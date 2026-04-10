---
title: "WebTransport: phương thức getStats()"
short-title: getStats()
slug: Web/API/WebTransport/getStats
page-type: web-api-instance-method
browser-compat: api.WebTransport.getStats
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Phương thức **`getStats()`** của giao diện {{domxref("WebTransport")}} trả về bất đồng bộ một object chứa thống kê kết nối HTTP/3.

## Cú pháp

```js-nolint
getStats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một object chứa thống kê kết nối HTTP/3.
Object được trả về có thể có các thuộc tính/thống kê sau:

- `timestamp`
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết dấu thời gian tại đó thống kê được thu thập, tính từ 1/1/1970 UTC.
- `bytesSent`
  - : Một số nguyên dương cho biết số byte đã gửi trên kết nối QUIC, bao gồm cả truyền lại.
    Lưu ý rằng con số này không bao gồm dữ liệu bổ sung từ các giao thức được QUIC dùng, như UDP, hoặc bất kỳ lớp bao ngoài nào khác.
- `packetsSent`
  - : Một số nguyên dương cho biết số gói tin đã gửi trên kết nối QUIC, bao gồm cả những gói được biết là đã bị mất.
- `packetsLost`
  - : Một số nguyên dương cho biết số gói tin bị mất trên kết nối QUIC.
    Giá trị này sẽ tăng khi gói được xác định là mất, và giảm nếu sau đó chúng được nhận.
- `numOutgoingStreamsCreated`
  - : Một số nguyên dương cho biết số luồng đi ra đã được tạo trên kết nối QUIC.
- `numIncomingStreamsCreated`
  - : Một số nguyên dương cho biết số luồng đi vào đã được tạo trên kết nối QUIC.
- `bytesReceived`
  - : Một số nguyên dương cho biết tổng số byte đã nhận trên kết nối QUIC.
    Con số này bao gồm dữ liệu trùng lặp từ các luồng, nhưng không bao gồm dữ liệu bổ sung cho các giao thức được QUIC dùng, như UDP, hoặc bất kỳ lớp bao ngoài nào khác.
- `packetsReceived`
  - : Một số nguyên dương cho biết tổng số gói tin đã nhận trên kết nối QUIC, bao gồm cả các gói không thể xử lý.
- `smoothedRtt`
  - : Một {{domxref("DOMHighResTimeStamp")}} chứa [thời gian khứ hồi (RTT)](/en-US/docs/Glossary/Round_Trip_Time) đã làm mượt hiện quan sát được trên kết nối, được tính như một trung bình động có trọng số theo hàm mũ của các mẫu RTT từ đầu cuối sau khi tính đến độ trễ xác nhận.
- `rttVariation`
  - : Một {{domxref("DOMHighResTimeStamp")}} chứa độ biến thiên trung bình của các mẫu thời gian khứ hồi hiện quan sát được trên kết nối.
- `minRtt`
  - : Một {{domxref("DOMHighResTimeStamp")}} chứa thời gian khứ hồi tối thiểu quan sát được trên toàn bộ kết nối.
- `datagrams`
  - : Một object chứa thống kê cho việc truyền datagram qua kết nối.
    Object này có các thuộc tính sau:
    - `timestamp`
      - : Một {{domxref("DOMHighResTimeStamp")}} cho biết dấu thời gian tại đó thống kê được thu thập, tính từ 1/1/1970 UTC.
    - `expiredOutgoing`
      - : Một số nguyên dương cho biết số datagram bị loại khỏi hàng đợi gửi vì đã hết hạn.
        Lưu ý rằng tuổi tối đa trước khi một datagram trong hàng đợi gửi hết hạn có thể được tìm thấy trong [`outgoingMaxAge`](/en-US/docs/Web/API/WebTransportDatagramDuplexStream/outgoingMaxAge).
    - `droppedIncoming`
      - : Một số nguyên dương cho biết số datagram đến bị bỏ.
        Datagram đến bị bỏ nếu ứng dụng không đọc chúng trước khi datagram mới làm tràn hàng đợi nhận của [`readable` stream](/en-US/docs/Web/API/WebTransportDatagramDuplexStream/readable).
    - `lostOutgoing`
      - : Một số nguyên dương cho biết số datagram đã gửi bị xác định là mất.
        Lưu ý rằng một datagram có thể bị xem là mất nếu, ví dụ, không có xác nhận nào đến trong một khoảng thời gian chờ, hoặc một xác nhận cho datagram sau đó đã được nhận trước.

<!-- Note, this is not in Firefox IDL, and method not yet implemented by others in https://searchfox.org/firefox-main/commit/4e6970cd336f1b642c0be6c9b697b4db5f7b6aeb
- `estimatedSendRate`
  - : Một số nguyên dương cho biết tốc độ ước tính mà dữ liệu đang xếp hàng sẽ được user agent gửi, tính bằng bit mỗi giây.
    Tốc độ này áp dụng cho tất cả các luồng và datagram chia sẻ cùng một phiên `WebTransport`.
    Thành viên này không xuất hiện khi phiên được ghép với các phiên khác trong một kết nối dùng chung (xem [`allowPooling`](/en-US/docs/Web/API/WebTransport/WebTransport#allowpooling) trong constructor `WebTransport`), hoặc nếu user agent chưa có ước tính.
-->

## Ví dụ

Ví dụ dưới đây dùng `await` để chờ promise do `getStats()` trả về.
Khi promise được giải quyết, kết quả của thuộc tính `bytesSent` trong object thống kê được ghi ra console.

```js
const stats = await transport.getStats();
console.log(`Bytes đã gửi: ${stats.bytesSent}`);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
