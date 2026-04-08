---
title: "@scope"
slug: Web/CSS/Reference/At-rules/@scope
page-type: css-at-rule
browser-compat:
  - css.at-rules.scope
  - css.selectors.nesting.at-scope
sidebar: cssref
---

**`@scope`** là một [quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) của [CSS](/en-US/docs/Web/CSS) cho phép bạn chọn các phần tử trong các cây con DOM cụ thể, nhắm mục tiêu phần tử một cách chính xác mà không cần viết các bộ chọn quá cụ thể gây khó ghi đè, đồng thời tránh kết nối chặt chẽ bộ chọn với cấu trúc DOM.

Trong JavaScript, `@scope` có thể được truy cập qua giao diện mô hình đối tượng CSS {{DOMxRef("CSSScopeRule")}}.

## Cú pháp

Quy tắc at `@scope` chứa một hoặc nhiều tập hợp quy tắc (gọi là **quy tắc kiểu có phạm vi**) và xác định một phạm vi để áp dụng chúng cho các phần tử được chọn. `@scope` có thể dùng theo hai cách:

1. Là một khối độc lập trong CSS, trong đó nó bao gồm phần mở đầu chứa bộ chọn **gốc phạm vi** và bộ chọn **giới hạn phạm vi** tùy chọn — xác định giới hạn trên và dưới của phạm vi.

   ```css
   @scope (scope root) to (scope limit) {
     /* … */
   }
   ```

2. Là kiểu nội tuyến bên trong phần tử {{htmlelement("style")}} trong HTML, trong đó phần mở đầu bị bỏ qua và tập hợp quy tắc được bao bọc tự động có phạm vi là phần tử cha bao ngoài phần tử `<style>`.

   ```html
   <parent-element>
     <style>
       @scope {
         /* rulesets */
       }
     </style>
   </parent-element>
   ```

   Cũng có thể kết hợp `@scope` nội tuyến với bộ chọn giới hạn phạm vi, ví dụ như `@scope to (scope limit) { ... }`.

## Mô tả

Một tài liệu web phức tạp có thể chứa các thành phần như đầu trang, chân trang, bài viết tin tức, bản đồ, trình phát media, quảng cáo và nhiều thứ khác. Khi độ phức tạp tăng lên, việc quản lý hiệu quả các kiểu dáng cho các thành phần này trở thành mối lo ngại, và việc giới hạn phạm vi kiểu dáng một cách hiệu quả giúp chúng ta quản lý được sự phức tạp này. Hãy xem xét cây DOM sau:

```plain
body
└─ article.feature
   ├─ section.article-hero
   │  ├─ h2
   │  └─ img
   │
   ├─ section.article-body
   │  ├─ h3
   │  ├─ p
   │  ├─ img
   │  ├─ p
   │  └─ figure
   │     ├─ img
   │     └─ figcaption
   │
   └─ footer
      ├─ p
      └─ img
```

Nếu bạn muốn chọn phần tử {{htmlelement("img")}} bên trong {{htmlelement("section")}} có class `article-body`, bạn có thể:

- Viết bộ chọn như `.feature > .article-body > img`. Tuy nhiên, bộ chọn này có độ đặc hiệu cao nên khó ghi đè, và cũng kết nối chặt chẽ với cấu trúc DOM. Nếu cấu trúc HTML thay đổi trong tương lai, bạn có thể phải viết lại CSS.
- Viết thứ gì đó ít cụ thể hơn như `.article-body img`. Tuy nhiên, điều đó sẽ chọn tất cả ảnh bên trong `section`.

Đây là lúc `@scope` hữu ích. Nó cho phép bạn xác định một phạm vi chính xác bên trong đó các bộ chọn được phép nhắm mục tiêu phần tử. Ví dụ, bạn có thể giải quyết vấn đề trên bằng khối `@scope` độc lập như sau:

```css
@scope (.article-body) to (figure) {
  img {
    border: 5px solid black;
    background-color: goldenrod;
  }
}
```

Bộ chọn gốc phạm vi `.article-body` xác định giới hạn trên của phạm vi cây DOM, và bộ chọn giới hạn phạm vi `figure` xác định giới hạn dưới. Kết quả là chỉ các phần tử {{htmlelement("img")}} bên trong `<section>` có class `article-body`, nhưng không nằm bên trong phần tử {{htmlelement("figure")}}, mới được chọn.

> [!NOTE]
> Loại phạm vi này — có giới hạn trên và dưới — thường được gọi là **phạm vi bánh vòng (donut scope)**.

Giới hạn trên của phạm vi là bao gồm (inclusive) và giới hạn dưới là không bao gồm (exclusive). Để thay đổi hành vi này, bạn có thể kết hợp bộ chọn với bộ chọn con toàn cục. Ví dụ, `@scope (scope root) to (scope limit > *)` sẽ làm cả hai giới hạn đều bao gồm, `@scope (scope root > *) to (scope limit)` sẽ làm cả hai giới hạn đều không bao gồm, trong khi `@scope (scope root > *) to (scope limit > *)` sẽ cho giới hạn trên không bao gồm và giới hạn dưới bao gồm.

Nếu bạn muốn chọn tất cả ảnh bên trong `<section>` có class `article-body`, bạn có thể bỏ qua giới hạn phạm vi:

```css
@scope (.article-body) {
  img {
    border: 5px solid black;
    background-color: goldenrod;
  }
}
```

Hoặc bạn có thể đặt khối `@scope` nội tuyến bên trong phần tử `<style>`, lần lượt bên trong `<section>` có class `article-body`:

```html
<section class="article-body">
  <style>
    @scope {
      img {
        border: 5px solid black;
        background-color: goldenrod;
      }
    }
  </style>

  <!-- ... -->
</section>
```

> [!NOTE]
> Điều quan trọng cần hiểu là mặc dù `@scope` cho phép bạn cô lập việc áp dụng bộ chọn cho các cây con DOM cụ thể, nó không hoàn toàn cô lập các kiểu đã áp dụng bên trong các cây con đó. Điều này thể hiện rõ nhất qua tính kế thừa — các thuộc tính được kế thừa bởi các phần tử con (ví dụ {{cssxref("color")}} hay {{cssxref("font-family")}}) vẫn sẽ được kế thừa, vượt qua bất kỳ giới hạn phạm vi nào đã đặt.

### Lớp giả `:scope` trong các khối `@scope`

Trong ngữ cảnh của một khối `@scope`, lớp giả {{cssxref(":scope")}} cung cấp cách tiện lợi để trực tiếp áp dụng kiểu cho gốc phạm vi, như sau:

```css
@scope (.feature) {
  :scope {
    background: rebeccapurple;
    color: antiquewhite;
    font-family: sans-serif;
  }
}
```

Một số lưu ý về `:scope` trong các khối `@scope`:

- `:scope` thêm độ đặc hiệu cấp class (xem [Độ đặc hiệu trong @scope](#specificity_in_scope) để biết chi tiết).

- Giới hạn phạm vi có thể dùng `:scope` để chỉ định một yêu cầu quan hệ cụ thể giữa giới hạn phạm vi và gốc. Ví dụ:

  ```css
  /* figure chỉ là giới hạn khi nó là con trực tiếp của :scope */
  @scope (.article-body) to (:scope > figure) {
    /* … */
  }
  ```

- Giới hạn phạm vi có thể tham chiếu các phần tử bên ngoài gốc phạm vi bằng `:scope`. Ví dụ:

  ```css
  /* figure chỉ là giới hạn khi :scope nằm bên trong .feature */
  @scope (.article-body) to (.feature :scope figure) {
    /* … */
  }
  ```

- Các quy tắc kiểu có phạm vi không thể thoát ra khỏi cây con. Các bộ chọn như `:scope + p` là không hợp lệ vì bộ chọn đó sẽ nằm ngoài cây con.

- Hoàn toàn hợp lệ khi xác định gốc phạm vi và giới hạn dưới dạng danh sách bộ chọn, trong trường hợp đó nhiều phạm vi sẽ được xác định. Trong ví dụ sau, các kiểu được áp dụng cho bất kỳ `<img>` nào bên trong `<section>` có class `article-hero` hoặc `article-body`, nhưng không nếu nó được lồng bên trong `<figure>`:

  ```css
  @scope (.article-hero, .article-body) to (figure) {
    img {
      border: 5px solid black;
      background-color: goldenrod;
    }
  }
  ```

### Độ đặc hiệu trong `@scope`

Bên trong một quy tắc `@scope`, cả bộ chọn đơn và [bộ chọn lồng `&`](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector) đều hoạt động như thể `:where(:scope)` được thêm vào đầu bộ chọn.
Vì {{cssxref(":where()")}} có độ đặc hiệu bằng không, các bộ chọn đơn và `&` không thêm trọng số nào. Trọng số độ đặc hiệu được xác định bởi phần còn lại của bộ chọn.
Ví dụ, độ đặc hiệu của bộ chọn `& img` tương đương với độ đặc hiệu của `:where(:scope) img` (0-0-1).

> [!WARNING]
> Độ đặc hiệu của `&` bên trong các khối `@scope` được xử lý khác nhau tùy thuộc vào engine trình duyệt và phiên bản phát hành.
> Kiểm tra [Tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

Trong cả hai trường hợp trong khối mã sau, độ đặc hiệu duy nhất đến từ `img`:

```css
@scope (.article-body) {
  /* img có độ đặc hiệu 0-0-1, như mong đợi */
  img {
    /* … */
  }

  /* & img cũng có độ đặc hiệu 0-0-1 */
  & img {
    /* … */
  }
}
```

Ngược lại, sử dụng `:scope` một cách tường minh chọn gốc phạm vi và thêm độ đặc hiệu cấp class (0-1-0), vì `:scope` là một [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes).
Trong khối mã sau, `:scope img` có độ đặc hiệu 0-1-1:

```css
@scope (.article-body) {
  /* :scope img có độ đặc hiệu 0-1-0 + 0-0-1 = 0-1-1 */
  :scope img {
    /* … */
  }
}
```

### Cách giải quyết xung đột `@scope`

`@scope` thêm một tiêu chí mới vào [tầng CSS](/en-US/docs/Web/CSS/Guides/Cascade): **độ gần của phạm vi (scoping proximity)**. Điều này quy định rằng khi hai phạm vi có kiểu xung đột, kiểu có số bước nhỏ nhất lên cây DOM để đến gốc phạm vi sẽ được áp dụng. Hãy xem ví dụ để hiểu điều này.

Lấy đoạn HTML sau, trong đó các thẻ có chủ đề khác nhau được lồng vào nhau:

```html
<div class="light-theme">
  <p>Light theme text</p>
  <div class="dark-theme">
    <p>Dark theme text</p>
    <div class="light-theme">
      <p>Light theme text</p>
    </div>
  </div>
</div>
```

Nếu bạn viết CSS chủ đề như sau, bạn sẽ gặp vấn đề:

```css
.light-theme {
  background: #cccccc;
}

.dark-theme {
  background: #333333;
}

.light-theme p {
  color: black;
}

.dark-theme p {
  color: white;
}
```

Đoạn văn trong cùng được cho là màu đen vì nó nằm trong thẻ chủ đề sáng. Tuy nhiên, nó được nhắm mục tiêu bởi cả `.light-theme p` và `.dark-theme p`. Vì quy tắc `.dark-theme p` xuất hiện sau trong thứ tự nguồn, nó được áp dụng và đoạn văn bị tô màu trắng sai.

Để khắc phục điều này, bạn có thể dùng `@scope` như sau:

```css
@scope (.light-theme) {
  :scope {
    background: #cccccc;
  }
  p {
    color: black;
  }
}

@scope (.dark-theme) {
  :scope {
    background: #333333;
  }
  p {
    color: white;
  }
}
```

Bây giờ đoạn văn trong cùng được tô màu đen đúng. Điều này là vì nó chỉ cách gốc phạm vi `.light-theme` một cấp trong cây DOM, nhưng cách hai cấp từ gốc phạm vi `.dark-theme`. Do đó, kiểu sáng thắng.

> [!NOTE]
> Độ gần của phạm vi vượt qua thứ tự nguồn nhưng bản thân nó bị ghi đè bởi các tiêu chí ưu tiên cao hơn như [độ quan trọng (importance)](/en-US/docs/Web/CSS/Reference/Values/important), [lớp (layers)](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers), và [độ đặc hiệu (specificity)](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Kiểu cơ bản bên trong gốc phạm vi

Trong ví dụ này, chúng ta dùng hai khối `@scope` riêng biệt để khớp các liên kết bên trong các phần tử có class `.light-scheme` và `.dark-scheme` tương ứng. Lưu ý cách `:scope` được dùng để chọn và áp dụng kiểu cho chính các gốc phạm vi. Trong ví dụ này, gốc phạm vi là các phần tử {{htmlelement("div")}} có các class được áp dụng cho chúng.

#### HTML

```html
<div class="light-scheme">
  <p>
    MDN contains lots of information about
    <a href="/en-US/docs/Web/HTML">HTML</a>,
    <a href="/en-US/docs/Web/CSS">CSS</a>, and
    <a href="/en-US/docs/Web/JavaScript">JavaScript</a>.
  </p>
</div>

<div class="dark-scheme">
  <p>
    MDN contains lots of information about
    <a href="/en-US/docs/Web/HTML">HTML</a>,
    <a href="/en-US/docs/Web/CSS">CSS</a>, and
    <a href="/en-US/docs/Web/JavaScript">JavaScript</a>.
  </p>
</div>
```

#### CSS

```css hidden
div {
  padding: 10px;
}
```

```css
@scope (.light-scheme) {
  :scope {
    background-color: plum;
  }

  a {
    color: darkmagenta;
  }
}

@scope (.dark-scheme) {
  :scope {
    background-color: darkmagenta;
    color: antiquewhite;
  }

  a {
    color: plum;
  }
}
```

#### Kết quả

Đoạn mã trên hiển thị như sau:

{{EmbedLiveSample("Basic style inside scope roots", "100%", "150")}}

### Gốc phạm vi và giới hạn phạm vi

Trong ví dụ này, chúng ta có một đoạn HTML khớp với cấu trúc DOM mà chúng ta đã thảo luận ở phần [Mô tả](#description). Cấu trúc này đại diện cho một tóm tắt bài viết điển hình. Các tính năng chính cần lưu ý là các phần tử {{htmlelement("img")}}, được lồng ở nhiều cấp độ trong cấu trúc.

Mục tiêu của ví dụ này là chỉ ra cách sử dụng gốc phạm vi và giới hạn để tạo kiểu cho các phần tử `<img>` bắt đầu từ đầu hệ thống phân cấp, nhưng chỉ xuống đến (và không bao gồm) `<img>` bên trong phần tử {{htmlelement("figure")}} — thực tế tạo ra một phạm vi bánh vòng.

#### HTML

```html
<article class="feature">
  <section class="article-hero">
    <h2>Article heading</h2>
    <img alt="image" src="" />
  </section>

  <section class="article-body">
    <h3>Article subheading</h3>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam euismod
      consectetur leo, nec eleifend quam volutpat vitae. Duis quis felis at
      augue imperdiet aliquam. Morbi at felis et massa mattis lacinia. Cras
      pharetra velit nisi, ac efficitur magna luctus nec.
    </p>

    <img alt="image" src="" />

    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

    <figure>
      <img alt="image" src="" />
      <figcaption>My infographic</figcaption>
    </figure>
  </section>

  <footer>
    <p>Written by Chris Mills.</p>
    <img alt="image" src="" />
  </footer>
</article>
```

#### CSS

```css hidden
* {
  box-sizing: border-box;
}

article {
  margin-bottom: 20px;
  padding: 10px;
  border: 2px solid gray;
}

.article-hero,
.article-body,
article footer {
  padding: 20px;
  margin: 10px;
  border: 2px solid lightgray;
}

img {
  height: 100px;
  width: 100%;
  display: block;
  background-color: lightgray;
  color: black;
  padding: 10px;
}
```

Trong CSS, chúng ta có hai khối `@scope`:

- Khối `@scope` đầu tiên xác định gốc phạm vi là các phần tử có class `.feature` (trong trường hợp này, chỉ `<article>` bên ngoài), minh họa cách `@scope` có thể được dùng để tạo chủ đề cho một tập hợp con HTML cụ thể.
- Khối `@scope` thứ hai cũng xác định gốc phạm vi là các phần tử có class `.feature`, nhưng cũng xác định giới hạn phạm vi là `figure`. Điều này đảm bảo rằng các tập hợp quy tắc chứa trong đó sẽ chỉ được áp dụng cho các phần tử khớp trong gốc phạm vi (`<article class="feature"> ... </article>` trong trường hợp này) mà **không** lồng bên trong các phần tử `<figure>` con. Khối `@scope` này chứa một tập hợp quy tắc duy nhất tạo kiểu cho các phần tử `<img>` với đường viền đen dày và màu nền vàng.

```css
/* Scoped CSS */

@scope (.feature) {
  :scope {
    background: rebeccapurple;
    color: antiquewhite;
    font-family: sans-serif;
  }

  figure {
    background-color: white;
    border: 2px solid black;
    color: black;
    padding: 10px;
  }
}

/* Donut scope */

@scope (.feature) to (figure) {
  img {
    border: 5px solid black;
    background-color: goldenrod;
  }
}
```

#### Kết quả

Trong mã đã hiển thị, lưu ý cách tất cả các phần tử `<img>` được tạo kiểu với đường viền dày và nền vàng, ngoại trừ cái bên trong phần tử `<figure>` (được gắn nhãn "My infographic").

{{EmbedLiveSample("Scope roots and scope limits", "100%", "400")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":scope")}}
- {{DOMxRef("CSSScopeRule")}}
- [Độ đặc hiệu (Specificity)](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Defining the `&` selector in a `@scope` rule](https://css.oddbird.net/scope/parent-selector/) on css.oddbird.net (2025)
- [Limit the reach of your selectors with the CSS `@scope` at-rule](https://developer.chrome.com/docs/css-ui/at-scope) on developer.chrome.com (2023)
