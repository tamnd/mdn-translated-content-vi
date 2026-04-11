---
title: RTCIceCandidateStats
slug: Web/API/RTCIceCandidateStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_local-candidate
---

{{APIRef("WebRTC")}}

Từ điển **`RTCIceCandidateStats`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được dùng để báo cáo các thống kê liên quan đến một {{domxref("RTCIceCandidate")}}.

Có thể lấy các thống kê bằng cách duyệt qua {{domxref("RTCStatsReport")}} được trả về bởi {{domxref("RTCPeerConnection.getStats()")}} cho đến khi tìm thấy báo cáo có [`type`](/en-US/docs/Web/API/RTCIceCandidateStats/type) là `local-candidate`.

## Thuộc tính phiên bản

- {{domxref("RTCIceCandidateStats.address", "address")}} {{optional_inline}}
  - : Một chuỗi chứa địa chỉ của ứng viên. Giá trị này có thể là địa chỉ IPv4, địa chỉ IPv6, hoặc tên miền đầy đủ. Thuộc tính này trước đây có tên là `ip` và chỉ chấp nhận địa chỉ IP.
    Tương ứng với {{domxref("RTCIceCandidate.address")}}.
- {{domxref("RTCIceCandidateStats.candidateType", "candidateType")}}
  - : Một chuỗi khớp với một trong các giá trị trong [`RTCIceCandidate.type`](/en-US/docs/Web/API/RTCIceCandidate/type#value), cho biết loại ứng viên mà đối tượng cung cấp thống kê.
- {{domxref("RTCIceCandidateStats.deleted", "deleted")}}
  - : Một boolean cho biết liệu ứng viên đã bị xóa hoặc giải phóng hay chưa.
- {{domxref("RTCIceCandidateStats.foundation", "foundation")}} {{optional_inline}} {{experimental_inline}}
  - : Một chuỗi xác định duy nhất ứng viên trên nhiều kênh truyền tải.
    Tương ứng với {{domxref("RTCIceCandidate.foundation")}}.
- {{domxref("RTCIceCandidateStats.port", "port")}} {{optional_inline}}
  - : Số cổng mạng được sử dụng bởi ứng viên.
    Tương ứng với {{domxref("RTCIceCandidate.port")}}.
- {{domxref("RTCIceCandidateStats.priority", "priority")}} {{optional_inline}}
  - : Mức độ ưu tiên của ứng viên.
    Tương ứng với {{domxref("RTCIceCandidate.priority")}}.
- {{domxref("RTCIceCandidateStats.protocol", "protocol")}} {{optional_inline}}
  - : Một chuỗi chỉ định giao thức (`tcp` hoặc `udp`) được sử dụng để truyền dữ liệu trên `port`.
    Tương ứng với {{domxref("RTCIceCandidate.protocol")}}.
- {{domxref("RTCIceCandidateStats.relayProtocol", "relayProtocol")}}
  - : Một chuỗi chỉ định giao thức đang được sử dụng bởi ứng viên {{Glossary("ICE")}} cục bộ để giao tiếp với máy chủ {{Glossary("TURN")}}.
- {{domxref("RTCIceCandidateStats.transportId", "transportId")}}
  - : Một chuỗi xác định duy nhất đối tượng kênh truyền tải được kiểm tra để lấy {{domxref("RTCTransportStats")}} liên kết với ứng viên tương ứng với các thống kê này.
- {{domxref("RTCIceCandidateStats.url", "url")}} {{optional_inline}}
  - : Một chuỗi chỉ định URL của máy chủ {{Glossary("ICE")}} từ đó ứng viên được mô tả đã được lấy. Thuộc tính này _chỉ_ có sẵn cho ứng viên cục bộ.
- {{domxref("RTCIceCandidateStats.usernameFragment", "usernameFragment")}} {{optional_inline}} {{experimental_inline}}
  - : Một chuỗi chứa đoạn tên người dùng ICE ("ice-ufrag").
    Tương ứng với {{domxref("RTCIceCandidate.usernameFragment")}}.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây có ở tất cả các đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCIceCandidateStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được giám sát để tạo ra tập hợp thống kê này.
- {{domxref("RTCIceCandidateStats.timestamp", "timestamp")}}
  - : Một đối tượng {{domxref("DOMHighResTimeStamp")}} chỉ ra thời điểm lấy mẫu cho đối tượng thống kê này.
- {{domxref("RTCIceCandidateStats.type", "type")}}
  - : Một chuỗi có giá trị `"local-candidate"`, chỉ ra loại thống kê mà đối tượng chứa.

## Ví dụ

Với biến `myPeerConnection` là một phiên bản của {{domxref("RTCPeerConnection")}}, đoạn code dưới đây sử dụng `await` để chờ báo cáo thống kê, sau đó duyệt qua nó bằng `RTCStatsReport.forEach()`.
Nó lọc các từ điển chỉ lấy những báo cáo có type là `local-candidate` và ghi lại kết quả.

```js
const stats = await myPeerConnection.getStats();

stats.forEach((report) => {
  if (report.type === "local-candidate") {
    // Ghi lại thông tin ứng viên ICE
    console.log(report);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
