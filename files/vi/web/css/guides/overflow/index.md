---
title: CSS overflow
short-title: Overflow
slug: Web/CSS/Guides/Overflow
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-overflow/
  - https://drafts.csswg.org/css-overflow-4/
  - https://drafts.csswg.org/css-overflow-5/
sidebar: cssref
---

Các thuộc tính của module **CSS overflow** giúp bạn xử lý scrollable overflow trong phương tiện trực quan.

Overflow xảy ra khi nội dung bên trong hộp phần tử vượt qua một hoặc nhiều cạnh của hộp đó. **Scrollable overflow** là nội dung xuất hiện bên ngoài hộp phần tử mà bạn có thể muốn thêm cơ chế cuộn. Các thuộc tính CSS overflow cho phép bạn kiểm soát điều gì xảy ra khi nội dung tràn ra ngoài hộp phần tử, bao gồm việc tạo carousel mà không cần JavaScript.

Các hiệu ứng vẽ tràn ra ngoài nội dung nhưng không tham gia vào CSS box model sẽ không ảnh hưởng đến layout. Loại overflow này còn được gọi là {{Glossary("ink overflow")}}. Ví dụ về ink overflow bao gồm box shadow, border image, text decoration, glyph nhô ra, và outline. Ink overflow không mở rộng vùng scrollable overflow.

## Overflow trong thực tế

Hãy thử ví dụ sau để xem hiệu ứng của các giá trị thuộc tính `overflow` khác nhau lên nội dung tràn và thanh cuộn trong hộp có kích thước cố định bên cạnh.

Ví dụ bao gồm các tùy chọn để thay đổi giá trị cho các thuộc tính `overflow-clip-margin` và `width`, cũng như để cuộn nội dung theo cách lập trình nếu thuộc tính overflow tạo ra {{Glossary("scroll container")}}. Chọn `overflow: clip` và xem hiệu ứng của các giá trị `overflow-clip-margin` khác nhau. Chọn `overflow: hidden` hoặc `overflow: scroll` để xem các thiết lập thanh trượt `ScrollLeft` và `ScrollTop` khác nhau.

```html hidden live-sample___overflow
<article>
  <fieldset>
    <legend>Select options:</legend>
    <label
      ><code>overflow</code>:
      <select id="overflowValue">
        <option>hidden</option>
        <option>clip</option>
        <option>scroll</option>
        <option>auto</option>
        <option selected>visible</option>
        <option>overlay</option>
      </select>
    </label>
    <label>
      <code>overflow-clip-margin</code>:
      <input type="number" id="ocm" value="1" min="0" max="10" />
      <code>em</code>
    </label>
    <label
      ><input type="checkbox" id="wide" /> <code>width</code>:
      <code>20em</code> or <code>40em</code></label
    >
    <fieldset>
      <legend>Scroll programmatically:</legend>
      <label
        >ScrollLeft:
        <input type="range" min="0" max="100" value="0" id="scrollL"
      /></label>
      <label
        >ScrollTop:
        <input type="range" min="0" max="100" value="0" id="scrollT"
      /></label>
    </fieldset>
  </fieldset>
  <pre class="visible">&nbsp;
    Oh, Rubber Duckie, you're the one
    You make bath time lots of fun
    Rubber Duckie, I'm awfully fond of you

    Rubber Duckie, joy of joys
    When I squeeze you, you make noise
    Rubber Duckie, you're my very best friend, it's true

    Oh, every day when I make my way to the tubby
    I find a little fella who's cute and yellow and chubby
    Rub-a-dub-dubby

    <a href="#">Rubber Duckie</a>, you're so fine
    And I'm lucky that you're mine
    Rubber Duckie, I'm awfully fond of you
      </pre>
</article>
```

```css hidden live-sample___overflow
article {
  display: flex;
  gap: 1em;
}

label {
  display: block;
  white-space: nowrap;
}

pre {
  border: 2px dashed crimson;
  height: 150px;
  width: 20em;
  margin-bottom: 3em;
  overflow-clip-margin: 1em;
  text-align: center;
}

.wide {
  width: 40em;
}

::before {
  font-weight: bold;
  color: white;
  background: crimson;
  display: inline-block;
  min-width: 50%;
  padding: 3px 5px;
  box-sizing: border-box;
}

.hidden {
  overflow: hidden;
}
.hidden::before {
  content: "hidden: ";
}

.clip {
  overflow: clip;
}
.clip::before {
  content: "clip: ";
}

.scroll {
  overflow: scroll;
}
.scroll::before {
  content: "scroll: ";
}

.auto {
  overflow: auto;
}
.auto::before {
  content: "auto: ";
}

.overlay {
  overflow: clip;
  overflow: overlay;
}
.overlay::before {
  content: "overlay (or clip if not supported): ";
}

.visible {
  overflow: visible;
}
.visible::before {
  content: "visible: ";
}

article:not(:has(pre.clip)) > fieldset > label:nth-of-type(2),
article:not(:has(pre.hidden, pre.scroll, pre.auto, pre.overlay))
  fieldset
  fieldset {
  opacity: 20%;
  pointer-events: none;
}
```

```js hidden live-sample___overflow
const pre = document.querySelector("pre");
const val = document.getElementById("overflowValue");
const check = document.getElementById("wide");
const ocm = document.getElementById("ocm");
const scrollL = document.getElementById("scrollL");
const scrollT = document.getElementById("scrollT");

val.addEventListener("change", () => {
  if (pre.classList.contains("wide")) {
    pre.className = `wide ${val.value}`;
  } else {
    pre.className = `${val.value}`;
  }
  scrollExample();
  clipMargin();
});

wide.addEventListener("change", () => {
  pre.classList.toggle("wide");
  scrollExample();
});

ocm.addEventListener("change", () => {
  clipMargin();
});

scrollL.addEventListener("change", () => {
  scrollExample();
});
scrollT.addEventListener("change", () => {
  scrollExample();
});

function scrollExample() {
  pre.scrollTo({
    top: scrollT.value,
    left: scrollL.value * 2,
    behavior: "smooth",
  });
}

function clipMargin() {
  pre.style.overflowClipMargin = `${ocm.value}em`;
}
```

{{EmbedLiveSample("overflow", "", "400px")}}

Một liên kết được đưa vào hộp nội dung ở trên để minh họa hiệu ứng của keyboard focus lên hành vi overflow và cuộn. Thử nhấn Tab đến liên kết hoặc cuộn nội dung theo cách lập trình: nội dung sẽ chỉ cuộn nếu giá trị `<overflow>` được liệt kê tạo ra một scroll container.

## Tham chiếu

### Thuộc tính

- {{CSSxRef("line-clamp")}}
- Shorthand {{CSSxRef("overflow")}}
- {{CSSxRef("overflow-block")}}
- {{CSSxRef("overflow-clip-margin")}}
- {{CSSxRef("overflow-inline")}}
- {{CSSxRef("overflow-x")}}
- {{CSSxRef("overflow-y")}}
- {{CSSxRef("scroll-behavior")}}
- {{cssxref("scroll-marker-group")}}
- {{cssxref("scroll-target-group")}}
- {{CSSxRef("scrollbar-gutter")}}
- {{CSSxRef("text-overflow")}}

Module CSS overflow level 4 cũng giới thiệu các thuộc tính `block-ellipsis`, `continue`, `max-lines`, `overflow-clip-margin-block`, `overflow-clip-margin-block-end`, `overflow-clip-margin-block-start`, `overflow-clip-margin-bottom`, `overflow-clip-margin-inline`, `overflow-clip-margin-inline-end`, `overflow-clip-margin-inline-start`, `overflow-clip-margin-left`, `overflow-clip-margin-right`, và `overflow-clip-margin-top`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

### Selector và pseudo-element

- {{cssxref("::scroll-button()")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref("::scroll-marker-group")}}
- {{cssxref(":target-after")}}
- {{cssxref(":target-before")}}
- {{cssxref(":target-current")}}

### Kiểu dữ liệu

- Các giá trị liệt kê {{cssxref("&lt;overflow&gt;")}}

### Thuật ngữ bảng chú giải

- {{glossary("Scroll container")}}
- [Scrollport](/en-US/docs/Glossary/Scroll_container#scrollport)

## Hướng dẫn

- [Học: Nội dung tràn](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow)
  - : Tìm hiểu overflow là gì và cách quản lý nó.
- [Tạo CSS carousel](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
  - : Tạo tính năng giao diện carousel thuần CSS bằng cách sử dụng scroll button, scroll marker và cột được tạo sẵn.
- [Tạo animation scroll progress timeline có tên](/en-US/docs/Web/CSS/Reference/Properties/scroll-timeline-name#creating_a_named_scroll_progress_timeline_animation)
  - : Các thuộc tính {{cssxref('scroll-timeline-name')}} và {{cssxref('scroll-timeline-axis')}} của CSS scroll timeline, cùng với shorthand {{cssxref('scroll-timeline')}}, tạo ra các animation được gắn với scroll offset của scroll container.

## Khái niệm liên quan

- {{cssxref("::column")}}
- Thuộc tính CSS {{CSSxRef("scrollbar-width")}}
- Thuộc tính CSS {{CSSxRef("scrollbar-color")}}
- Thuộc tính CSS {{CSSxRef("scrollbar-gutter")}}
- Thuộc tính CSS {{CSSxRef("scroll-behavior")}}
- Thuộc tính shorthand CSS {{cssxref("scroll-margin")}}
- Thuộc tính shorthand CSS {{cssxref("scroll-padding")}}
- Thuộc tính CSS {{cssxref("scroll-snap-align")}}
- Thuộc tính CSS {{cssxref("scroll-snap-stop")}}
- Thuộc tính CSS {{cssxref("scroll-snap-type")}}
- Thuộc tính CSS {{cssxref("text-overflow")}}
- Pseudo-element {{CSSxRef("::-webkit-scrollbar")}}
- ARIA role [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- Phương thức {{domxref("Element.scroll", "scroll()")}} của Element
- Phương thức {{domxref("Element.scrollBy", "scrollBy()")}} của Element
- Phương thức {{domxref("Element.scrollIntoView", "scrollIntoView()")}} của Element
- Phương thức {{domxref("Element.scrollTo", "scrollTo()")}} của Element
- Thuộc tính {{domxref("Element.scrollTop", "scrollTop")}} của Element
- Thuộc tính {{domxref("Element.scrollLeft", "scrollLeft")}} của Element
- Thuộc tính {{domxref("Element.scrollWidth", "scrollWidth")}} của Element
- Thuộc tính {{domxref("Element.scrollHeight", "scrollHeight")}} của Element
- Sự kiện {{domxref("Document.scroll_event", "scroll")}} của Document
- Thuật ngữ bảng chú giải {{Glossary("Scroll container")}}
- Thuật ngữ bảng chú giải {{Glossary("Ink overflow")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS scrollbars styling](/en-US/docs/Web/CSS/Guides/Scrollbars_styling)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- Module [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view)
- Cách [debug scrollable overflow](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/debug_scrollable_overflow/index.html)
