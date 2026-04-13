---
title: Web animation API tips and tricks
slug: Web/API/Web_Animations_API/Tips
page-type: guide
---

{{DefaultAPISidebar("Web Animations")}}

Hoạt ảnh CSS cho phép làm những điều rất ấn tượng với các phần tử tạo nên tài liệu và ứng dụng của bạn. Có nhiều việc bạn có thể muốn làm nhưng không hiển nhiên, và cũng có nhiều cách khéo léo để làm những việc có thể không thấy ngay. Bài viết này là một tập hợp các mẹo và thủ thuật, bao gồm cách chạy lại một hoạt ảnh đã hoàn thành.

## Chạy lại một hoạt ảnh

Đặc tả [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations) không cung cấp cách để chạy lại một hoạt ảnh. Bạn không thể chỉ đặt lại {{cssxref("animation-play-state")}} của phần tử thành `"running"` sau khi hoạt ảnh kết thúc. Thay vào đó, bạn phải dùng JavaScript để phát lại một hoạt ảnh đã hoàn thành.

Đây là một cách ổn định và đáng tin cậy để làm điều đó.

### HTML

Trước hết, hãy định nghĩa HTML cho một {{HTMLElement("div")}} mà chúng ta muốn làm hoạt ảnh và một nút sẽ phát lại hoạt ảnh.

```html
<div class="box"></div>
<button class="runButton">Run the animation</button>
```

### CSS

Hãy tạo kiểu cho hộp bằng CSS.

```css
.box {
  width: 100px;
  height: 100px;
  border: 1px solid black;
  margin-bottom: 1rem;
}
```

### JavaScript

Tiếp theo là JavaScript thực hiện công việc. Hàm `playAnimation()` sẽ được gọi khi người dùng nhấp vào nút chạy. Thay vì dùng at-rule {{cssxref("@keyframes")}}, chúng ta [định nghĩa keyframes bằng JavaScript](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats).

```js
const box = document.querySelector(".box");
const button = document.querySelector(".runButton");

/*
  equivalent to the following CSS @keyframes
*/
const colorChangeFrames = { backgroundColor: ["grey", "lime"] };
const colorChangeTiming = {
  duration: 1000,
  iterations: 1,
};

function playAnimation() {
  box.animate(colorChangeFrames, colorChangeTiming);
}

button.addEventListener("click", playAnimation);
```

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [Keyframe Formats](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats)
