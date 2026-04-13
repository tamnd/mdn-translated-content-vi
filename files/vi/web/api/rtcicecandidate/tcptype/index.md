---
title: "RTCIceCandidate: thuộc tính tcpType"
short-title: tcpType
slug: Web/API/RTCIceCandidate/tcpType
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.tcpType
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`tcpType`** của giao diện **{{domxref("RTCIceCandidate")}}** được đưa vào trong TCP candidate để cung cấp thêm chi tiết về loại candidate.

Giá trị của trường `tcpType` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `tcpType` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng, nếu nó được định dạng đúng cách.

## Giá trị

Nếu {{domxref("RTCIceCandidate.protocol","protocol")}} là "tcp", `tcpType` có một trong các giá trị sau:

- `"active"`
  - : Truyền tải sẽ cố gắng mở một kết nối đi ra ngoài nhưng sẽ không nhận các yêu cầu kết nối đến.
- `"passive"`
  - : Truyền tải sẽ nhận các yêu cầu kết nối đến nhưng sẽ không cố gắng mở một kết nối đi ra ngoài.
- `"so"`
  - : Truyền tải sẽ cố gắng mở một kết nối đồng thời với ngang hàng của nó.

`tcpType` là `null` với {{Glossary("UDP")}} candidate.

## Ví dụ

Trong ví dụ này, {{domxref("RTCIceCandidate.protocol", "protocol")}}
và `tcpType` của candidate được dùng để điều chỉnh giao diện người dùng cho simultaneous-open TCP candidate.

```js
if (candidate.protocol === "tcp" && candidate.tcpType === "so") {
  adjustForSimultaneousOpen(candidate);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Introduction to WebRTC protocols](/en-US/docs/Web/API/WebRTC_API/Protocols)
- [WebRTC connectivity](/en-US/docs/Web/API/WebRTC_API/Connectivity)
- {{domxref("RTCIceCandidate.protocol")}}
- {{domxref("RTCIceCandidate.type")}}
