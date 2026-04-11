---
title: "RTCIceCandidate: thuộc tính relatedPort"
short-title: relatedPort
slug: Web/API/RTCIceCandidate/relatedPort
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.relatedPort
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`relatedPort`** của giao diện **{{domxref("RTCIceCandidate")}}** cho biết số cổng của reflexive hoặc relay candidate.

Nếu candidate là host candidate (tức là {{domxref("RTCIceCandidate/address", "address")}} của nó thực ra là địa chỉ IP thực của ngang hàng từ xa), `relatedPort` là `null`.

Giá trị của trường `relatedPort` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `relatedPort` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng, nếu nó được định dạng đúng cách (trường `rel-port`).

Địa chỉ liên quan ({{domxref("RTCIceCandidate.relatedAddress", "relatedAddress")}}) và cổng không được {{Glossary("ICE")}} tự sử dụng; chúng chỉ được cung cấp
cho mục đích phân tích và chẩn đoán, và việc đưa chúng vào có thể bị các hệ thống bảo mật chặn, vì vậy đừng phụ thuộc vào việc chúng có giá trị khác `null`.

## Giá trị

Một giá trị 16-bit không dấu chứa số cổng liên quan của candidate, nếu có. Với
cả peer lẫn server reflexive candidate, địa chỉ và cổng liên quan mô tả
cơ sở cho candidate đó. Với relay candidate, địa chỉ và cổng liên quan cung cấp
địa chỉ được ánh xạ do máy chủ TURN chọn.

Với host candidate, `relatedPort` là `null`, có nghĩa là trường không được đưa vào a-line của candidate.

## Ghi chú sử dụng

Địa chỉ và cổng liên quan không được ICE tự sử dụng, và chỉ có mặt cho
mục đích chẩn đoán và Quality-of-Service. Chúng thực tế có thể bị bỏ qua vì lý do bảo mật,
nhưng nếu có mặt thì có thể là công cụ hữu ích trong khi gỡ lỗi. Xem [Ví dụ](#ví-dụ) bên dưới.

Đây là dòng thuộc tính {{Glossary("SDP")}} (a-line) mô tả một ICE candidate
được máy chủ STUN phát hiện:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 6502 typ srflx raddr 198.51.100.45 rport 32768 generation 0
```

Cổng từ xa, `relatedPort`, là số ngay sau nhãn `"rport"` trên a-line, hay 32768.

## Ví dụ

Trong ví dụ này, {{domxref("RTCIceCandidate.type", "type")}} của candidate được
kiểm tra, và sau đó đầu ra gỡ lỗi được hiển thị, dựa trên loại candidate, bao gồm
loại candidate, địa chỉ (`ip` và {{domxref("RTCIceCandidate.port", "port")}}),
và địa chỉ liên quan ({{domxref("RTCIceCandidate.relatedAddress", "relatedAddress")}} và `relatedPort`).

```js
const ip = candidate.address;
const port = candidate.port;
const relIP = candidate.relatedAddress;
const relPort = candidate.relatedPort;

if (relIP && relPort) {
  console.log(
    `Candidate type '${type}' — contact address: ${ip} ${port}, related address: ${relIP} ${relPort}`,
  );
} else {
  console.log(`Host candidate address is ${ip} ${port}`);
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
- {{domxref("RTCIceCandidate.relatedAddress")}}
- {{domxref("RTCIceCandidate.address")}} và {{domxref("RTCIceCandidate.port")}}
