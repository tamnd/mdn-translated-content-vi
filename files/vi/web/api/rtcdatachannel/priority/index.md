---
title: "RTCDataChannel: thuộc tính ưu tiên"
short-title: priority
slug: Web/API/RTCDataChannel/priority
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCDataChannel.priority
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`priority`** của giao diện {{domxref("RTCDataChannel")}} trả về một chuỗi cho biết mức độ ưu tiên của kênh dữ liệu. Mức độ ưu tiên được tác nhân người dùng chỉ định tại thời điểm tạo kênh dựa trên tùy chọn `priority` trong tham số `dataChannelDict` được truyền cho {{domxref("RTCPeerConnection.createDataChannel()")}} hoặc từ thiết bị ngang hàng từ xa cho các kênh dữ liệu đến.


## Giá trị

Một chuỗi biểu thị mức độ ưu tiên của kênh dữ liệu. Các giá trị có thể có, theo thứ tự ưu tiên từ thấp nhất đến cao nhất:

- `"very-low"`
  - : Kênh dữ liệu có mức độ ưu tiên rất thấp.
- `"low"`
  - : Kênh dữ liệu có mức độ ưu tiên thấp. Đây là giá trị mặc định.
- `"medium"`
  - : Kênh dữ liệu có mức độ ưu tiên trung bình.
- `"high"`
  - : Kênh dữ liệu có mức độ ưu tiên cao.



## Ví dụ

### Kiểm tra mức độ ưu tiên của kênh dữ liệu

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel", { priority: "high" });


console.log(dc.priority); // "high"
```


## Thông số kỹ thuật

{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}


## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
