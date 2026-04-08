---
title: Scroll-driven animation timelines
slug: Web/CSS/Guides/Scroll-driven_animations/Timelines
page-type: guide
sidebar: cssref
---

Một UI pattern phổ biến bao gồm các phần tử animate khi người dùng cuộn theo chiều dọc hoặc ngang trên trang. Các _scroll-driven animation_ này xảy ra trực tiếp khi cuộn trang hoặc một scroll container tràn trong trang.

Các thuộc tính được định nghĩa trong module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) mở rộng [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) bằng cách cho phép animate các giá trị thuộc tính được định nghĩa trong animation {{cssxref("@keyframes")}} để phản hồi tương tác người dùng.

Hướng dẫn này cung cấp tổng quan về cách dùng CSS để tạo scroll-driven animation timeline và animation.

## Scroll-driven animation là gì?

Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) định nghĩa các thuộc tính cho phép [CSS keyframe animation](/en-US/docs/Web/CSS/Guides/Animations/Using#defining_an_animation_sequence_using_keyframes) được liên kết với cuộn.

### Tiến triển của timeline

Animation có thể được đặt để tiến triển theo _scroll-based timeline_ thay vì timeline tài liệu dựa trên thời gian mặc định, mà không cần JavaScript. CSS cho phép chúng ta [xác định animation timeline nào sẽ dùng](#animation_timelines), bao gồm animate các phần tử bằng cách cuộn một phần tử có thể cuộn thay vì bằng sự trôi qua của thời gian.

### Lợi ích về hiệu suất

CSS scroll-driven animation có hiệu suất tốt. JavaScript scroll-driven animation yêu cầu [`scroll`](/en-US/docs/Web/API/Document/scroll_event) event listener và các đối tượng {{domxref("IntersectionObserver")}} trên {{glossary("main thread")}} để theo dõi các phần tử qua [scrollport](/en-US/docs/Glossary/Scroll_container#scrollport). Bất cứ khi nào bạn dựa vào main thread để render hiệu ứng bằng JavaScript, bạn có nguy cơ chặn main thread, có thể dẫn đến trang không phản hồi và trải nghiệm người dùng kém, hoặc {{glossary("jank")}}.

## Nền tảng

Scroll-driven animation xây dựng trên [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) và [Web Animations API](/en-US/docs/Web/API/Web_Animations_API). Trước khi tạo scroll-driven animation, bạn phải hiểu về animation {{cssxref("@keyframes")}} trong CSS. Xem [hướng dẫn sử dụng CSS animation](/en-US/docs/Web/CSS/Guides/Animations/Using) để tìm hiểu thêm.

Trong CSS, animation được tạo bằng cách gắn keyframe animation vào một phần tử dùng thuộc tính {{cssxref("animation-name")}} (hoặc shorthand {{cssxref("animation")}}). Theo mặc định, animation chạy trên timeline tài liệu mặc định, di chuyển từ keyframe `from` đến keyframe `to` theo thời gian trôi qua, với animation kéo dài bằng thời gian được định nghĩa bởi giá trị thuộc tính {{cssxref("animation-duration")}}. Khi được đặt để chạy trên timeline tài liệu mặc định, animation chạy đến hoàn thành trừ khi bị ngăn không cho vậy, ví dụ bằng cách có {{cssxref("animation-play-state")}} được đặt thành `paused` hoặc bằng cách xóa `animation-name` khỏi phần tử.

Scroll-driven animation là CSS animation không chạy trên [DocumentTimeline](/en-US/docs/Web/API/DocumentTimeline) mặc định. Thay vào đó, chúng chạy trên scroll-progress hoặc view-progress timeline, được điều khiển bởi cuộn nội dung của phần tử. Có một liên kết trực tiếp giữa hành động cuộn của người dùng và tiến triển của animation qua các keyframe `@keyframe`. Khi người dùng cuộn lên, xuống, trái hoặc phải, animation di chuyển tiến hoặc lùi qua tiến triển keyframe. Khi cuộn tạm dừng, animation cũng tạm dừng, như thể `animation-play-state` được đặt thành `pause`.

## Animation timeline

Thuộc tính {{cssxref("animation-timeline")}}, được định nghĩa trong module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations), được dùng để đặt timeline cho animation.

Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) định nghĩa các tính năng để đặt `animation-timeline` là scroll-progress hoặc view-progress timeline. Bạn có thể tường minh [đặt tên một phần tử là timeline controller](#named_scroll_progress_timelines) dùng các thuộc tính `scroll-timeline-*` và `view-timeline-*`, rồi đặt tên đó làm `animation-timeline` của phần tử con. Bạn cũng có thể định nghĩa _anonymous scroll progress timeline_ và _anonymous view progress timeline_ dùng các hàm [`scroll()`](#scroll_progress_timelines) và [`view()`](#view_progress_timelines).

Ngoài ra, thuộc tính `animation-timeline` có thể được dùng để tường minh xác định rằng [timeline tài liệu mặc định được dùng](#regular_css_animations_default_document_timeline) hoặc để chỉ định rằng [animation không có timeline](#removing_an_animations_timeline), và do đó không nên xảy ra.

### CSS animation thông thường: timeline tài liệu mặc định

Đặt `animation-timeline` tường minh thành `auto`, hoặc bỏ qua thuộc tính và để nó mặc định thành `auto`, đặt timeline là timeline tài liệu mặc định. Khi được đặt thành giá trị mặc định này, tiến triển của animation được xác định bởi {{cssxref("animation-duration")}}, {{cssxref("animation-delay")}}, và lượng thời gian đã trôi qua kể từ khi animation được liên kết với phần tử qua thuộc tính `animation-name`. Timeline dựa trên thời gian là timeline truyền thống liên quan đến CSS animation.

```css live-sample___regular
:checked ~ .container > .item {
  animation-name: action;
  animation-duration: 3s;
  animation-delay: 500ms;
  animation-timeline: auto;
}
```

Chúng ta tạo animation keyframe xoay được gọi là `action`:

```css live-sample___regular live-sample___named_scroll live-sample___anon_scroll
@keyframes action {
  from {
    rotate: 45deg;
  }
  to {
    rotate: 765deg;
  }
}
```

```html hidden live-sample___regular
<input type="checkbox" id="i" />
<label for="i">
  Check to apply the animation. Uncheck to remove the animation
</label>
<div class="container">
  <span class="item"></span>
</div>
```

```css hidden live-sample___regular
div {
  width: 400px;
  height: 100px;
  border: 1px solid;
  background-color: palegoldenrod;
  position: relative;
}
span {
  --size: 50px;
  height: var(--size);
  width: var(--size);
  background-color: magenta;
  border: 1px solid;
  position: absolute;
  left: calc(50% - (var(--size) / 2));
  top: calc(50% - (var(--size) / 2));
}
```

Khi checkbox được chọn, animation `action` được áp dụng cho phần tử. Khi bỏ chọn, animation không được áp dụng cho `<div>`.

{{EmbedLiveSample("regular", "100%", "150")}}

Hãy thử chọn checkbox. Không có gì xảy ra trong nửa giây animation delay. Sau đó, khi animation bắt đầu, hộp sẽ nhảy đến góc xoay 45 độ, và sau đó mất 3 giây để xoay thêm 720 độ, hoặc thêm hai vòng đầy đủ. Sau tổng cộng ba giây rưỡi, animation kết thúc và `<div>` sẽ trở về trạng thái không xoay mặc định.

> [!NOTE]
> `animation-timeline` được đặt lại thành giá trị mặc định `auto` bởi shorthand {{cssxref("animation")}}, nhưng không thể được đặt bằng shorthand. Do đó, khi tạo scroll-driven animation, luôn khai báo `animation-timeline` sau bất kỳ khai báo shorthand `animation` nào để đạt hiệu ứng mong muốn.

## Scroll progress timeline

Với _scroll progress timeline_, timeline tiến triển dựa trên việc cuộn phần tử có thể cuộn (_scroller_) từ trên xuống dưới (hoặc trái sang phải) và ngược lại. Theo mặc định, vị trí trong phạm vi cuộn được chuyển đổi thành phần trăm tiến triển — `0%` ở đầu và `100%` ở cuối. <!--This [animation range can be controlled](#controlling_the_animation_range) via the {{cssxref("animation-range")}} properties.-->

Để tạo scroll progress timeline, giá trị `animation-timeline` phải tham chiếu đến scroller, có thể được đặt tên hoặc ẩn danh.

### Named scroll progress timeline

_Named scroll progress timeline_ là timeline trong đó scroller được đặt tên tường minh bằng thuộc tính {{cssxref("scroll-timeline-name")}} (hoặc shorthand {{cssxref("scroll-timeline")}}). Tên là một {{cssxref("dashed-ident")}}. Scroller được liên kết với phần tử cần animate bằng cách chỉ định `scroll-timeline-name` của nó làm giá trị của thuộc tính `animation-timeline` của phần tử đó.

HTML của chúng ta bao gồm ba phần tử: `item`, phần tử chúng ta sẽ animate; `container`, phần tử chúng ta sẽ cuộn; và scroller. `container` cần đủ lớn để tràn ra ngoài `scroller` cha của nó: Nếu không có cuộn, sẽ không có scroll timeline.

```html live-sample___named_scroll live-sample___anon_scroll
<main class="scroller">
  <div class="container">
    <span class="item"></span>
  </div>
</main>
```

Chúng ta cung cấp một số style cơ bản. Những style quan trọng bao gồm đặt chiều cao cho container lớn hơn scroller, rồi đặt overflow để cho phép cuộn:

```css live-sample___named_scroll live-sample___anon_scroll
.scroller {
  width: 400px;
  height: 100px;
  overflow: scroll;
}
.container {
  height: 200px;
}
```

Đặt `animation-timeline` trên phần tử được animate khớp với `scroll-timeline-name` của một phần tử tổ tiên là điều tạo ra named scroll progress timeline. Chúng ta cũng phải bao gồm animation, điều chúng ta làm bằng cách đặt giá trị thành phần `animation-name` của shorthand {{cssxref("animation")}} thành tên {{cssxref("custom-ident")}} của animation keyframe của chúng ta:

```css live-sample___named_scroll
.scroller {
  scroll-timeline-name: --rotate;
}
.item {
  animation: action 1ms linear;
  animation-timeline: --rotate;
}
```

```css hidden live-sample___named_scroll live-sample___anon_scroll
main {
  border: 1px solid;
  background-color: palegoldenrod;
}
div {
  position: relative;
}
span {
  --size: 50px;
  height: var(--size);
  width: var(--size);
  background-color: magenta;
  border: 1px solid;
  position: absolute;
  left: calc(50% - (var(--size) / 2));
  top: calc(50% - (var(--size) / 2));
}
```

Trong trường hợp này, chúng ta không có checkbox, vì tiến triển animation `action` được kiểm soát bởi việc cuộn scroller tràn, không giống như thời gian, không hết hạn.

{{EmbedLiveSample("named_scroll", "100%", "150")}}

Trước khi cuộn xảy ra, vị trí của container nằm ở đầu scroller và animation ở keyframe 0%. Hãy thử cuộn xuống. Khi bạn cuộn, animation tiến qua timeline, xoay thêm 720 độ. Khi bạn không thể cuộn nữa, tiến triển animation ở 100%, hoặc keyframe `to`. Phần tử được animate không trở về góc xoay mặc định trừ khi scroller được cuộn trở lại lên trên.

#### Thời gian animation

Bạn có thể đã chú ý rằng thành phần {{cssxref("animation-duration")}} của shorthand `animation` được đặt thành `1ms`. Khi tạo [CSS scroll-driven animation](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), việc chỉ định giá trị `animation-duration` không ảnh hưởng đến thời lượng của animation và không cần thiết. Tuy nhiên, thời lượng có thể ảnh hưởng đến animation timeline view progress phi tuyến tính, và Firefox yêu cầu `animation-duration` khác không để áp dụng animation cho phần tử. Vì những lý do này, thực hành phổ biến là đặt `animation-duration` thành `1ms`.

Đặt `animation-duration: 1ms` đảm bảo rằng animation hoạt động trong Firefox, hiệu ứng animation nhất quán trên tất cả trình duyệt, và animation bị ẩn nếu trình duyệt không hỗ trợ view progress animation timeline. Nếu trình duyệt hỗ trợ keyframe animation, animation sẽ không hiển thị với người dùng. Tuy nhiên, animation vẫn xảy ra và các animation event được kích hoạt.

### Anonymous scroll progress timeline

Bạn không cần đặt tên cho scroll progress timeline. Thay vào đó, bạn có thể liên kết _anonymous scroll progress timeline_ với animation. Trong trường hợp này, `animation-timeline` của phần tử cần animate được đặt thành hàm {{cssxref("animation-timeline/scroll", "scroll()")}}. Hàm này chọn scroller cung cấp scroll progress timeline và trục cuộn để sử dụng dựa trên các đối số tùy chọn bạn truyền vào. Một tham số là từ khóa [`<scroller>`](/en-US/docs/Web/CSS/Reference/Properties/animation-timeline/scroll#scroller) xác định mối quan hệ của phần tử scroller với phần tử hiện tại (`nearest`, `root` hoặc `self`). Tham số kia là giá trị [`<axis>`](/en-US/docs/Web/CSS/Reference/Properties/animation-timeline/scroll#axis) của thanh cuộn (`block`, `inline`, `y` hoặc `x`).

Ví dụ này sử dụng tất cả CSS giống như ví dụ trước, ngoại trừ `animation-timeline`, được chúng ta đặt thành hàm `scroll()`. Chúng ta cũng ghi đè kích thước của container để thay đổi hướng cuộn:

```css live-sample___anon_scroll
.item {
  animation: action 1ms linear;
  animation-timeline: scroll(nearest inline);
}
.container {
  inline-size: 800px;
  block-size: 100%;
}
```

{{EmbedLiveSample("anon_scroll", "100%", "150")}}

Chúng ta đặt {{cssxref("inline-size")}} trên container để nó tràn theo chiều inline, và đặt {{cssxref("block-size")}} thành `100%` để nó không còn tràn theo chiều block. Hãy thử cuộn theo chiều inline.

## View progress timeline

Bạn cũng có thể tiến hành animation dựa trên sự thay đổi về khả năng hiển thị của một phần tử bên trong scroller — điều này được thực hiện thông qua _view progress timeline_. Thay vì theo dõi scroll offset của scroll container, view progress timeline theo dõi vị trí tương đối của một phần tử, được gọi là _subject_, trong một scrollport. Sự tiến triển của các keyframe animation dựa trên _khả năng hiển thị_ của subject bên trong scroller. Khác với scroll progress timeline, với view progress timeline, bạn không thể chỉ định scroller — khả năng hiển thị của subject luôn được theo dõi trong scroll container tổ tiên gần nhất của nó.

Animation view progress timeline chỉ xảy ra khi phần tử hiển thị trong scrollport. Tiến triển timeline bắt đầu ở `0%` khi subject được theo dõi bắt đầu giao cắt với scrollport ở cạnh cuối block hoặc inline. `100%` xảy ra khi subject thoát khỏi scrollport ở cạnh bắt đầu block hoặc inline.

Vì `100%` thường đạt được khi phần tử rời khỏi viewport, bạn có thể muốn đặt hiệu ứng cuối cùng của animation trong khối keyframe xảy ra trước khi animation kết thúc. Bạn có thể đặt hiệu ứng hoàn thành trong khối keyframe `20%`, `50%` hoặc `80%` thay vì dùng keyframe `to` hoặc `100%` để đảm bảo phần tử hoàn thành animate trong khi vẫn còn trong view.

Với view progress timeline, bạn có thể điều chỉnh phạm vi hiển thị của view progress.
Dùng {{cssxref("view-timeline-inset")}}, một phần của shorthand {{cssxref("view-timeline")}}, để điều chỉnh khi nào subject được coi là trong view. Giá trị mặc định là `auto`. Tác động của bất kỳ giá trị inset không phải `auto` nào giống như bạn đã di chuyển các cạnh của scroll port: giá trị dương tạo ra điều chỉnh vào trong, và giá trị âm tạo ra điều chỉnh ra ngoài.

Tương tự như scroll progress timeline, view progress timeline có thể được đặt tên hoặc ẩn danh.

### Named view progress timeline

_Named view progress timeline_ là timeline trong đó subject được đặt tên tường minh bằng thuộc tính {{cssxref("view-timeline-name")}}, một thành phần của shorthand `view-timeline`. Tên `<dashed-ident>` sau đó được liên kết với phần tử cần animate bằng cách chỉ định nó làm giá trị của thuộc tính `animation-timeline` của phần tử đó.

Với named view progress timeline, phần tử cần animate không cần phải là subject. Nói cách khác, phần tử kiểm soát timeline không cần phải là phần tử đang được animate. Điều này có nghĩa là bạn có thể animate một phần tử dựa trên chuyển động của phần tử khác trong scroll container có thể cuộn của nó.

Ở đây chúng ta dùng thuộc tính {{cssxref("view-timeline-name")}} để đặt tên cho một phần tử, xác định bản thân phần tử đó là nguồn của view progress timeline. Sau đó chúng ta đặt tên đó làm giá trị của thuộc tính `animation-timeline`.

```css live-sample___named_view
.item {
  animation: action 1ms linear;

  view-timeline-name: --a-name;
  animation-timeline: --a-name;
}
```

Chúng ta áp dụng animation **trước** animation timeline, vì `animation` đặt lại `animation-timeline` thành `auto`.

Animation hơi khác so với các ví dụ trước ở chỗ hiệu ứng xoay bắt đầu ở `20%` và kết thúc ở `80%` của quá trình animation; điều này có nghĩa là phần tử sẽ không xoay tích cực khi lần đầu tiên vào view và sẽ ngừng xoay trước khi hoàn toàn ra khỏi view.

```css live-sample___named_view live-sample___anon_view
@keyframes action {
  0%,
  20% {
    rotate: 45deg;
  }
  80%,
  100% {
    rotate: 720deg;
  }
}
```

```css hidden live-sample___named_view live-sample___anon_view live-sample___anon_view_args
.scroller {
  width: 400px;
  height: 200px;
  line-height: 2;
  overflow: scroll;
  border: 1px solid;
  background-color: palegoldenrod;
}
.item {
  --size: 50px;
  height: var(--size);
  width: var(--size);
  background-color: magenta;
  border: 1px solid;
  left: calc(50% - (var(--size) / 2));
  top: calc(50% - (var(--size) / 2));
}
```

```html hidden live-sample___named_view live-sample___anon_view live-sample___anon_view_args
<main class="scroller">
  <p>Scroll down to view the animation</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div class="item"></div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>Scroll up to view the animation</p>
</main>
```

{{EmbedLiveSample("named_view", "100%", "250")}}

Cuộn phần tử vào view. Lưu ý rằng phần tử animate qua animation `@keyframes` khi nó di chuyển qua vùng hiển thị của scroller tổ tiên của nó.

### Anonymous view progress timeline: hàm `view()`

Ngoài ra, hàm {{cssxref("animation-timeline/view", "view()")}} có thể được đặt làm giá trị của thuộc tính `animation-timeline` để chỉ định rằng animation timeline của phần tử là _anonymous view progress timeline_. Điều này làm cho phần tử được animate dựa trên vị trí của nó bên trong scroller cha gần nhất.

Hàm `view()` tạo ra view timeline. Bạn gắn timeline vào phần tử muốn animate bằng thuộc tính `animation-timeline`. Hàm tạo ra view timeline cho mỗi phần tử khớp với selector.

Trong ví dụ này, chúng ta lại định nghĩa `animation` trước `animation-timeline`, để timeline không bị đặt lại. Sau đó chúng ta bao gồm hàm `view()` không có đối số. Chúng ta không chỉ định scroller, vì theo định nghĩa, khả năng hiển thị của subject được theo dõi bởi scroller tổ tiên gần nhất của nó.

```css live-sample___anon_view
.item {
  animation: action 1ms linear;
  animation-timeline: view();
}
```

{{EmbedLiveSample("anon_view", "100%", "250")}}

### Tham số của hàm `view()`

Hàm `view()` nhận tối đa ba giá trị tùy chọn làm đối số:

- Không hoặc một tham số `<axis>`. Nếu được đặt, điều này chỉ định trục cuộn mà animation tiến triển theo.
- Từ khóa `auto` hoặc không, một hoặc hai giá trị inset {{cssxref("length-percentage")}}. Nếu được đặt, các giá trị này chỉ định offset cho cạnh bắt đầu và/hoặc cạnh kết thúc của scrollport.

Khai báo `view()` tương đương với `view(block auto)`, định nghĩa `block` là trục của phần tử cha cung cấp timeline và {{cssxref("scroll-padding")}}, thường mặc định là `0`, làm inset trong vùng hiển thị mà animation bắt đầu và kết thúc.

Hàm đặt các giá trị của các thuộc tính {{cssxref("view-timeline-axis")}} và {{cssxref("view-timeline-inset")}}.

Các đối số {{cssxref("view-timeline-inset")}} chỉ định inset (nếu dương) hoặc outset (nếu âm) điều chỉnh điểm bắt đầu và kết thúc của scrollport. Chúng được dùng để xác định vị trí cuộn mà tại đó phần tử được coi là "trong view", xác định độ dài của animation timeline. Nói cách khác, thay vì bắt đầu ở cạnh bắt đầu và kết thúc ở cạnh cuối của scrollport, animation xảy ra ở đầu và cuối của view đã được điều chỉnh inset.

Khác với hàm `scroll()` của scroll timeline, không có đối số `<scroller>` trong hàm `view()`, vì view timeline luôn theo dõi subject trong scroll container tổ tiên gần nhất của nó.

Trong ví dụ này, vì chúng ta đang dùng giá trị inset, chúng ta có thể dùng các [keyframe selector](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors) `from` và `to`.

```css live-sample___anon_view_args
@keyframes action {
  from {
    rotate: 45deg;
  }
  to {
    rotate: 720deg;
  }
}

.item {
  animation: action 1ms linear;
  animation-timeline: view(block 20% 20%);
}
```

{{EmbedLiveSample("anon_view_args", "100%", "250")}}

## Vấn đề về khả năng tiếp cận

Cũng như tất cả animation và transition, luôn tính đến tùy chọn [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) của mọi người dùng.

### Xóa timeline của animation

Đặt `animation-timeline: none` ngắt kết nối phần tử khỏi tất cả animation timeline, bao gồm cả timeline tài liệu dựa trên thời gian mặc định, nghĩa là phần tử sẽ không animate. Mặc dù một số animation có thể cần thiết, bạn có thể xóa animation dựa trên cài đặt `prefers-reduced-motion` của người dùng bằng:

```css
@media (prefers-reduced-motion: reduce) {
  .optionalAnimations {
    animation-timeline: none;
  }
}
```

Vì shorthand `animation` đặt `animation-timeline` thành `auto`, hãy dùng selector có đủ độ ưu tiên để đảm bảo `animation-timeline` của bạn không bị ghi đè bởi các khai báo shorthand `animation`.

## Xem thêm

- [Understanding timeline range names](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- Module [Scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
