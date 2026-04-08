---
title: interactivity
slug: Web/CSS/Reference/Properties/interactivity
page-type: css-property
status:
  - experimental
browser-compat: css.properties.interactivity
sidebar: cssref
---

{{seecompattable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`interactivity`** chỉ định liệu một phần tử và các nút con của nó có được đặt thành trạng thái [inert](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) hay không.

## Cú pháp

```css
/* Giá trị từ khóa */
interactivity: auto;
interactivity: inert;

/* Giá trị toàn cục */
interactivity: inherit;
interactivity: initial;
interactivity: revert;
interactivity: revert-layer;
interactivity: unset;
```

### Giá trị

- `auto`
  - : Các phần tử được chọn ở trạng thái mặc định về tính inertness. Thông thường có nghĩa là chúng có thể tương tác, nhưng [không phải lúc nào cũng vậy](#tính_inert_mặc_định). Đây là giá trị mặc định.

- `inert`
  - : Các phần tử được chọn và các phần tử con của chúng ở trạng thái inert.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Mô tả

Thuộc tính `interactivity` có thể được sử dụng để đặt liệu một phần tử và các phần tử con của nó có ở trạng thái inert hay không. Xem trang tham chiếu thuộc tính HTML [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) để biết mô tả chi tiết về trạng thái inert.

Trường hợp sử dụng điển hình cho `interactivity: inert` là trong nội dung phân trang, như carousel, khi bạn chỉ muốn nội dung và các điều khiển của trang hiện tại được tương tác. Trong những trường hợp như vậy, việc focus không mong muốn vào một liên kết hoặc nút ngoài màn hình có thể làm hỏng trải nghiệm.

Nếu trạng thái inert của một phần tử được chỉ định bởi cả HTML (thuộc tính `inert`, hoặc cài đặt tự động của trình duyệt) và CSS (thuộc tính `interactive`) cùng một lúc, CSS sẽ không có tác dụng — nó không thể ghi đè tính inertness của HTML.

Ví dụ, phần tử HTML sau sẽ ở trạng thái inert:

```html
<button inert>You can't press me</button>
```

Việc đặt `interactive: auto` trên đó sẽ không có tác dụng.

### Tính inert mặc định

Hầu hết các phần tử đều có thể tương tác theo mặc định, nhưng không phải lúc nào cũng vậy:

- Phần tử tổ tiên của một phần tử có thể được đặt thành trạng thái inert, thông qua thuộc tính `interactive` hoặc thuộc tính `inert`.
- Trong khi một {{htmlelement("dialog")}} modal đang hiển thị, phần còn lại của trang sẽ tự động được đặt thành trạng thái inert.

## Ví dụ

### Sử dụng `interactivity` cơ bản

Trong ví dụ này chúng ta có hai phần tử {{htmlelement("input")}}. Phần tử thứ hai có `interactivity: inert` được đặt trên nó qua một class, và do đó không thể focus hoặc chỉnh sửa trong các trình duyệt hỗ trợ.

```html live-sample___basic-interactivity
<p>
  <label>
    This input is interactive:
    <input type="text" name="one" value="editable" />
  </label>
</p>
<p>
  <label>
    This input is not interactive:
    <input type="text" name="two" value="Not editable" class="inert" />
  </label>
</p>
```

```css live-sample___basic-interactivity
.inert {
  interactivity: inert;
  background-color: lightpink;
}
```

#### Kết quả

Kết quả trông như sau:

{{ EmbedLiveSample("basic-interactivity", "100%", "100") }}

### Khám phá các hiệu ứng của tính inertness

Trong ví dụ này chúng ta khám phá các hiệu ứng của thuộc tính `interactivity`.

#### HTML

Markup gồm hai phần tử {{htmlelement("p")}}, mỗi phần tử chứa một liên kết. Đoạn thứ hai cũng có class `inert` được đặt trên nó, và một phần tử {{htmlelement("span")}} con với [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt trên nó để có thể chỉnh sửa.

```html-nolint live-sample___inertness-effects
<p>
  This paragraph is not
  <a
    href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes/inert"
    >inert</a
  >. You should be able to select the text content, search for it using
  in-browser search features, and focus and click the link. There is a
  <code>click</code> event handler set on the paragraph that changes the border
  color for a second when it is clicked anywhere.
  <span contenteditable>This sentence has <code>contenteditable</code> set on
  it, so it is editable</span>.
</p>

<p class="inert">
  This paragraph is
  <a
    href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes/inert"
    >inert</a
  >. You won't be able to select the text content, search for it using
  in-browser search features, focus and click the link, or issue
  <code>click</code> events on it (the border color won't change when it is
  clicked).
  <span contenteditable
    >This sentence has <code>contenteditable</code> set on it, but it is not
    editable because it is inert</span
  >.
</p>
```

#### CSS

Chúng ta đặt thuộc tính `interactivity` trên đoạn thứ hai với giá trị `inert`, khiến nó ở trạng thái inert. Điều này có nghĩa là bạn có thể chỉnh sửa văn bản `contenteditable` trong đoạn đầu tiên, nhưng không phải trong đoạn thứ hai, và bạn không thể tìm kiếm văn bản, chọn văn bản, hoặc tương tác với liên kết trong đoạn thứ hai.

```css live-sample___inertness-effects
.inert {
  interactivity: inert;
}

[contenteditable] {
  outline: 1px dashed lightblue;
}

.borderChanged {
  border-color: orange;
}
```

```css hidden live-sample___inertness-effects
body {
  font: 1.2em / 1.5 system-ui;
}

p {
  border: 5px solid black;
  padding: 10px;
  width: 90%;
  margin: 20px auto;
}
```

#### JavaScript

Chúng ta đặt một event handler trên mỗi đoạn văn để chuyển đổi tên class khi được nhấp, thêm classname rồi xóa class sau hai giây.

```js live-sample___inertness-effects
const paras = document.querySelectorAll("p");

function tempBorderChange(e) {
  const targetPara = e.currentTarget;
  targetPara.classList.add("borderChanged");
  setTimeout(() => {
    targetPara.classList.remove("borderChanged");
  }, 2000);
}

for (para of paras) {
  para.addEventListener("click", tempBorderChange);
}
```

#### Kết quả

{{ EmbedLiveSample("inertness-effects", "100%", "380") }}

Lưu ý rằng đoạn thứ hai ở trạng thái inert; do đó nó không hoạt động như đoạn đầu tiên. Ví dụ, liên kết không thể được nhấp hoặc focus, văn bản không thể được chọn hoặc tìm kiếm, `<span>` `contenteditable` không thể chỉnh sửa, và các sự kiện `click` không được đăng ký trên nó.

### Đặt các phần tử ngoài màn hình thành inert bằng view timeline

Ví dụ này hiển thị nội dung phân trang cuộn ngang, với mỗi trang được snapped bằng [CSS Scroll Snap](/en-US/docs/Web/CSS/Guides/Scroll_snap), và tính inertness được kiểm soát thông qua [scroll-driven animation](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) sử dụng [view progress timeline](/en-US/docs/Web/CSS/Reference/Properties/view-timeline-name). Nội dung hiển thị trong {{glossary("scroll container")}} có thể tương tác; nó trở thành inert khi di chuyển ra ngoài vùng nội dung tràn.

#### HTML

HTML bao gồm một [heading](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) cấp cao nhất và một [danh sách không có thứ tự](/en-US/docs/Web/HTML/Reference/Elements/ul) với bốn [mục danh sách](/en-US/docs/Web/HTML/Reference/Elements/li), mỗi mục chứa nội dung cho một trang riêng biệt.

```html live-sample___offscreen-inert
<h1>Pagination interactivity demo</h1>
<ul>
  <li>
    <h2>Page 1</h2>
    <p>This is the first page of content.</p>
    <p><a href="#">A demo link</a>.</p>
    <p><button>Press me</button></p>
  </li>
  <li>
    <h2>Page 2</h2>
    <p>This is the second page of content.</p>
    <p><a href="#">A demo link</a>.</p>
    <p><button>Press me</button></p>
  </li>
  <li>
    <h2>Page 3</h2>
    <p>This is the third page of content.</p>
    <p><a href="#">A demo link</a>.</p>
    <p><button>Press me</button></p>
  </li>
  <li>
    <h2>Page 4</h2>
    <p>This is the fourth page of content.</p>
    <p><a href="#">A demo link</a>.</p>
    <p><button>Press me</button></p>
  </li>
</ul>
```

#### CSS

Giá trị {{cssxref("width")}} là `100vw` được đặt trên danh sách không có thứ tự để làm cho nó rộng bằng viewport. Chúng ta thêm {{cssxref("height")}} cố định, một số {{cssxref("padding")}}, và giá trị {{cssxref("overflow-x")}} là `scroll` để nội dung tràn sẽ cuộn. Các mục danh sách con được bố cục ngang với {{cssxref("display", "display: flex")}}. Flex container này được cho giá trị {{cssxref("scroll-snap-type")}} là `x mandatory` để biến nó thành [scroll snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container). Từ khóa `x` khiến các [snap target](/en-US/docs/Glossary/Scroll_snap#snap_target) của container được snapped theo chiều ngang. Từ khóa `mandatory` có nghĩa là container sẽ luôn snap đến một snap target khi kết thúc hành động cuộn.

```css hidden live-sample___offscreen-inert
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  text-align: center;
  margin: 0;
}

button {
  background-color: white;
}
```

```css live-sample___offscreen-inert
ul {
  width: 100vw;
  height: 250px;
  padding: 1vw;
  overflow-x: scroll;
  display: flex;
  gap: 1vw;
  scroll-snap-type: x mandatory;
}
```

Mỗi mục danh sách có các kiểu sau được áp dụng:

- Giá trị {{cssxref("flex")}} là `0 0 98vw`, buộc mỗi mục có kích thước bằng scroll container trừ {{cssxref("gap")}} được đặt trên danh sách (xem khai báo `gap` trong quy tắc `ul` hiển thị ở trên). Điều này cũng có tác dụng căn giữa mỗi trang bên trong scroll container.
- Giá trị {{cssxref("scroll-snap-align")}} là `center`, để khiến scroll container snap đến tâm của mỗi snap target.
- Giá trị {{cssxref("view-timeline")}} là `--inner-change inline`, để khai báo phần tử là chủ thể của view progress timeline `--inner-change`, và đặt timeline đó tiến triển theo hướng inline khi nó di chuyển qua scroll container tổ tiên.
- Giá trị {{cssxref("animation-timeline")}} có cùng tên với {{cssxref("view-timeline-name")}}, như được định nghĩa trong thuộc tính viết tắt `view-timeline`, có nghĩa là view progress timeline được đặt tên sẽ được sử dụng để kiểm soát tiến độ của các animation được áp dụng cho phần tử.
- {{cssxref("animation-name")}} và {{cssxref("animation-fill-mode")}} định nghĩa animation được áp dụng cho phần tử này và fill mode của nó. Giá trị `both` là bắt buộc vì bạn muốn trạng thái animation bắt đầu áp dụng cho phần tử trước khi animation bắt đầu, và trạng thái animation kết thúc áp dụng cho phần tử sau khi animation kết thúc. Nếu animation không được duy trì, khai báo `interactivity: inert` được áp dụng qua animation sẽ không áp dụng cho các mục danh sách khi chúng ở ngoài scroll container.

```css live-sample___offscreen-inert
li {
  list-style-type: none;
  background-color: #eeeeee;
  border: 1px solid #dddddd;
  padding: 20px;

  flex: 0 0 98vw;

  scroll-snap-align: center;

  view-timeline: --inner-change inline;
  animation-timeline: --inner-change;
  animation-name: inert-change;
  animation-fill-mode: both;
}
```

Cuối cùng, các {{cssxref("@keyframes")}} animation được định nghĩa. `interactivity: inert` được đặt tại các vị trí `entry 0%` và `exit 100%` của view timeline. Kết hợp với giá trị `animation-fill-mode: both`, điều này có nghĩa là các mục danh sách sẽ ở trạng thái inert trước khi bắt đầu và sau khi kết thúc view timeline, tức là khi chúng ở ngoài scroll container. Giữa các vị trí `entry 1%` và `exit 99%`, `interactivity: auto` được đặt trên các mục danh sách, có nghĩa là chúng có thể được tương tác bình thường khi ở trong scroll container.

```css live-sample___offscreen-inert
@keyframes inert-change {
  entry 0%,
  exit 100% {
    interactivity: inert;
  }

  entry 1%,
  exit 99% {
    interactivity: auto;
  }
}
```

Xem trang tham chiếu {{cssxref("animation-range")}} để giải thích về các giá trị vị trí.

#### Kết quả

Cuộn danh sách không có thứ tự theo chiều ngang để xem hiệu ứng phân trang — mỗi trang snap vào tầm nhìn. Thử dùng tab giữa các liên kết và nút; bạn sẽ thấy rằng chỉ những cái trên màn hình mới có thể tương tác và có thể dùng tab đến.

{{ EmbedLiveSample("offscreen-inert", "100%", "320") }}

## Vấn đề khả năng tiếp cận

Hãy cân nhắc kỹ về khả năng tiếp cận khi làm cho các phần tử trở thành inert. Theo mặc định, không có cách nào nhìn thấy để biết một phần tử hoặc cây con của nó có ở trạng thái inert hay không. Với tư cách là nhà phát triển web, bạn có trách nhiệm chỉ rõ các phần nội dung đang hoạt động và những phần đang ở trạng thái inert.

Trong khi cung cấp các dấu hiệu trực quan và không trực quan về tính inertness của nội dung, cũng cần nhớ rằng viewport trực quan có thể chỉ chứa một số phần của nội dung. Người dùng có thể phóng to vào một phần nhỏ của nội dung, hoặc người dùng có thể không thể xem nội dung chút nào. Các phần inert không rõ ràng là inert có thể dẫn đến sự thất vọng và trải nghiệm người dùng kém.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert)
- {{domxref("HTMLElement.inert")}}
