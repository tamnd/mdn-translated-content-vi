---
title: "RTCDataChannel: sự kiện kết thúc"
short-title: closing
slug: Web/API/RTCDataChannel/closing_event
page-type: web-api-event
browser-compat: api.RTCDataChannel.closing_event
---

{{APIRef("WebRTC")}}

Sự kiện **`closing`** được gửi đến {{domxref("RTCDataChannel")}} ngay trước khi kênh bắt đầu quá trình tắt truyền dữ liệu cơ bản.

Sự kiện này không thể hủy và không bong bóng.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("closing", (event) => { })

onclosing = (event) => { }
```


## Loại sự kiện


Một [[[PH3]] chung chung.

## Mô tả


Trong khi sự kiện `closing` được gửi đến kênh ngay trước khi bắt đầu đóng quá trình truyền dữ liệu của kênh thì sự kiện {{domxref("RTCDataChannel.close_event", "close")}} sẽ được gửi sau khi quá trình đóng hoàn tất.

## Ví dụ

Ví dụ này cập nhật giao diện trạng thái kết nối khi sự kiện `closing` xuất hiện.

Đầu tiên, một ví dụ sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}}:

```js
dataChannel.addEventListener("closing", (ev) => {
  myConnectionStatus.icon = closingIcon;
  myConnectionStatus.text = "Connection closing";
});
```

Bạn cũng có thể đặt trực tiếp thuộc tính xử lý sự kiện `onclosing`:

```js
pc.onclosing = (ev) => {
  myConnectionStatus.icon = closingIcon;

  myConnectionStatus.text = "Connection closing";
};
```


## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling)
