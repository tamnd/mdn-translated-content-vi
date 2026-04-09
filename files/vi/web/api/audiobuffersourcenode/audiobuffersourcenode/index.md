---
title: "AudioBufferSourceNode: hàm tạo AudioBufferSourceNode()"
short-title: AudioBufferSourceNode()
slug: Web/API/AudioBufferSourceNode/AudioBufferSourceNode
page-type: web-api-constructor
browser-compat: api.AudioBufferSourceNode.AudioBufferSourceNode
---

{{APIRef("Web Audio API")}}

Hàm tạo **`AudioBufferSourceNode()`** tạo một thực thể đối tượng {{domxref("AudioBufferSourceNode")}} mới.

## Cú pháp

```js-nolint
new AudioBufferSourceNode(context, options)
```

### Tham số

- `context`
  - : Một tham chiếu tới {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `buffer`
      - : Một thực thể {{domxref("AudioBuffer")}} sẽ được phát.
    - `detune`
      - : Một giá trị tính theo cent để điều biến tốc độ dựng luồng âm thanh. Phạm vi danh định của nó là (-∞ đến +∞). Mặc định là `0`.
    - `loop`
      - : Một giá trị boolean cho biết âm thanh có nên phát lặp hay không.
        Mặc định là `false`. Nếu vòng lặp được sửa đổi động trong khi đang phát,
        giá trị mới sẽ có hiệu lực ở khối xử lý âm thanh tiếp theo.
    - `loopEnd`
      - : Một giá trị tùy chọn, tính bằng giây, cho biết nơi việc lặp nên kết thúc nếu
        thuộc tính `loop` là `true`. Mặc định là `0`. Giá trị này
        được loại trừ khỏi nội dung của vòng lặp. Các khung mẫu tạo nên vòng lặp
        chạy từ các giá trị `loopStart` đến
        `loopEnd`-(1/`sampleRate`). Hợp lý khi đặt nó thành một
        giá trị trong khoảng từ 0 đến thời lượng của bộ đệm. Nếu `loopEnd` nhỏ hơn
        0, việc lặp sẽ kết thúc tại 0. Nếu `loopEnd` lớn hơn
        thời lượng của bộ đệm, việc lặp sẽ kết thúc tại cuối bộ đệm. Thuộc tính này
        được chuyển đổi thành một độ lệch khung mẫu chính xác trong bộ đệm bằng cách nhân với
        tần số lấy mẫu của bộ đệm và làm tròn tới số nguyên gần nhất. Do đó, hành vi của nó
        không phụ thuộc vào giá trị của tham số `playbackRate`.
    - `loopStart`
      - : Một giá trị tùy chọn tính bằng giây, cho biết nơi việc lặp nên bắt đầu
        nếu thuộc tính `loop` là `true`. Mặc định là `0`. Hợp lý
        khi đặt nó thành một giá trị trong khoảng từ 0 đến thời lượng của bộ đệm. Nếu
        `loopStart` nhỏ hơn 0, việc lặp sẽ bắt đầu tại 0. Nếu
        `loopStart` lớn hơn thời lượng của bộ đệm, việc lặp sẽ
        bắt đầu tại cuối bộ đệm. Thuộc tính này được chuyển đổi thành một độ lệch khung mẫu chính xác
        trong bộ đệm bằng cách nhân với tần số lấy mẫu của bộ đệm và làm tròn tới số nguyên gần nhất.
        Do đó, hành vi của nó không phụ thuộc vào giá trị của tham số `playbackRate`.
    - `playbackRate`
      - : Tốc độ mà tại đó luồng âm thanh sẽ được dựng. Giá trị
        mặc định là `1`. Tham số này là k-rate. Đây là một tham số tổ hợp
        với `detune`. Phạm vi danh định của nó là (-∞ đến +∞).
    - `channelCount`
      - : Biểu diễn một số nguyên dùng để xác định có bao nhiêu kênh được dùng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối tới bất kỳ đầu vào nào của nút. (Xem
        {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách dùng và định nghĩa chính xác của nó
        phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Biểu diễn một giá trị liệt kê mô tả cách các kênh phải được khớp giữa
        đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm
        thông tin, bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Biểu diễn một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này
        sẽ xác định cách việc [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) âm thanh diễn ra.
        Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem
        {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm cả các giá trị mặc định.)

### Giá trị trả về

Một thực thể đối tượng {{domxref("AudioBufferSourceNode")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
