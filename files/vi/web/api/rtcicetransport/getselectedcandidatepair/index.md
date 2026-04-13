---
title: "RTCIceTransport: phương thức getSelectedCandidatePair()"
short-title: getSelectedCandidatePair()
slug: Web/API/RTCIceTransport/getSelectedCandidatePair
page-type: web-api-instance-method
browser-compat: api.RTCIceTransport.getSelectedCandidatePair
---

{{APIRef("WebRTC")}}

Phương thức **`getSelectedCandidatePair()`** của giao diện {{domxref("RTCIceTransport")}} trả về một đối tượng {{domxref("RTCIceCandidatePair")}} chứa cặp ứng cử viên {{Glossary("ICE")}} lựa chọn tốt nhất hiện tại, mô tả cấu hình của các điểm cuối của truyền tải.

## Cú pháp

```js-nolint
getSelectedCandidatePair()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("RTCIceCandidatePair")}} mô tả cấu hình của hai điểm cuối của cặp ứng cử viên hiện đang được chọn.
{{domxref("RTCIceCandidatePair.local", "local")}} mô tả cấu hình của đầu cục bộ của kết nối, trong khi {{domxref("RTCIceCandidatePair.remote", "remote")}} mô tả cấu hình của đối tác từ xa.

Giá trị trả về là `null` nếu chưa có cặp ứng cử viên nào được chọn.

## Ghi chú sử dụng

Khi tác nhân ICE thực hiện thương lượng của một {{domxref("RTCPeerConnection")}}, nó thu thập và phân tích các cấu hình ứng cử viên từ mỗi hai đối tác.
Ngay khi tìm thấy một cặp ứng cử viên phù hợp có thể chấp nhận được, đáp ứng các yêu cầu cho kết nối, sự kiện {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "selectedcandidatepairchange")}} được kích hoạt trên {{domxref("RTCIceTransport")}}.
Từ thời điểm đó trở đi, cặp ứng cử viên phù hợp tốt nhất sẽ luôn có sẵn bằng cách gọi `getSelectedCandidatePair()`.

Khi thương lượng ICE tiếp tục, bất kỳ khi nào tìm thấy một cặp ứng cử viên tốt hơn cặp hiện đang được chọn, cặp mới được chọn, thay thế cặp trước đó, và sự kiện `selectedcandidatepairchange` được kích hoạt lại.

> [!NOTE]
> Có thể một trong các cấu hình trong cặp ứng cử viên đã chọn vẫn không thay đổi khi một cặp mới được chọn.

## Ví dụ

Xem [`RTCIceTransport.onselectedcandidatepairchange`](/en-US/docs/Web/API/RTCIceTransport/selectedcandidatepairchange_event#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
