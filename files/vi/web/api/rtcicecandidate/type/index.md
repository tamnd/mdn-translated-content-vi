---
title: "RTCIceCandidate: thuộc tính type"
short-title: type
slug: Web/API/RTCIceCandidate/type
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.type
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`type`** của giao diện **{{domxref("RTCIceCandidate")}}** xác định loại candidate mà đối tượng biểu diễn.

Giá trị của trường `type` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `type` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng (trường `cand-type`), nếu nó được định dạng đúng cách.

## Giá trị

Một chuỗi có giá trị là một trong những giá trị được định nghĩa bên dưới. Các loại candidate này được liệt kê theo thứ tự ưu tiên; loại nào đứng cao hơn trong danh sách thì hiệu quả hơn.

- `host`
  - : Candidate là host candidate, có địa chỉ IP được chỉ định trong thuộc tính {{domxref("RTCIceCandidate.address")}} thực ra là địa chỉ thực của ngang hàng từ xa.
- `srflx`
  - : Candidate là server reflexive candidate; `ip` và port
    là một binding được cấp phát bởi NAT khi agent gửi
    gói tin qua NAT đến máy chủ. Chúng có thể được máy chủ {{Glossary("STUN")}} và {{Glossary("TURN")}} biết đến để biểu diễn ngang hàng của candidate một cách ẩn danh.
- `prflx`
  - : Candidate là peer reflexive candidate; `ip` và port
    là một binding được cấp phát bởi NAT khi nó gửi yêu cầu STUN để biểu diễn ngang hàng của candidate một cách ẩn danh.
- `relay`
  - : Candidate là relay candidate, được lấy từ máy chủ {{Glossary("TURN")}}. Địa chỉ IP của relay candidate là địa chỉ mà máy chủ TURN dùng để chuyển tiếp media giữa hai ngang hàng.

Nếu `type` là `null`, thông tin đó đã bị thiếu trong
a-line của {{domxref("RTCIceCandidate.candidate", "candidate")}}, điều này sẽ khiến
{{domxref("RTCPeerConnection.addIceCandidate()")}} ném ra
ngoại lệ `OperationError`.

## Ví dụ

Trong ví dụ này, `type` của candidate được dùng để
trình bày giao diện người dùng được sửa đổi cho host candidate (những candidate mà
{{domxref("RTCIceCandidate/address", "ip")}} trỏ trực tiếp đến ngang hàng từ xa, thay vì
qua trung gian).

```js
if (candidate.type === "host") {
  showHostControls();
} else {
  hideHostControls();
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
- {{domxref("RTCIceCandidate.tcpType")}}
