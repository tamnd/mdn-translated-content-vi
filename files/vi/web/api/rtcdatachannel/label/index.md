---
title: "RTCDataChannel: thuộc tính nhãn"
short-title: label
slug: Web/API/RTCDataChannel/label
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.label
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc **`label`**
trả về một chuỗi chứa tên mô tả kênh dữ liệu. Những cái này
nhãn không bắt buộc phải là duy nhất.

Bạn có thể sử dụng nhãn theo ý muốn; bạn có thể sử dụng nó để xác định tất cả các kênh
đang được sử dụng cho cùng một mục đích, bằng cách đặt cho chúng cùng một tên. Hoặc bạn có thể cho
mỗi kênh một nhãn duy nhất cho mục đích theo dõi. Nó hoàn toàn phụ thuộc vào thiết kế
các quyết định được đưa ra khi xây dựng trang web hoặc ứng dụng của bạn.

Bạn có thể tìm thấy ID duy nhất trong thuộc tính {{domxref("RTCDataChannel.id", "id")}}.

> [!LƯU Ý]
> Nhãn của kênh dữ liệu được đặt khi kênh được tạo bằng cách gọi
> {{domxref("RTCPeerConnection.createDataChannel()")}}. Nó không thể thay đổi sau đó.

## Giá trị

Mã nhận dạng chuỗi do trang web hoặc ứng dụng chỉ định khi kênh dữ liệu được tạo,
như được chỉ định khi {{domxref("RTCPeerConnection.createDataChannel()")}} được gọi tới
tạo kênh.

## Ví dụ

Mẫu này tạo kênh dữ liệu trên {{domxref("RTCPeerConnection")}}, sau đó, một số
sau đó, đặt nội dung của thành phần giao diện người dùng để hiển thị tên kênh.

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel");

// …

document.getElementById("channel-name").appendChild(
  Object.assign(document.createElement("span"), {
    className: "channelName",
    textContent: dc.label,
  }),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.id")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
