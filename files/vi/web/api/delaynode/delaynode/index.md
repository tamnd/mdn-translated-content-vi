---
title: "DelayNode: hàm khởi tạo DelayNode()"
short-title: DelayNode()
slug: Web/API/DelayNode/DelayNode
page-type: web-api-constructor
browser-compat: api.DelayNode.DelayNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`DelayNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("DelayNode")}} mới với delay-line; một mô-đun xử lý âm thanh AudioNode gây ra độ trễ giữa thời điểm đến của dữ liệu đầu vào và sự lan truyền của nó đến đầu ra.

## Cú pháp

```js-nolint
new DelayNode(context)
new DelayNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến một {{domxref("AudioContext")}} hoặc {{domxref("OfflineAudioContext")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các tùy chọn nút delay. Có thể chứa các thành viên sau:
    - `delayTime`
      - : Thời gian trễ ban đầu cho nút, tính bằng giây. Mặc định là `0`.
    - `maxDelayTime`
      - : Thời gian trễ tối đa cho nút, tính bằng giây. Mặc định là `1`.
    - `channelCount`
      - : Đại diện cho một số nguyên được sử dụng để xác định có bao nhiêu kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối đến bất kỳ đầu vào nào của nút.
    - `channelCountMode`
      - : Đại diện cho một giá trị liệt kê mô tả cách các kênh phải khớp giữa các đầu vào và đầu ra của nút.
    - `channelInterpretation`
      - : Đại diện cho một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ định nghĩa cách audio [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) sẽ xảy ra. Các giá trị có thể là `"speakers"` hoặc `"discrete"`.

### Giá trị trả về

Một phiên bản đối tượng {{domxref("DelayNode")}} mới.

## Ví dụ

```js
const audioCtx = new AudioContext();
const delayNode = new DelayNode(audioCtx, {
  delayTime: 0.5,
  maxDelayTime: 2,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
