---
title: "AnimationEffect: phương thức updateTiming()"
short-title: updateTiming()
slug: Web/API/AnimationEffect/updateTiming
page-type: web-api-instance-method
browser-compat: api.AnimationEffect.updateTiming
---

{{ APIRef("Web Animations") }}

Phương thức `updateTiming()` của giao diện {{domxref("AnimationEffect")}} cập nhật các thuộc tính thời gian đã chỉ định cho một hiệu ứng hoạt ảnh.

## Cú pháp

```js-nolint
updateTiming(timing)
```

### Tham số

- `timing` {{optional_inline}}
  - : Một đối tượng chứa không hoặc nhiều thuộc tính trong giá trị trả về của {{domxref("AnimationEffect.getTiming()")}}, biểu diễn các thuộc tính thời gian cần cập nhật.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu các giá trị không hợp lệ được cung cấp cho bất kỳ thuộc tính thời gian nào.

### Ví dụ

#### Tác dụng phụ

`updateTiming()` có thể khiến bất kỳ {{domxref("Animation")}} liên kết nào bắt đầu hoặc dừng phát, ví dụ nếu hiệu ứng của một hoạt ảnh đang chạy được rút ngắn sao cho thời điểm kết thúc của nó nằm trước {{domxref("Animation.currentTime")}} hoặc hiệu ứng của một hoạt ảnh đã kết thúc được kéo dài sao cho thời điểm kết thúc của nó nằm sau {{domxref("Animation.currentTime")}}.

```js
const animation = document.body.animate([], { duration: 1000 });
animation.finish();
console.log(animation.playState); // finished
animation.effect.updateTiming({ duration: 2000 });
console.log(animation.playState); // running
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationEffect")}}
- {{domxref("Animation")}}
- {{domxref("AnimationEffect.getTiming()")}}
- {{domxref("AnimationEffect.getComputedTiming()")}}
