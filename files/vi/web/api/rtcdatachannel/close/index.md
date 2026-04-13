---
title: "RTCDataChannel: phương thức close()"
short-title: close()
slug: Web/API/RTCDataChannel/close
page-type: web-api-instance-method
browser-compat: api.RTCDataChannel.close
---

{{APIRef("WebRTC")}}

Phương thức **`RTCDataChannel.close()`** đóng
{{domxref("RTCDataChannel")}}. Một trong hai máy ngang hàng được phép gọi phương thức này để bắt đầu
đóng kênh.

Việc đóng kênh dữ liệu không phải là ngay lập tức. Hầu hết quá trình đóng
kết nối được xử lý không đồng bộ; bạn có thể phát hiện khi kênh đã kết thúc
kết thúc bằng cách theo dõi sự kiện {{DOMxRef("RTCDataChannel.close_event", "close")}} trên kênh dữ liệu.

Chuỗi các sự kiện xảy ra để đáp ứng với phương thức này được gọi là:

1. {{domxref("RTCDataChannel.readyState")}} được đặt thành `closing`.
2. Một tác vụ nền được thiết lập để xử lý phần còn lại của các bước bên dưới và
   `close()` trả về cho người gọi.
3. Lớp vận chuyển xử lý mọi thông báo được lưu vào bộ đệm; lớp giao thức quyết định
   nên gửi chúng hay loại bỏ chúng.
4. Quá trình vận chuyển dữ liệu cơ bản đã bị đóng.
5. Thuộc tính {{domxref("RTCDataChannel.readyState")}} được đặt thành
   `closed`.
6. Nếu quá trình vận chuyển bị đóng do lỗi,
   `RTCDataChannel` được gửi
   một sự kiện {{DOMxRef("RTCDataChannel.error_event", "error")}}
   với {{DOMxRef("DOMException.name", "name")}} được đặt thành `NetworkError`.
7. Một sự kiện {{domxref("RTCDataChannel.close_event", "close")}} được gửi tới kênh.

## Cú pháp

```js-nolint
close()
```

### Thông số

Không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel");

dc.onmessage = (event) => {
  console.log(`received: ${event.data}`);
  dc.close(); // We decided to close after the first received message
};

dc.onopen = () => {
  console.log("datachannel open");
};

dc.onclose = () => {
  console.log("datachannel close");
};

// Now negotiate the connection and so forth…
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.readyState")}}
- sự kiện {{DOMxRef("RTCDataChannel.close_event", "close")}}
