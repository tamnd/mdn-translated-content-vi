---
title: "AudioData: hàm tạo AudioData()"
short-title: AudioData()
slug: Web/API/AudioData/AudioData
page-type: web-api-constructor
browser-compat: api.AudioData.AudioData
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm tạo **`AudioData()`** tạo một đối tượng {{domxref("AudioData")}} mới biểu diễn một mẫu âm thanh riêng lẻ.

## Cú pháp

```js-nolint
new AudioData(init)
```

### Tham số

- `init`
  - : Một đối tượng chứa các thành phần sau:
    - `format`
      - : Một trong các giá trị sau:
        - "u8"
        - "s16"
        - "s32"
        - "f32"
        - "u8-planar"
        - "s16-planar"
        - "s32-planar"
        - "f32-planar"
    - `sampleRate`
      - : Một giá trị thập phân chứa tốc độ lấy mẫu theo Hz.
    - `numberOfFrames`
      - : Một số nguyên chứa số frame trong mẫu này.
    - `numberOfChannels`
      - : Một số nguyên chứa số kênh trong mẫu này.
    - `timestamp`
      - : Một số nguyên cho biết thời gian của dữ liệu tính bằng micro giây.
    - `data`
      - : Một mảng định kiểu chứa dữ liệu âm thanh của mẫu này.
    - `transfer`
      - : Một mảng {{jsxref("ArrayBuffer")}} mà `AudioData` sẽ tách rời và giành quyền sở hữu. Nếu mảng này chứa {{jsxref("ArrayBuffer")}} làm nền cho `data`, `AudioData` sẽ dùng trực tiếp bộ đệm đó thay vì sao chép từ nó.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `init` có định dạng không chính xác.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
