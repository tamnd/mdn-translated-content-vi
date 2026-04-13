---
title: "RTCDataChannel: thuộc tính id"
short-title: id
slug: Web/API/RTCDataChannel/id
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.id
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`id`** trả về số ID (từ 0 đến 65.534)
xác định duy nhất {{domxref("RTCDataChannel")}}. ID này được đặt ở
thời điểm kênh dữ liệu được tạo bởi tác nhân người dùng (nếu
{{domxref("RTCDataChannel.negotiated")}} là `false`) hoặc theo trang web hoặc ứng dụng
tập lệnh (nếu `negotiated` là `true`).

Do đó, mỗi {{domxref("RTCPeerConnection")}} có thể có mức tối đa theo lý thuyết là
65.534 kênh dữ liệu trên đó, mặc dù mức tối đa thực tế có thể khác nhau tùy theo trình duyệt
browser.

## Giá trị

Giá trị `unsigned short` (nghĩa là số nguyên nằm trong khoảng từ 0 đến 65,535)
xác định duy nhất kênh dữ liệu.

Mặc dù thuộc tính {{domxref("RTCDataChannel.label", "label")}} không nhất thiết phải
duy nhất, số ID này được đảm bảo là duy nhất trong số tất cả các kênh dữ liệu. Ngoài ra,
việc triển khai WebRTC đã biết sử dụng cùng một ID trên cả hai thiết bị ngang hàng. Một ID duy nhất làm cho nó
mã của bạn dễ dàng thực hiện tín hiệu liên quan đến kênh dữ liệu ngoài băng tần hơn.

Điều này cũng có thể hữu ích cho mục đích ghi nhật ký và gỡ lỗi.

## Ví dụ

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel");

console.log(`Channel id: ${dc.id}`);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
