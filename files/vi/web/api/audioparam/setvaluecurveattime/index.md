---
title: "AudioParam: phương thức setValueCurveAtTime()"
short-title: setValueCurveAtTime()
slug: Web/API/AudioParam/setValueCurveAtTime
page-type: web-api-instance-method
browser-compat: api.AudioParam.setValueCurveAtTime
---

{{APIRef("Web Audio API")}}

Phương thức **`setValueCurveAtTime()`** của giao diện {{domxref("AudioParam")}} lên lịch để giá trị của tham số thay đổi theo một đường cong được định nghĩa bằng một danh sách các giá trị.

Đường cong là nội suy tuyến tính giữa chuỗi giá trị được định nghĩa trong một mảng các giá trị dấu chấm động, được co giãn để khớp vào khoảng đã cho bắt đầu tại `startTime` và kéo dài trong một thời lượng xác định.

## Cú pháp

```js-nolint
setValueCurveAtTime(values, startTime, duration)
```

### Tham số

- `values`
  - : Một mảng số dấu chấm động biểu diễn đường cong giá trị mà {{domxref("AudioParam")}} sẽ đi qua trong `duration` đã chỉ định. Mọi giá trị trong mảng phải là số hữu hạn; nếu có bất kỳ giá trị nào là `NaN`, `Infinity` hoặc `-Infinity`, ngoại lệ {{jsxref("TypeError")}} sẽ được ném ra.
- `startTime`
  - : Một số thực kép biểu diễn thời điểm (tính bằng giây) kể từ sau khi {{ domxref("AudioContext") }} được tạo lần đầu mà việc thay đổi giá trị sẽ xảy ra. Nếu giá trị này nhỏ hơn {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}, nó sẽ bị chặn về `currentTime`.
- `duration`
  - : Một số thực kép biểu diễn tổng thời gian (tính bằng giây) mà trong đó `value` của tham số sẽ thay đổi theo đường cong đã chỉ định. Các giá trị đã chỉ định được phân bố đều trên toàn bộ thời lượng này.

### Giá trị trả về

Tham chiếu đến đối tượng `AudioParam` này. Một số cách triển khai trình duyệt cũ hơn của giao diện này trả về `undefined`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu mảng `values` được chỉ định có ít hơn 2 phần tử.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `startTime` được chỉ định là số âm hoặc là giá trị không hữu hạn, hoặc `duration` không phải là số hữu hạn dương.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu một hoặc nhiều giá trị trong mảng `values` là không hữu hạn. Các giá trị không hữu hạn gồm `NaN`, `Infinity` và `-Infinity`.

## Ghi chú sử dụng

Khi giá trị của tham số hoàn tất việc đi theo đường cong, giá trị của nó được đảm bảo sẽ khớp với giá trị cuối cùng trong tập giá trị được chỉ định bởi tham số `values`.

> [!NOTE]
> Một số cách triển khai ban đầu của Web Audio API không đảm bảo điều này, dẫn đến kết quả ngoài mong đợi.

## Ví dụ

Trong ví dụ này, chúng ta có một nguồn phương tiện với một nút duy nhất (xem [repo webaudio-examples](https://github.com/mdn/webaudio-examples/blob/main/audio-param/index.html) để xem mã nguồn, hoặc [xem ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/audio-param/).) Khi nhấn nút này, `setValueCurveAtTime()` được dùng để thay đổi giá trị gain giữa các giá trị chứa trong mảng `waveArray`:

```js
// create audio context
const audioCtx = new AudioContext();

// set basic variables for example
const myAudio = document.querySelector("audio");

const valueCurve = document.querySelector(".value-curve");

// Create a MediaElementAudioSourceNode
// Feed the HTMLMediaElement into it
const source = audioCtx.createMediaElementSource(myAudio);

// Create a gain node and set its gain value to 0.5
const gainNode = audioCtx.createGain();
gainNode.gain.value = 0.5;
const currGain = gainNode.gain.value;

// connect the AudioBufferSourceNode to the gainNode
// and the gainNode to the destination
source.connect(gainNode);
gainNode.connect(audioCtx.destination);

// set button to do something onclick

const waveArray = new Float32Array(9);
waveArray[0] = 0.5;
waveArray[1] = 1;
waveArray[2] = 0.5;
waveArray[3] = 0;
waveArray[4] = 0.5;
waveArray[5] = 1;
waveArray[6] = 0.5;
waveArray[7] = 0;
waveArray[8] = 0.5;

valueCurve.onclick = () => {
  gainNode.gain.setValueCurveAtTime(waveArray, audioCtx.currentTime, 2);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

Các phiên bản trước Chrome 46 dùng nearest neighbor thay vì nội suy tuyến tính.

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
