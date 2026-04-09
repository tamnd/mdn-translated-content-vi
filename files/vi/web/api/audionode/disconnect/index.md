---
title: "AudioNode: phương thức disconnect()"
short-title: disconnect()
slug: Web/API/AudioNode/disconnect
page-type: web-api-instance-method
browser-compat: api.AudioNode.disconnect
---

{{ APIRef("Web Audio API") }}

Phương thức **`disconnect()`** của giao diện {{ domxref("AudioNode") }} cho phép bạn ngắt kết nối một hoặc nhiều nút khỏi nút mà phương thức được gọi trên đó.

## Cú pháp

```js-nolint
disconnect()
disconnect(output)
disconnect(destination)
disconnect(destination, output)
disconnect(destination, output, input)
```

### Tham số

Có nhiều phiên bản của phương thức `disconnect()`, chấp nhận các tổ hợp tham số khác nhau để kiểm soát những nút nào sẽ bị ngắt kết nối. Nếu không có tham số nào được cung cấp, mọi kết nối đầu ra sẽ bị ngắt.

- `destination` {{optional_inline}}
  - : Một {{domxref("AudioNode")}} hoặc {{domxref("AudioParam")}} chỉ định nút hoặc các nút sẽ bị ngắt kết nối. Nếu giá trị này là một `AudioNode`, một nút duy nhất sẽ bị ngắt kết nối, với các tham số tùy chọn khác (`output` và/hoặc `input`) tiếp tục giới hạn đầu vào và/hoặc đầu ra nào cần ngắt. Nếu giá trị này là một `AudioParam`, thì kết nối tới `AudioParam` đó sẽ bị chấm dứt, và đóng góp của nút vào tham số tính toán đó sẽ trở thành 0 kể từ khi thay đổi có hiệu lực.
- `output` {{optional_inline}}
  - : Chỉ mục mô tả đầu ra nào từ `AudioNode` hiện tại sẽ bị ngắt kết nối. Các số chỉ mục được xác định theo số lượng kênh đầu ra (xem [Kênh âm thanh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_channels)).
- `input` {{optional_inline}}
  - : Chỉ mục mô tả đầu vào nào của `AudioNode` đích được chỉ định sẽ bị ngắt kết nối. Các số chỉ mục được xác định theo số lượng kênh đầu vào (xem [Kênh âm thanh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_channels)). Không áp dụng nếu `destination` là một `AudioParam`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị chỉ định cho `input` hoặc `output` là không hợp lệ, tham chiếu tới một nút không tồn tại hoặc nằm ngoài phạm vi cho phép.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu nút mà `disconnect()` được gọi trên đó không được kết nối tới nút `destination` được chỉ định.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode);
gainNode.connect(audioCtx.destination);

gainNode.disconnect();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
