---
title: "RTCIceCandidate: thuộc tính relatedAddress"
short-title: relatedAddress
slug: Web/API/RTCIceCandidate/relatedAddress
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.relatedAddress
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`relatedAddress`** của giao diện **{{domxref("RTCIceCandidate")}}** là một chuỗi chỉ ra **địa chỉ liên quan** của relay hoặc reflexive candidate.

Nếu candidate là host candidate (tức là {{domxref("RTCIceCandidate/address", "address")}} của nó thực ra là địa chỉ IP thực của ngang hàng từ xa), `relatedAddress` là `null`.

Giá trị của trường `relatedAddress` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `relatedAddress` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng nếu nó được định dạng đúng cách (trường `rel-address`).

Địa chỉ liên quan và cổng ({{domxref("RTCIceCandidate.relatedPort", "relatedPort")}}) không được {{Glossary("ICE")}} tự sử dụng; chúng chỉ được cung cấp cho mục đích phân tích và chẩn đoán, và việc đưa chúng vào có thể bị các hệ thống bảo mật chặn, vì vậy đừng phụ thuộc vào việc chúng có giá trị khác `null`.

## Giá trị

Một chuỗi chứa địa chỉ liên quan của candidate.
Với cả peer lẫn server reflexive candidate, địa chỉ liên quan (và cổng liên quan) là cơ sở cho server hoặc peer reflexive candidate đó.
Với relay candidate, địa chỉ và cổng liên quan được đặt thành địa chỉ được ánh xạ do máy chủ TURN chọn.

Với host candidate, `relatedAddress` là `null`, có nghĩa là trường không được đưa vào a-line của candidate.

## Ghi chú sử dụng

Địa chỉ liên quan được đưa vào ICE candidate mặc dù ICE tự nó không sử dụng.
`relatedAddress` có thể được dùng cho mục đích chẩn đoán; bằng cách quan sát mối quan hệ giữa các loại candidate khác nhau và địa chỉ, địa chỉ liên quan của chúng.
`relatedAddress` cũng có thể được dùng bởi các cơ chế Quality-of-Service (QoS).

Đây là dòng thuộc tính [SDP](/en-US/docs/Web/API/WebRTC_API/Protocols#sdp) (a-line) mô tả một ICE candidate được máy chủ STUN phát hiện:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 6502 typ srflx raddr 198.51.100.45 rport 32768 generation 0
```

Địa chỉ từ xa, `relatedAddress`, là bộ tứ chấm (cho IPv4) hoặc địa chỉ 64-bit phân cách bằng dấu hai chấm (cho IPv6) ngay sau văn bản `"raddr"`, hay `"198.51.100.45"`.

## Ví dụ

Trong ví dụ này, {{domxref("RTCIceCandidate.type", "type")}} của candidate được kiểm tra, và sau đó đầu ra gỡ lỗi được hiển thị, dựa trên loại candidate, bao gồm {{domxref("RTCIceCandidate/address", "ip")}} và `relatedAddress` của candidate.

```js
switch (candidate.type) {
  case "host":
    console.log(`Host candidate's IP address is ${candidate.address}`);
    break;
  case "srflx":
    console.log(
      `Server reflexive candidate's base address is ${candidate.relatedAddress}; reachable at ${candidate.address}`,
    );
    break;
  case "prflx":
    console.log(
      `Peer reflexive candidate's base address is ${candidate.relatedAddress}; reachable at ${candidate.address}`,
    );
    break;
  case "relay":
    console.log(
      `Relay candidate's address assigned by the TURN server is ${candidate.relatedAddress}; reachable at ${candidate.address}`,
    );
    break;
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
- [Lifetime of a WebRTC session](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
- {{domxref("RTCIceCandidate.relatedPort")}}
- {{domxref("RTCIceCandidate.address")}} và {{domxref("RTCIceCandidate.port")}}
