---
title: "RemotePlayback: state property"
short-title: state
slug: Web/API/RemotePlayback/state
page-type: web-api-instance-property
browser-compat: api.RemotePlayback.state
---

{{APIRef("Remote Playback API")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("RemotePlayback")}} trả về trạng thái hiện tại của kết nối `RemotePlayback`.

## Giá trị

Một trong các giá trị:

- `"connecting"`
  - : Tác nhân người dùng đang cố gắng khởi tạo phát từ xa với thiết bị đã chọn.
- `"connected"`
  - : Quá trình chuyển đổi từ phát cục bộ sang phát từ xa đã xảy ra. Tất cả các lệnh bây giờ sẽ được thực hiện trên thiết bị từ xa.
- `"disconnected"`
  - : Phát từ xa chưa được khởi tạo, đã thất bại khi khởi tạo, hoặc đã bị dừng.

## Ví dụ

Trong ví dụ sau, giá trị của `RemotePlayback.state` được in ra console khi tác nhân người dùng kết nối thành công.

```js
RemotePlayback.onconnect = () => {
  console.log(RemotePlayback.state);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
