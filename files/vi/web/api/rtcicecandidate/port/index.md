---
title: "RTCIceCandidate: thuộc tính port"
short-title: port
slug: Web/API/RTCIceCandidate/port
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.port
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`port`** của giao diện **{{domxref("RTCIceCandidate")}}** chứa số cổng
trên thiết bị tại địa chỉ được cung cấp bởi {{domxref("RTCIceCandidate.address")}} mà ngang hàng của candidate có thể đạt tới được.

Giá trị của trường `port` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `port` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng, nếu nó được định dạng đúng cách.

## Giá trị

Một số 16-bit cho biết số cổng trên thiết bị tại địa chỉ được chỉ ra bởi {{domxref("RTCIceCandidate/address", "address")}} mà ngang hàng của candidate có thể đạt tới được.

`port` được khởi tạo thành `null` nếu không được chỉ định trong
`candidate`, hoặc nếu chuỗi `candidate` không thể được phân tích đúng cách.

> [!NOTE]
> Nếu `port` là `null`, việc truyền candidate vào {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}
> sẽ thất bại, ném ra ngoại lệ `OperationError`.
> Điều này chỉ áp dụng nếu candidate thực hiện `port`.

## Ghi chú sử dụng

Hãy xem xét dòng thuộc tính {{Glossary("SDP")}} (a-line) mô tả một ICE candidate:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

Số cổng nằm ở trường thứ sáu, là `"44323"`. Trong trường hợp này, giá trị của `port` sẽ là 44323.

## Ví dụ

Đoạn mã này lấy địa chỉ IP và số cổng của candidate, lưu chúng
vào một đối tượng để sử dụng sau.

```js
const candidateLoc = {
  address: candidate.ip,
  port: candidate.port,
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
