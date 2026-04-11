---
title: "RTCIceCandidate: thuộc tính protocol"
short-title: protocol
slug: Web/API/RTCIceCandidate/protocol
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.protocol
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`protocol`** của giao diện **{{domxref("RTCIceCandidate")}}** là một chuỗi
cho biết candidate sử dụng {{Glossary("UDP")}} hay {{Glossary("TCP")}} làm giao thức truyền tải.

Giá trị của trường `protocol` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `protocol` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng, nếu nó được định dạng đúng cách.

`protocol` là `null` theo mặc định nếu không được chỉ định đúng trong SDP, nhưng đây là điều kiện lỗi và sẽ dẫn đến ngoại lệ được ném ra khi bạn gọi {{domxref("RTCPeerConnection.addIceCandidate()")}}.

## Giá trị

Một chuỗi cho biết giao thức mạng mà candidate sử dụng:

- `tcp`
  - : Candidate, nếu được chọn, sẽ sử dụng {{Glossary("TCP")}} làm giao thức truyền tải cho dữ liệu của nó. Thuộc tính {{domxref("RTCIceCandidate.tcpType", "tcpType")}} cung cấp thêm thông tin về loại TCP candidate được đối tượng biểu diễn.
- `udp`
  - : Candidate sẽ sử dụng giao thức truyền tải {{Glossary("UDP")}} cho dữ liệu của nó. Đây là giao thức được ưu tiên cho các tương tác media vì hiệu suất tốt hơn.

> [!NOTE]
> Nếu `protocol` là `null` và `protocol` được {{Glossary("user agent")}} hỗ trợ, việc truyền
> candidate vào {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} sẽ thất bại, ném ra ngoại lệ `OperationError`.

## Ghi chú sử dụng

Đây là ví dụ về a-line candidate từ một giao dịch ICE:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

Trường thứ ba, `"udp"`, là loại giao thức, cho biết
candidate sẽ sử dụng giao thức truyền tải UDP.

## Ví dụ

Đoạn mã này kiểm tra giá trị của `protocol` để quyết định xem có nên
xem xét giá trị của {{domxref("RTCIceCandidate.tcpType", "tcpType")}} để xem đó có phải là
candidate **simultaneous-open** (**S-O**) hay không.

```js
if (candidate.protocol === "tcp") {
  if (candidate.tcpType === "so") {
    adjustForSimultaneousOpen(candidate);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
