---
title: column-height
slug: Web/CSS/Reference/Properties/column-height
page-type: css-property
status:
  - experimental
browser-compat: css.properties.column-height
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`column-height`** [CSS](/en-US/docs/Web/CSS) chỉ định chiều cao của các cột trong [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout).

Thuộc tính viết tắt {{cssxref("columns")}} có thể được sử dụng để đặt các giá trị thuộc tính `column-height`, {{cssxref("column-count")}} và {{cssxref("column-width")}} trong một khai báo duy nhất.

## Cú pháp

```css
/* Từ khóa */
column-height: auto;

/* Giá trị <length> */
column-height: 300px;
column-height: 25em;
column-height: 70vh;

/* Giá trị toàn cục */
column-height: inherit;
column-height: initial;
column-height: revert;
column-height: revert-layer;
column-height: unset;
```

### Giá trị

- `auto`
  - : Giá trị khởi tạo. Nếu container nội dung có chiều cao được đặt, các cột nội dung sẽ phát triển đến chiều cao đó, tràn ra bên cạnh nếu nội dung không vừa trong container. Nếu container nội dung không có chiều cao được đặt, nội dung sẽ được phân phối đều giữa các cột được tạo bên trong container.
- {{cssxref("&lt;length>")}}
  - : Chiều cao của các cột. Phải không âm.

## Mô tả

Thuộc tính `column-height` đặt chiều cao của các cột trong [bố cục nhiều cột](/en-US/docs/Web/CSS/Guides/Multicol_layout). Điều này hữu ích để giới hạn chiều cao cột nhằm tăng khả năng đọc khi đặt nhiều cột bằng cách sử dụng thuộc tính {{cssxref("column-count")}} hoặc {{cssxref("column-width")}}.

Không có `column-height`, nếu chiều cao của nội dung nhiều cột vượt quá chiều cao viewport, người đọc sẽ cần cuộn xuống đến cuối cột và sau đó cuộn ngược lên đầu cột tiếp theo. Một cách khắc phục có thể là đặt chiều cao cố định cho container nội dung, tuy nhiên, các cột dư thừa sau đó sẽ tràn ra bên cạnh và người đọc sẽ phải cuộn theo hướng nội tuyến để đọc toàn bộ nội dung.

Thuộc tính `column-height`, cùng với {{cssxref("column-wrap")}}, cho phép bạn đặt chiều cao cụ thể cho các cột và bọc chúng sang hàng cột mới khi đến cạnh container.

Giá trị mặc định của `column-wrap` là `auto`, được giải quyết thành `wrap` khi `column-height` được đặt thành giá trị `<length>`; `wrap` cho phép các cột có chiều cao cố định bọc sang nhiều hàng. Khi `column-height` bằng `auto`, `column-wrap: auto` được giải quyết thành `nowrap`, cho phép các cột tràn ngang nếu chiều cao container cố định được đặt. Do hành vi mặc định này, thông thường bạn không cần đặt thuộc tính `column-wrap` một cách rõ ràng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách sử dụng cơ bản của thuộc tính `column-height` để tạo bố cục nhiều cột được bọc.

#### HTML

Chúng ta bao gồm một bài thơ của Dr. Seuss sử dụng {{htmlelement("ol")}} chứa 28 {{htmlelement("li")}}, tiếp theo là tên tác giả trong {{htmlelement("p")}}.

```html
<ol>
  <li>One fish</li>
  <li>Two fish</li>
  <li>Red fish</li>
  <li>Blue fish</li>
  ...
</ol>
<p>-- Dr. Seuss</p>
```

```html hidden live-sample___basic-example
<ol>
  <li>One fish</li>
  <li>Two fish</li>
  <li>Red fish</li>
  <li>Blue fish</li>
  <li>Black fish</li>
  <li>Blue fish</li>
  <li>Old fish</li>
  <li>New fish.</li>
  <li>This one has a little star.</li>
  <li>This one has a little car.</li>
  <li>Say! What a lot</li>
  <li>Of fish there are.</li>
  <li>Yes. Some are red. And some are blue.</li>
  <li>Some are old. And some are new.</li>
  <li>Some are sad.</li>
  <li>And some are glad.</li>
  <li>And some are very, very bad.</li>
  <li>Why are they</li>
  <li>Sad and glad and bad?</li>
  <li>I do not know.</li>
  <li>Go ask your dad.</li>
  <li>Some are thin.</li>
  <li>And some are fat.</li>
  <li>The fat one has</li>
  <li>A yellow hat.</li>
  <li>From there to here, from here to there,</li>
  <li>Funny things</li>
  <li>Are everywhere.</li>
</ol>
<p>--Dr. Seuss</p>
```

#### CSS

Chúng ta định nghĩa `<ol>` là một container nhiều cột bằng cách đặt thuộc tính {{cssxref("column-width")}} thành `150px`, nghĩa là container sẽ chứa càng nhiều cột càng tốt với mỗi cột có chiều rộng ít nhất là `150px`. Thuộc tính {{cssxref("gap")}} là `2em` tạo khoảng cách ngang giữa các cột và khoảng cách dọc giữa các hàng cột. Sau đó chúng ta đặt `column-height` thành `2em`, khiến giá trị mặc định `auto` của thuộc tính `column-wrap` được giải quyết thành `wrap` để tạo các hàng cột được bọc.

```css live-sample___basic-example
ol {
  column-width: 150px;
  gap: 2em;
  column-height: 3em;
}
```

#### Kết quả

{{EmbedLiveSample("basic-example", "100%", "300")}}

### Các cột cuộn snap

Ví dụ này kết hợp bố cục nhiều cột được bọc với [CSS scroll snapping](/en-US/docs/Web/CSS/Guides/Scroll_snap), tạo trải nghiệm có thể sử dụng trong đó mỗi hành động cuộn snap một hàng cột mới gọn gàng bên trong toàn bộ chiều cao của viewport để đọc thoải mái.

#### HTML

HTML, chứa nhiều đoạn văn nội dung từ các trang chủ MDN HTML, CSS và JavaScript, đã được ẩn đi cho ngắn gọn.

```html hidden live-sample___scroll-snapped live-sample___column-playground
<h1>HTML, CSS, and JavaScript summaries</h1>
<p>
  <strong>HTML</strong> (HyperText Markup Language) is the most basic building
  block of the Web. It defines the meaning and structure of web content. Other
  technologies besides HTML are generally used to describe a web page's
  appearance (CSS) or behavior (JavaScript).
</p>
<p>
  "Hypertext" refers to links that connect web pages to one another, either
  within a single website or between websites. Links are a fundamental aspect of
  the Web. By uploading content to the Internet and linking it to pages created
  by other people, you become an active participant in the World Wide Web.
</p>
<p>
  HTML uses "markup" to annotate text, images, and other content for display in
  a Web browser. HTML markup includes special "elements" such as
  <a href="/en-US/docs/Web/HTML/Reference/Elements/head"
    ><code>&lt;head&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/title"
    ><code>&lt;title&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/body"
    ><code>&lt;body&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/header"
    ><code>&lt;header&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/footer"
    ><code>&lt;footer&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/article"
    ><code>&lt;article&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/section"
    ><code>&lt;section&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/p"><code>&lt;p&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/div"
    ><code>&lt;div&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/span"
    ><code>&lt;span&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/img"
    ><code>&lt;img&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/aside"
    ><code>&lt;aside&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/audio"
    ><code>&lt;audio&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/canvas"
    ><code>&lt;canvas&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/datalist"
    ><code>&lt;datalist&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/details"
    ><code>&lt;details&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/embed"
    ><code>&lt;embed&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/nav"
    ><code>&lt;nav&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/search"
    ><code>&lt;search&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/output"
    ><code>&lt;output&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/progress"
    ><code>&lt;progress&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/video"
    ><code>&lt;video&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/ul"
    ><code>&lt;ul&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/ol"
    ><code>&lt;ol&gt;</code></a
  >,
  <a href="/en-US/docs/Web/HTML/Reference/Elements/li"
    ><code>&lt;li&gt;</code></a
  >
  and many others.
</p>
<p>
  An HTML element is set off from other text in a document by "tags", which
  consist of the element name surrounded by <code>&lt;</code> and
  <code>&gt;</code>. The name of an element inside a tag is case-insensitive.
  That is, it can be written in uppercase, lowercase, or a mixture. For example,
  the <code>&lt;title&gt;</code> tag can be written as
  <code>&lt;Title&gt;</code>, <code>&lt;TITLE&gt;</code>, or in any other way.
  However, the convention and recommended practice is to write tags in
  lowercase.
</p>

<hr />

<p>
  <strong>Cascading Style Sheets</strong> (<strong>CSS</strong>) is a
  <a href="/en-US/docs/Web/API/StyleSheet">stylesheet</a> language used to
  describe the presentation of a document written in
  <a href="/en-US/docs/Web/HTML">HTML</a> or
  <a href="/en-US/docs/Web/XML/Guides/XML_introduction">XML</a> (including XML
  dialects such as <a href="/en-US/docs/Web/SVG">SVG</a>,
  <a href="/en-US/docs/Web/MathML">MathML</a> or
  <a href="/en-US/docs/Glossary/XHTML">XHTML</a>). CSS describes how elements
  should be rendered on screen, on paper, in speech, or on other media.
</p>
<p>
  CSS is among the core languages of the <strong>open web</strong> and is
  standardized across web browsers according to
  <a href="https://www.w3.org/Style/CSS/#specs" class="external" target="_blank"
    >W3C specifications</a
  >. Previously, the development of various parts of CSS specification was done
  synchronously, which allowed the versioning of the latest recommendations. You
  might have heard about CSS1, CSS2.1, or even CSS3. There will never be a CSS3
  or a CSS4; rather, everything is now just "CSS" with individual CSS modules
  having version numbers.
</p>
<p>
  After CSS 2.1, the scope of the specification increased significantly and the
  progress on different CSS modules started to differ so much, that it became
  more effective to
  <a
    href="https://www.w3.org/Style/CSS/current-work"
    class="external"
    target="_blank"
    >develop and release recommendations separately per module</a
  >. Instead of versioning the CSS specification, W3C now periodically takes a
  snapshot of
  <a href="https://www.w3.org/TR/css/" class="external" target="_blank"
    >the latest stable state of the CSS specification</a
  >
  and individual modules progress. CSS modules now have version numbers, or
  levels, such as
  <a
    href="https://drafts.csswg.org/css-color-5/"
    class="external"
    target="_blank"
    >CSS Color Module Level 5</a
  >.
</p>

<hr />

<p>
  <strong>JavaScript</strong> (<strong>JS</strong>) is a lightweight interpreted
  (or
  <a href="/en-US/docs/Glossary/Just_In_Time_Compilation"
    >just-in-time compiled</a
  >) programming language with
  <a href="/en-US/docs/Glossary/First-class_Function">first-class functions</a>.
  While it is most well-known as the scripting language for Web pages,
  <a
    href="https://en.wikipedia.org/wiki/JavaScript#Other_usage"
    class="external"
    target="_blank"
    >many non-browser environments</a
  >
  also use it, such as <a href="/en-US/docs/Glossary/Node.js">Node.js</a>,
  <a href="https://couchdb.apache.org/" class="external" target="_blank"
    >Apache CouchDB</a
  >
  and
  <a
    href="https://opensource.adobe.com/dc-acrobat-sdk-docs/acrobatsdk/"
    class="external"
    target="_blank"
    >Adobe Acrobat</a
  >. JavaScript is a
  <a href="/en-US/docs/Glossary/Prototype-based_programming">prototype-based</a
  >, <a href="/en-US/docs/Glossary/Garbage_collection">garbage-collected</a>,
  <a href="/en-US/docs/Glossary/Dynamic_typing">dynamic</a> language, supporting
  multiple paradigms such as imperative, functional, and object-oriented.
</p>
<p>
  JavaScript's dynamic capabilities include runtime object construction,
  variable parameter lists, function variables, dynamic script creation (via
  <a href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval"
    ><code>eval</code></a
  >), object introspection (via
  <a href="/en-US/docs/Web/JavaScript/Reference/Statements/for...in"
    ><code>for...in</code></a
  >
  and
  <a
    href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#static_methods"
    ><code>Object</code> utilities</a
  >), and source-code recovery (JavaScript functions store their source text and
  can be retrieved through
  <a
    href="/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/toString"
    ><code>toString()</code></a
  >).
</p>
<p>
  This section is dedicated to the JavaScript language itself, and not the parts
  that are specific to Web pages or other host environments. For information
  about <a href="/en-US/docs/Glossary/API">APIs</a> that are specific to Web
  pages, please see <a href="/en-US/docs/Web/API">Web APIs</a> and
  <a href="/en-US/docs/Glossary/DOM">DOM</a>.
</p>
<p>
  The standards for JavaScript are the
  <a href="https://tc39.es/ecma262/" class="external" target="_blank"
    >ECMAScript Language Specification</a
  >
  (ECMA-262) and the
  <a href="https://tc39.es/ecma402/" class="external" target="_blank"
    >ECMAScript Internationalization API specification</a
  >
  (ECMA-402). As soon as one browser implements a feature, we try to document
  it. This means that cases where some
  <a href="https://github.com/tc39/proposals" class="external" target="_blank"
    >proposals for new ECMAScript features</a
  >
  have already been implemented in browsers, documentation and examples in MDN
  articles may use some of those new features. Most of the time, this happens
  between the
  <a href="https://tc39.es/process-document/" class="external" target="_blank"
    >stages</a
  >
  3 and 4, and is usually before the spec is officially published.
</p>
<p>
  Do not confuse JavaScript with the
  <a
    href="https://en.wikipedia.org/wiki/Java_(programming_language)"
    class="external"
    target="_blank"
    >Java programming language</a
  >
  — <strong>JavaScript is <em>not</em> "Interpreted Java"</strong>. Both "Java"
  and "JavaScript" are trademarks or registered trademarks of Oracle in the U.S.
  and other countries. However, the two programming languages have very
  different syntax, semantics, and use.
</p>
<p>
  JavaScript documentation of core language features (pure
  <a
    href="/en-US/docs/Web/JavaScript/Reference/JavaScript_technologies_overview"
    >ECMAScript</a
  >, for the most part) includes the following:
</p>
```

#### CSS

Chúng ta bắt đầu bằng cách đặt {{cssxref("column-width")}} trên phần tử {{htmlelement("body")}} để xác định chiều rộng ưa thích cho các cột. {{cssxref("gap")}} là `3em 2em` tạo khoảng cách `3em` giữa các hàng và `2em` giữa các cột. {{cssxref("column-rule")}} thêm một đường kẻ ở giữa khoảng cách giữa các cột. `column-height` là `95vh` làm cho các cột gần bằng chiều cao của viewport.

Chúng ta đặt rõ ràng {{cssxref("column-wrap")}} thành `wrap` như một lời nhắc về hành vi bọc được áp dụng. Chúng ta có thể đặt giá trị thành `auto` hoặc bỏ qua thuộc tính hoàn toàn, vì theo mặc định, `column-wrap` được giải quyết thành `wrap` khi `column-height` được đặt thành giá trị `<length>`.

```css live-sample___scroll-snapped
body {
  column-width: 150px;
  column-rule: 2px solid red;
  gap: 3em 2em;
  padding: 0 2em;
  column-height: 95vh;
  column-wrap: wrap;
}
```

Tiếp theo, chúng ta đặt thuộc tính {{cssxref("column-span")}} của phần tử [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) thành `all`, để tiêu đề trải dài trên tất cả các cột, và đặt thuộc tính {{cssxref("margin-top")}} của {{htmlelement("p")}} đầu tiên thành `0` để nó thẳng hàng với đầu các cột.

```css live-sample___scroll-snapped live-sample___column-playground
h1 {
  column-span: all;
}

p:first-of-type {
  margin-top: 0;
}
```

Cuối cùng, chúng ta thêm scroll snapping bằng cách đặt {{cssxref("scroll-snap-type")}} thành `y mandatory` trên phần tử {{htmlelement("html")}}, và {{cssxref("scroll-snap-align")}} thành `start` trên các phần tử giả {{cssxref("::column")}} đại diện cho mỗi cột được tạo. Điều này khiến nội dung snap đến đầu cột mới mỗi khi cuộn.

```css live-sample___scroll-snapped
html {
  scroll-snap-type: y mandatory;
}

::column {
  scroll-snap-align: start;
}
```

```css hidden live-sample___scroll-snapped live-sample___column-playground
* {
  box-sizing: border-box;
}

html {
  font-family: Arial, Helvetica, sans-serif;
}

p {
  line-height: 1.5;
}

@supports not (column-height: 15em) {
  body::before {
    content: "Your browser does not support the 'column-height' property.";
    background-color: wheat;
    position: fixed;
    inset: 40% 0;
    height: fit-content;
    text-align: center;
    padding: 1rem 0;
  }
}
```

#### Kết quả

{{EmbedLiveSample("scroll-snapped", "100%", "400")}}

Thử cuộn nội dung. Lưu ý cách mỗi hàng cột mới lấp đầy viewport và cách nội dung snap gọn gàng đến đầu hàng mới với mỗi lần cuộn.

### Sân chơi `column-height` và `column-count`

Ví dụ này xây dựng dựa trên ví dụ trước bằng cách bao gồm hai thanh trượt phạm vi cho phép bạn điều chỉnh số lượng cột và chiều cao cột của bố cục nhiều cột.

#### HTML và JavaScript

HTML giống như ví dụ trước, với việc thêm một biểu mẫu chứa hai phần tử [`<input="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) cập nhật các giá trị `column-count` và `column-height` thông qua JavaScript. HTML và JavaScript đã được ẩn đi cho ngắn gọn.

```html hidden live-sample___column-playground
<form>
  <div>
    <label for="columns">
      <code>column-count <output id="columns-output">3</output></code>
    </label>
    <input type="range" min="3" max="6" value="3" id="columns" />
  </div>
  <div>
    <label for="column-height">
      <code>column-height <output id="column-height-output">20em</output></code>
    </label>
    <input type="range" min="10" max="30" value="20" id="column-height" />
  </div>
</form>
```

```js hidden live-sample___column-playground
const columnsRange = document.getElementById("columns");
const columnsOutput = document.getElementById("columns-output");
const columnHeightRange = document.getElementById("column-height");
const columnHeightOutput = document.getElementById("column-height-output");

columnsRange.addEventListener("input", () => {
  document.body.style.columnCount = columnsRange.value;
  columnsOutput.textContent = columnsRange.value;
});

columnHeightRange.addEventListener("input", () => {
  document.body.style.columnHeight = `${columnHeightRange.value}em`;
  columnHeightOutput.textContent = `${columnHeightRange.value}em`;
});
```

#### CSS

Chúng ta chỉ định {{cssxref("column-rule")}} và {{cssxref("gap")}} với các giá trị giống như ví dụ trước. Chúng ta không chỉ định `column-width`; thay vào đó, chúng ta tạo bố cục nhiều cột bằng cách sử dụng thuộc tính {{cssxref("column-count")}}, tương tác đặt số lượng cột và chiều cao hàng cột bằng JavaScript. Scroll snapping không được bao gồm trong ví dụ này.

```css live-sample___column-playground
body {
  column-count: 3;
  column-height: 20em;
  column-rule: 2px solid red;
  gap: 3em 2em;
  padding: 0 2em;
}
```

```css hidden live-sample___column-playground
form {
  border: 1px solid black;
  background-color: white;
  padding: 10px;
  position: fixed;
  bottom: 1px;
  right: 1px;
}

form div {
  display: flex;
  gap: 1em;
  align-items: center;
  justify-content: space-between;
}
```

#### Kết quả

{{EmbedLiveSample("column-playground", "100%", "400")}}

Điều chỉnh số lượng cột và chiều cao cột để xem tác động của các thuộc tính này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("column-count")}}
- {{cssxref("column-width")}}
- Thuộc tính viết tắt {{cssxref("columns")}}
- {{Cssxref("column-wrap")}}
- Module [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout)
