---
title: view()
slug: Web/CSS/Reference/Properties/animation-timeline/view
page-type: css-function
browser-compat: css.properties.animation-timeline.view
sidebar: cssref
---

Hàm **`view()`** [CSS](/en-US/docs/Web/CSS/Reference/Values/Functions) được dùng với thuộc tính {{cssxref("animation-timeline")}} để tạo [tiến trình xem ẩn danh](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#anonymous_view_progress_timeline_the_view_function) dựa trên thời điểm một phần tử xuất hiện trong {{glossary("scroll container")}} gần nhất. Bạn có thể điều chỉnh trục theo dõi và các giá trị inset tùy chọn để kiểm soát thời điểm phần tử được xem là "trong tầm nhìn".

## Cú pháp

```css
/* Không có tham số */
animation-timeline: view();

/* Tham số trục */
animation-timeline: view(block);
animation-timeline: view(x);

/* Tham số inset */
animation-timeline: view(auto);
animation-timeline: view(20%);
animation-timeline: view(200px);
animation-timeline: view(20% 40%);
animation-timeline: view(20% 200px);
animation-timeline: view(100px 200px);
animation-timeline: view(auto 200px);

/* Cả trục và inset */
animation-timeline: view(block auto);
animation-timeline: view(inline 20%);
animation-timeline: view(x 200px auto);
```

### Tham số

- `<axis>`
  - : Xác định hướng cuộn được sử dụng bởi tiến trình xem. Giá trị có thể là một trong các từ khóa {{cssxref("axis")}}: `block`, `inline`, `x`, hoặc `y`. Giá trị mặc định là `block`.
- `<view-timeline-inset>`
  - : Xác định vùng inset để định nghĩa khi nào một phần tử được xem là "trong tầm nhìn". Giá trị có thể là từ khóa `auto` hoặc tối đa hai giá trị {{cssxref("length-percentage")}}.

## Mô tả

Tiến trình xem tiến triển dựa trên sự thay đổi trong khả năng hiển thị của phần tử chủ thể bên trong scroll container gần nhất. Hàm `view()` được dùng với thuộc tính {{cssxref("animation-timeline")}} để tạo tiến trình xem như vậy.

Các tham số của hàm có thể chỉ định trục thanh cuộn mà tiến trình được theo dõi và các giá trị inset điều chỉnh vị trí của hộp mà chủ thể được xem là hiển thị.

- **Trục**: Mặc định, `view()` sử dụng trục block. Bạn có thể thay đổi điều này bằng cách cung cấp giá trị `<axis>` rõ ràng. Nếu trục được chọn không có thanh cuộn, thì tiến trình hoạt hình sẽ không hoạt động (tiến trình bằng không).
- **Inset**: Mặc định, tiến trình ở `0%` (keyframe `from` trong hoạt hình {{cssxref("@keyframes")}}) khi chủ thể lần đầu hiển thị tại một cạnh của scroller, và ở `100%` (keyframe `to`) khi cạnh viền ngoài của chủ thể chạm cạnh đối diện của scroller. Bạn có thể kiểm soát các điểm này với tham số `<view-timeline-inset>`.
  Hoạt hình kéo dài miễn là phần tử nằm trong tầm nhìn đã điều chỉnh inset. Inset được dùng để xác định phần tử có trong tầm nhìn không, từ đó xác định độ dài của tiến trình hoạt hình. Inset gồm tối đa hai giá trị, mỗi giá trị có thể là `auto` hoặc {{cssxref("length-percentage")}}.
  - Giá trị đầu tiên xác định phần bắt đầu, một offset hướng vào từ đầu của scrollport.
  - Giá trị thứ hai, nếu có, xác định phần kết thúc, một offset hướng vào từ cuối của scrollport. Nếu giá trị lớn hơn `0`, nó xác định một inset (dương). Giá trị âm xác định điều chỉnh outset với [scrollport](/en-US/docs/Glossary/Scroll_container#scrollport).

Thành phần trục và inset có thể được chỉ định theo bất kỳ thứ tự nào. Trong thành phần inset, giá trị đầu tiên xác định inset bắt đầu, và giá trị thứ hai xác định inset kết thúc.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Tạo tiến trình xem ẩn danh sử dụng `view()`

Trong ví dụ này, chúng ta tạo một tiến trình xem ẩn danh cho phần tử có class `subject` và `animation` sử dụng `animation-timeline: view()`. Kết quả là khi bạn cuộn tài liệu, phần tử này sẽ được hoạt hình khi di chuyển lên qua tài liệu.

#### HTML

HTML cho ví dụ như sau.

```html
<div class="content">
  <h1>Content</h1>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Risus quis varius quam
    quisque id. Et ligula ullamcorper malesuada proin libero nunc consequat
    interdum varius. Elit ullamcorper dignissim cras tincidunt lobortis feugiat
    vivamus at augue.
  </p>

  <p>
    Dolor sed viverra ipsum nunc aliquet. Sed sed risus pretium quam vulputate
    dignissim. Tortor aliquam nulla facilisi cras. A erat nam at lectus urna
    duis convallis convallis. Nibh ipsum consequat nisl vel pretium lectus.
    Sagittis aliquam malesuada bibendum arcu vitae elementum. Malesuada bibendum
    arcu vitae elementum curabitur vitae nunc sed velit.
  </p>

  <div class="subject-container">
    <div class="subject animation"></div>
  </div>

  <p>
    Adipiscing enim eu turpis egestas pretium aenean pharetra magna ac. Arcu
    cursus vitae congue mauris rhoncus aenean vel. Sit amet cursus sit amet
    dictum. Augue neque gravida in fermentum et. Gravida rutrum quisque non
    tellus orci ac auctor augue mauris. Risus quis varius quam quisque id diam
    vel quam elementum. Nibh praesent tristique magna sit amet purus gravida
    quis. Duis ultricies lacus sed turpis tincidunt id aliquet. In egestas erat
    imperdiet sed euismod nisi. Eget egestas purus viverra accumsan in nisl nisi
    scelerisque. Netus et malesuada fames ac.
  </p>
</div>
<div class="overlay top">inset start 50%</div>
<div class="overlay bottom">inset end 10%</div>
```

#### CSS

Class `subject` và `content` được tạo kiểu tối giản, và nội dung văn bản có một số thiết lập phông chữ cơ bản:

```css
.subject {
  width: 300px;
  height: 200px;
  background-color: deeppink;
}

.content {
  width: 75%;
  max-width: 800px;
  margin: 0 auto;
}

p {
  font-size: 1.5rem;
  line-height: 1.8;
}
```

Để giúp hiển thị kết quả, chúng ta đã định nghĩa một vài class bổ sung. Class `subject-container` hiển thị ranh giới của hoạt hình. Và các lớp phủ bán trong suốt `top` và `bottom` đánh dấu scrollport đã điều chỉnh inset.

```css
.subject-container {
  border: 2px dashed black;
  width: 300px;
  margin: 0 auto;
}

.overlay {
  position: fixed;
  width: 100%;
  background-color: #f5deb3aa;
  display: flex;
  font-size: 1.2rem;
  font-weight: bold;
  color: red;
  justify-content: flex-end;
}

.top {
  top: 0;
  height: 50%;
  align-items: end;
}

.bottom {
  bottom: 0;
  height: 10%;
}
```

Phần tử `<div>` có class `subject` cũng được thêm class `animation`. Hoạt hình `grow` khiến phần tử `subject` lớn lên hoặc thu nhỏ lại. Quy tắc `animation-timeline: view(block 55% 10%)` thiết lập phần tử được hoạt hình khi tiến qua tiến trình xem được tạo bởi scroll container gần nhất (trong trường hợp này là phần tử gốc của tài liệu).

Khi cuộn xuống, hãy lưu ý cách các giá trị inset `50% 10%` khiến hoạt hình bắt đầu khi phần tử cách 10% từ dưới cùng của scrollport và kết thúc khi cách 50% từ trên cùng. Khi hoạt hình tiến theo timeline, `subject` lớn dần. Ngược lại, khi cuộn lên, hoạt hình diễn ra ngược chiều, bắt đầu từ 50% từ trên cùng, đi lùi qua các keyframe, và kết thúc ở 10% từ dưới cùng. Vậy khi hoạt hình chạy ngược, `subject` thu nhỏ lại.

Một điểm quan trọng cần nhớ là hoạt hình chỉ kéo dài khi phần tử `subject` trong tầm nhìn, được định nghĩa ở đây bởi các giá trị inset `50% 10%`.

```css
.animation {
  animation-timeline: view(block 50% 10%);
  animation-name: grow;
  animation-duration: 1ms; /* Firefox requires this to apply the animation */
  animation-timing-function: linear;
}

@keyframes grow {
  from {
    transform: scaleX(0);
  }

  to {
    transform: scaleX(1);
  }
}
```

```css hidden
@layer no-support {
  @supports not (animation-timeline: view()) {
    body::before {
      content: "Your browser doesn't support the CSS `view()` function.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

#### Kết quả

Cuộn để xem phần tử có class `subject` được hoạt hình khi vào và rời khỏi tầm nhìn inset đã điều chỉnh.

{{EmbedLiveSample("Examples", "100%", "480px")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- [Scroll-driven animation timelines](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) module
- [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) module
- {{domxref("ViewTimeline")}}
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
