---
title: "AudioParam: thuộc tính value"
short-title: value
slug: Web/API/AudioParam/value
page-type: web-api-instance-property
browser-compat: api.AudioParam.value
---

{{APIRef("Web Audio API")}}

Thuộc tính **`value`** của giao diện {{domxref("AudioParam")}} lấy hoặc đặt giá trị của `AudioParam` này tại thời điểm hiện tại. Ban đầu, giá trị được đặt thành {{domxref("AudioParam.defaultValue")}}.

Việc đặt `value` có cùng hiệu ứng với việc gọi {{domxref("AudioParam.setValueAtTime")}} cùng với thời điểm được trả về bởi thuộc tính {{domxref("BaseAudioContext/currentTime", "currentTime")}} của `AudioContext`.

## Giá trị

Một {{jsxref("Number")}} dấu chấm động biểu diễn giá trị của tham số tại thời điểm hiện tại. Giá trị này sẽ nằm giữa các giá trị được chỉ định bởi thuộc tính {{domxref("AudioParam.minValue", "minValue")}} và {{domxref("AudioParam.maxValue", "maxValue")}}.

## Mô tả

### Độ chính xác và biến thiên của giá trị

Kiểu dữ liệu được dùng nội bộ để lưu `value` là số dấu chấm động đơn chính xác (32 bit), trong khi JavaScript dùng số dấu chấm động kép chính xác (64 bit). Do đó, giá trị bạn đọc từ thuộc tính `value` có thể không phải lúc nào cũng đúng bằng giá trị bạn đã đặt cho nó.

Hãy xem ví dụ sau:

```js
const source = new AudioBufferSourceNode(/* … */);
const rate = 5.3;
source.playbackRate.value = rate;
console.log(source.playbackRate.value === rate);
```

Kết quả ghi log sẽ là `false`, vì tham số tốc độ phát `rate` đã được chuyển thành số dấu chấm động 32 bit gần nhất với 5.3, cho ra 5.300000190734863. Một cách giải quyết là dùng phương thức {{jsxref("Math.fround()")}}, phương thức này trả về giá trị đơn chính xác tương đương với giá trị JavaScript 64 bit được chỉ định, khi đặt `value`, như sau:

```js
const source = new AudioBufferSourceNode(/* … */);
const rate = Math.fround(5.3);
source.playbackRate.value = rate;
console.log(source.playbackRate.value === rate);
```

Trong trường hợp này, kết quả ghi log sẽ là `true`.

### Giá trị của một thuộc tính thay đổi theo thời gian

`value` của một `AudioParam` có thể là cố định hoặc có thể thay đổi theo thời gian. Điều này được phản ánh qua getter `value`, vốn trả về giá trị của tham số tại **render quantum** gần nhất của bộ máy dựng âm thanh, hay thời điểm mà các bộ đệm âm thanh được xử lý và cập nhật. Ngoài việc xử lý các bộ đệm âm thanh, mỗi render quantum còn cập nhật `value` của từng `AudioParam` khi cần dựa trên thời điểm hiện tại và mọi thay đổi giá trị tham số theo thời gian đã được thiết lập.

Khi tham số mới được tạo, giá trị của nó được đặt thành giá trị mặc định do {{domxref("AudioParam.defaultValue")}} cung cấp. Đây là giá trị của tham số tại thời điểm 0.0 giây và sẽ vẫn là giá trị của tham số cho đến render quantum đầu tiên mà trong đó giá trị bị thay đổi.

Trong mỗi render quantum, trình duyệt thực hiện những việc sau liên quan đến việc quản lý giá trị của một tham số:

- Nếu setter `value` đã được dùng, giá trị của tham số được đổi thành giá trị đã cho.
- Nếu thời điểm hiện tại bằng hoặc vượt quá thời điểm được chỉ định bởi lời gọi trước đó tới {{domxref("AudioParam.setValueAtTime", "setValueAtTime()")}}, `value` sẽ được đổi thành giá trị được truyền vào `setValueAtTime()`.
- Nếu bất kỳ phương thức thay đổi giá trị dạng chuyển tiếp hoặc đường dốc nào đã được gọi và thời điểm hiện tại nằm trong khoảng thời gian mà thay đổi chuyển tiếp đó phải diễn ra, giá trị sẽ được cập nhật theo thuật toán phù hợp.
  Các phương thức thay đổi giá trị dạng chuyển tiếp hoặc đường dốc này bao gồm {{domxref("AudioParam.linearRampToValueAtTime", "linearRampToValueAtTime()")}}, {{domxref("AudioParam.setTargetAtTime", "setTargetAtTime()")}} và {{domxref("AudioParam.setValueCurveAtTime", "setValueCurveAtTime()")}}.

Do đó, `value` của một tham số được duy trì để phản ánh chính xác trạng thái của tham số theo thời gian.

## Ví dụ

Ví dụ này thay đổi ngay lập tức âm lượng của một {{domxref("GainNode")}} xuống 40%.

```js
const audioCtx = new AudioContext();
const gainNode = audioCtx.createGain();
gainNode.gain.value = 0.4;
// which is identical to:
gainNode.gain.setValueAtTime(0.4, audioCtx.currentTime);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
