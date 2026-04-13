---
title: "MIDIOutput: phương thức send()"
short-title: send()
slug: Web/API/MIDIOutput/send
page-type: web-api-instance-method
browser-compat: api.MIDIOutput.send
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Phương thức **`send()`** của giao diện {{domxref("MIDIOutput")}} xếp hàng các tin nhắn cho cổng MIDI tương ứng. Tin nhắn có thể được gửi ngay lập tức hoặc với dấu thời gian tùy chọn để trì hoãn việc gửi.

## Cú pháp

```js-nolint
send(data)
send(data, timestamp)
```

### Tham số

- `data`
  - : Một chuỗi gồm một hoặc nhiều [tin nhắn MIDI hợp lệ](https://midi.org/about-midi-part-3midi-messages). Mỗi mục đại diện cho một byte dữ liệu.
- `timestamp` {{optional_inline}}
  - : Một {{domxref("DOMHighResTimestamp")}} với thời gian tính bằng mili giây khi tin nhắn nên được gửi (tương đối so với {{domxref("Performance.timeOrigin")}}).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `data` không phải là chuỗi hợp lệ hoặc không chứa tin nhắn MIDI hợp lệ.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `data` là tin nhắn hệ thống độc quyền và {{domxref("MIDIAccess")}} không bật quyền truy cập độc quyền.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu cổng bị ngắt kết nối.

## Ví dụ

Trong ví dụ sau, một nốt C giữa được gửi ngay lập tức, tiếp theo là tin nhắn tắt nốt sau một giây.

```js
function sendMiddleC(midiAccess, portID) {
  const noteOnMessage = [0x90, 60, 0x7f]; // Note on middle C, full velocity
  const output = midiAccess.outputs.get(portID);
  output.send(noteOnMessage); // Omitting the timestamp means send immediately.
  output.send([0x80, 60, 0x40], window.performance.now() + 1000.0); // timestamp = now + 1000ms.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
