---
title: "RTCIceCandidate: thuộc tính sdpMLineIndex"
short-title: sdpMLineIndex
slug: Web/API/RTCIceCandidate/sdpMLineIndex
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.sdpMLineIndex
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sdpMLineIndex`** trên giao diện {{domxref("RTCIceCandidate")}}
là chỉ số bắt đầu từ 0 của m-line mô tả media được gắn với candidate.

Thuộc tính này có thể được cấu hình bằng cách chỉ định giá trị của thuộc tính `sdpMLineIndex` trong đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Nếu bạn gọi hàm khởi tạo với chuỗi m-line thay vì đối tượng tùy chọn, giá trị của `sdpMLineIndex` được trích xuất từ chuỗi m-line candidate được chỉ định.

## Giá trị

Một số chứa chỉ số bắt đầu từ 0 vào tập hợp các m-line cung cấp mô tả media,
cho biết nguồn media nào được gắn với candidate, hoặc `null` nếu không có liên kết như vậy.

> [!NOTE]
> Khi cố gắng thêm một candidate (sử dụng
> {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}) có
> giá trị `null` cho `sdpMid` hoặc
> `sdpMLineIndex` sẽ ném ra ngoại lệ {{jsxref("TypeError")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
