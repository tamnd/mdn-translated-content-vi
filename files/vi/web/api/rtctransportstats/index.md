---
title: RTCTransportStats
slug: Web/API/RTCTransportStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_transport
---

{{APIRef("WebRTC")}}

Từ điển **`RTCTransportStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) cung cấp thông tin về transport ({{domxref("RTCDtlsTransport")}} và {{domxref("RTCIceTransport")}} bên dưới nó) được sử dụng bởi một cặp candidate cụ thể.

Tính năng _BUNDLE_ là một phần mở rộng SDP cho phép đàm phán để sử dụng một transport duy nhất để gửi và nhận phương tiện được mô tả bởi nhiều mô tả phương tiện SDP.
Nếu endpoint từ xa biết về tính năng này, tất cả {{domxref("MediaStreamTrack")}} và kênh dữ liệu sẽ được gom vào một transport duy nhất khi hoàn tất đàm phán.
Điều này đúng với các trình duyệt hiện tại, nhưng nếu kết nối với endpoint cũ không nhận biết BUNDLE, thì các transport riêng biệt có thể được sử dụng cho các phương tiện khác nhau.
Chính sách sử dụng trong đàm phán được cấu hình trong [hàm khởi tạo `RTCPeerConnection`](/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection).

Các thống kê này có thể được lấy bằng cách duyệt qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi bạn tìm thấy báo cáo có [`type`](/en-US/docs/Web/API/RTCTransportStats/type) là `transport`.

## Thuộc tính phiên bản

- {{domxref("RTCTransportStats.bytesReceived", "bytesReceived")}} {{optional_inline}}
  - : Tổng số byte payload đã nhận trên transport này (byte đã nhận, không bao gồm header, padding hoặc kiểm tra kết nối ICE).
- {{domxref("RTCTransportStats.bytesSent", "bytesSent")}} {{optional_inline}}
  - : Tổng số byte payload đã gửi trên transport này (byte đã gửi, không bao gồm header, padding hoặc kiểm tra kết nối ICE).
- {{domxref("RTCTransportStats.dtlsCipher", "dtlsCipher")}} {{optional_inline}}
  - : Chuỗi chỉ ra tên của cipher suite được sử dụng cho transport DTLS, chẳng hạn như `TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256`.
- {{domxref("RTCTransportStats.dtlsRole", "dtlsRole")}} {{optional_inline}} {{experimental_inline}}
  - : Chuỗi chỉ ra vai trò DTLS của {{domxref("RTCPeerConnection")}} liên quan.
    Đây là một trong các giá trị: `client`, `server`, `unknown` (trước khi đàm phán DTLS bắt đầu).
- {{domxref("RTCTransportStats.dtlsState", "dtlsState")}}
  - : Chuỗi chỉ ra {{domxref("RTCDtlsTransport.state","trạng thái")}} hiện tại của {{domxref("RTCDtlsTransport")}} bên dưới.
    Đây là một trong các giá trị: `new`, `connecting`, `connected`, `closed`, `failed`.
- {{domxref("RTCTransportStats.iceLocalUsernameFragment", "iceLocalUsernameFragment")}} {{optional_inline}} {{experimental_inline}}
  - : Chuỗi chỉ ra username fragment cục bộ xác định duy nhất phiên tương tác ICE được quản lý bởi transport này.
- {{domxref("RTCTransportStats.iceRole", "iceRole")}} {{optional_inline}} {{experimental_inline}}
  - : Chuỗi chỉ ra [`role`](/en-US/docs/Web/API/RTCIceTransport/role) ICE của {{domxref("RTCIceTransport")}} bên dưới.
    Đây là một trong các giá trị: `controlled`, `controlling`, hoặc `unknown`.
- {{domxref("RTCTransportStats.iceState", "iceState")}} {{optional_inline}} {{experimental_inline}}
  - : Chuỗi chỉ ra {{domxref("RTCIceTransport.state","trạng thái")}} hiện tại của {{domxref("RTCIceTransport")}} bên dưới.
    Đây là một trong các giá trị: `new`, `checking`, `connected`, `completed`, `disconnected`, `failed`, hoặc `closed`.
- {{domxref("RTCTransportStats.localCertificateId", "localCertificateId")}} {{optional_inline}}
  - : Chuỗi chứa id của chứng chỉ cục bộ được sử dụng bởi transport này.
    Chỉ có mặt với các transport DTLS, và sau khi DTLS đã được đàm phán.
- {{domxref("RTCTransportStats.packetsReceived", "packetsReceived")}} {{optional_inline}} {{experimental_inline}}
  - : Tổng số gói tin đã nhận trên transport này.
- {{domxref("RTCTransportStats.packetsSent", "packetsSent")}} {{optional_inline}} {{experimental_inline}}
  - : Tổng số gói tin đã gửi qua transport này.
- {{domxref("RTCTransportStats.remoteCertificateId", "remoteCertificateId")}} {{optional_inline}}
  - : Chuỗi chứa id của chứng chỉ từ xa được sử dụng bởi transport này.
    Chỉ có mặt với các transport DTLS, và sau khi DTLS đã được đàm phán.
- {{domxref("RTCTransportStats.selectedCandidatePairChanges", "selectedCandidatePairChanges")}} {{optional_inline}}
  - : Số lần cặp candidate được chọn của transport này đã thay đổi.
    Giá trị ban đầu là không và tăng lên bất cứ khi nào một cặp candidate được chọn hoặc bị mất.
- {{domxref("RTCTransportStats.selectedCandidatePairId", "selectedCandidatePairId")}} {{optional_inline}}
  - : Chuỗi chứa định danh duy nhất cho đối tượng đã được kiểm tra để tạo ra {{domxref("RTCIceCandidatePairStats")}} liên quan đến transport này.
- {{domxref("RTCTransportStats.srtpCipher", "srtpCipher")}} {{optional_inline}}
  - : Chuỗi chỉ ra tên mô tả của protection profile được sử dụng cho transport [Secure Real-time Transport Protocol (SRTP)](/en-US/docs/Glossary/RTP).
- {{domxref("RTCTransportStats.tlsVersion", "tlsVersion")}} {{optional_inline}}
  - : Chuỗi chứa phiên bản TLS đã đàm phán.
    Có mặt với các transport DTLS, và chỉ tồn tại sau khi DTLS đã được đàm phán.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây chung cho tất cả các đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCTransportStats.id", "id")}}
  - : Chuỗi xác định duy nhất đối tượng đang được giám sát để tạo ra tập hợp thống kê này.
- {{domxref("RTCTransportStats.timestamp", "timestamp")}}
  - : Đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCTransportStats.type", "type")}}
  - : Chuỗi có giá trị `"transport"`, chỉ ra loại thống kê mà đối tượng chứa.

## Ví dụ

Ví dụ này cho thấy một hàm trả về thống kê transport, hoặc `null` nếu không có thống kê nào được cung cấp.

Hàm chờ kết quả của lệnh gọi {{domxref("RTCPeerConnection.getStats()")}} rồi duyệt qua {{domxref("RTCStatsReport")}} được trả về để chỉ lấy các thống kê có kiểu `"transport"`.
Sau đó nó trả về thống kê hoặc `null`, sử dụng dữ liệu trong báo cáo.

```js
async function numberOpenConnections (peerConnection) {
  const stats = await peerConnection.getStats();
  let transportStats = null;

  stats.forEach((report) => {
    if (report.type === "transport") {
      transportStats = report;
      break;
    }
  });

return transportStats
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
