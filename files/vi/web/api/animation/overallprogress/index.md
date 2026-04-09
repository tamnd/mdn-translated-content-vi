---
title: "Animation: thuộc tính overallProgress"
short-title: overallProgress
slug: Web/API/Animation/overallProgress
page-type: web-api-instance-property
browser-compat: api.Animation.overallProgress
---

{{APIRef("Web Animations")}}

Thuộc tính chỉ đọc **`overallProgress`** của giao diện {{domxref("Animation")}} trả về một số nằm giữa `0` và `1` biểu thị tiến độ tổng thể của hoạt ảnh hướng tới trạng thái kết thúc. Đây là tiến độ tổng thể qua tất cả các lần lặp của hoạt ảnh, không phải từng lần lặp riêng lẻ.

`overallProgress` hoạt động nhất quán trên mọi hoạt ảnh, bất kể loại {{domxref("AnimationTimeline", "timeline")}} là gì.

## Giá trị

Một số từ `0` đến `1`, hoặc `null` nếu hoạt ảnh không có timeline, đang không hoạt động hoặc chưa từng được phát, hoặc nếu {{domxref("Animation/currentTime", "currentTime")}} của nó được đặt thành một giá trị không phải thời gian.

Nếu thuộc tính [`iterations`](/en-US/docs/Web/API/KeyframeEffect/KeyframeEffect#iterations) của hoạt ảnh được đặt thành `Infinity`, hoặc nếu {{domxref("Animation/currentTime", "currentTime")}} của nó được đặt thành giá trị âm, `overallProgress` sẽ trả về `0`.

Nếu [`duration`](/en-US/docs/Web/API/KeyframeEffect/KeyframeEffect#duration) của nó được đặt thành `0`, `overallProgress` sẽ trả về `1`.

## Ví dụ

### Hiển thị phần trăm tiến độ

Bản demo này dùng `overallProgress` để tạo phần hiển thị "phần trăm tiến độ", được hiển thị trên màn hình trong khi hoạt ảnh chạy.

### HTML

HTML chứa một {{htmlelement("button")}} để nhấn bắt đầu hoạt ảnh, một phần tử {{htmlelement("p")}} để hiển thị phần trăm tiến độ, và một {{htmlelement("div")}} sẽ được tạo hoạt ảnh.

```html
<button>Run animation</button>
<p class="progress">Progress: 0%</p>
<div class="box"></div>
```

Phần CSS của demo cung cấp một số kiểu dáng cơ bản, không quan trọng để hiểu cách JavaScript hoạt động, vì vậy chúng tôi đã ẩn nó để ngắn gọn.

```css hidden
* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  width: 500px;
  margin: 0 auto;
  padding: 20px;
}

.progress {
  font-weight: bold;
}

.box {
  width: 100px;
  height: 100px;
  border-radius: 40px 20px;
  border: 10px solid black;
  background: lightseagreen;
  margin: 0 auto;
}
```

### JavaScript

Trong JavaScript, trước tiên chúng ta lấy tham chiếu tới các phần tử {{htmlelement("button")}}, {{htmlelement("p")}} và {{htmlelement("div")}}.

Sau đó chúng ta tạo:

- biến `animation`, sẽ tham chiếu tới hoạt ảnh sau khi được tạo
- một mảng [keyframes](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats)
- một đối tượng tùy chọn chứa các thuộc tính thời gian.

```js
const btn = document.querySelector("button");
const progress = document.querySelector(".progress");
const box = document.querySelector(".box");

let animation;

const keyframes = [{ rotate: "0deg" }, { rotate: "360deg" }];

const timingProps = {
  duration: 3000,
  iterations: 1,
};
```

Tiếp theo, chúng ta thêm một trình lắng nghe sự kiện `"click"` vào `<button>` qua [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) để khi được nhấn, nó sẽ:

1. Khởi động hoạt ảnh bằng {{domxref("Element.animate()")}}, truyền vào các keyframe và tùy chọn đã định nghĩa trước đó, rồi gán thực thể {{domxref("Animation")}} trả về cho biến `animation`.
2. Chạy hàm `updateProgress()` qua phương thức {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}}, hàm này xử lý việc cập nhật phần hiển thị phần trăm tiến độ.

```js
btn.addEventListener("click", () => {
  // Animate the box
  animation = box.animate(keyframes, timingProps);
  // Start updating the progress percentage via rAF()
  requestAnimationFrame(updateProgress);
});
```

Bây giờ hãy định nghĩa hàm `updateProgress()`. Hàm này truy vấn {{domxref("Animation.playState")}} để xem hoạt ảnh đã kết thúc chưa. Nếu chưa kết thúc, chúng ta lấy giá trị hiện tại của `overallProgress`, nhân với 100 rồi làm tròn xuống để chuyển thành phần trăm nguyên, sau đó cập nhật giá trị {{domxref("Node.textContent", "textContent")}} của phần tử `<p>` bằng giá trị đó. Sau đó ta lại gọi `requestAnimationFrame(updateProgress)` để tiếp tục cập nhật phần trăm tiến độ.

Nếu hoạt ảnh đã kết thúc, chúng ta thay phần trăm tiến độ bằng thông điệp "Finished!", và không gọi `requestAnimationFrame(updateProgress)`, vì vậy việc cập nhật sẽ dừng lại.

```js
function updateProgress() {
  // Check if the animation is finished
  if (animation.playState !== "finished") {
    // Convert overallProgress to a whole number percentage
    const progressPercentage = Math.floor(animation.overallProgress * 100);
    // Update the progress paragraph with the percentage
    progress.textContent = `Progress: ${progressPercentage}%`;
    // Only request the next frame if the animation is not finished
    requestAnimationFrame(updateProgress);
  } else {
    progress.textContent = "Finished!";
  }
}
```

### Kết quả

Kết quả đầu ra trông như sau. Hãy thử nhấn nút để xem hoạt ảnh và chỉ báo tiến độ liên quan chạy.

{{ EmbedLiveSample("Displaying a percentage progress", "100%", 250) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Animation")}} để biết các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh trên trang web.
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
