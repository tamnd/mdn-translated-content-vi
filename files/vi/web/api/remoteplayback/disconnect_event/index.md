---
title: "RemotePlayback: disconnect event"
short-title: disconnect
slug: Web/API/RemotePlayback/disconnect_event
page-type: web-api-event
browser-compat: api.RemotePlayback.disconnect_event
---

{{APIRef("Remote Playback API")}}

Sự kiện **`disconnect`** của giao diện {{domxref("RemotePlayback")}} được kích hoạt khi tác nhân người dùng ngắt kết nối khỏi thiết bị từ xa.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("disconnect", (event) => { })

ondisconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Trong ví dụ sau, giá trị của {{domxref("RemotePlayback.state")}} được in ra console khi tác nhân người dùng ngắt kết nối khỏi thiết bị từ xa.

```js
RemotePlayback.ondisconnect = () => {
  console.log(RemotePlayback.state);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
