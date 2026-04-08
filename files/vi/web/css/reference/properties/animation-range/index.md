---
title: animation-range
slug: Web/CSS/Reference/Properties/animation-range
page-type: css-shorthand-property
browser-compat: css.properties.animation-range
sidebar: cssref
---

Thuộc tính viết tắt **`animation-range`** trong [CSS](/en-US/docs/Web/CSS) được dùng để đặt điểm bắt đầu và điểm kết thúc của phạm vi đính kèm của hoạt ảnh dọc theo dòng thời gian, tức là nơi hoạt ảnh sẽ bắt đầu và kết thúc trên dòng thời gian.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("animation-range-start")}}
- {{cssxref("animation-range-end")}}

## Cú pháp

```css
/* Chỉ giá trị bắt đầu phạm vi */
/* Cú pháp một giá trị */
animation-range: normal;
animation-range: 20%;
animation-range: 100px;
animation-range: cover;
animation-range: contain;
/* Cú pháp hai giá trị */
animation-range: cover 20%;
animation-range: contain 100px;

/* Giá trị bắt đầu và kết thúc phạm vi */
/* Cú pháp hai giá trị */
animation-range: normal 25%;
animation-range: 25% normal;
animation-range: 25% 50%;
animation-range: entry exit;
/* Cú pháp ba giá trị */
animation-range: cover cover 200px;
animation-range: 10% exit 90%;
animation-range: entry 10% 90%;
/* Cú pháp bốn giá trị */
animation-range: cover 0% cover 200px;
animation-range: entry 10% exit 100%;

/* Giá trị toàn cục */
animation-timeline: inherit;
animation-timeline: initial;
animation-timeline: revert;
animation-timeline: revert-layer;
animation-timeline: unset;
```

Thuộc tính viết tắt `animation-range` được chỉ định là một hoặc nhiều phạm vi hoạt ảnh đơn lẻ phân cách bằng dấu phẩy. Mỗi phạm vi hoạt ảnh được chỉ định bằng một đến bốn giá trị phân cách bằng khoảng trắng gồm các giá trị `<timeline-range-name>`, giá trị `<length-percentage>`, và/hoặc từ khóa `normal`.

### Giá trị

- `<animation-range-start>`
  - : Từ khóa `normal`, giá trị `<length-percentage>`, một {{cssxref("timeline-range-name")}}, hoặc cặp `<timeline-range-name> <length-percentage>`, đại diện cho {{cssxref("animation-range-start")}}. Nếu đặt `<timeline-range-name>` mà không có `<length-percentage>`, mặc định `<length-percentage>` là `0%`.
- `<animation-range-end>`
  - : Từ khóa `normal`, giá trị `<length-percentage>`, một `<timeline-range-name>`, hoặc cặp `<timeline-range-name> <length-percentage>`, đại diện cho {{cssxref("animation-range-end")}}. Nếu đặt `<timeline-range-name>` mà không có `<length-percentage>`, mặc định `<length-percentage>` là `100%`.

## Mô tả

Thuộc tính viết tắt `animation-range` đặt các giá trị `animation-range-start` và `animation-range-end`, xác định nơi hoạt ảnh sẽ bắt đầu và kết thúc trên dòng thời gian. Theo mặc định, các kiểu được định nghĩa trong hoạt ảnh keyframe chỉ được áp dụng cho phần tử khi phần tử đó đang được tạo hoạt ảnh. Khi nào hoạt ảnh keyframe được áp dụng cho phần tử phụ thuộc vào dòng thời gian hoạt ảnh đó. Theo mặc định, hoạt ảnh chỉ được áp dụng giữa điểm bắt đầu và điểm kết thúc phạm vi của dòng thời gian. Để áp dụng hoạt ảnh ngoài phạm vi này, hãy đặt {{cssxref("animation-fill-mode")}} thành `backwards`, `forwards`, hoặc `both`. Ba giá trị `animation-fill-mode` này lần lượt áp dụng kiểu keyframe đầu tiên cho đến điểm bắt đầu phạm vi, kiểu keyframe cuối cùng sau khi hoạt ảnh kết thúc, hoặc cả hai trước và sau.

Khu vực {{glossary("Scroll container", "scroll port")}} được gọi là phạm vi hiển thị của tiến trình view là khu vực bên trong scrollport mà phần tử chủ thể của hoạt ảnh [dòng thời gian tiến trình view được đặt tên](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#view_progress_timelines) được coi là hiển thị. Theo mặc định, đây là phạm vi đầy đủ của scrollport, nhưng có thể được điều chỉnh bằng thuộc tính {{cssxref("view-timeline-inset")}}.

Nếu hai giá trị được chỉ định làm thành phần của thuộc tính `<animation-range>`, chúng sẽ được giải thích theo thứ tự `<animation-range-start>` rồi `<animation-range-end>`. Giá trị của mỗi thành phần là từ khóa `normal`, một {{cssxref("length-percentage")}}, hoặc {{cssxref("timeline-range-name")}} tùy chọn theo sau bởi `<length-percentage>`. Các giá trị này được phân cách bằng khoảng trắng. Normal bằng với `0%` cho điểm bắt đầu và `100%` cho điểm kết thúc. Đặt `normal` cùng với `<length-percentage>` cho điểm bắt đầu hoặc kết thúc phạm vi đều không hợp lệ.

### Xác định điểm bắt đầu phạm vi và mặc định điểm kết thúc phạm vi

Khi bạn chỉ xác định `<animation-range-start>`, bằng cách đặt một {{cssxref("length-percentage")}} đơn lẻ, một {{cssxref("timeline-range-name")}} đơn lẻ, từ khóa `normal`, hoặc bằng cách chỉ định một `<timeline-range-name>` đơn lẻ theo sau một `<length-percentage>` đơn lẻ, giá trị được tính của `<animation-range-end>` tuân theo các quy tắc cụ thể:

Nếu giá trị là một `<length-percentage>` đơn lẻ hoặc từ khóa `normal`, giá trị này xác định `<animation-range-start>` và `<animation-range-end>` được đặt ngầm định thành `normal`. Ví dụ:

- `animation-range: 20%;` tương đương với `animation-range-start: 20%; animation-range-end: normal;`
- `animation-range: normal;` tương đương với `animation-range-start: 0%; animation-range-end: 100%;`

Nếu giá trị là một {{cssxref("timeline-range-name")}} đơn lẻ (không có `<length-percentage>` theo sau), tên phạm vi dòng thời gian đó được áp dụng cho cả thành phần `<animation-range-start>` và `<animation-range-end>`, và các phạm vi `0%` và `100%` lần lượt được ngầm định. Ví dụ:

- `animation-range: contain;` tương đương với `animation-range-start: contain 0%; animation-range-end: contain 100%;`
- `animation-range: cover;` tương đương với `animation-range-start: cover 0%; animation-range-end: cover 100%;`

Nếu giá trị là một `<timeline-range-name>` đơn lẻ theo sau một `<length-percentage>` đơn lẻ theo thứ tự đó, cặp này xác định `<animation-range-start>`, và `<timeline-range-name>` đã xác định được áp dụng cho `<animation-range-end>` tại `100%`. Ví dụ:

- `animation-range: cover 20%;` tương đương với `animation-range-start: cover 20%; animation-range-end: cover 100%;`
- `animation-range: contain 100px;` tương đương với `animation-range-start: contain 100px; animation-range-end: contain 100%;`

### Xác định rõ ràng cả điểm bắt đầu và kết thúc phạm vi với hai giá trị

Nếu hai hoặc nhiều giá trị được bao gồm trong khai báo `animation-range` và các giá trị không phải là một `<timeline-range-name>` đơn lẻ theo sau bởi `<length-percentage>`, cả `<animation-range-start>` và `<animation-range-end>` đều được đặt tường minh.

Nếu bạn bao gồm hai giá trị và giá trị đầu tiên là từ khóa `normal` hoặc `<length-percentage>`, giá trị đó xác định `<animation-range-start>` và giá trị thứ hai xác định `<animation-range-end>`. Ví dụ:

- `animation-range: normal 25%;` tương đương với `animation-range-start: 0%; animation-range-end: 25%;`
- `animation-range: 25% 50%;` tương đương với `animation-range-start: 25%; animation-range-end: 50%;`
- `animation-range: 25% contain;` tương đương với `animation-range-start: 25%; animation-range-end: contain 100%;`
- `animation-range: 25% normal;` tương đương với `animation-range-start: 25%; animation-range-end: 100%;`

### Nhiều hoạt ảnh

Khi chỉ định phạm vi cho nhiều hoạt ảnh, thuộc tính viết tắt `animation-range` được chỉ định là một hoặc nhiều phạm vi hoạt ảnh đơn lẻ phân cách bằng dấu phẩy. Mỗi animation-range được áp dụng cho các hoạt ảnh theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các trường hợp số lượng hoạt ảnh và các giá trị thuộc tính `animation-range` không khớp, nếu có nhiều giá trị `animation-range` hơn hoạt ảnh, các phạm vi thừa bị bỏ qua. Nếu có nhiều hoạt ảnh hơn phạm vi, danh sách giá trị `animation-range` sẽ được lặp lại cho đến khi có phạm vi tương ứng cho mỗi hoạt ảnh. Ví dụ, nếu đặt `animation-range: 25% 75%, normal;`, phạm vi hoạt ảnh của tất cả hoạt ảnh số lẻ là `25% 75%` và tất cả hoạt ảnh số chẵn sẽ là `0% 100%`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản thuộc tính `animation-range`

Trong ví dụ này, chúng ta rút ngắn thời lượng của hoạt ảnh cuộn trang tiến trình view bằng cách sử dụng thuộc tính `animation-range` để điều chỉnh điểm bắt đầu và kết thúc của hoạt ảnh, và minh họa hiệu ứng của thuộc tính {{cssxref("animation-fill-mode")}} trên các dòng thời gian hoạt ảnh rút ngắn.

#### HTML

Ở giữa một khối văn bản dài, chúng ta thêm một phần tử mà chúng ta sẽ tạo hoạt ảnh. Chúng ta thêm rất nhiều văn bản để đảm bảo nội dung tràn ra ngoài container, nhưng phần này được ẩn để ngắn gọn.
Chúng ta cũng thêm một ô checkbox để bật/tắt thuộc tính {{cssxref("animation-fill-mode")}}, để minh họa hiệu ứng của nó trên các dòng thời gian hoạt ảnh rút ngắn. Phần này cũng được ẩn.

```html-nolint hidden
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
```

```html
<div class="animatedElement"></div>
```

```html-nolint hidden
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
  <label>
    <input type="checkbox" /> Add <code>animation-fill-mode: both;</code>
  </label>
</div>
```

#### CSS

Chúng ta định nghĩa một hoạt ảnh tạo hiệu ứng độ mờ, tỷ lệ và màu nền của phần tử, khiến nó mờ dần, phóng to, và thay đổi màu khi hoạt ảnh tiến triển. Chúng ta áp dụng hoạt ảnh này cho `animatedElement` bằng viết tắt {{cssxref("animation")}}.

Dòng thời gian tiến trình view được tạo bằng cách đặt hàm {{cssxref("animation-timeline/view", "view()")}} làm giá trị của thuộc tính {{cssxref("animation-timeline")}} trên `animatedElement`. Kết quả là phần tử tạo hoạt ảnh khi nó di chuyển lên qua tài liệu trong khi cuộn. Chúng ta khai báo thuộc tính `animation-timeline` sau viết tắt, vì viết tắt sẽ đặt lại thuộc tính này.

Cuối cùng, khai báo `animation-range` được đặt để hoạt ảnh bắt đầu muộn hơn mong đợi và kết thúc sớm hơn.

```css
.animatedElement {
  background-color: deeppink;
  animation: appear 1ms linear;
  animation-timeline: view();
  animation-range: entry 10% exit -25%;
}

@keyframes appear {
  from {
    background-color: rebeccapurple;
    opacity: 0;
    transform: scaleX(0);
  }

  to {
    background-color: darkturquoise;
    opacity: 0.75;
    transform: scaleX(0.75);
  }
}
```

Chúng ta cũng thêm kiểu có điều kiện: khi checkbox được chọn, thuộc tính `animation-fill-mode` được áp dụng cho phần tử có hoạt ảnh:

```css
:has(:checked) .animatedElement {
  animation-fill-mode: both;
}
```

Các kiểu khác được ẩn để ngắn gọn.

```css hidden
.animatedElement {
  width: 300px;
  height: 200px;
  margin: 0 auto;
  background-color: deeppink;
}

:has(:checked) .animatedElement {
  animation-fill-mode: both;
}

.content {
  width: 75%;
  max-width: 800px;
  margin: 0 auto;
}

p,
h1 {
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  font-size: 3rem;
}

p {
  font-size: 1.5rem;
  line-height: 1.5;
}
@supports not (animation-range: normal) {
  body::before {
    content: "Your browser does not support the 'animation-range' property.";
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1rem 0;
  }
}
```

#### Kết quả

Cuộn để xem phần tử được tạo hoạt ảnh.

{{EmbedLiveSample("Examples", "100%", "480px")}}

Lưu ý cách các giá trị thuộc tính keyframe `from` hoặc `0%` không được áp dụng cho phần tử có hoạt ảnh cho đến khi cạnh trên của khối trên cách `10%` so với cạnh dưới của container; phần tử có kích thước đầy đủ, hoàn toàn không trong suốt và màu đỏ tươi. Tại thời điểm đó, hoạt ảnh được áp dụng và được tạo kiểu với các giá trị được xác định bởi bộ chọn keyframe `0%`. Khi đạt đến `animation-range-end`, cách 25% từ đỉnh scrollport, nó nhảy trở lại kiểu gốc.

Thông thường, bạn sẽ muốn đặt `animation-fill-mode: both` khi tạo [hoạt ảnh cuộn trang](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations). Sự nhảy về trạng thái mặc định xảy ra vì chúng ta không đặt thuộc tính {{cssxref("animation-fill-mode")}} trên phần tử, thuộc tính này có thể được dùng để áp dụng kiểu hoạt ảnh cho phần tử trước và sau khi thực thi hoạt ảnh. Chúng ta ban đầu bỏ qua thuộc tính này trong ví dụ để giúp trực quan hóa tốt hơn các hiệu ứng của `animation-range`.

Đánh dấu vào checkbox để áp dụng thuộc tính `animation-fill-mode` cho phần tử có hoạt ảnh rồi cuộn lại: các kiểu hoạt ảnh sẽ được áp dụng liên tục.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("animation-timeline")}}
- {{cssxref("animation-range-end")}}
- {{cssxref("animation-range-start")}}
- {{cssxref("scroll-timeline")}}
- {{cssxref("timeline-scope")}}
- {{cssxref("view-timeline-inset")}}
- {{cssxref("animation-fill-mode")}}
- [Hiểu tên phạm vi dòng thời gian](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names)
- [Hoạt ảnh cuộn trang CSS](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) module
- [Trình trực quan hóa phạm vi dòng thời gian view](https://scroll-driven-animations.style/tools/view-timeline/ranges/)
