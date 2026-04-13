---
title: "Animation: thuộc tính startTime"
short-title: startTime
slug: Web/API/Animation/startTime
page-type: web-api-instance-property
browser-compat: api.Animation.startTime
---

{{ APIRef("Web Animations") }}

Thuộc tính **`Animation.startTime`** của giao diện {{domxref("Animation")}} là một giá trị dấu phẩy động độ chính xác kép, cho biết thời điểm được lên lịch khi việc phát hoạt ảnh sẽ bắt đầu.

**Thời gian bắt đầu** của một hoạt ảnh là giá trị thời gian của {{domxref("DocumentTimeline","timeline")}} của nó khi {{domxref("KeyframeEffect")}} đích được lên lịch bắt đầu phát. **Thời gian bắt đầu** của một hoạt ảnh ban đầu là unresolved (nghĩa là nó là `null` vì không có giá trị).

## Giá trị

Một số dấu phẩy động biểu diễn thời gian hiện tại tính bằng mili giây, hoặc `null` nếu chưa có thời gian nào được đặt. Bạn có thể đọc giá trị này để xác định thời gian bắt đầu hiện đang được đặt là bao nhiêu, và bạn cũng có thể thay đổi giá trị này để hoạt ảnh bắt đầu vào một thời điểm khác.

## Ví dụ

### Đồng bộ nhiều hoạt ảnh khác nhau

Trong ví dụ sau, chúng ta có thể đồng bộ tất cả những chú mèo hoạt hình mới bằng cách cho tất cả chúng cùng `startTime` với chú mèo đang chạy ban đầu. Lưu ý rằng điều này chỉ có thể với Web Animation API: không thể đồng bộ hai hoạt ảnh riêng biệt bằng CSS animations.

```html hidden
<div id="css-cats">
  <h2>Cats animated with<br />CSS Animations</h2>
  <div class="cat with-css"></div>
  <button id="insert-css-cat">Add a Cat</button>
</div>

<div id="waapi-cats">
  <h2>Cats animated with the<br />Web Animation API</h2>
  <div class="cat" id="with-waapi"></div>
  <button id="insert-waapi-cat">Add a Cat</button>
</div>
```

```css
/* All cats have the same dimensions and the same sprite for a background image. */
.cat {
  background: url("/shared-assets/images/examples/web-animations/cat_sprite.png") -600px
    0 no-repeat;
  height: 150px;
  width: 100%;
}

/* The cats animated with CSS have their running animations set with CSS */
.cat.with-css {
  animation: 0.75s steps(13, end) infinite run-cycle;
}

/*
  The keyframes for the CSS running animation.
  This moves the background image sprite around.
*/
@keyframes run-cycle {
  from {
    background-position: -600px 0;
  }
  to {
    background-position: -600px -1950px;
  }
}
```

```css hidden
#css-cats,
#waapi-cats {
  text-align: center;
  vertical-align: top;
  min-width: 300px;
}

body {
  background: #e5e6e9;
  color: #071933;
  font-family: sans-serif;
  display: flex;
  flex-wrap: wrap;
}
```

```js
const cssCats = document.getElementById("css-cats");
const waapiCats = document.getElementById("waapi-cats");
const insertCSSCat = document.getElementById("insert-css-cat");
const insertWAAPICat = document.getElementById("insert-waapi-cat");

// The same information as @keyframes run-cycle
const keyframes = [
  { backgroundPosition: "-600px 0" },
  { backgroundPosition: "-600px -1950px" },
];
// The same information as .cat.with-css
const timing = {
  duration: 750,
  iterations: Infinity,
  easing: "steps(13, end)",
};

const catRunning = document
  .getElementById("with-waapi")
  .animate(keyframes, timing);

function createCat() {
  const newCat = document.createElement("div");
  newCat.classList.add("cat");
  return newCat;
}

insertCSSCat.addEventListener("click", () => {
  const newCat = createCat();
  newCat.classList.add("with-css");
  cssCats.insertBefore(newCat, insertCSSCat);
});

insertWAAPICat.addEventListener("click", () => {
  const newCat = createCat();
  const newAnimationPlayer = newCat.animate(keyframes, timing);
  // set start time to be the same as the original .cat#with-waapi
  newAnimationPlayer.startTime = catRunning.startTime;
  waapiCats.insertBefore(newCat, insertWAAPICat);
});
```

{{EmbedLiveSample("Syncing different animations", "", 600)}}

## Độ chính xác thời gian bị giảm

Để bảo vệ khỏi các cuộc tấn công dựa trên thời gian và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `animation.startTime` có thể bị làm tròn tùy theo thiết lập trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, khi đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, khi độ chính xác thời gian bị giảm, kết quả của `animation.startTime` sẽ luôn là bội số của 0.002, hoặc bội số của 0.1 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi `privacy.resistFingerprinting` được bật.

```js
// reduced time precision (2ms) in Firefox 60
animation.startTime;
// Might be:
// 23.404
// 24.192
// 25.514
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
animation.startTime;
// Might be:
// 49.8
// 50.6
// 51.7
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
- {{domxref("Animation.currentTime")}} cho thời gian hiện tại của hoạt ảnh.
