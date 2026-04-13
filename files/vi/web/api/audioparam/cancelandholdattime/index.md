---
title: "AudioParam: phương thức cancelAndHoldAtTime()"
short-title: cancelAndHoldAtTime()
slug: Web/API/AudioParam/cancelAndHoldAtTime
page-type: web-api-instance-method
browser-compat: api.AudioParam.cancelAndHoldAtTime
---

{{APIRef("Web Audio API")}}

Phương thức **`cancelAndHoldAtTime()`** của giao diện {{domxref("AudioParam")}} hủy mọi thay đổi trong tương lai đã được lên lịch cho `AudioParam`, nhưng giữ nguyên giá trị của nó tại một thời điểm nhất định cho đến khi có thêm thay đổi bằng các phương thức khác.

## Cú pháp

```js-nolint
cancelAndHoldAtTime(cancelTime)
```

### Tham số

- `cancelTime`
  - : Một số thực kép biểu diễn thời điểm (tính bằng giây) kể từ sau khi [`AudioContext`](/en-US/docs/Web/API/AudioContext) được tạo lần đầu, sau đó mọi thay đổi đã lên lịch sẽ bị hủy.

### Giá trị trả về

Tham chiếu đến {{domxref("AudioParam")}} mà phương thức được gọi trên đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
