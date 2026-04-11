---
title: "RTCIceCandidate: thuộc tính sdpMid"
short-title: sdpMid
slug: Web/API/RTCIceCandidate/sdpMid
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.sdpMid
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sdpMid`** trên giao diện {{domxref("RTCIceCandidate")}} trả về một chuỗi
xác định thẻ định danh media stream của thành phần media mà candidate được gắn với.
ID này xác định duy nhất một stream cụ thể cho thành phần mà candidate được gắn với.

Thuộc tính này có thể được cấu hình bằng cách chỉ định giá trị của thuộc tính `sdpMid` trong đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate","RTCIceCandidate()")}}.
Nếu bạn gọi hàm khởi tạo với chuỗi m-line thay vì đối tượng tùy chọn, giá trị của `sdpMid` được trích xuất từ chuỗi m-line candidate được chỉ định.

## Giá trị

Một chuỗi xác định duy nhất thành phần media nguồn mà
candidate lấy dữ liệu từ đó, hoặc `null` nếu không có liên kết như vậy với candidate.

> [!NOTE]
> Khi cố gắng thêm một candidate (sử dụng {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}) có
> giá trị `null` cho cả `sdpMid` và `sdpMLineIndex` sẽ ném ra ngoại lệ {{jsxref("TypeError")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
