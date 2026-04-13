---
title: "ChannelSplitterNode: hàm tạo ChannelSplitterNode()"
short-title: ChannelSplitterNode()
slug: Web/API/ChannelSplitterNode/ChannelSplitterNode
page-type: web-api-constructor
browser-compat: api.ChannelSplitterNode.ChannelSplitterNode
---

{{APIRef("Web Audio API")}}

Hàm tạo **`ChannelSplitterNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một thực thể đối tượng {{domxref("ChannelSplitterNode")}} mới, biểu diễn một nút tách đầu vào thành các đầu ra riêng biệt cho từng kênh âm thanh của nút nguồn.

## Cú pháp

```js-nolint
new ChannelSplitterNode(context)
new ChannelSplitterNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("BaseAudioContext")}} biểu diễn ngữ cảnh âm thanh mà bạn muốn liên kết nút này với.
- `options` {{optional_inline}}
  - : Một đối tượng xác định các thuộc tính mà bạn muốn `ChannelSplitterNode` có:
    - `numberOfOutputs` {{optional_inline}}
      - : Một số xác định số lượng đầu ra mà {{domxref("ChannelSplitterNode")}} nên có. Nếu không được chỉ định, giá trị mặc định dùng là 6.
    - `channelCount` {{optional_inline}}
      - : Một số nguyên dùng để xác định có bao nhiêu kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối tới bất kỳ đầu vào nào của nút.
        (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.)
        Cách sử dụng và định nghĩa chính xác của thuộc tính này phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode` {{optional_inline}}
      - : Một chuỗi mô tả cách các kênh phải được khớp giữa đầu vào và đầu ra của nút.
        (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm cả các giá trị mặc định.)
    - `channelInterpretation` {{optional_inline}}
      - : Một chuỗi mô tả ý nghĩa của các kênh.
        Cách diễn giải này sẽ xác định cách quá trình [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) diễn ra.
        Các giá trị có thể có là `"speakers"` hoặc `"discrete"`.
        (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm cả các giá trị mặc định.)

### Giá trị trả về

Một thực thể đối tượng {{domxref("ChannelSplitterNode")}} mới.

## Ví dụ

```js
const ac = new AudioContext();

const options = {
  numberOfOutputs: 2,
};

const mySplitter = new ChannelSplitterNode(ac, options);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
