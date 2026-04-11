---
title: "RTCIceCandidate: thuộc tính foundation"
short-title: foundation
slug: Web/API/RTCIceCandidate/foundation
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.foundation
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`foundation`** của giao diện {{domxref("RTCIceCandidate")}} là một chuỗi cho phép tương quan các candidate từ một đường mạng chung trên nhiều đối tượng {{domxref("RTCIceTransport")}}.

Các candidate dùng chung `foundation` nếu chúng:

- có cùng loại: "host", "relayed", "server reflexive" hoặc "peer reflexive".
- có "bases" dùng chung địa chỉ IP và truyền tải, nhưng không nhất thiết cùng cổng.
  Lưu ý rằng địa chỉ IP là địa chỉ của giao diện mạng mà ICE agent đã gửi candidate từ đó.
- Chúng đến từ máy chủ {{Glossary("STUN")}} hoặc TURN có cùng địa chỉ IP.

Thuộc tính này giúp tối ưu hóa hiệu năng ICE khi ưu tiên và tương quan các candidate xuất hiện trên nhiều đối tượng {{domxref("RTCIceTransport")}}.

## Giá trị

Một chuỗi xác định duy nhất candidate trên tất cả các `RTCIceTransport` mà nó có sẵn.

> [!NOTE]
> Nếu `port` là `null` và `port` được {{Glossary("user agent")}} hỗ trợ, việc truyền candidate vào {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} sẽ thất bại, ném ra ngoại lệ `OperationError`.

## Ghi chú sử dụng

Hãy xem xét dòng thuộc tính {{Glossary("SDP")}} (a-line) mô tả một ICE candidate:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

Trường `"4234997325"` là foundation.

## Ví dụ

Đoạn mã này dùng `foundation` của hai candidate để xác định xem chúng có thực sự là cùng một candidate không.

```js
if (candidate1.foundation === candidate2.foundation) {
  /* the two candidates are the same, even if they're on
     different transports */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
