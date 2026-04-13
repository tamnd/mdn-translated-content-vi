---
title: "Animation: phương thức play()"
short-title: play()
slug: Web/API/Animation/play
page-type: web-api-instance-method
browser-compat: api.Animation.play
---

{{ APIRef("Web Animations") }}

Phương thức **`play()`** của giao diện {{ domxref("Animation") }} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) bắt đầu hoặc tiếp tục phát một hoạt ảnh. Nếu hoạt ảnh đã kết thúc, việc gọi `play()` sẽ khởi động lại hoạt ảnh và phát nó từ đầu.

## Cú pháp

```js-nolint
play()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ [Growing/Shrinking Alice Game](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010), việc nhấp hoặc chạm vào chiếc bánh khiến hoạt ảnh phóng to của Alice (`aliceChange`) phát theo chiều thuận làm cô ấy to lên, đồng thời kích hoạt hoạt ảnh của chiếc bánh. Hai lệnh `Animation.play()`, một `EventListener`:

```js
// The cake has its own animation:
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

// Pause the cake's animation so it doesn't play immediately.
nommingCake.pause();

// This function will play when ever a user clicks or taps
const growAlice = () => {
  // Play Alice's animation.
  aliceChange.play();

  // Play the cake's animation.
  nommingCake.play();
};

// When a user holds their mouse down or taps, call growAlice to make all the animations play.
cake.addEventListener("mousedown", growAlice);
cake.addEventListener("touchstart", growAlice);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}} để biết các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh trên trang web.
- {{domxref("Animation.pause()")}} để tạm dừng hoạt ảnh.
- {{domxref("Animation.reverse()")}} để phát hoạt ảnh ngược lại.
- {{domxref("Animation.finish()")}} để kết thúc hoạt ảnh.
- {{domxref("Animation.cancel()")}} để hủy hoạt ảnh.
