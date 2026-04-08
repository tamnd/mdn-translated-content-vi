---
title: quotes
slug: Web/CSS/Reference/Properties/quotes
page-type: css-property
browser-compat: css.properties.quotes
sidebar: cssref
---

Thuộc tính **`quotes`** của [CSS](/vi/docs/Web/CSS) đặt cách trình duyệt hiển thị dấu ngoặc kép được thêm tự động vào phần tử HTML {{HTMLElement("q")}} hoặc được thêm bằng cách sử dụng giá trị `open-quotes` hoặc `close-quotes` (hoặc bỏ qua bằng `no-open-quote` và `no-close-quote`) của thuộc tính CSS {{cssxref("content")}}.

{{InteractiveExample("CSS Demo: quotes")}}

```css interactive-example-choice
quotes: none;
```

```css interactive-example-choice
quotes: initial;
```

```css interactive-example-choice
quotes: "'" "'";
```

```css interactive-example-choice
quotes: "„" """ "‚" "'";
```

```css interactive-example-choice
quotes: "«" "»" "‹" "›";
```

```html interactive-example
<section id="default-example">
  <q id="example-element"
    >Show us the wonder-working <q>Brothers,</q> let them come out publicly—and
    we will believe in them!</q
  >
</section>
```

```css interactive-example
q {
  font-size: 1.2rem;
}
```

Trình duyệt chèn dấu ngoặc kép vào phần mở đầu và kết thúc của các phần tử `<q>` và cho các giá trị `open-quote` và `close-quote` của thuộc tính `content`. Mỗi dấu ngoặc mở hoặc đóng được thay thế bằng một trong các chuỗi từ giá trị của `quotes`, dựa trên độ sâu lồng nhau, hoặc, nếu `quotes` được đặt rõ ràng hoặc giải quyết thành `auto`, dấu ngoặc kép được sử dụng phụ thuộc vào ngôn ngữ.

## Cú pháp

```css
/* Giá trị từ khóa */
quotes: none;
quotes: auto;

/* Giá trị <string> */
quotes: "«" "»"; /* Đặt open-quote và close-quote dùng dấu ngoặc kép Pháp */
quotes: "«" "»" "‹" "›"; /* Đặt hai cấp độ dấu ngoặc kép */

/* Giá trị toàn cục */
quotes: inherit;
quotes: initial;
quotes: revert;
quotes: revert-layer;
quotes: unset;
```

### Giá trị

- `none`
  - : Các giá trị `open-quote` và `close-quote` của thuộc tính {{cssxref("content")}} không tạo ra dấu ngoặc kép, như thể `no-open-quote` và `no-close-quote` được đặt tương ứng.
- `auto`
  - : Dấu ngoặc kép phù hợp về mặt in ấn cho ngôn ngữ kế thừa (tức là qua thuộc tính [`lang`](/vi/docs/Web/HTML/Reference/Global_attributes/lang) được đặt trên phần tử cha hoặc tổ tiên khác).
- {{cssxref("&lt;string&gt;")}}
  - : Xác định một hoặc nhiều cặp giá trị dấu ngoặc kép cho dấu mở và đóng. Trong mỗi cặp, dấu đầu tiên được dùng cho `open-quote` và dấu thứ hai cho `close-quote`.

    Cặp đầu tiên biểu thị cấp độ ngoài cùng của trích dẫn. Cặp thứ hai, nếu có, biểu thị cấp độ lồng nhau đầu tiên. Cặp tiếp theo được dùng cho các cấp độ lồng nhau gấp đôi, v.v. Nếu độ sâu lồng nhau của trích dẫn lớn hơn số cặp, cặp cuối cùng trong giá trị `quotes` sẽ được lặp lại.

    Cặp nào được dùng phụ thuộc vào độ sâu, hoặc cấp độ lồng nhau, của trích dẫn: số lần xuất hiện của trích dẫn `<q>` hoặc `open-quote` (hoặc `no-open-quote`) trong tất cả văn bản được tạo trước lần xuất hiện hiện tại, trừ đi số lần xuất hiện của dấu đóng, dưới dạng `</q>`, `close-quote` hoặc `no-close-quote`. Nếu độ sâu là 0, cặp đầu tiên được dùng, nếu độ sâu là 1, cặp thứ hai được dùng, v.v.

> [!NOTE]
> Giá trị `open-quote` của thuộc tính CSS `content` tăng và `no-close-quote` giảm cấp độ trích dẫn, nhưng không chèn dấu ngoặc kép.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Dấu ngoặc mặc định và các ghi đè

Ví dụ này so sánh dấu ngoặc mặc định được cung cấp bởi phần tử HTML ngữ nghĩa `<q>` với những dấu ngoặc chúng ta xác định bằng thuộc tính CSS `quotes`.

Giá trị mặc định của `quotes` là [`auto`](#auto). Trong ví dụ này, mục danh sách đầu tiên có `quotes: auto` được đặt, vì vậy nó nhận dấu ngoặc mặc định cho ngôn ngữ được chỉ định; giống như khi không đặt thuộc tính `quotes`. Mục danh sách thứ hai xác định dấu ngoặc nào sẽ dùng cho các trích dẫn và trích dẫn lồng nhau; những dấu ngoặc này sẽ được sử dụng cho các phần tử con của phần tử có lớp `specialQuotes` bất kể ngôn ngữ.

#### HTML

```html
<ul>
  <li>
    Default quotes:
    <p lang="ru">
      <q
        >Митч Макконнелл - это человек, который знает о России и ее влиянии
        меньше, чем даже Дональд Трамп, и <q>я ничего не знаю</q>, сказал
        Трамп</q
      >, - писал Раджу.
    </p>
  </li>
  <li class="specialQuotes">
    Defined by <code>quotes</code> property :
    <p lang="ru">
      <q
        >Митч Макконнелл - это человек, который знает о России и ее влиянии
        меньше, чем даже Дональд Трамп, и <q>я ничего не знаю</q>, сказал
        Трамп</q
      >, - писал Раджу.
    </p>
  </li>
</ul>
```

#### CSS

```css
li {
  quotes: auto;
}

.specialQuotes {
  quotes: "" " " "" "'" "'";
}
```

#### Kết quả

{{EmbedLiveSample('Overriding default quotes', "100%", 200)}}

Theo mặc định, trình duyệt cung cấp dấu ngoặc kép đặc thù theo ngôn ngữ khi phần tử `<q>` được sử dụng. Nếu thuộc tính `quotes` được xác định, các giá trị được cung cấp sẽ ghi đè các giá trị mặc định của trình duyệt. Lưu ý thuộc tính `quotes` được kế thừa. Thuộc tính `quotes` được đặt trên `<li>` có lớp `specialQuotes`, nhưng dấu ngoặc được áp dụng cho các phần tử `<q>`.

Lưu ý rằng mỗi dấu mở và đóng được thay thế bằng một trong các chuỗi từ giá trị quotes, dựa trên độ sâu lồng nhau.

### Dấu ngoặc tự động

Giá trị mặc định của `quotes` là `auto`. Ví dụ này hoạt động mà không cần đặt rõ ràng.

#### HTML

```html
<ul>
  <li lang="fr">
    <q>Ceci est une citation française.</q>
  </li>
  <li lang="ru">
    <q>Это русская цитата</q>
  </li>
  <li lang="de">
    <q>Dies ist ein deutsches Zitat</q>
  </li>
  <li lang="en">
    <q>This is an English quote.</q>
  </li>
</ul>
```

#### CSS

```css
q {
  quotes: auto;
}
li:not(:last-of-type) {
  border-bottom: 1px solid;
}
```

```css hidden
li {
  padding: 0.5em 0;
}
```

#### Kết quả

{{EmbedLiveSample('Auto_quotes', "100%", 200)}}

Lưu ý rằng thuộc tính [`lang`](/vi/docs/Web/HTML/Reference/Global_attributes/lang) được đặt trên phần tử tổ tiên của `<q>`, không phải trên chính `<q>`. Nếu một trích dẫn ở ngôn ngữ khác với văn bản xung quanh, thông thường người ta trích dẫn văn bản bằng dấu ngoặc của ngôn ngữ của văn bản xung quanh, không phải ngôn ngữ của chính trích dẫn.

### Với nội dung được tạo

Trong ví dụ này, thay vì sử dụng phần tử `<q>`, chúng ta thêm dấu ngoặc kép vào các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}} trước và sau nội dung của mỗi phần tử với tên lớp cụ thể.

#### HTML

```html
<p>
  <span class="quote">I should be using quotes</span>, I thought,
  <span class="quote"
    >But why use semantic HTML elements when I can add classes to
    <span class="quote">ALL THE THINGS!</span>?
  </span>
</p>
```

#### CSS

```css
.quote {
  quotes: '"' '"' "'" "'";
}
.quote::before {
  content: open-quote;
}
.quote::after {
  content: close-quote;
}
```

#### Kết quả

{{EmbedLiveSample('With generated content', "100%", 80)}}

### Văn bản làm dấu ngoặc và dấu ngoặc trống

Ví dụ này minh họa việc sử dụng thứ gì đó khác ngoài dấu ngoặc kép làm giá trị `<string>`. Dấu mở chỉ ra người nói và, vì không có dấu mở ngoặc kép, dấu đóng là trống. (Việc kết hợp `<string>` với từ khóa liệt kê để tạo cặp không được hỗ trợ). Chúng ta đặt `auto` cho các trích dẫn lồng nhau. Những trích dẫn lồng nhau này sẽ được bao quanh bởi bất cứ thứ gì ngôn ngữ quy định là bình thường cho trích dẫn lồng nhau.

#### HTML

```html
<ul>
  <li><q data-speaker="karen">Hello</q></li>
  <li><q data-speaker="chad">Hi</q></li>
  <li><q data-speaker="karen">this conversation is not interesting</q></li>
  <li>
    <q data-speaker="pat"
      >OMG! <q>Hi</q>? Seriously? at least <q>hello</q> is five letters long.</q
    >
  </li>
</ul>
```

#### CSS

```css
[data-speaker="karen" i] {
  quotes: "She said: " "";
}
[data-speaker="chad" i] {
  quotes: "He said: " "";
}
[data-speaker="pat" i] {
  quotes: "They said: " "";
}
[data-speaker] q {
  quotes: auto;
}
```

```css hidden
li {
  padding: 0.5em 0;
}
```

#### Kết quả

{{EmbedLiveSample('Text as quotes and empty quotes', "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content)
- {{ Cssxref("contain") }}
- {{ Cssxref("content") }}
