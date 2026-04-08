---
title: Basic concepts of scroll snap
short-title: Basic concepts
slug: Web/CSS/Guides/Scroll_snap/Basic_concepts
page-type: guide
sidebar: cssref
---

Các thuộc tính trong module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) cho phép bạn xác định cách cuộn snap vào các điểm cụ thể khi người dùng cuộn qua tài liệu.

Tính năng [scroll snap](/en-US/docs/Glossary/Scroll_snap) cho phép bạn xác định các snap position nơi scrollport của một [scroll container](/en-US/docs/Glossary/Scroll_container) có thể kết thúc hoặc "snap vào" sau khi thao tác cuộn hoàn tất.

## Các thuộc tính quan trọng cho CSS scroll snap

Trước khi xác định scroll snapping, bạn cần bật cuộn trên một scroll container. Bạn có thể làm điều này bằng cách đảm bảo scroll container có kích thước xác định và có {{cssxref("overflow")}} được bật.

Sau đó bạn có thể định nghĩa scroll snapping trên scroll container bằng hai thuộc tính quan trọng sau:

- {{cssxref("scroll-snap-type")}}: Dùng thuộc tính này để xác định liệu viewport có thể cuộn snap hay không, liệu snapping là bắt buộc hay tùy chọn, và trục mà snapping sẽ xảy ra.
- {{cssxref("scroll-snap-align")}}: Thuộc tính này được đặt trên mỗi phần tử con của scroll container và bạn có thể dùng nó để xác định snap position của từng phần tử con hoặc không có snap.
- {{cssxref("scroll-snap-stop")}}: Thuộc tính này đảm bảo rằng một phần tử con được snap trong khi cuộn và không bị bỏ qua.
- {{cssxref("scroll-margin")}}: Thuộc tính này có thể được đặt trên các phần tử con được snap trong khi cuộn để tạo ra một khoảng cách từ hộp được định nghĩa.
- {{cssxref("scroll-padding")}}: Thuộc tính này có thể được đặt trên scroll container để tạo ra một offset snapping.

Ví dụ bên dưới minh họa scroll snapping theo trục dọc, được định nghĩa bởi `scroll-snap-type`. Ngoài ra, `scroll-snap-align` áp dụng cho tất cả các phần tử con của phần tử `<section>`, xác định điểm mà việc cuộn của mỗi phần tử con nên dừng lại.

```html live-sample___mandatory-y
<article class="scroller">
  <section>
    <h2>Section one</h2>
  </section>
  <section>
    <h2>Section two</h2>
  </section>
  <section>
    <h2>Section three</h2>
  </section>
</article>
```

```css hidden live-sample___mandatory-y
body {
  font: 1.2em / 1.5 sans-serif;
}

.scroller {
  border: 4px solid #333333;
  width: 300px;
}

.scroller section {
  min-height: 100%;
  padding: 10px;
}

.scroller section:nth-child(odd) {
  background-color: #cccccc;
}
```

```css live-sample___mandatory-y
.scroller {
  height: 300px;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
}

.scroller section {
  scroll-snap-align: start;
}
```

{{EmbedLiveSample("mandatory-y", "", "350px")}}

## Sử dụng scroll-snap-type

Thuộc tính {{CSSxRef("scroll-snap-type")}} cần biết trục mà scroll snapping xảy ra. Đây có thể là `x`, `y`, hoặc các ánh xạ logic `block` hoặc `inline`. Bạn cũng có thể dùng từ khóa `both` để bật scroll snapping trên cả hai trục.

Bạn cũng có thể truyền vào các từ khóa `mandatory` hoặc `proximity`. Từ khóa `mandatory` cho trình duyệt biết liệu nội dung _có_ phải snap đến một điểm nhất định hay không, bất kể vị trí cuộn ở đâu. Từ khóa `proximity` có nghĩa là nội dung có thể snap đến điểm đó, nhưng không bắt buộc.

Sử dụng `mandatory` tạo ra trải nghiệm cuộn rất nhất quán — bạn biết trình duyệt sẽ luôn snap đến từng điểm được định nghĩa. Điều này có nghĩa là bạn có thể tự tin rằng thứ gì đó bạn kỳ vọng ở đầu màn hình sẽ ở đó khi cuộn kết thúc. Tuy nhiên, nó có thể gây vấn đề nếu nội dung lớn hơn bạn kỳ vọng — người dùng có thể thấy mình ở tình huống khó chịu là không bao giờ có thể cuộn và xem một điểm nhất định trong nội dung. Do đó, việc sử dụng `mandatory` cần được cân nhắc kỹ và chỉ dùng trong các tình huống mà bạn biết lượng nội dung hiển thị trên màn hình hoặc phần có thể cuộn tại bất kỳ thời điểm nào.

> [!NOTE]
> Không bao giờ dùng `mandatory` nếu nội dung bên trong một trong các phần tử con của bạn sẽ tràn ra khỏi container cha vì người dùng sẽ không thể cuộn nội dung tràn vào view.

Giá trị `proximity` chỉ snap các phần tử con vào một vị trí khi nó ở gần, với trình duyệt xác định khoảng cách chính xác.
Nhấp "Play" để chỉnh sửa ví dụ bên dưới trong MDN Playground. Thay đổi giá trị `scroll-snap-type` giữa `mandatory` và `proximity` để xem ảnh hưởng của nó lên trải nghiệm cuộn.

```html live-sample___mandatory-proximity
<article class="scroller">
  <section>
    <h2>Section one</h2>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </section>
  <section>
    <h2>Section two</h2>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </section>
  <section>
    <h2>Section three</h2>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </section>
</article>
```

```css hidden live-sample___mandatory-proximity
body {
  font: 1.2em / 1.5 sans-serif;
}

.scroller {
  border: 4px solid #333333;
  width: 300px;
}

.scroller section {
  min-height: 100%;
  padding: 10px;
}

.scroller section:nth-child(odd) {
  background-color: #cccccc;
}
```

```css live-sample___mandatory-proximity
.scroller {
  height: 300px;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
}

.scroller section {
  scroll-snap-align: start;
}
```

{{EmbedLiveSample("mandatory-proximity", "", "350px")}}

Trong ví dụ trên, cả {{cssxref("height", "height: 300px;")}} và {{cssxref("overflow-y", "overflow-y: scroll;")}} đều được đặt trên scroll container.
Nếu nội dung không tràn ra khỏi container, không có gì để cuộn.

## Sử dụng scroll-snap-align

Các giá trị hợp lệ cho thuộc tính {{CSSxRef("scroll-snap-align")}} bao gồm `start`, `end`, `center` và `none`. Các giá trị này được dùng để chỉ định điểm trong scroll container mà nội dung nên snap vào. Nhấp "Play" trong ví dụ bên dưới và thay đổi giá trị của `scroll-snap-align` để xem cách nó thay đổi hành vi cuộn.

```html hidden live-sample___align
<article class="scroller">
  <section>
    <h2>Section one</h2>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </section>
  <section>
    <h2>Section two</h2>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </section>
  <section>
    <h2>Section three</h2>
    <p>
      Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
      kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus
      winter purslane kale. Celery potato scallion desert raisin horseradish
      spinach carrot soko.
    </p>
  </section>
</article>
```

```css hidden live-sample___align
body {
  font: 1.2em / 1.5 sans-serif;
}

.scroller {
  border: 4px solid #333333;
  width: 300px;
}

.scroller section {
  min-height: 100%;
  padding: 10px;
}

.scroller section:nth-child(odd) {
  background-color: #cccccc;
}
```

```css live-sample___align
.scroller {
  height: 200px;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
}

.scroller section {
  scroll-snap-align: start;
}
```

{{EmbedLiveSample("align", "", "250px")}}

Nếu `scroll-snap-type` là `mandatory` và `scroll-snap-align` trên một phần tử con được đặt thành `none` hoặc không được đặt (trong trường hợp đó mặc định là `none`), người dùng sẽ không thể cuộn phần tử đó vào view.

## Sử dụng scroll-padding

Khi dùng `start` hoặc `end`, nếu bạn không muốn nội dung snap vào chính cạnh của scroll container, hoặc nếu bạn muốn snap position bị lệch nhẹ khỏi giữa khi dùng `center`, hãy dùng thuộc tính {{CSSxRef("scroll-padding")}} hoặc các giá trị longhand tương đương để thêm padding.

Trong ví dụ bên dưới, `scroll-padding` được đặt thành `50px`. Khi nội dung snap vào đầu của phần hai và phần ba, cuộn dừng lại cách 50 pixel từ đầu phần đó. Hãy thử thay đổi giá trị `scroll-padding` để xem cách nó thay đổi khoảng cách.

```html live-sample___scroll-padding
<article class="scroller">
  <section>
    <h2>Section one</h2>
  </section>
  <section>
    <h2>Section two</h2>
  </section>
  <section>
    <h2>Section three</h2>
  </section>
</article>
```

```css hidden live-sample___scroll-padding
body {
  font: 1.2em / 1.5 sans-serif;
}

.scroller {
  border: 4px solid #333333;
  width: 300px;
}

.scroller section {
  min-height: 100%;
  padding: 10px;
}

.scroller section:nth-child(odd) {
  background-color: #cccccc;
}
```

```css live-sample___scroll-padding
.scroller {
  height: 300px;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
  scroll-padding: 50px;
}

.scroller section {
  scroll-snap-align: start;
}
```

{{EmbedLiveSample("scroll-padding", "", "350px")}}

Điều này có thể hữu ích nếu bạn có một phần tử [fixed](/en-US/docs/Web/CSS/Reference/Properties/position#fixed_positioning) như thanh điều hướng, có thể chồng lên nội dung đã cuộn. Bằng cách dùng `scroll-padding`, bạn có thể dành chỗ cho phần tử cố định, như trong ví dụ bên dưới, nơi phần tử `<h1>` vẫn hiển thị trên màn hình khi nội dung cuộn bên dưới nó. Không có padding, tiêu đề sẽ chồng lên một phần nội dung khi snapping xảy ra.

```html hidden live-sample___scroll-padding-sticky
<article class="scroller">
  <h1>Sticky Heading</h1>
  <section>
    <h2>Section one</h2>
  </section>
  <section>
    <h2>Section two</h2>
  </section>
  <section>
    <h2>Section three</h2>
  </section>
</article>
```

```css hidden live-sample___scroll-padding-sticky
body {
  font: 1.2em / 1.5 sans-serif;
}

.scroller {
  border: 4px solid #333333;
  width: 300px;
}

.scroller section {
  min-height: 100%;
  padding: 10px;
}

.scroller section:nth-child(odd) {
  background-color: #cccccc;
}
```

```css live-sample___scroll-padding-sticky
.scroller h1 {
  position: sticky;
  top: 0;
  min-height: 40px;
  background-color: black;
  color: white;
  margin: 0;
  padding: 0;
}

.scroller h2 {
  margin: 0;
  padding: 0;
}

.scroller {
  height: 300px;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
  scroll-padding: 50px;
}

.scroller section {
  scroll-snap-align: start;
}
```

{{EmbedLiveSample("scroll-padding-sticky", "", "350px")}}

## Sử dụng scroll-margin

Thuộc tính {{CSSxRef("scroll-margin")}} hoặc các giá trị longhand scroll margin có thể được đặt trên các phần tử con, xác định một khoảng cách từ hộp được định nghĩa. Điều này cho phép có lượng khoảng cách khác nhau cho các phần tử con khác nhau và có thể được dùng kết hợp với `scroll-padding` trên phần tử cha.

```html hidden live-sample___scroll-margin
<article class="scroller">
  <section>
    <h2>Section one</h2>
  </section>
  <section>
    <h2>Section two</h2>
  </section>
  <section>
    <h2>Section three</h2>
  </section>
</article>
```

```css hidden live-sample___scroll-margin
body {
  font: 1.2em / 1.5 sans-serif;
}

.scroller {
  border: 4px solid #333333;
  width: 300px;
}

.scroller section {
  min-height: 100%;
  padding: 10px;
}

.scroller section:nth-child(odd) {
  background-color: #cccccc;
}
```

```css live-sample___scroll-margin
.scroller {
  height: 300px;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
}

.scroller section {
  scroll-snap-align: start;
  scroll-margin: 40px;
}
```

{{EmbedLiveSample("scroll-margin", "", "350px")}}

## Sử dụng scroll-snap-stop

Sử dụng thuộc tính {{CSSxRef("scroll-snap-stop")}}, bạn có thể chỉ định liệu cuộn có phải snap vào các snap point đã xác định hay không. Trong các ví dụ trên, điều này có nghĩa là cuộn sẽ dừng lại ở đầu mỗi phần hoặc có thể bỏ qua các phần.

Với định nghĩa thuộc tính này, bạn có thể đảm bảo người dùng xem từng phần của scroller và không vô tình cuộn qua chúng. Tuy nhiên, cài đặt này cũng có thể ảnh hưởng tiêu cực đến trải nghiệm người dùng bằng cách ngăn họ nhanh chóng cuộn đến nội dung mong muốn.

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Practical CSS scroll snapping](https://css-tricks.com/practical-css-scroll-snapping/) trên CSS-Tricks (2020)
- [CSS scroll snap](https://12daysofweb.dev/2022/css-scroll-snap/) trên 12 Days of Web (2019)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
- [Scroll snap examples](https://codepen.io/collection/KpqBGW) trên CodePen
