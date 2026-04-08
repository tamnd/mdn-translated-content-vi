---
title: animation-timeline
slug: Web/CSS/Reference/Properties/animation-timeline
page-type: css-property
browser-compat: css.properties.animation-timeline
sidebar: cssref
---

Thuộc tính **`animation-timeline`** trong [CSS](/en-US/docs/Web/CSS) chỉ định dòng thời gian dùng để kiểm soát tiến trình của hoạt ảnh CSS.

## Cú pháp

```css
/* Từ khóa */
animation-timeline: none;
animation-timeline: auto;

/* Dòng thời gian được đặt tên */
animation-timeline: --timeline_name;

/* Dòng thời gian tiến trình cuộn trang ẩn danh */
animation-timeline: scroll();
animation-timeline: scroll(x root);

/* Dòng thời gian tiến trình view ẩn danh */
animation-timeline: view();
animation-timeline: view(inline);
animation-timeline: view(x 200px auto);

/* Nhiều giá trị */
animation-timeline: --progress-bar-timeline, --carousel-timeline;
animation-timeline: auto, view(20% 80%), none, scroll(inline nearest);

/* Giá trị toàn cục */
animation-timeline: inherit;
animation-timeline: initial;
animation-timeline: revert;
animation-timeline: revert-layer;
animation-timeline: unset;
```

### Giá trị

Thuộc tính `animation-timeline` được chỉ định là một hoặc nhiều giá trị phân cách bằng dấu phẩy, mỗi giá trị có thể là một trong các giá trị sau:

- `none`
  - : Hoạt ảnh không được liên kết với dòng thời gian nào, và không có hoạt ảnh nào xảy ra.

- `auto`
  - : Dòng thời gian của hoạt ảnh là {{domxref("DocumentTimeline")}} mặc định của tài liệu. Đây là giá trị mặc định.

- {{cssxref("animation-timeline/scroll", "scroll()")}}
  - : Xác định phần tử gốc, scroller gần nhất, hoặc chính nó như một dòng thời gian tiến trình cuộn trang ẩn danh, và tùy chọn hướng cuộn của scroller.

- {{cssxref("animation-timeline/view", "view()")}}
  - : Xác định container cuộn tổ tiên gần nhất như một dòng thời gian tiến trình view ẩn danh, tùy chọn ghi đè hướng trục `baseline` mặc định và các inset bắt đầu và kết thúc `auto`.

- `<dashed-ident>`
  - : Tên của dòng thời gian tiến trình cuộn trang hoặc view, như được xác định bởi thuộc tính {{cssxref('scroll-timeline-name')}} hoặc {{cssxref('view-timeline-name')}} của container cuộn (hoặc thuộc tính viết tắt {{cssxref('scroll-timeline')}} hoặc {{cssxref('view-timeline')}}).

## Mô tả

Dòng thời gian mặc định cho hoạt ảnh keyframe CSS là {{domxref("DocumentTimeline")}} dựa trên thời gian. Thuộc tính `animation-timeline` có thể được dùng để đặt dòng thời gian tiến trình cuộn trang hoặc view được đặt tên hoặc ẩn danh. Ngoài ra, nó có thể được dùng để đặt tường minh dòng thời gian tài liệu dựa trên thời gian mặc định để kiểm soát tiến trình của hoạt ảnh phần tử hoặc không có dòng thời gian nào, trong trường hợp đó phần tử không tạo hoạt ảnh.

Các loại dòng thời gian sau có thể được đặt qua `animation-timeline`:

- {{domxref("DocumentTimeline")}}
  - : Dòng thời gian tài liệu mặc định, được tiến triển theo thời gian kể từ khi tài liệu được tải lần đầu trong trình duyệt. Đây là dòng thời gian truyền thống liên kết với hoạt ảnh CSS và được chọn bằng giá trị `auto`, hoặc bằng cách không chỉ định giá trị `animation-timeline` nào, vì đây là giá trị mặc định.
- [Dòng thời gian tiến trình cuộn trang](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#scroll_progress_timelines)
  - : Hoạt ảnh được tiến triển bằng cách cuộn một phần tử có thể cuộn, hay _scroller_, theo chiều ngang hoặc dọc. Phần tử cung cấp dòng thời gian tiến trình cuộn trang có thể được chỉ định theo hai cách:
    - [Dòng thời gian tiến trình cuộn trang được đặt tên](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_scroll_progress_timelines)
      - : Scroller được đặt tên tường minh bằng cách đặt thuộc tính {{cssxref("scroll-timeline-name")}} (hoặc thuộc tính viết tắt {{cssxref("scroll-timeline")}}) thành {{cssxref("dashed-ident")}}; tên `<dashed-ident>` đó sau đó được đặt làm giá trị của thuộc tính `animation-timeline`.
    - [Dòng thời gian tiến trình cuộn trang ẩn danh](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#anonymous_scroll_progress_timelines)
      - : Thuộc tính `animation-timeline` của phần tử cần tạo hoạt ảnh được đặt thành hàm {{cssxref("animation-timeline/scroll", "scroll()")}}. Hai tham số tùy chọn của hàm xác định scroller cung cấp dòng thời gian tiến trình cuộn trang và trục cuộn cần dùng.
- [Dòng thời gian tiến trình view](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#view_progress_timelines)
  - : Hoạt ảnh keyframe được tiến triển dựa trên sự thay đổi khả năng hiển thị của một phần tử bên trong scroller; phần tử này được gọi là _chủ thể_. Theo mặc định, dòng thời gian ở `0%` khi phần tử lần đầu tiên hiển thị ở một cạnh của scroller, và ở `100%` khi cạnh cuối của nó thoát ra cạnh đối diện của scroller. Dòng thời gian tiến trình view có thể được chỉ định theo hai cách:
    - [Dòng thời gian tiến trình view được đặt tên](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#named_view_progress_timeline)
      - : Chủ thể được đặt tên tường minh bằng cách đặt thuộc tính {{cssxref("view-timeline-name")}} (hoặc thuộc tính viết tắt {{cssxref("view-timeline")}}) thành `<dashed-ident>`. Khi bạn đặt thuộc tính `animation-timeline` của phần tử cần tạo hoạt ảnh thành `<dashed-ident>` đó, khả năng hiển thị của chủ thể kiểm soát tiến trình hoạt ảnh của phần tử. Lưu ý rằng phần tử cần tạo hoạt ảnh không nhất thiết phải giống với chủ thể.
    - [Dòng thời gian tiến trình view ẩn danh](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#anonymous_view_progress_timeline_the_view_function)
      - : Thuộc tính `animation-timeline` của phần tử cần tạo hoạt ảnh được đặt thành hàm {{cssxref("animation-timeline/view", "view()")}}, khiến nó được tạo hoạt ảnh dựa trên khả năng hiển thị của nó trong scrollport của container cha gần nhất có thể cuộn.
- Không có dòng thời gian
  - : Tất cả dòng thời gian hoạt ảnh có thể bị xóa bằng cách chọn giá trị `none`. Khi `animation-timeline: none` được đặt, không có hoạt ảnh nào xảy ra vì không có dòng thời gian nào để theo dõi.

Thuộc tính `animation-timeline` được bao gồm trong viết tắt {{cssxref("animation")}} như một giá trị chỉ đặt lại. Điều này có nghĩa là bao gồm `animation` sẽ đặt lại giá trị `animation-timeline` đã khai báo trước về `auto`; không thể đặt giá trị cụ thể thông qua viết tắt. Khi tạo [hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines), bạn cần khai báo `animation-timeline` sau khi khai báo bất kỳ viết tắt `animation` nào để có hiệu lực.

Nếu bạn chỉ định nhiều giá trị phân cách bằng dấu phẩy, mỗi giá trị `animation-timeline` được áp dụng cho một hoạt ảnh theo thứ tự xuất hiện của các giá trị {{cssxref("animation-name")}}. Nếu số giá trị trong khai báo `animation-timeline` lớn hơn số giá trị `animation-name`, các giá trị dòng thời gian thừa sẽ bị bỏ qua. Nếu có ít giá trị `animation-timeline` hơn giá trị `animation-name`, các giá trị `animation-timeline` sẽ được lặp lại theo thứ tự cho đến khi mỗi `animation-name` có dòng thời gian liên kết.

Nếu hai hoặc nhiều dòng thời gian có cùng tên `<dashed-ident>` và cùng độ đặc hiệu, dòng thời gian được khai báo cuối cùng trong cascade sẽ được sử dụng. Nếu không tìm thấy dòng thời gian nào khớp với tên được bao gồm trong `animation-timeline`, `animation-name` liên kết với giá trị đó sẽ không được liên kết với dòng thời gian nào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách sử dụng cơ bản của thuộc tính `animation-timeline`, cùng với các giá trị `none`, `auto`, và mặc định (`auto`).

#### HTML

Chúng ta có một {{htmlelement("article")}} với ba phần tử con {{htmlelement("section")}}. Mỗi `<section>` có một `id` duy nhất và một phần tử con {{htmlelement("div")}}.

```html
<article>
  <section id="none">
    <div></div>
  </section>
  <section id="auto">
    <div></div>
  </section>
  <section id="default">
    <div></div>
  </section>
</article>
```

#### CSS

Chúng ta sử dụng [bố cục hộp linh hoạt](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) để đặt ba section cạnh nhau. Chúng ta dùng [nội dung được tạo](/en-US/docs/Web/CSS/Guides/Generated_content) để hiển thị `id`. Chúng ta tạo kiểu tất cả phần tử như nhau, áp dụng hoạt ảnh {{cssxref("@keyframes")}} `rotate` xoay phần tử 1 vòng đầy đủ. Sử dụng viết tắt {{cssxref("animation")}}, chúng ta khai báo các lần lặp vô hạn, 2 giây, tuyến tính của hoạt ảnh `rotate`, xen kẽ hướng của mỗi hoạt ảnh.

```css
article {
  display: flex;
  gap: 10px;
  text-align: center;
}
section {
  background-color: beige;
  padding: 20px;
}
section::after {
  content: attr(id);
  display: block;
}
div {
  height: 100px;
  width: 100px;
  background-color: magenta;
  animation: rotate 2s infinite alternate linear;
}
@keyframes rotate {
  to {
    rotate: 1turn;
  }
}
```

Sự khác biệt duy nhất là khai báo `animation-timeline` (hoặc không có trong trường hợp `default`) cho mỗi `<div>`.

```css
#none div {
  animation-timeline: none;
}
#auto div {
  animation-timeline: auto;
}
```

```css hidden
@layer no-support {
  @supports not (animation-timeline: none) {
    body::before {
      content: "Your browser doesn't support the `animation-timeline` property";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

Vì thuộc tính `animation-timeline` được bao gồm trong viết tắt {{cssxref("animation")}} như một giá trị chỉ đặt lại, `animation-timeline` phải đặt sau viết tắt `animation`, hoặc được áp dụng với độ đặc hiệu cao hơn viết tắt `animation`, để có hiệu lực.

#### Kết quả

{{EmbedLiveSample("basic usage", "100%", "170px")}}

Lưu ý rằng khai báo giá trị `auto` có tác dụng tương tự như để `animation-timeline` mặc định về giá trị đó, và `none` xóa tất cả dòng thời gian khỏi phần tử, do đó không có hoạt ảnh trong trường hợp `none`.

### Đặt dòng thời gian tiến trình cuộn trang được đặt tên

Trong ví dụ này, dòng thời gian hoạt ảnh được đặt thành dòng thời gian tiến trình cuộn trang theo chiều ngang.

#### HTML

Container của chúng ta bao gồm ba phần tử stretcher đủ rộng để đảm bảo container là container cuộn. Phần tử ở giữa chứa một hình dạng mà chúng ta sẽ tạo hoạt ảnh.

```html live-sample___named_scroll live-sample___anonymous_scroll
<div id="container">
  <div class="stretcher"></div>
  <div class="stretcher">
    <div id="shape"></div>
  </div>
  <div class="stretcher"></div>
</div>
```

#### CSS

Chúng ta xác định container là flex container, đặt {{cssxref("width")}} trên container bằng một nửa chiều rộng của các flex children kết hợp. Thêm giá trị `scroll` cho {{cssxref("overflow-x")}} đặt nó có thanh cuộn ngang.

Dòng thời gian tiến trình cuộn trang, được xác định bằng thuộc tính {{cssxref("scroll-timeline-name")}} và {{cssxref("scroll-timeline-axis")}}, được đặt tên là `--square-timeline`. Dòng thời gian này được áp dụng cho phần tử `#shape` bằng `animation-timeline: --square-timeline`.

```css live-sample___named_scroll live-sample___anonymous_scroll
#container {
  display: flex;
  width: 300px;
  border: 1px solid;

  overflow-x: scroll;
  scroll-timeline-axis: inline;
  scroll-timeline-name: --square-timeline;
}

.stretcher {
  flex: 0 0 200px;
}
```

CSS bên dưới xác định một hình vuông xoay theo các hướng xen kẽ theo dòng thời gian được cung cấp bởi thuộc tính `animation-timeline`, được đặt thành dòng thời gian `--square-timeline` được đặt tên ở trên. Hoạt ảnh được đặt để xảy ra hai lần, theo các hướng xen kẽ, khi nó đi qua viewport. Chúng ta đã thêm [góc khắc](/en-US/docs/Web/CSS/Reference/Properties/corner-shape) để làm hiệu ứng hoạt ảnh rõ ràng hơn.

```css live-sample___named_scroll live-sample___anonymous_scroll
#shape {
  background-color: deeppink;
  width: 100px;
  height: 100px;
  border-radius: 25px;
  corner-shape: notch;

  animation: rotateAnimation 1ms linear 2 alternate;
  animation-timeline: --square-timeline;
}

@keyframes rotateAnimation {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
```

```css hidden live-sample___named_scroll live-sample___named_view
@layer no-support {
  @supports not (animation-timeline: --square-timeline) {
    body::before {
      content: "Your browser doesn't support named animation timelines.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

#### Kết quả

Cuộn để xem phần tử được tạo hoạt ảnh.

{{EmbedLiveSample("named_scroll", "100%", "150px")}}

### Đặt dòng thời gian tiến trình cuộn trang ẩn danh

Ví dụ này mở rộng ví dụ trước, áp dụng dòng thời gian tiến trình cuộn trang ẩn danh bằng hàm `scroll()`.

#### CSS

Chúng ta bao gồm tất cả CSS từ ví dụ trước, chỉ đặt thuộc tính `animation-timeline` để ghi đè giá trị của ví dụ trước. Dòng thời gian được cung cấp bởi giá trị `scroll(inline nearest)`, chọn thanh cuộn theo hướng inline của phần tử tổ tiên gần nhất có thanh cuộn. Đây là thanh cuộn dọc của phần tử `#container`, vì các phần tử `.stretcher` không có nội dung tràn và do đó không phải là container cuộn.

```css live-sample___anonymous_scroll
#shape {
  animation-timeline: scroll(inline nearest);
}
```

```css hidden live-sample___anonymous_scroll
@layer no-support {
  @supports not (animation-timeline: scroll()) {
    body::before {
      content: "Your browser doesn't support the scroll() function.";
      background-color: wheat;
      display: block;
      text-align: center;
      padding: 1em;
    }
  }
}
```

#### Kết quả

Cuộn để xem phần tử hình vuông được tạo hoạt ảnh.

{{EmbedLiveSample("anonymous_scroll", "100%", "150px")}}

### Đặt dòng thời gian tiến trình view được đặt tên

Trong ví dụ này, chúng ta minh họa cách tạo và áp dụng dòng thời gian tiến trình view được đặt tên. Hai phần tử sẽ được tạo hoạt ảnh, với các phần tử khác nhau đóng vai trò scroller.

#### HTML

```html-nolint hidden live-sample___named_view
<main class="scroller">
  <div class="container">
    <h1>Directions</h1>
    <h2>Lincoln Memorial to Martin Luther King, Jr. Memorial</h2>
    <ol>
      <li>Head south on Lincoln Memorial Circle</li>
      <li>Turn right toward Independence Ave</li>
      <li>Turn left onto Independence Ave</li>
      <li>Turn right onto West Basin Dr</li>
      <li>Look up when you reach 64 Independence Ave!</li>
    </ol>
    <section>
```

HTML của chúng ta bao gồm nhiều văn bản trong một container trong một scroller, được ẩn để ngắn gọn. Ở giữa khối văn bản, chúng ta bao gồm hai phần tử `<div>` mà chúng ta sẽ tạo hoạt ảnh dựa trên khả năng hiển thị của chính phần tử trong trường hợp đầu tiên và dựa trên khả năng hiển thị của phần tử cha trong trường hợp thứ hai:

```html live-sample___named_view
<div class="animated-element self">SELF</div>
<div class="animated-element parent">PARENT</div>
```

```html-nolint hidden live-sample___named_view
</section>
<h2>Martin Luther King, Jr. Memorial to Lincoln Memorial</h2>
<ol>
  <li>Head north toward Independence Ave SW</li
  ><li>Turn left onto Independence Ave</li
  ><li>Turn right toward the Korean War Veterans Memorial</li
  ><li>Take a photo of the memorial as you walk past it.</li
  ><li>Head north on Lincoln Memorial Circle</li
  ><li>Look up. You can't miss it!</li>
</ol>
  </div>
</main>
```

#### CSS

Chúng ta tạo một hoạt ảnh keyframe thay đổi độ mờ và tỷ lệ của phần tử, và áp dụng nó cho cả hai phần tử có hoạt ảnh:

```css live-sample___named_view
@keyframes animation-effect {
  0% {
    opacity: 0;
    scale: 0;
  }
  100% {
    opacity: 1;
    scale: 1;
  }
}

.animated-element {
  animation: animation-effect 1ms linear;
}
```

Phần tử `self` được đặt tên tường minh là scroller cho chính nó bằng cách đặt thuộc tính `view-timeline-name` thành `<dashed-ident>` và cũng đặt tên `<dashed-ident>` đó làm giá trị của thuộc tính `animation-timeline`. Trong trường hợp `parent`, chúng ta đặt `container` làm scroller cho phần tử có hoạt ảnh:

```css live-sample___named_view
.self {
  view-timeline-name: --self-scroller-element;
  animation-timeline: --self-scroller-element;
}
.container {
  view-timeline-name: --parent-scroller-element;
}
.parent {
  animation-timeline: --parent-scroller-element;
}
```

Các khai báo CSS bổ sung được ẩn để ngắn gọn.

```css hidden live-sample___named_view
@layer setup {
  section {
    display: flex;
    gap: 10px;
  }
  main {
    width: 400px;
    padding: 1em;
    height: 300px;
    overflow: scroll;
    border: 1px solid;
    background-color: beige;
    font-family: sans-serif;
  }

  li {
    margin-bottom: 0.75lh;
  }

  .animated-element {
    height: 200px;
    width: calc(100% - 2em);
    margin: auto;
    background-color: forestgreen;
    background-image:
      repeating-linear-gradient(37deg, transparent 0 52px, beige 52px 57px),
      repeating-linear-gradient(94deg, transparent 0 52px, beige 52px 57px);
    border: 1px solid;
    font-size: 3em;
    place-content: center;
  }
}
```

#### Kết quả

Cuộn container để xem cả hai phần tử tạo hoạt ảnh.

{{EmbedLiveSample("named_view", "100%", "350px")}}

Lưu ý cách khả năng hiển thị của phần tử `self` kiểm soát hoạt ảnh của chính nó. Trong trường hợp này, phần tử ở keyframe `0%` khi cạnh trên vào viewport hay phần hiển thị của scrollport, và chỉ đến keyframe `100%` khi cạnh dưới thoát khỏi viewport.

Phần tử `parent` chỉ hiển thị khi phần tử cha hiển thị, nghĩa là khi nó vào tầm nhìn, nó đã đi qua khoảng `25%` của hoạt ảnh. Nó chỉ đi qua khoảng `75%` hoạt ảnh khi thoát ra đầu viewport.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timing-function")}}
- {{cssxref("scroll-timeline-name")}}, {{cssxref("scroll-timeline-axis")}}, {{cssxref("scroll-timeline")}}
- {{cssxref("view-timeline-name")}}, {{cssxref("view-timeline-axis")}}, {{cssxref("view-timeline")}}, {{cssxref("view-timeline-inset")}}
- {{domxref("AnimationTimeline")}}
- [Hướng dẫn: Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using)
- [Hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations) module
- [Hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) module
