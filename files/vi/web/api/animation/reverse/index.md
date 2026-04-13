---
title: "Animation: phương thức reverse()"
short-title: reverse()
slug: Web/API/Animation/reverse
page-type: web-api-instance-method
browser-compat: api.Animation.reverse
---

{{APIRef("Web Animations")}}

Phương thức **`Animation.reverse()`** của giao diện {{ domxref("Animation") }} đảo ngược hướng phát, nghĩa là hoạt ảnh kết thúc tại điểm bắt đầu của nó. Nếu được gọi trên một hoạt ảnh chưa từng phát, toàn bộ hoạt ảnh sẽ được phát ngược. Nếu được gọi trên một hoạt ảnh đang tạm dừng, hoạt ảnh sẽ tiếp tục theo chiều ngược lại.

## Cú pháp

```js-nolint
reverse()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ [Growing/Shrinking Alice Game](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010), việc nhấp hoặc chạm vào chai khiến hoạt ảnh phóng to của Alice (`aliceChange`) phát ngược lại, làm cô ấy nhỏ đi. Điều đó được thực hiện bằng cách đặt {{ domxref("Animation.playbackRate") }} của `aliceChange` thành `-1` như sau:

```js
const shrinkAlice = () => {
  // play Alice's animation in reverse
  aliceChange.playbackRate = -1;
  aliceChange.play();

  // play the bottle's animation
  drinking.play();
};
```

Nhưng điều đó cũng có thể được thực hiện bằng cách gọi `reverse()` trên `aliceChange` như sau:

```js
const shrinkAlice = () => {
  // play Alice's animation in reverse
  aliceChange.reverse();

  // play the bottle's animation
  drinking.play();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}} để biết các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh trên trang web.
- {{domxref("Animation.pause()")}} để tạm dừng hoạt ảnh.
- {{domxref("Animation.play()")}} để đưa hoạt ảnh tiến về phía trước.
