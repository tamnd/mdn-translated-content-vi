---
title: content
slug: Web/CSS/Reference/Properties/content
page-type: css-property
browser-compat: css.properties.content
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`content`** thay thế nội dung bằng một giá trị được tạo ra. Nó có thể được dùng để xác định những gì được hiển thị bên trong một phần tử hoặc pseudo-element. Đối với các phần tử, thuộc tính `content` chỉ định liệu phần tử hiển thị bình thường (`normal` hoặc `none`) hay được thay thế bằng một hình ảnh (và văn bản "alt" liên quan). Đối với pseudo-element và margin box, `content` xác định nội dung là hình ảnh, văn bản, cả hai, hoặc không có gì, điều này quyết định liệu phần tử có hiển thị hay không.

Các đối tượng được chèn bằng thuộc tính `content` là **{{ glossary("replaced elements")}} ẩn danh**.

{{InteractiveExample("CSS Demo: content", "tabbed-shorter")}}

```css interactive-example
.topic-games::before {
  content: "🎮 " / "games";
}

.topic-weather::before {
  content: "⛅ " / "cloudy";
}

.topic-hot::before {
  content: url("/shared-assets/images/examples/fire.png") / "On fire";
  margin-right: 6px;
}
```

```html interactive-example
<p class="topic-games">Game News: A new inFamous is not planned</p>

<p class="topic-weather">
  Weather for Today: Heat, violent storms and twisters
</p>

<p class="topic-hot">Trending Article: Must-watch videos of the week</p>
```

## Cú pháp

```css
/* Keywords that cannot be combined with other values */
content: normal;
content: none;

/* <content-replacement>: <image> values */
content: url("http://www.example.com/test.png");
content: linear-gradient(#e66465, #9198e5);
content: image-set("image1x.png" 1x, "image2x.png" 2x);

/* speech output: alternative text after a "/"  */
content: url("../img/test.png") / "This is the alt text";
content: counter(chapter) / "Chapter " counter(chapter);

/* <string> value */
content: "unparsed text";

/* <counter> values, optionally with <list-style-type> */
content: counter(chapter_counter);
content: counter(chapter_counter, upper-roman);
content: counters(section_counter, ".");
content: counters(section_counter, ".", decimal-leading-zero);

/* attr() value linked to the HTML attribute value */
content: attr(href);

/* <quote> values */
content: open-quote;
content: close-quote;
content: no-open-quote;
content: no-close-quote;

/* <content-list>: a list of content values. 
Several values can be used simultaneously */
content: "prefix" url("http://www.example.com/test.png");
content: "prefix" url("/img/test.png") "suffix" / "Alt text";
content: open-quote counter(chapter_counter);

/* Global values */
content: inherit;
content: initial;
content: revert;
content: revert-layer;
content: unset;
```

### Giá trị

Giá trị có thể là:

- Một trong hai từ khóa: `none` hoặc `normal`. `normal` là giá trị thuộc tính mặc định.
- `<content-replacement>` khi thay thế DOM node. `<content-replacement>` luôn là `<image>`.
- Một `<content-list>` khi thay thế pseudo-element và margin box. Một `<content-list>` là danh sách một hoặc nhiều hộp inline ẩn danh xuất hiện theo thứ tự đã chỉ định. Mỗi mục `<content-list>` có kiểu [`<string>`](#string), [`<image>`](#image), [`<counter>`](#counter), [`<quote>`](#quote), [`<target>`](#target), hoặc [`<leader()>`](#leader).
- Giá trị văn bản thay thế tùy chọn có thể bao gồm các giá trị `<string>`, `<counter>`, hoặc hàm [`attr()`](#attrx), đứng trước bởi dấu gạch chéo (`/`).

Các từ khóa và kiểu dữ liệu được đề cập ở trên được mô tả chi tiết hơn dưới đây:

- `none`
  - : Khi áp dụng cho pseudo-element, pseudo-element không được tạo ra.
    Khi áp dụng cho một phần tử, giá trị không có hiệu lực.

- `normal`
  - : Đối với pseudo-element {{cssxref("::before")}} và {{cssxref("::after")}}, giá trị này tính toán thành `none`. Đối với các pseudo-element khác như {{cssxref("::marker")}}, {{cssxref("::placeholder")}}, hoặc {{cssxref("::file-selector-button")}}, nó tạo ra nội dung ban đầu (hoặc bình thường) của phần tử. Đối với các phần tử thông thường hoặc page margin box, nó tính toán thành các con của phần tử. Đây là giá trị mặc định.

- {{cssxref("&lt;string&gt;")}}
  - : Một chuỗi ký tự được bao quanh bởi dấu nháy đơn hoặc kép tương ứng. Nhiều giá trị chuỗi sẽ được ghép nối (không có toán tử ghép nối trong CSS).

- {{cssxref("image")}}
  - : Một {{cssxref("image")}}, đại diện cho hình ảnh cần hiển thị. Điều này có thể bằng với {{cssxref("url_value", "&lt;url&gt;")}}, {{cssxref("image/image-set", "image-set()")}}, hoặc kiểu dữ liệu {{cssxref("gradient")}}, hoặc một phần của trang web, được xác định bởi hàm {{cssxref("element()")}}.

- `<counter>`
  - : Giá trị `<counter>` là [CSS counter](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters), thường là một số được tạo ra bởi các phép tính được xác định bởi các thuộc tính {{cssxref("&lt;counter-reset&gt;")}} và {{cssxref("&lt;counter-increment&gt;")}}. Nó có thể được hiển thị bằng hàm {{cssxref("counter()")}} hoặc {{cssxref("counters()")}}.
    - {{cssxref("counter()")}}
      - : Hàm {{cssxref("counter()")}} có hai dạng: 'counter(_name_)' hoặc 'counter(_name_, style)'. Văn bản được tạo ra là giá trị của counter trong cùng với tên đã cho trong phạm vi tại pseudo-element đã cho. Nó được định dạng theo {{cssxref("&lt;list-style-type&gt;")}} đã chỉ định (mặc định là `decimal`).
    - {{cssxref("counters()")}}
      - : Hàm {{cssxref("counters()")}} cũng có hai dạng: 'counters(_name_, _string_)' hoặc 'counters(_name_, _string_, _style_)'. Văn bản được tạo ra là giá trị của tất cả các counter có tên đã cho trong phạm vi tại pseudo-element đã cho, từ ngoài vào trong, được phân cách bởi chuỗi đã chỉ định. Các counter được hiển thị theo {{cssxref("&lt;list-style-type&gt;")}} được chỉ định (mặc định là `decimal`).

- `<quote>`
  - : Kiểu dữ liệu `<quote>` bao gồm các từ khóa phụ thuộc vào ngôn ngữ và vị trí:
    - `open-quote` và `close-quote`
      - : Các giá trị này được thay thế bằng chuỗi thích hợp từ thuộc tính {{cssxref("quotes")}}.
    - `no-open-quote` và `no-close-quote`
      - : Không giới thiệu nội dung, nhưng tăng (giảm) mức lồng nhau cho dấu nháy.

- `<target>`
  - : Kiểu dữ liệu `<target>` bao gồm ba hàm target, `<target-counter()>`, `<target-counters()>`, và `<target-text()>` tạo ra các tham chiếu chéo lấy từ điểm đến của liên kết. Xem [Cú pháp hình thức](#formal_syntax).

- `<leader()>`
  - : Kiểu dữ liệu `<leader()>` bao gồm hàm leader: `leader( <leader-type> )`. Hàm này chấp nhận các giá trị từ khóa `dotted`, `solid`, hoặc `space` (tương đương `leader(".")`, `leader("_")`, và `leader(" ")` tương ứng), hoặc `<string>` làm tham số. Khi được hỗ trợ và sử dụng làm giá trị cho `content`, loại leader được cung cấp sẽ được chèn như một mẫu lặp lại, kết nối trực quan nội dung qua một đường ngang.

- `attr(x)`
  - : Hàm CSS `attr(x)` lấy giá trị của thuộc tính của phần tử được chọn, hoặc phần tử gốc của pseudo-element. Giá trị của thuộc tính `x` của phần tử là một chuỗi chưa được phân tích đại diện cho tên thuộc tính. Nếu không có thuộc tính `x`, chuỗi rỗng được trả về. Độ nhạy phân biệt hoa/thường của tham số tên thuộc tính phụ thuộc vào ngôn ngữ tài liệu.

- văn bản thay thế: `/ <string> | <counter> | attr()`
  - : Văn bản thay thế có thể được chỉ định cho hình ảnh hoặc bất kỳ mục `<content-list>` nào, bằng cách thêm dấu gạch chéo và sau đó là tổ hợp các chuỗi, counter và hàm `attr()`. Văn bản thay thế dành cho đầu ra giọng nói của trình đọc màn hình, nhưng cũng có thể được hiển thị trong một số trình duyệt.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Khả năng tiếp cận

Nội dung được tạo ra bởi CSS không được đưa vào [DOM](/en-US/docs/Web/API/Document_Object_Model). Vì vậy, nó sẽ không được đại diện trong [cây khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis) và một số tổ hợp công nghệ hỗ trợ/trình duyệt nhất định sẽ không thông báo nó. Nếu nội dung truyền đạt thông tin quan trọng để hiểu mục đích của trang, tốt hơn là đưa nó vào tài liệu chính.

Nếu nội dung được chèn vào không chỉ là trang trí, hãy kiểm tra rằng thông tin được cung cấp cho công nghệ hỗ trợ và cũng có sẵn khi CSS bị tắt.

- [Accessibility support for CSS generated content – Tink](https://tink.uk/accessibility-support-for-css-generated-content/) (2015)
- [WCAG, Guideline 1.3: Create content that can be presented in different ways](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.3_—_create_content_that_can_be_presented_in_different_ways)
- [Understanding Success Criterion 1.3.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-programmatic.html)
- [Failure of Success Criterion 1.3.1: inserting non-decorative generated content](https://www.w3.org/TR/WCAG20-TECHS/F87) Techniques for WCAG 2.0

## Ví dụ

Năm ví dụ đầu tiên tạo nội dung được tạo ra trên pseudo-element. Ba ví dụ cuối là [ví dụ về thay thế phần tử](#element_replacement_with_url).

### Thêm chuỗi dựa trên class của phần tử

Ví dụ này chèn văn bản được tạo ra sau văn bản của các phần tử có tên class nhất định. Văn bản có màu đỏ.

#### HTML

```html
<h2>Paperback Best Sellers</h2>
<ol>
  <li>Political Thriller</li>
  <li class="new-entry">Halloween Stories</li>
  <li>My Biography</li>
  <li class="new-entry">Vampire Romance</li>
</ol>
```

#### CSS

```css
.new-entry::after {
  content: " New!"; /* The leading space creates separation
                       between the DOM node's content and the generated content
                       being added. */
  color: red;
}
```

#### Kết quả

{{EmbedLiveSample('Appending_strings_based_on_an_elements_class', '100%', 160)}}

### Dấu nháy

Ví dụ này chèn dấu nháy có màu sắc khác nhau quanh các trích dẫn.

#### HTML

```html
<p>
  According to Sir Tim Berners-Lee,
  <q cite="http://www.w3.org/People/Berners-Lee/FAQ.html#Internet">
    I was lucky enough to invent the Web at the time when the Internet already
    existed - and had for a decade and a half.
  </q>
  We must understand that there is nothing fundamentally wrong with building on
  the contributions of others.
</p>
<p lang="fr-fr">
  Mais c'est Magritte qui a dit,
  <q lang="fr-fr"> Ceci n'est pas une pipe. </q>.
</p>
```

#### CSS

```css
q {
  color: blue;
}

q::before,
q::after {
  font-size: larger;
  color: red;
  background: #cccccc;
}

q::before {
  content: open-quote;
}

q::after {
  content: close-quote;
}
```

#### Kết quả

{{EmbedLiveSample('Quotes', '100%', 200)}}

Lưu ý rằng [loại dấu nháy được tạo ra](/en-US/docs/Web/CSS/Reference/Properties/quotes#auto_quotes) dựa trên ngôn ngữ. Trình duyệt thêm dấu nháy mở và đóng trước và sau các phần tử {{HTMLElement("q")}} theo mặc định, vì vậy các dấu nháy trong ví dụ này sẽ xuất hiện mà không cần đặt chúng một cách tường minh. Chúng có thể bị tắt bằng cách đặt các giá trị thuộc tính `content` tương ứng thành `no-open-quote` và `no-close-quote`, hoặc bằng cách đặt cả hai thành `none`. Chúng cũng có thể được tắt bằng cách đặt thuộc tính {{cssxref("quotes")}} thành `none`.

### Thêm văn bản vào bộ đếm mục danh sách

Ví dụ này kết hợp một counter được kẹp giữa hai `<string>` được thêm vào trước tất cả các mục danh sách, tạo ra nhãn chi tiết hơn cho các mục danh sách ({{HTMLElement("li")}}) trong danh sách có thứ tự ({{HTMLElement("ol")}}).

#### HTML

```html
<ol>
  <li>Dogs</li>
  <li>Cats</li>
  <li>
    Birds
    <ol>
      <li>Owls</li>
      <li>Ducks</li>
      <li>Flightless</li>
    </ol>
  </li>
  <li>Marsupials</li>
</ol>
```

#### CSS

```css
ol {
  counter-reset: items;
  margin-left: 2em;
}
li {
  counter-increment: items;
}
li::marker {
  content: "item " counters(items, ".", numeric) ": ";
}
```

#### Kết quả

{{EmbedLiveSample('Adding_text_to_list_item_counters', '100%', 200)}}

Nội dung được tạo ra trên nhãn của mỗi mục danh sách thêm văn bản "item " làm tiền tố, bao gồm khoảng trắng để phân tách tiền tố với counter, theo sau là ": ", dấu hai chấm và khoảng trắng thêm. Hàm {{cssxref("counters()")}} định nghĩa counter `items` số, trong đó các số của danh sách có thứ tự lồng nhau được phân cách bởi dấu chấm (`.`) trong hầu hết các trình duyệt.

### Chuỗi với giá trị thuộc tính

Ví dụ này hữu ích cho style sheet in ấn. Nó sử dụng [attribute selector](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) để chọn mọi liên kết an toàn đủ điều kiện, thêm giá trị thuộc tính `href` sau văn bản liên kết làm nội dung của pseudo-element {{cssxref("::after")}}.

#### HTML

```html
<ul>
  <li><a href="https://mozilla.com">Mozilla</a></li>
  <li><a href="/">MDN</a></li>
  <li><a href="https://openwebdocs.org">OpenWebDocs</a></li>
</ul>
```

#### CSS

```css
a[href^="https://"]::after {
  content: " (URL: " attr(href) ")";
  color: darkgreen;
}
```

#### Kết quả

{{EmbedLiveSample('Strings_with_attribute_values', '100%', 200)}}

Nội dung được tạo ra là giá trị của thuộc tính `href`, có tiền tố là "URL: ", với khoảng trắng, tất cả trong ngoặc đơn.

### Thêm hình ảnh với văn bản thay thế

Ví dụ này chèn một hình ảnh trước tất cả các liên kết. Hai giá trị `content` được cung cấp. Giá trị `content` sau bao gồm hình ảnh với văn bản thay thế mà trình đọc màn hình có thể đọc thành giọng nói.

#### HTML

```html
<a href="https://www.mozilla.org/en-US/">Mozilla Home Page</a>
```

#### CSS

CSS để hiển thị hình ảnh và đặt văn bản thay thế được hiển thị bên dưới.
Điều này cũng đặt font và màu cho nội dung.

```css
a::before {
  content: url("https://mozorg.cdn.mozilla.net/media/img/favicon.ico") /
    " MOZILLA: ";
}
```

#### Kết quả

{{EmbedLiveSample('Adding_an_image_with_alternative_text', '100%', 60)}}

> [!NOTE]
> Giá trị văn bản thay thế được hiển thị trong cây khả năng tiếp cận của trình duyệt. Tham khảo phần [Xem thêm](#see_also) để biết các bảng khả năng tiếp cận theo trình duyệt.

Nếu sử dụng trình đọc màn hình, nó sẽ đọc từ "MOZILLA" khi đến hình ảnh. Bạn có thể chọn pseudo-element `::before` bằng công cụ chọn trong developer tools và xem {{glossary("accessible name")}} trong bảng khả năng tiếp cận.

### Bao gồm counter trong văn bản thay thế

Ví dụ này có danh sách liên kết đến một tập hợp các chương sách, và cho thấy cách sử dụng nội dung được tạo ra để bao gồm biểu tượng sách và counter trước mỗi liên kết, với văn bản thay thế bao gồm từ "Chapter" thay vì biểu tượng. Điều này dẫn đến từ "chapter" và số chương đứng trước văn bản trong {{glossary("accessible name")}} của mỗi liên kết, sẽ được thông báo cho người dùng trình đọc màn hình khi liên kết nhận được tiêu điểm.

#### HTML

Chúng ta bao gồm một tiêu đề theo sau bởi danh sách có thứ tự các liên kết tiêu đề chương bằng các phần tử {{htmlelement("ol")}}, {{htmlelement("li")}}, và {{htmlelement("a")}}.

```html live-sample___alt-counter
<h2>Chapter list</h2>
<ol>
  <li><a href="#">A stranger calls</a></li>
  <li><a href="#">Two owls</a></li>
  <li><a href="#">Dinner was bland</a></li>
  <li><a href="#">Three owls</a></li>
  <li><a href="#">No-one answered the door</a></li>
  <li><a href="#">The stranger leaves</a></li>
  <li><a href="#">Bedtime</a></li>
</ol>
```

#### CSS

CSS bao gồm {{cssxref("counter-reset")}} cho counter `chapter` trên phần tử `<ol>`. Chúng ta cũng tăng counter `chapter` trên mỗi phần tử `<li>` bằng {{cssxref("counter-increment")}}, và xóa nhãn danh sách bằng cách đặt giá trị {{cssxref("list-style-type")}} là `none`.

```css live-sample___alt-counter
ol {
  counter-reset: chapter;
}

li {
  counter-increment: chapter;
  list-style-type: none;
}
```

Tiếp theo, chúng ta đặt pseudo-element {{cssxref("::before")}} của các phần tử `<a>` để có `content` được tạo ra bằng biểu tượng sách để đại diện cho một chương, cộng với giá trị counter `chapter` hiện tại, và ký tự khoảng trắng để nội dung được tạo ra được phân tách với văn bản liên kết. Cuối cùng, chúng ta đặt văn bản thay thế của nội dung được tạo ra thành giá trị counter `chapter` hiện tại đứng trước từ "Chapter".

```css live-sample___alt-counter
a::before {
  content: "📖 " counter(chapter) " " / "Chapter " counter(chapter);
}
```

#### Kết quả

{{EmbedLiveSample('alt-counter', '100%', 270)}}

Khi trình đọc màn hình điều hướng đến một liên kết trong danh sách, các trình duyệt hỗ trợ sẽ thông báo "Chapter" theo sau là số counter hiện tại, theo sau là văn bản liên kết, ví dụ: "Chapter 1 A stranger calls" và "Chapter 2 Two owls".

### Thay thế phần tử với URL

Ví dụ này thay thế một phần tử thông thường! Nội dung phần tử được thay thế bằng SVG sử dụng kiểu {{cssxref("url_value", "&lt;url&gt;")}}.

Pseudo-element không được hiển thị trên các replaced element. Vì phần tử này được thay thế, bất kỳ `::after` hoặc `::before` tương ứng nào đều không được tạo ra hoặc áp dụng. Để minh họa điều này, chúng ta bao gồm một khối khai báo `::after`, cố gắng thêm `id` làm nội dung được tạo ra. Pseudo-element này sẽ không được tạo ra vì phần tử đã bị thay thế.

#### HTML

```html
<div id="replaced">This content is replaced!</div>
```

#### CSS

```css
#replaced {
  content: url("mdn.svg");
}

/* will not show if element replacement is supported */
div::after {
  content: " (" attr(id) ")";
}
```

#### Kết quả

{{EmbedLiveSample('Element_replacement_with_url', '100%',400)}}

Khi tạo nội dung trên các phần tử thông thường (chứ không chỉ trên pseudo-element), toàn bộ phần tử được thay thế. Điều này có nghĩa là pseudo-element `::before` và `::after` không được tạo ra.

### Thay thế phần tử với `<gradient>`

Ví dụ này minh họa cách nội dung của phần tử có thể được thay thế bằng bất kỳ loại `<image>` nào, trong trường hợp này là CSS gradient. Nội dung phần tử được thay thế bằng {{cssxref("gradient/linear-gradient", "linear-gradient()")}}. Chúng ta cung cấp văn bản thay thế vì tất cả hình ảnh nên được mô tả cho khả năng tiếp cận.

#### HTML

```html
<div id="replaced">I disappear</div>
```

#### CSS

```css
div {
  border: 1px solid;
  background-color: #cccccc;
  min-height: 100px;
  min-width: 100px;
}

#replaced {
  content: repeating-linear-gradient(blue 0, orange 10%) /
    "Gradients and alt text are supported";
}
```

#### Kết quả

{{EmbedLiveSample('Element_replacement_with_gradient', '100%', 200)}}

Kiểm tra [bảng khả năng tương thích trình duyệt](#browser_compatibility). Tất cả trình duyệt hỗ trợ gradient và tất cả trình duyệt hỗ trợ thay thế phần tử bằng hình ảnh, nhưng không phải tất cả trình duyệt hỗ trợ gradient làm giá trị `content`.

### Thay thế phần tử với `image-set()`

Ví dụ này thay thế nội dung phần tử bằng {{cssxref("image/image-set", "image-set()")}}. Nếu màn hình của người dùng có độ phân giải bình thường, `1x.png` sẽ được hiển thị. Màn hình có độ phân giải cao hơn sẽ hiển thị hình ảnh `2x.png`.

#### HTML

```html
<div id="replaced">I disappear!</div>
```

#### CSS

```css hidden
div {
  width: 100px;
  border: 1px solid lightgrey;
}
```

```css-nolint
#replaced {
  content: image-set(
    "1x.png" 1x,
    "2x.png" 2x
  ) / "DPI";
}
```

#### Kết quả

{{EmbedLiveSample('Element_replacement_with_image-set', '100%', 110)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("::after")}}
- {{Cssxref("::before")}}
- {{Cssxref("::marker")}}
- {{cssxref("::scroll-button()")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref(":target-current")}}
- {{Cssxref("contain")}}
- {{Cssxref("quotes")}}
- {{cssxref("gradient", "&lt;gradient&gt;")}}
- {{cssxref("image/image-set", "image-set()")}}
- {{cssxref("url_value", "&lt;url&gt;")}}
- {{glossary("Replaced elements")}}
- [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content) module
- [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists) module
- Browser accessibility panels: [Firefox Accessibility inspector](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/), [Chrome Accessibility pane](https://developer.chrome.com/docs/devtools/accessibility/reference#pane), and [Safari Accessibility tree](https://webflow.com/glossary/accessibility-tree#:~:text=To%20view%20a%20website%E2%80%99s%20accessibility%20tree%20in%20Safari)
