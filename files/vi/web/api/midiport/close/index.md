---
title: "MIDIPort: phương thức close()"
short-title: close()
slug: Web/API/MIDIPort/close
page-type: web-api-instance-method
browser-compat: api.MIDIPort.close
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Phương thức **`close()`** của giao diện {{domxref("MIDIPort")}} làm cho việc truy cập vào thiết bị MIDI được kết nối với `MIDIPort` này không khả dụng.

Nếu cổng được đóng thành công, một {{domxref("MIDIConnectionEvent")}} mới được thêm vào hàng đợi cho các sự kiện `MIDIPort` {{domxref("MIDIPort.statechange_event", "statechange")}} và `MIDIAccess` {{domxref("MIDIAccess.statechange_event", "statechange")}}, và thuộc tính {{domxref("MIDIPort.connection")}} được thay đổi thành `"closed"`.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được giải quyết khi cổng được đóng.

## Ví dụ

Ví dụ sau đây cho thấy một cổng đầu ra được đóng.

```js
let output = midiAccess.outputs.get(portID);
output.close(); // closes the port
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
