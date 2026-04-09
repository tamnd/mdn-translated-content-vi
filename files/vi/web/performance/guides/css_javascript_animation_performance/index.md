---
title: Hiệu năng hoạt ảnh CSS và JavaScript
short-title: Hoạt ảnh CSS và JavaScript
slug: Web/Performance/Guides/CSS_JavaScript_animation_performance
page-type: guide
sidebar: performancesidebar
---

Hoạt ảnh là yếu tố quan trọng để mang lại trải nghiệm người dùng dễ chịu trong nhiều ứng dụng. Có nhiều cách để triển khai hoạt ảnh trên web, chẳng hạn như hoạt ảnh CSS {{cssxref("transition","chuyển đổi")}}/{{cssxref("animation","hoạt ảnh")}} hoặc hoạt ảnh dựa trên JavaScript (dùng {{domxref("Window.requestAnimationFrame","requestAnimationFrame()")}}). Trong bài viết này, chúng ta phân tích sự khác biệt về hiệu năng giữa hoạt ảnh dựa trên CSS và hoạt ảnh dựa trên JavaScript.

## CSS transitions và animations

Cả CSS transitions và animations đều có thể dùng để tạo hoạt ảnh. Mỗi loại phù hợp với những tình huống sử dụng riêng:

- CSS {{cssxref("transition","transitions")}} cung cấp một cách dễ dàng để tạo hoạt ảnh diễn ra giữa kiểu hiện tại và trạng thái CSS cuối cùng, ví dụ trạng thái nghỉ của một nút và trạng thái hover. Ngay cả khi phần tử đang ở giữa một transition, transition mới vẫn bắt đầu ngay từ kiểu hiện tại thay vì nhảy thẳng đến trạng thái CSS cuối. Xem [Sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using) để biết thêm chi tiết.
- CSS {{cssxref("animation","animations")}}, ngược lại, cho phép nhà phát triển tạo hoạt ảnh giữa một tập giá trị thuộc tính bắt đầu và một tập giá trị kết thúc thay vì giữa hai trạng thái. CSS animations gồm hai thành phần: một kiểu mô tả hoạt ảnh CSS và một tập keyframe chỉ ra trạng thái bắt đầu và kết thúc của kiểu hoạt ảnh, cùng với các điểm trung gian có thể có. Xem [Sử dụng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm chi tiết.

Về mặt hiệu năng, không có khác biệt giữa việc triển khai hoạt ảnh bằng CSS transitions hay animations. Trong bài viết này, cả hai đều được xếp chung dưới nhóm hoạt ảnh dựa trên CSS.

## requestAnimationFrame

API {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} cung cấp một cách hiệu quả để tạo hoạt ảnh bằng JavaScript. Hàm callback của phương thức này được trình duyệt gọi trước lần repaint tiếp theo ở mỗi khung hình. So với {{domxref("Window.setTimeout", "setTimeout()")}}/{{domxref("Window.setInterval", "setInterval()")}}, vốn cần một tham số độ trễ cụ thể, `requestAnimationFrame()` hiệu quả hơn nhiều. Nhà phát triển có thể tạo hoạt ảnh bằng cách thay đổi kiểu của phần tử mỗi khi vòng lặp được gọi (hoặc cập nhật bản vẽ Canvas, hoặc bất cứ thứ gì khác).

> [!NOTE]
> Giống như CSS transitions và animations, `requestAnimationFrame()` sẽ tạm dừng khi tab hiện tại bị đưa xuống nền.

Để biết thêm chi tiết, hãy đọc [hoạt ảnh với JavaScript từ setInterval đến requestAnimationFrame](https://hacks.mozilla.org/2011/08/animating-with-javascript-from-setinterval-to-requestanimationframe/).

## So sánh hiệu năng:<br>transitions so với requestAnimationFrame

Thực tế là, trong hầu hết trường hợp, hiệu năng của hoạt ảnh dựa trên CSS gần như giống hệt hoạt ảnh bằng JavaScript - ít nhất là trong Firefox. Một số thư viện hoạt ảnh dựa trên JavaScript, như [GSAP](https://gsap.com/) và [Velocity.JS](https://github.com/julianshapiro/velocity/wiki), thậm chí còn tuyên bố rằng chúng có thể đạt hiệu năng tốt hơn [CSS transitions/animations gốc](https://css-tricks.com/myth-busting-css-animations-vs-javascript/). Điều này có thể xảy ra vì CSS transitions/animations đang lấy mẫu lại kiểu phần tử trên luồng giao diện chính trước khi mỗi sự kiện repaint xảy ra, gần như giống hệt việc lấy mẫu lại kiểu phần tử qua một callback `requestAnimationFrame()`, vốn cũng được kích hoạt trước lần repaint tiếp theo. Nếu cả hai hoạt ảnh đều chạy trên luồng giao diện chính, thì xét về hiệu năng không có khác biệt.

Trong phần này, chúng ta sẽ hướng dẫn bạn qua một bài kiểm tra hiệu năng bằng Firefox để xem phương pháp hoạt ảnh nào có vẻ tốt hơn tổng thể.

### Bật công cụ FPS

Trước khi đi qua ví dụ, hãy bật công cụ FPS trước để thấy tốc độ khung hình hiện tại:

1. Trong thanh URL, nhập _about:config_; nhấp nút `I'll be careful, I promise!` để vào màn hình cấu hình.
   ![Warning screen that changing settings can be risky, with a button to accept risks.](pic1.png)
2. Trong thanh tìm kiếm, tìm tùy chọn `layers.acceleration.draw-fps`.
3. Nhấp đúp vào mục này để đặt giá trị thành `true`. Bây giờ bạn sẽ thấy ba ô tím nhỏ ở góc trên bên trái của cửa sổ Firefox. Ô đầu tiên biểu thị FPS.
   ![Entering the search term filters the options. Only the layers.acceleration.draw-fps preference is showing and is set to true. Three numbers (001, 001, and 108) are appearing in the upper left corner of the browser, overlaying its UI.](pic2.png)

### Chạy bài kiểm tra hiệu năng

Ban đầu trong bài kiểm tra dưới đây, tổng cộng 1000 {{htmlelement("div")}} phần tử được biến đổi bằng hoạt ảnh CSS.

```js
const boxes = [];
const button = document.getElementById("toggle-button");
const boxContainer = document.getElementById("box-container");
const animationType = document.getElementById("type");

// create boxes
for (let i = 0; i < 1000; i++) {
  const div = document.createElement("div");
  div.classList.add("css-animation");
  div.classList.add("box");
  boxContainer.appendChild(div);
  boxes.push(div.style);
}

let toggleStatus = true;
let rafId;
button.addEventListener("click", () => {
  if (toggleStatus) {
    animationType.textContent = " requestAnimationFrame";
    for (const child of boxContainer.children) {
      child.classList.remove("css-animation");
    }
    rafId = window.requestAnimationFrame(animate);
  } else {
    window.cancelAnimationFrame(rafId);
    animationType.textContent = " CSS animation";
    for (const child of boxContainer.children) {
      child.classList.add("css-animation");
    }
  }
  toggleStatus = !toggleStatus;
});

const duration = 6000;
const translateX = 500;
const rotate = 360;
const scale = 1.4 - 0.6;
let start;
function animate(time) {
  if (!start) {
    start = time;
    rafId = window.requestAnimationFrame(animate);
    return;
  }

  const progress = (time - start) / duration;
  if (progress < 2) {
    let x = progress * translateX;
    let transform;
    if (progress >= 1) {
      x = (2 - progress) * translateX;
      transform = `translateX(${x}px) rotate(${
        (2 - progress) * rotate
      }deg) scale(${0.6 + (2 - progress) * scale})`;
    } else {
      transform = `translateX(${x}px) rotate(${progress * rotate}deg) scale(${
        0.6 + progress * scale
      })`;
    }

    for (const box of boxes) {
      box.transform = transform;
    }
  } else {
    start = null;
  }
  rafId = window.requestAnimationFrame(animate);
}
```

```html hidden
<div id="header">
  <button id="toggle-button">Toggle</button>
  <span id="type">CSS Animation</span>
</div>
<div id="box-container"></div>
```

```css hidden
#header {
  position: sticky;
  top: 0.5rem;
  margin: 0 0.5rem;
  z-index: 100;
  background-color: lightgreen;
}

#box-container {
  margin-top: 1.5rem;
  display: grid;
  grid-template-columns: repeat(40, 1fr);
  gap: 15px;
}

.box {
  width: 30px;
  height: 30px;
  background-color: red;
}

.css-animation {
  animation: animate 6s linear 0s infinite alternate;
}

@keyframes animate {
  0% {
    transform: translateX(0) rotate(0deg) scale(0.6);
  }
  100% {
    transform: translateX(500px) rotate(360deg) scale(1.4);
  }
}
```

{{ EmbedLiveSample("Running the performance test", "100%", "480") }}

Hoạt ảnh có thể được chuyển sang `requestAnimationFrame()` bằng cách nhấp vào nút chuyển đổi.

Hãy chạy cả hai ngay bây giờ, rồi so sánh FPS của từng loại (ô tím đầu tiên). Bạn sẽ thấy hiệu năng của CSS animations và `requestAnimationFrame()` rất gần nhau.

### Hoạt ảnh ngoài luồng chính

Ngay cả với kết quả kiểm tra ở trên, chúng tôi vẫn cho rằng CSS animations là lựa chọn tốt hơn. Nhưng bằng cách nào? Mấu chốt là, miễn là các thuộc tính chúng ta muốn animate không kích hoạt reflow/repaint (đọc [CSS triggers](https://csstriggers.com/) để biết thêm thông tin), chúng ta có thể chuyển các thao tác lấy mẫu đó ra ngoài luồng chính. Thuộc tính phổ biến nhất là CSS transform. Nếu một phần tử được nâng lên thành một [layer](https://wiki.mozilla.org/Gecko:Overview#Graphics), việc animate các thuộc tính transform có thể được thực hiện trong GPU, nghĩa là hiệu năng và hiệu quả tốt hơn, đặc biệt trên thiết bị di động. Tìm hiểu thêm trong [OffMainThreadCompositing](https://wiki.mozilla.org/Platform/GFX/OffMainThreadCompositing).

Để bật OMTA (Off Main Thread Animation) trong Firefox, bạn có thể vào _about:config_ và tìm `layers.offmainthreadcomposition.async-animations`. Chuyển giá trị của nó sang `true`.

![Entering the search term filters the options. Only the layers.offmainthreadcomposition.async-animations preference is showing, set to true. The three numbers in the upper left corner of the browser, above its UI, have increased to 005, 003, and 108.](pic3.png)

Sau khi bật OMTA, hãy thử chạy lại bài kiểm tra ở trên. Bạn sẽ thấy FPS của CSS animations giờ sẽ cao hơn đáng kể.

> [!NOTE]
> Trong Nightly/Developer Edition, bạn sẽ thấy OMTA đã được bật theo mặc định, vì vậy bạn có thể phải làm bài kiểm tra theo cách ngược lại (kiểm tra khi bật trước, rồi tắt để kiểm tra khi không có OMTA.)

## Tóm tắt

Trình duyệt có thể tối ưu hóa các luồng kết xuất. Tóm lại, chúng ta nên luôn cố gắng tạo hoạt ảnh bằng CSS transitions/animations khi có thể. Nếu hoạt ảnh của bạn thực sự phức tạp, bạn có thể phải dựa vào hoạt ảnh dựa trên JavaScript thay thế.
