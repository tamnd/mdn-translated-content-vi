---
title: "Animation: phương thức pause()"
short-title: pause()
slug: Web/API/Animation/pause
page-type: web-api-instance-method
browser-compat: api.Animation.pause
---

{{ APIRef("Web Animations") }}

Phương thức **`pause()`** của giao diện {{domxref("Animation")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) tạm ngừng việc phát của hoạt ảnh.

## Cú pháp

```js-nolint
pause()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Animation.currentTime", "currentTime")}} của hoạt ảnh là `unresolved` (có thể là vì nó chưa bắt đầu phát), và thời điểm kết thúc của hoạt ảnh là dương vô cùng.

## Ví dụ

`Animation.pause()` được dùng nhiều lần trong trò chơi Alice in Web Animations API Land [Growing/Shrinking Alice Game](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010), chủ yếu vì các hoạt ảnh được tạo bằng phương thức {{domxref("Element.animate()")}} sẽ bắt đầu phát ngay lập tức và phải được tạm dừng thủ công nếu bạn muốn tránh điều đó:

```js
// animation of the cupcake slowly getting eaten up
const nommingCake = document
  .getElementById("eat-me_sprite")
  .animate(
    [{ transform: "translateY(0)" }, { transform: "translateY(-80%)" }],
    {
      fill: "forwards",
      easing: "steps(4, end)",
      duration: aliceChange.effect.timing.duration / 2,
    },
  );

// doesn't actually need to be eaten until a click event, so pause it initially:
nommingCake.pause();
```

Ngoài ra, khi đặt lại:

```js
// An all-purpose function to pause the animations on Alice, the cupcake, and the bottle that reads "drink me."
const stopPlayingAlice = () => {
  aliceChange.pause();
  nommingCake.pause();
  drinking.pause();
};

// When the user releases the cupcake or the bottle, pause the animations.
cake.addEventListener("mouseup", stopPlayingAlice);
bottle.addEventListener("mouseup", stopPlayingAlice);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}} để biết các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh trên trang web.
- {{domxref("Animation.reverse()")}} để phát hoạt ảnh ngược lại.
- {{domxref("Animation.finish()")}} để kết thúc hoạt ảnh.
- {{domxref("Animation.cancel()")}} để hủy hoạt ảnh.
