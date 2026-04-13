---
title: "MIDIPort: phương thức open()"
short-title: open()
slug: Web/API/MIDIPort/open
page-type: web-api-instance-method
browser-compat: api.MIDIPort.open
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Phương thức **`open()`** của giao diện {{domxref("MIDIPort")}} làm cho thiết bị MIDI được kết nối với `MIDIPort` này trở nên khả dụng rõ ràng.

Nếu cổng được mở thành công, một {{domxref("MIDIConnectionEvent")}} mới được thêm vào hàng đợi cho các sự kiện `MIDIPort` {{domxref("MIDIPort.statechange_event", "statechange")}} và `MIDIAccess` {{domxref("MIDIAccess.statechange_event", "statechange")}}, và thuộc tính {{domxref("MIDIPort.connection")}} được thay đổi thành `"open"`.

Nếu cổng đã mở khi phương thức này được gọi, promise sẽ được giải quyết thành công.

## Cú pháp

```js-nolint
open()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết khi truy cập vào cổng được lấy thành công.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Promise bị từ chối với lỗi này nếu cổng không khả dụng và không thể mở được.

## Ví dụ

Ví dụ sau đây cho thấy một cổng đầu ra được mở.

```js
const output = midiAccess.outputs.get(portID);
output.open(); // opens the port
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
