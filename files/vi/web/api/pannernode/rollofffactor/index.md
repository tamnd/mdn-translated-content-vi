---
title: "PannerNode: rolloffFactor property"
short-title: rolloffFactor
slug: Web/API/PannerNode/rolloffFactor
page-type: web-api-instance-property
browser-compat: api.PannerNode.rolloffFactor
---

{{ APIRef("Web Audio API") }}

Thuộc tính `rolloffFactor` của giao diện {{ domxref("PannerNode") }} là một giá trị double mô tả tốc độ giảm âm lượng khi nguồn di chuyển xa người nghe. Giá trị này được dùng bởi tất cả các mô hình khoảng cách. Giá trị mặc định của thuộc tính `rolloffFactor` là `1`.

## Giá trị

Một số có phạm vi phụ thuộc vào {{ domxref("PannerNode.distanceModel", "distanceModel") }} của panner như sau (các giá trị âm không được phép):

- `"linear"`
  - : Phạm vi là 0 đến 1.
- `"inverse"`
  - : Phạm vi là 0 đến `Infinity`.
- `"exponential"`
  - : Phạm vi là 0 đến `Infinity`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu thuộc tính được gán giá trị nằm ngoài phạm vi chấp nhận.

## Ví dụ

Ví dụ này minh họa cách các giá trị `rolloffFactor` khác nhau ảnh hưởng đến cách âm lượng của nốt nhạc thử nghiệm giảm dần với khoảng cách tăng dần từ người nghe:

```js
const context = new AudioContext();
// all our test tones will last this many seconds
const NOTE_LENGTH = 4;
// this is how far we'll move the sound
const Z_DISTANCE = 20;

// this function creates a graph for the test tone with a given rolloffFactor
// and schedules it to move away from the listener along the Z (depth-wise) axis
// at the given start time, resulting in a decrease in volume (decay)
const scheduleTestTone = (rolloffFactor, startTime) => {
  const osc = new OscillatorNode(context);

  const panner = new PannerNode(context);
  panner.rolloffFactor = rolloffFactor;

  // set the initial Z position, then schedule the ramp
  panner.positionZ.setValueAtTime(0, startTime);
  panner.positionZ.linearRampToValueAtTime(Z_DISTANCE, startTime + NOTE_LENGTH);

  osc.connect(panner).connect(context.destination);

  osc.start(startTime);
  osc.stop(startTime + NOTE_LENGTH);
};

// this tone should decay fairly quickly
scheduleTestTone(1, context.currentTime);
// this tone should decay slower than the previous one
scheduleTestTone(0.5, context.currentTime + NOTE_LENGTH);
// this tone should decay only slightly
scheduleTestTone(0.1, context.currentTime + NOTE_LENGTH * 2);
```

Sau khi chạy mã này, các dạng sóng kết quả sẽ trông như thế này:

![Hình ảnh trực quan dạng sóng của ba nốt nhạc dao động được tạo ra trong Web Audio. Mỗi bộ dao động di chuyển ra xa người nghe với cùng tốc độ, nhưng với các giá trị rolloffFactor khác nhau ảnh hưởng đến sự giảm âm lượng kết quả.](screen_shot_2018-10-11_at_23.22.37.png)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
