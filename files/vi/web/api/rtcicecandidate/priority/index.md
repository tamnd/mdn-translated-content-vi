---
title: "RTCIceCandidate: thuộc tính priority"
short-title: priority
slug: Web/API/RTCIceCandidate/priority
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.priority
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`priority`** của giao diện **{{domxref("RTCIceCandidate")}}** xác định độ ưu tiên của candidate theo ngang hàng từ xa; giá trị này càng cao, ngang hàng từ xa càng coi candidate là tốt hơn.

Giá trị của trường `priority` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `priority` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng, nếu nó được định dạng đúng cách.

## Giá trị

Một giá trị số nguyên dài không dấu cho biết độ ưu tiên của candidate theo ngang hàng từ xa.
Giá trị này càng lớn, ngang hàng từ xa càng coi candidate này là đáng ưu tiên hơn.

`priority` được khởi tạo thành `null` nếu không được chỉ định trong `candidate`, hoặc nếu chuỗi `candidate` không thể được phân tích đúng cách.

> [!NOTE]
> Nếu `priority` là `null`, việc truyền
> candidate vào {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}
> sẽ thất bại, ném ra ngoại lệ `OperationError`. Điều này chỉ áp dụng nếu
> candidate thực hiện thuộc tính `priority`.

## Ghi chú sử dụng

Hãy xem xét dòng thuộc tính {{Glossary("SDP")}} (a-line) mô tả một ICE candidate:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

Độ ưu tiên là số sau giao thức, vì vậy nó là trường thứ tư trong chuỗi candidate.
Trong ví dụ này, độ ưu tiên là 2043278322.

## Ví dụ

Ví dụ này kiểm tra `priority` của candidate và nếu nó lớn hơn độ ưu tiên của candidate đã thấy trước đó, ghi nhớ candidate để sử dụng sau.

```js
let bestCandidate = {
  candidate: "",
  sdpMid: null,
  sdpMLineIndex: null,
  priority: 0,
};

function handleCandidate(candidateString) {
  const candidate = new RTCIceCandidate(candidateString);

  if (candidate.priority > bestCandidate.priority) {
    bestCandidate = candidate;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
