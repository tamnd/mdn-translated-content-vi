---
title: "PannerNode: refDistance property"
short-title: refDistance
slug: Web/API/PannerNode/refDistance
page-type: web-api-instance-property
browser-compat: api.PannerNode.refDistance
---

{{ APIRef("Web Audio API") }}

Thuộc tính `refDistance` của giao diện {{ domxref("PannerNode") }} là một giá trị double biểu diễn khoảng cách tham chiếu để giảm âm lượng khi nguồn âm thanh di chuyển xa người nghe hơn - tức là khoảng cách mà tại đó sự giảm âm lượng bắt đầu có hiệu lực. Giá trị này được dùng bởi tất cả các mô hình khoảng cách.

Giá trị mặc định của thuộc tính `refDistance` là `1`.

## Giá trị

Một số không âm. Nếu giá trị được đặt nhỏ hơn 0, {{jsxref("RangeError")}} sẽ được ném ra.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu thuộc tính được gán giá trị nằm ngoài phạm vi chấp nhận.

## Ví dụ

Ví dụ này minh họa cách các giá trị `refDistance` khác nhau ảnh hưởng đến cách âm lượng của âm thanh giảm dần khi nó di chuyển xa người nghe. Không giống như {{ domxref("PannerNode.rolloffFactor", "rolloffFactor") }}, việc thay đổi giá trị này cũng _trì hoãn_ sự giảm âm lượng cho đến khi âm thanh vượt qua điểm tham chiếu.

```js
const context = new AudioContext();
// all our test tones will last this many seconds
const NOTE_LENGTH = 6;
// this is how far we'll move the sound
const Z_DISTANCE = 20;

// this function creates a graph for the test tone with a given refDistance
// and schedules it to move away from the listener along the Z (depth-wise) axis
// at the given start time, resulting in a decrease in volume (decay)
const scheduleTestTone = (refDistance, startTime) => {
  const osc = new OscillatorNode(context);

  const panner = new PannerNode(context);
  panner.refDistance = refDistance;

  // set the initial Z position, then schedule the ramp
  panner.positionZ.setValueAtTime(0, startTime);
  panner.positionZ.linearRampToValueAtTime(Z_DISTANCE, startTime + NOTE_LENGTH);

  osc.connect(panner).connect(context.destination);

  osc.start(startTime);
  osc.stop(startTime + NOTE_LENGTH);
};

// this tone should decay immediately and fairly quickly
scheduleTestTone(1, context.currentTime);
// this tone should decay slower and later than the previous one
scheduleTestTone(4, context.currentTime + NOTE_LENGTH);
// this tone should decay only slightly, and only start decaying fairly late
scheduleTestTone(7, context.currentTime + NOTE_LENGTH * 2);
```

Sau khi chạy mã này, các dạng sóng kết quả sẽ trông như thế này:

![Hình ảnh trực quan dạng sóng của ba nốt nhạc dao động được tạo ra trong Web Audio. Mỗi bộ dao động di chuyển ra xa người nghe với cùng tốc độ, nhưng với các giá trị refDistance khác nhau ảnh hưởng đến sự giảm âm lượng kết quả.](screen_shot_2018-10-11_at_23.14.32.png)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
