---
title: "RemotePlayback: connect event"
short-title: connect
slug: Web/API/RemotePlayback/connect_event
page-type: web-api-event
browser-compat: api.RemotePlayback.connect_event
---

{{APIRef("Remote Playback API")}}

Sự kiện **`connect`** của giao diện {{domxref("RemotePlayback")}} được kích hoạt khi tác nhân người dùng kết nối với thiết bị từ xa.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("connect", (event) => { })

onconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Trong ví dụ sau, giá trị của {{domxref("RemotePlayback.state")}} được in ra console khi tác nhân người dùng kết nối thành công.

```js
RemotePlayback.onconnect = () => {
  console.log(RemotePlayback.state);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
