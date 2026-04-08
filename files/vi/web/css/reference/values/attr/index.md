---
title: attr()
slug: Web/CSS/Reference/Values/attr
page-type: css-function
browser-compat: css.types.attr
sidebar: cssref
---

> [!NOTE]
> Hàm `attr()` có thể được dùng với bất kỳ thuộc tính CSS nào, nhưng hỗ trợ cho các thuộc tính khác ngoài {{CSSxRef("content")}} vẫn là thử nghiệm.

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) [CSS](/vi/docs/Web/CSS) **`attr()`** được dùng để lấy giá trị của một thuộc tính của phần tử được chọn và sử dụng nó trong giá trị thuộc tính, tương tự như cách hàm {{cssxref("var()")}} thay thế giá trị thuộc tính tùy chỉnh. Nó cũng có thể được dùng với [pseudo-elements](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-elements), trong trường hợp đó giá trị thuộc tính trên phần tử gốc của pseudo-element được trả về.

{{InteractiveExample("CSS Demo: attr()", "tabbed-shorter")}}

```css interactive-example
blockquote {
  margin: 1em 0;
}

blockquote::after {
  display: block;
  content: " (source: " attr(cite) ") ";
  color: hotpink;
}
```

```html interactive-example
<blockquote cite="https://mozilla.org/en-US/about/">
  Mozilla is working to put control of the internet back in the hands of the
  people using it.
</blockquote>

<blockquote cite="https://web.dev/about/">
  Build beautiful, accessible, fast, and secure websites that work
  cross-browser.
</blockquote>
```

## Cú pháp

```css
/* Basic usage */
attr(data-count)
attr(href)

/* With type */
attr(data-width px)
attr(data-size rem)
attr(data-name raw-string)
attr(id type(<custom-ident>))
attr(data-count type(<number>))
attr(data-size type(<length> | <percentage>))

/* With fallback */
attr(data-count type(<number>), 0)
attr(data-width px, inherit)
attr(data-something, "default")
```

### Tham số

Cú pháp của hàm `attr()` như sau:

```plain
attr(<attr-name> <attr-type>? , <fallback-value>?)
```

Các tham số bao gồm:

- `<attr-name>`
  - : Tên thuộc tính có giá trị cần được lấy từ (các) phần tử HTML được chọn.
- `<attr-type>`
  - : Xác định cách giá trị thuộc tính được phân tích thành giá trị CSS. Đây có thể là từ khóa `raw-string`, hàm {{cssxref("type()")}}, hoặc đơn vị kích thước CSS (được chỉ định bằng định danh `<attr-unit>`). Khi bỏ qua, mặc định là `raw-string`.
    - `raw-string`
      - : Từ khóa `raw-string` khiến giá trị ký tự của thuộc tính được coi là giá trị của chuỗi CSS, không có phân tích CSS nào được thực hiện (bao gồm ký tự thoát CSS, loại bỏ khoảng trắng, chú thích, v.v.). `<fallback-value>` chỉ được dùng nếu thuộc tính bị bỏ qua; chỉ định giá trị rỗng không kích hoạt giá trị dự phòng.

        ```css
        attr(data-name raw-string, "stranger")
        ```

        > [!NOTE]
        > Từ khóa này ban đầu được đặt tên và hỗ trợ trong trình duyệt Chromium là `string`. Cả hai từ khóa sẽ được hỗ trợ một thời gian ngắn, để tương thích ngược.

    - {{cssxref("type()")}}
      - : Hàm `type()` nhận `<syntax>` làm đối số xác định kiểu dữ liệu để phân tích giá trị thành.
        > [!NOTE]
        > Vì [lý do bảo mật](#limitations_and_security), {{CSSxRef("url_value", "&lt;url&gt;")}} không được phép là kiểu dữ liệu của `attr()`.

    - `<attr-unit>`
      - : Định danh `<attr-unit>` xác định đơn vị mà giá trị số phải có (nếu có). Nó có thể là ký tự `%` (phần trăm) hoặc [đơn vị khoảng cách CSS](/vi/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#distance_units) như `px`, `rem`, `deg`, `s`, v.v.

        ```css
        attr(data-size rem)
        attr(data-width px, inherit)
        attr(data-rotation deg)
        ```

- `<fallback-value>`
  - : Giá trị được dùng nếu thuộc tính được chỉ định bị thiếu hoặc chứa giá trị không hợp lệ.

### Giá trị trả về

Giá trị trả về của `attr()` là giá trị của thuộc tính HTML có tên là `<attr-name>` được phân tích theo `<attr-type>` đã cho hoặc được phân tích thành chuỗi CSS.

Khi `<attr-type>` được đặt, `attr()` sẽ cố phân tích thuộc tính thành `<attr-type>` đó và trả về. Nếu thuộc tính không thể được phân tích thành `<attr-type>` đã cho, `<fallback-value>` sẽ được trả về thay thế. Khi không có `<attr-type>` được đặt, thuộc tính sẽ được phân tích thành chuỗi CSS.

Nếu không có `<fallback-value>` được đặt, giá trị trả về sẽ mặc định là chuỗi rỗng khi không có `<attr-type>` được đặt hoặc [giá trị đảm bảo không hợp lệ](/vi/docs/Glossary/guaranteed_invalid_value) khi có `<attr-type>`.

## Mô tả

### Giới hạn và bảo mật

Hàm `attr()` có thể tham chiếu các thuộc tính không bao giờ được thiết kế để dùng cho tạo kiểu và có thể chứa thông tin nhạy cảm (ví dụ: mã thông báo bảo mật được dùng bởi các script trên trang). Nói chung điều này ổn, nhưng nó có thể trở thành mối đe dọa bảo mật khi được dùng trong URL. Do đó, bạn không thể dùng `attr()` để tạo URL một cách động.

```html
<!-- This won't work! -->
<span data-icon="https://example.org/icons/question-mark.svg">help</span>
```

```css
span[data-icon] {
  background-image: url(attr(data-icon));
}
```

Tuy nhiên, hạn chế này chỉ áp dụng cho những nơi yêu cầu nghiêm ngặt kiểu `<url>`.
Một số hàm — như {{CSSxRef("image/image-set","image-set()")}} — có thể chấp nhận giá trị `<string>` sau đó được diễn giải như URL, cho phép `attr()` hoạt động trong những ngữ cảnh đó, tùy thuộc vào hỗ trợ trình duyệt:

```css
span[data-icon] {
  background: image-set(attr(data-icon));
}
```

Các giá trị dùng `attr()` được đánh dấu là _`attr()`-tainted_. Dùng giá trị bị nhiễm `attr()` như hoặc trong `<url>` làm khai báo trở thành ["không hợp lệ tại thời điểm tính toán giá trị" hay IACVT viết tắt](https://www.bram.us/2024/02/26/css-what-is-iacvt/).

### Tương thích ngược

Nói chung, cú pháp `attr()` hiện đại tương thích ngược vì cách dùng cũ — không chỉ định `<attr-type>` — hoạt động giống như trước. Có `attr(data-attr)` trong code của bạn giống như viết `attr(data-attr type(<string>))` hoặc đơn giản hơn là `attr(data-attr string))`.

Tuy nhiên, có hai trường hợp biên mà cú pháp `attr()` hiện đại hoạt động khác với cú pháp cũ.

Trong đoạn code sau, các trình duyệt không hỗ trợ cú pháp `attr()` hiện đại sẽ loại bỏ khai báo thứ hai vì chúng không thể phân tích nó. Kết quả trong các trình duyệt đó là `"Hello World"`.

```html
<div text="Hello"></div>
```

```css
div::before {
  content: attr(text) " World";
}
div::before {
  content: attr(text) 1px;
}
```

Trong các trình duyệt có hỗ trợ cú pháp hiện đại, kết quả sẽ là... không có gì. Các trình duyệt đó sẽ phân tích thành công khai báo thứ hai, nhưng vì đó là nội dung không hợp lệ cho thuộc tính `content`, khai báo trở thành ["không hợp lệ tại thời điểm tính toán giá trị" hay IACVT viết tắt](https://www.bram.us/2024/02/26/css-what-is-iacvt/).

Để ngăn tình huống này, [phát hiện tính năng](#feature_detection) được khuyến nghị.

Trường hợp biên thứ hai như sau:

```html
<div id="parent"><div id="child" data-attr="foo"></div></div>
```

```css
#parent {
  --x: attr(data-attr);
}
#child::before {
  content: var(--x);
}
```

Các trình duyệt không hỗ trợ cú pháp hiện đại hiển thị văn bản `"foo"`. Trong các trình duyệt có hỗ trợ `attr()` hiện đại, không có kết quả nào.

Điều này là vì `attr()` — tương tự như các thuộc tính tùy chỉnh dùng hàm `var()` — được thay thế tại [thời điểm tính toán giá trị](https://www.bram.us/2024/02/26/css-what-is-iacvt/#custom-properties). Với hành vi hiện đại, `--x` đầu tiên cố đọc thuộc tính `data-attr` từ phần tử `#parent`, kết quả là chuỗi rỗng vì không có thuộc tính đó trên `#parent`. Chuỗi rỗng đó sau đó được kế thừa bởi phần tử `#child`, dẫn đến khai báo `content: ;` được đặt.

Để ngăn tình huống này, không truyền các giá trị `attr()` được kế thừa cho các phần tử con trừ khi bạn muốn.

### Phát hiện tính năng

Bạn có thể phát hiện hỗ trợ cho cú pháp `attr()` hiện đại bằng cách dùng at-rule {{CSSxRef("@supports")}}. Trong bài kiểm tra, hãy thử gán `attr()` nâng cao cho thuộc tính CSS (không phải tùy chỉnh).

Ví dụ:

```css
@supports (x: attr(x type(*))) {
  /* Browser has modern attr() support */
}

@supports not (x: attr(x type(*))) {
  /* Browser does not have modern attr() support */
}
```

Chúng ta có thể thực hiện kiểm tra tương tự trong JavaScript với [`CSS.supports()`](/vi/docs/Web/API/CSS/supports_static):

```js
if (CSS.supports("x: attr(x type(*))")) {
  /* Browser has modern attr() support */
}

if (!CSS.supports("x: attr(x type(*))")) {
  /* Browser does not have modern attr() support */
}
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Thuộc tính content

Trong ví dụ này, chúng ta thêm vào trước giá trị của thuộc tính `data-foo` [`data-*`](/vi/docs/Web/HTML/Reference/Global_attributes/data-*) [toàn cầu](/vi/docs/Web/HTML/Reference/Global_attributes) vào nội dung của phần tử {{HTMLElement("p")}}.

#### HTML

```html
<p data-foo="hello">world</p>
```

#### CSS

```css
[data-foo]::before {
  content: attr(data-foo) " ";
}
```

#### Kết quả

{{EmbedLiveSample("content_property", "100%", 50)}}

### Dùng giá trị dự phòng

{{SeeCompatTable}}

Trong ví dụ này, chúng ta thêm vào sau giá trị của `data-browser` [`data-*`](/vi/docs/Web/HTML/Reference/Global_attributes/data-*) [toàn cầu](/vi/docs/Web/HTML/Reference/Global_attributes) vào phần tử {{HTMLElement("p")}}. Nếu thuộc tính `data-browser` bị thiếu khỏi phần tử {{HTMLElement("p")}}, chúng ta thêm giá trị _dự phòng_ là "**Unknown**".

#### HTML

```html
<p data-browser="Firefox">My favorite browser is:</p>
<p>Your favorite browser is:</p>
```

#### CSS

```css
p::after {
  content: " " attr(data-browser, "Unknown");
  color: tomato;
}
```

#### Kết quả

{{EmbedLiveSample("using_fallback", "100%", 90)}}

### Giá trị color

{{SeeCompatTable}}

Trong ví dụ này, chúng ta đặt giá trị CSS của {{CSSXRef("background-color")}} thành giá trị của thuộc tính `data-background` [`data-*`](/vi/docs/Web/HTML/Reference/Global_attributes/data-*) [toàn cầu](/vi/docs/Web/HTML/Reference/Global_attributes) được gán cho phần tử {{HTMLElement("div")}}.

#### HTML

```html
<div class="background" data-background="lime">
  background expected to be red if your browser does not support advanced usage
  of attr()
</div>
```

#### CSS

```css hidden
.background {
  height: 100vh;
}
```

```css
.background {
  background-color: red;
}

.background[data-background] {
  background-color: attr(data-background type(<color>), red);
}
```

#### Kết quả

{{EmbedLiveSample("color_value", "100%", 50)}}

### Dùng đơn vị kích thước

{{SeeCompatTable}}

Trong ví dụ này, thuộc tính `data-rotation` được phân tích thành đơn vị `deg`, xác định phép xoay của phần tử.

#### HTML

```html
<div data-rotation="-3">I am rotated by -3 degrees</div>
<div data-rotation="2">And I by 2 degrees</div>
<div>And so am I, using the fallback value of 1.5deg</div>
```

#### CSS

```css hidden
body {
  min-height: 100svh;
  display: grid;
  place-content: center;
  gap: 1em;
}
div {
  margin: 0 auto;
  border: 1px solid;
  border-radius: 0.25em;
  padding: 0.5em;
}
```

```css
div {
  width: fit-content;
  transform-origin: 50% 50%;
  rotate: attr(data-rotation deg, 1.5deg);
}
```

#### Kết quả

{{EmbedLiveSample("using_dimension_units", "100%", 300)}}

### Phân tích giá trị `attr()` thành `<custom-ident>`

{{SeeCompatTable}}

Trong ví dụ này, các giá trị của thuộc tính {{cssxref("view-transition-name")}} được lấy từ thuộc tính `id` của phần tử. Thuộc tính được phân tích thành {{CSSxRef("&lt;custom-ident&gt;")}}, là những gì {{cssxref("view-transition-name")}} chấp nhận làm giá trị.

Các giá trị kết quả cho {{cssxref("view-transition-name")}} là `card-1`, `card-2`, `card-3`, v.v.

#### HTML

HTML chứa bốn thẻ với các thuộc tính `id` khác nhau và một `<button>` "Shuffle cards" xáo trộn các thẻ.

```html
<div class="cards">
  <div class="card" id="card-1">1</div>
  <div class="card" id="card-2">2</div>
  <div class="card" id="card-3">3</div>
  <div class="card" id="card-4">4</div>
</div>
<button>Shuffle cards</button>
```

```html hidden
<div class="warning">
  <p>
    Your browser does not support advanced <code>attr()</code>. As a result,
    this demo won't do anything.
  </p>
</div>
```

#### CSS

Các thẻ được bố trí trong một flex container:

```css
.cards {
  display: flex;
  flex-direction: row;
  gap: 1em;
  padding: 1em;
}
```

```css hidden
:root {
  view-transition-name: none;
}
::view-transition {
  pointer-events: none;
}

@supports (x: attr(x type(*))) {
  .warning {
    display: none;
  }
}

@layer layout {
  .card {
    border-radius: 0.25em;
    width: 20vw;
    max-width: 5em;
    aspect-ratio: 1 / 1.6;
    background: lightgrey;

    display: grid;
    place-content: center;
    font-size: 2em;
  }

  * {
    box-sizing: border-box;
  }

  body {
    min-height: 100svh;
    display: grid;
    place-content: center;
  }

  button {
    justify-self: center;
  }
}

@layer warning {
  .warning {
    padding: 1em;
    border: 1px solid #cccccc;
    background: rgb(255 255 205 / 0.8);
    text-align: center;
    order: -1;
    margin: 1em;
  }

  .warning > :first-child {
    margin-top: 0;
  }
  .warning > :last-child {
    margin-bottom: 0;
  }
}
```

Trên mỗi thẻ, hàm `attr()` lấy thuộc tính `id` và phân tích nó thành {{CSSxRef("&lt;custom-ident&gt;")}}, được dùng làm giá trị cho thuộc tính {{cssxref("view-transition-name")}}. Khi không có `id` được đặt trên thẻ, giá trị dự phòng `none` được dùng thay thế.

```css
.card {
  view-transition-name: attr(id type(<custom-ident>), none);
  view-transition-class: card;
}
```

#### JavaScript

Khi `<button>` được nhấn, các thẻ được xáo trộn. Điều này được thực hiện bằng cách ngẫu nhiên hóa thứ tự của một mảng chứa tham chiếu đến tất cả các thẻ và sau đó cập nhật thuộc tính {{CSSxRef("order")}} của mỗi thẻ thành vị trí chỉ số mảng mới của nó.

Để tạo hoạt ảnh cho mỗi thẻ đến vị trí mới của nó, [View Transitions](/vi/docs/Web/API/View_Transition_API/Using) được dùng. Điều này được thực hiện bằng cách bọc cập nhật `order` trong lời gọi đến [`document.startViewTransition`](/vi/docs/Web/API/Document/startViewTransition).

```js
const shuffle = (array) => {
  for (let i = array.length - 1; i >= 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
};

document.querySelector("button").addEventListener("click", (e) => {
  const $cards = Array.from(document.querySelectorAll(".card"));
  shuffle($cards);
  document.startViewTransition(() => {
    $cards.forEach(($card, i) => {
      $card.style.setProperty("order", i);
    });
  });
});
```

#### Kết quả

{{EmbedLiveSample("parsing_attr_values_as_custom-idents", "100%", 400)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bộ chọn thuộc tính](/vi/docs/Web/CSS/Reference/Selectors/Attribute_selectors)
- [Thuộc tính HTML `data-*`](/vi/docs/Web/HTML/Reference/Global_attributes/data-*)
- [Thuộc tính SVG `data-*`](/vi/docs/Web/SVG/Reference/Attribute/data-*)
