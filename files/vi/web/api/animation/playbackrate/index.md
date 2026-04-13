---
title: "Animation: thuộc tính playbackRate"
short-title: playbackRate
slug: Web/API/Animation/playbackRate
page-type: web-api-instance-property
browser-compat: api.Animation.playbackRate
---

{{APIRef("Web Animations")}}

Thuộc tính **`Animation.playbackRate`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về hoặc đặt tốc độ phát của hoạt ảnh.

Hoạt ảnh có một **tốc độ phát** cung cấp hệ số tỉ lệ từ tốc độ thay đổi của các giá trị thời gian của {{domxref("DocumentTimeline", "timeline")}} của hoạt ảnh sang thời gian hiện tại của hoạt ảnh. Tốc độ phát ban đầu là `1`.

## Giá trị

Nhận một số có thể là 0, âm hoặc dương. Giá trị âm sẽ đảo ngược hoạt ảnh. Giá trị này là một hệ số tỉ lệ, vì vậy ví dụ giá trị 2 sẽ làm tăng gấp đôi tốc độ phát.

> [!NOTE]
> Việc đặt `playbackRate` của một hoạt ảnh thành `0` về thực chất sẽ tạm dừng hoạt ảnh (tuy nhiên, {{domxref("Animation.playState", "playState")}} của nó không nhất thiết trở thành `paused`).

## Ví dụ

Trong ví dụ [Growing/Shrinking Alice Game](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010), việc nhấp hoặc chạm vào chai khiến hoạt ảnh phóng to của Alice (`aliceChange`) đảo chiều, làm cô ấy thu nhỏ lại:

```js
const shrinkAlice = () => {
  aliceChange.playbackRate = -1;
  aliceChange.play();
};

// On tap or click, Alice will shrink.
bottle.addEventListener("mousedown", shrinkAlice);
bottle.addEventListener("touchstart", shrinkAlice);
```

Ngược lại, việc nhấp vào chiếc bánh khiến cô ấy "lớn lên", phát `aliceChange` theo chiều thuận một lần nữa:

```js
const growAlice = () => {
  aliceChange.playbackRate = 1;
  aliceChange.play();
};

// On tap or click, Alice will grow.
cake.addEventListener("mousedown", growAlice);
cake.addEventListener("touchstart", growAlice);
```

Trong một ví dụ khác, [Red Queen's Race Game](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#other_useful_methods), Alice và Red Queen liên tục chậm dần:

```js
setInterval(() => {
  // Make sure the playback rate never falls below .4
  if (redQueenAlice.playbackRate > 0.4) {
    redQueenAlice.updatePlaybackRate(redQueenAlice.playbackRate * 0.9);
  }
}, 3000);
```

Nhưng việc nhấp hoặc chạm vào họ sẽ khiến họ tăng tốc bằng cách nhân `playbackRate` của họ:

```js
const goFaster = () => {
  redQueenAlice.updatePlaybackRate(redQueenAlice.playbackRate * 1.1);
};

document.addEventListener("click", goFaster);
document.addEventListener("touchstart", goFaster);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
