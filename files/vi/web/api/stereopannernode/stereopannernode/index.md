---
title: "StereoPannerNode: hàm khởi tạo StereoPannerNode()"
short-title: StereoPannerNode()
slug: Web/API/StereoPannerNode/StereoPannerNode
page-type: web-api-constructor
browser-compat: api.StereoPannerNode.StereoPannerNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`StereoPannerNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo đối tượng {{domxref("StereoPannerNode")}} mới là {{domxref("AudioNode")}} đại diện cho một nút panner stereo đơn giản có thể được dùng để chuyển luồng âm thanh sang trái hoặc phải.

## Cú pháp

```js-nolint
new StereoPannerNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến một {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn như sau:
    - `pan`
      - : Một số thực dấu phẩy động trong khoảng \[-1,1] chỉ ra vị trí của {{domxref("AudioNode")}} trong hình ảnh đầu ra.
        Giá trị -1 đại diện cho hoàn toàn bên trái và 1 đại diện cho hoàn toàn bên phải.
        Giá trị mặc định là `0`.
    - `channelCount`
      - : Đại diện cho một số nguyên được dùng để xác định bao nhiêu kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối đến bất kỳ đầu vào nào của nút.
        (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.)
        Cách sử dụng và định nghĩa chính xác của nó phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Đại diện cho giá trị được liệt kê mô tả cách các kênh phải được khớp giữa các đầu vào và đầu ra của nút.
        (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Đại diện cho giá trị được liệt kê mô tả ý nghĩa của các kênh.
        Diễn giải này sẽ xác định cách [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) âm thanh sẽ xảy ra.
        Các giá trị có thể là `"speakers"` hoặc `"discrete"`.
        (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)

### Giá trị trả về

Một instance đối tượng {{domxref("StereoPannerNode")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
