---
title: column-wrap
slug: Web/CSS/Reference/Properties/column-wrap
page-type: css-property
status:
  - experimental
browser-compat: css.properties.column-wrap
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính CSS **`column-wrap`** xác định hành vi xuống dòng của các cột tràn trong [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout).

## Cú pháp

```css
/* Từ khóa */
column-wrap: auto;
column-wrap: nowrap;
column-wrap: wrap;

/* Giá trị toàn cục */
column-wrap: inherit;
column-wrap: initial;
column-wrap: revert;
column-wrap: revert-layer;
column-wrap: unset;
```

### Giá trị

- `auto`
  - : Giá trị ban đầu. Nếu {{cssxref("column-height")}} của vùng chứa nội dung được đặt thành {{cssxref("&lt;length>")}}, `auto` sẽ được hiểu là `wrap`, còn lại sẽ là `nowrap`.
- `nowrap`
  - : Các cột tràn ra theo chiều ngang (inline direction).
- `wrap`
  - : Các cột tràn được đặt vào một hàng mới theo chiều dọc (block direction).

## Mô tả

Thuộc tính `column-wrap` có thể dùng để đặt các cột của [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout) xuống dòng mới khi chúng bắt đầu tràn ra khỏi chiều rộng cột. Điều này hữu ích để tạo bố cục dễ đọc hơn khi sử dụng thuộc tính {{cssxref("column-count")}} hoặc {{cssxref("column-width")}} để tạo nhiều cột.

Nếu không có `column-wrap`, các cột dư thừa sẽ tràn sang một bên và người đọc phải cuộn theo chiều ngang để đọc hết nội dung. Thuộc tính {{cssxref("column-height")}}, kết hợp với `column-wrap`, cho phép bạn đặt chiều cao cố định cho các cột và tự động xuống hàng khi chạm đến cạnh vùng chứa.

Giá trị mặc định của `column-wrap` là `auto`, được hiểu là `wrap` khi `column-height` được đặt thành giá trị `<length>`; `wrap` cho phép các cột có chiều cao cố định xuống nhiều hàng. Khi `column-height` bằng `auto`, `column-wrap: auto` được hiểu là `nowrap`, cho phép các cột tràn ngang nếu vùng chứa có chiều cao cố định.

Do hành vi mặc định này, thông thường bạn không cần đặt tường minh thuộc tính `column-wrap`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách sử dụng cơ bản của thuộc tính `column-wrap` để tạo bố cục nhiều cột có xuống hàng bằng cách đặt thuộc tính `column-height`.

#### HTML

Chúng ta dùng một bài thơ của Dr. Seuss trong phần tử {{htmlelement("ol")}} chứa 28 phần tử {{htmlelement("li")}}, theo sau là tên tác giả trong phần tử {{htmlelement("p")}}.

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

Chúng ta định nghĩa `<ol>` là vùng chứa nhiều cột bằng cách đặt thuộc tính {{cssxref("column-width")}} thành `150px`, nghĩa là vùng chứa sẽ có càng nhiều cột càng tốt, mỗi cột có độ rộng tối thiểu `150px`. Thuộc tính {{cssxref("gap")}} đặt khoảng cách ngang giữa các cột và khoảng cách dọc giữa các hàng cột. Sau đó chúng ta đặt `column-height` thành `3em`, khiến giá trị mặc định `auto` của `column-wrap` được hiểu là `wrap` để tạo các hàng cột xuống dòng.

```css live-sample___basic-example
ol {
  column-width: 150px;
  gap: 2em;
  column-height: 3em;
}
```

#### Kết quả

{{EmbedLiveSample("basic-example", "100%", "300")}}

### So sánh `wrap` và `nowrap`

Ví dụ này có bố cục nhiều cột minh họa sự khác biệt giữa giá trị `wrap` và `nowrap` bằng cách cho phép bạn chuyển đổi giá trị `column-wrap` của vùng chứa cột giữa hai giá trị này. Kết quả là bố cục chuyển đổi động giữa cuộn ngang và cuộn dọc.

#### HTML và JavaScript

Phần đánh dấu của ví dụ này chứa nhiều đoạn nội dung, lấy từ trang chủ HTML, CSS và JavaScript của MDN, cùng một phần tử [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) điều khiển bằng JavaScript để chuyển đổi giá trị thuộc tính `column-wrap` của vùng chứa giữa `nowrap` và `wrap`. HTML và JavaScript đã được ẩn để ngắn gọn.

```html hidden live-sample___wrap-nowrap
<form>
  <label for="set-wrap"
    >Set <code>column-wrap</code> to <code>wrap</code></label
  >
  <input type="checkbox" id="set-wrap" />
</form>
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

```js hidden live-sample___wrap-nowrap
const checkbox = document.getElementById("set-wrap");
checkbox.addEventListener("change", () => {
  if (checkbox.checked) {
    document.body.style.columnWrap = "wrap";
  } else {
    document.body.style.columnWrap = "nowrap";
  }
});
```

#### CSS

Chúng ta biến phần tử {{htmlelement("body")}} thành vùng chứa nhiều cột bằng cách đặt {{cssxref("column-count")}} thành `3`. Sau đó đặt {{cssxref("gap")}} thành `3em 2em`, tạo khoảng cách `3em` giữa các hàng và `2em` giữa các cột.

Tiếp theo đặt `column-height` thành `90vh`, làm cho các cột gần bằng chiều cao viewport. Chúng ta cũng đặt `column-wrap` thành `nowrap`, khiến các cột nội dung dư thừa tràn sang ngang. Điều này cần thiết vì giá trị ban đầu của `column-wrap` là `auto`, được hiểu là `wrap` khi `column-height` được đặt thành giá trị `<length>`.

Hộp kiểm chuyển đổi thuộc tính `column-wrap` giữa `nowrap` và `wrap`. Khi đặt thành `wrap`, các cột nội dung dư thừa tràn theo chiều dọc sang hàng mới, tạo bố cục dọc. Giá trị `column-height` làm cho mỗi hàng cột lấp đầy viewport.

```css live-sample___wrap-nowrap
body {
  column-count: 3;
  gap: 3em 2em;
  padding: 0 2em;
  column-height: 90vh;
  column-wrap: nowrap;
}
```

Tiếp theo, chúng ta đặt thuộc tính {{cssxref("column-span")}} của phần tử [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) thành `all` để tiêu đề trải rộng trên tất cả các cột, và đặt thuộc tính {{cssxref("margin-top")}} của {{htmlelement("p")}} đầu tiên thành `0` để nó thẳng hàng với đỉnh cột.

```css live-sample___wrap-nowrap
h1 {
  column-span: all;
}

p:first-of-type {
  margin-top: 0;
}
```

```css hidden live-sample___wrap-nowrap
* {
  box-sizing: border-box;
}

html {
  font-family: Arial, Helvetica, sans-serif;
}

p {
  line-height: 1.5;
}

@supports not (column-wrap: wrap) {
  body::before {
    content: "Your browser does not support the 'column-wrap' property.";
    background-color: wheat;
    position: fixed;
    inset: 40% 0;
    height: fit-content;
    text-align: center;
    padding: 1rem 0;
  }
}

form {
  position: fixed;
  top: 0;
  right: 0;
  background-color: white;
  padding: 5px;
  border: 1px solid black;
}
```

#### Kết quả

{{EmbedLiveSample("wrap-nowrap", "100%", "400")}}

Chuyển đổi hộp kiểm để thay đổi giá trị của thuộc tính `column-wrap` và chuyển đổi bố cục giữa cuộn ngang và cuộn dọc. Khi `column-wrap` được đặt thành `nowrap`, các cột tràn sang ngang; khi `column-wrap` được đặt thành `wrap`, các hàng cột mới được thêm vào theo chiều dọc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("column-count")}}
- {{cssxref("column-width")}}
- Thuộc tính viết tắt {{cssxref("columns")}}
- {{Cssxref("column-height")}}
- Mô-đun [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout)
