---
title: "RemotePlayback: connecting event"
short-title: connecting
slug: Web/API/RemotePlayback/connecting_event
page-type: web-api-event
browser-compat: api.RemotePlayback.connecting_event
---

{{APIRef("Remote Playback API")}}

Sự kiện **`connecting`** của giao diện {{domxref("RemotePlayback")}} được kích hoạt khi tác nhân người dùng khởi tạo phát từ xa.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("connecting", (event) => { })

onconnecting = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Trong ví dụ sau, giá trị của {{domxref("RemotePlayback.state")}} được in ra console khi tác nhân người dùng bắt đầu kết nối.

```js
RemotePlayback.onconnecting = () => {
  console.log(RemotePlayback.state);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
