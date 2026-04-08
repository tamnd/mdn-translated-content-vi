---
title: if()
slug: Web/CSS/Reference/Values/if
page-type: css-function
status:
  - experimental
browser-compat: css.types.if
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`if()`** của [CSS](/vi/docs/Web/CSS) cho phép đặt các giá trị khác nhau cho một thuộc tính tùy thuộc vào kết quả của một bài kiểm tra điều kiện. Bài kiểm tra có thể dựa trên một [truy vấn style](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries), một [truy vấn media](/vi/docs/Web/CSS/Guides/Media_queries/Using), hoặc một [truy vấn tính năng](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries).

## Cú pháp

```css-nolint
/* Một <if-test> duy nhất */
if(style(--scheme: dark): #eeeeee;)
if(media(print): black;)
if(media(width > 700px): 0 auto;)
if(supports(color: lch(7.1% 60.23 300.16)): lch(7.1% 60.23 300.16);)

/* <if-test> với else */
if(style(--size: "2xl"): 1em; else: 0.25em;)
if(media(print): white; else: black;)
if(media(width < 700px): 0 auto; else: 20px auto)
if(
  supports(color: lch(7.1% 60.23 300.16)): lch(7.1% 60.23 300.16);
  else: #03045e;
)
if(
  supports(color: lch(75% 0 0)): 3px solid lch(75% 0 0);
  else: 3px solid silver;
)

/* Nhiều <if-test> */
if(
  style(--scheme: ice): linear-gradient(#caf0f8, white, #caf0f8);
  style(--scheme: fire): linear-gradient(#ffc971, white, #ffc971);
  else: none;
)

/* <if-test> trong một shorthand */
3px yellow if(
  style(--color: green): dashed;
  style(--color: yellow): inset;
  else: solid;
)
```

### Tham số

Tham số là một danh sách các `<if-branch>` được phân tách bằng dấu chấm phẩy. Mỗi `<if-branch>` là một `<if-condition>` theo sau là dấu hai chấm và một `<value>`:

```plain
<if-branch> = <if-condition> : <value>;
```

- `<if-condition>`
  - : Một `<if-test>` hoặc từ khóa `else`.
    - `<if-test>`
      - : Một [truy vấn style](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries), [truy vấn media](/vi/docs/Web/CSS/Guides/Media_queries/Using), hoặc [truy vấn tính năng](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries).

    - `else`
      - : Một từ khóa đại diện cho một `<if-condition>` luôn đánh giá là true.

- `<value>`
  - : Một giá trị thuộc tính.

### Giá trị trả về

Một giá trị hoặc {{glossary("guaranteed_invalid_value", "guaranteed-invalid")}}.

## Mô tả

Hàm CSS `if()` cung cấp logic điều kiện cho các giá trị thuộc tính CSS, và hoạt động theo cách tương tự như các câu lệnh JavaScript [`if...else`](/vi/docs/Web/JavaScript/Reference/Statements/if...else).

Hàm `if()` có thể được sử dụng bên trong giá trị của bất kỳ thuộc tính nào, và có thể chứa không hoặc nhiều `<if-condition>` được phân tách bằng dấu chấm phẩy. Mỗi `<if-condition>` là một cặp `<if-test> : <value>` hoặc một cặp `else : <value>`. Dấu chấm phẩy sau `<if-condition>` cuối cùng là tùy chọn.

Giá trị trả về được tính như sau:

1. Các biểu thức `<if-condition>` được đánh giá, theo thứ tự chúng xuất hiện trong hàm.
2. `<if-condition>` đầu tiên đánh giá là `true` sẽ có `<value>` liên quan được trả về.
3. Nếu không có `<if-condition>` nào đánh giá là `true`, hàm trả về {{glossary("guaranteed_invalid_value", "&lt;guaranteed-invalid&gt;")}}. Điều này hoạt động như invalid hoặc `false` nếu hàm `if()` được sử dụng trong câu lệnh giá trị có fallback, chẳng hạn như [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) hoặc hàm {{cssxref("anchor()")}}.

Ví dụ:

```css-nolint
div {
  background-image: if(
    style(--scheme: ice): linear-gradient(#caf0f8, white, #caf0f8);
    style(--scheme: fire): linear-gradient(#ffc971, white, #ffc971);
    else: none;
  );
}
```

Trong trường hợp này, chúng ta đang đặt một {{cssxref("linear-gradient()")}} khác làm {{cssxref("background-image")}} trên các phần tử {{htmlelement("div")}}, tùy thuộc vào việc thuộc tính tùy chỉnh `--scheme` được đặt thành `ice` hay `fire`. Nếu `--scheme` không tồn tại, hoặc nó tồn tại và được đặt thành bất kỳ giá trị nào khác, giá trị `else` sẽ có tác dụng, và thuộc tính `background-image` được đặt thành `none`.

> [!NOTE]
> Mỗi điều kiện phải được phân tách khỏi giá trị liên quan của nó bằng dấu hai chấm, và mỗi cặp `<if-condition> : <value>` phải được phân tách bằng dấu chấm phẩy. Dấu chấm phẩy là tùy chọn cho cặp `<if-condition> : <value>` cuối cùng.

> [!WARNING]
> Không được có khoảng trắng giữa `if` và dấu ngoặc mở (`(`). Nếu có, toàn bộ khai báo sẽ không hợp lệ.

Nếu một `<if-condition>` hoặc `<value>` duy nhất không hợp lệ, nó không làm vô hiệu toàn bộ hàm `if()`; thay vào đó, trình phân tích cú pháp chuyển sang cặp `<if-condition> : <value>` tiếp theo. Nếu không có `<if-condition>` hay `<value>` nào hợp lệ, hàm trả về {{glossary("guaranteed_invalid_value", "guaranteed-invalid")}}.

### Tần suất và vị trí của các cặp `else : <value>`

Bạn có thể bao gồm nhiều cặp `else : <value>` bên trong hàm `if()`, ở bất kỳ vị trí nào. Tuy nhiên, trong hầu hết các trường hợp, một cặp `else : <value>` duy nhất ở cuối danh sách phân tách bằng dấu chấm phẩy được sử dụng để cung cấp giá trị mặc định luôn được trả về nếu không có `<if-test>` nào đánh giá là true.

Nếu bạn bao gồm cặp `else : <value>` trước bất kỳ cặp `<if-test> : <value>` nào, các điều kiện theo sau không được đánh giá vì `else` luôn đánh giá là `true`. Do đó `if()` sau đây luôn trả về `none`, và hai cặp `<if-test> : <value>` không bao giờ được đánh giá:

```css-nolint
div {
  background-image: if(
    else: none;
    style(--scheme: ice): linear-gradient(#caf0f8, white, #caf0f8);
    style(--scheme: fire): linear-gradient(#ffc971, white, #ffc971)
  );
}
```

Gỡ lỗi một giá trị không hoạt động như mong đợi là một trường hợp bạn có thể muốn đặt `else : <value>` ở vị trí khác với cuối danh sách giá trị. Trong ví dụ sau, chúng ta đang cố gắng tìm hiểu xem cặp `<if-test> : <value>` đầu tiên có hoạt động đúng không. Nếu không, cặp `else : <value>` trả về giá trị `url("debug.png")` để hiển thị một hình ảnh cho biết cặp `<if-test> : <value>` đầu tiên cần sửa. Hai cặp `<if-test> : <value>` cuối cùng lại không bao giờ được đánh giá.

```css-nolint
div {
  background-image: if(
    style(--scheme: ice): linear-gradient(#caf0f8, white, #caf0f8);
    else: url("debug.png");
    style(--scheme: fire): linear-gradient(#ffc971, white, #ffc971);
    else: none;
  );
}
```

Lưu ý rằng hàm `if()` vẫn hợp lệ nếu nó chỉ chứa một cặp `else : <value>`, hoặc không chứa gì. Các giá trị thuộc tính sau đây đều hợp lệ:

```css
background-color: if(else: yellow);
background-image: if();
```

Các hàm này không hữu ích. Chúng được đưa vào để chứng minh tính hợp lệ của chúng. Trong trường hợp này, giá trị {{cssxref("background-color")}} sẽ luôn được đặt thành `yellow` và `background-image` sẽ được đặt thành giá trị ban đầu của nó. Bạn nên đặt trực tiếp `background-color` thành `yellow`, và `background-image` thành `initial` hoặc `none`.

### Các loại if-test

Một `<if-test>` chấp nhận một trong ba loại truy vấn. Phần này xem xét từng loại chi tiết.

#### Truy vấn style

Một `<if-test>` [truy vấn style](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries) cho phép bạn kiểm tra xem một giá trị thuộc tính cụ thể có được đặt trên một phần tử không, và áp dụng một giá trị cho một thuộc tính khác. Hãy xem thêm một ví dụ:

```css-nolint
background-image: if(
  style(--scheme: ice): linear-gradient(#caf0f8, white, #caf0f8);
  else: none;
);
```

Nếu thuộc tính tùy chỉnh `--scheme` được đặt thành giá trị `ice` trên cùng một phần tử, giá trị `linear-gradient()` được cung cấp sẽ được trả về. Nếu không, `none` được trả về.

Sử dụng truy vấn style bên trong các câu lệnh `if()` có lợi thế hơn các truy vấn {{cssxref("@container")}} — bạn có thể nhắm mục tiêu trực tiếp một phần tử với các style, dựa trên việc thuộc tính tùy chỉnh có được đặt trên nó hay không, thay vì phải kiểm tra các style được đặt trên phần tử container cha.

Bạn cũng có thể sử dụng logic `and`, `or`, hoặc `not` bên trong truy vấn style. Ví dụ:

```css-nolint
background-color: if(
  style((--scheme: dark) or (--scheme: very-dark)): black;
);

background-color: if(
  style((--scheme: dark) and (--contrast: hi)): black;
);

background-color: if(
  not style(--scheme: light): black;
);
```

Truy vấn `@container` có một số lợi thế — bạn chỉ có thể đặt các giá trị thuộc tính đơn lẻ mỗi lần với truy vấn style `if()`, trong khi truy vấn `@container` có thể được sử dụng để áp dụng có điều kiện toàn bộ tập hợp các quy tắc. Hai cách tiếp cận này bổ sung cho nhau và có các ứng dụng khác nhau.

Lưu ý rằng các truy vấn style container hiện tại không hỗ trợ các thuộc tính CSS thông thường, chỉ các thuộc tính tùy chỉnh CSS. Ví dụ, sau đây sẽ không hoạt động:

```css-nolint example-bad
if(
  background-color: if(style(color: white): black;);
)
```

#### Truy vấn media

Một `<if-test>` [truy vấn media](/vi/docs/Web/CSS/Guides/Media_queries/Using) có thể được sử dụng để đặt giá trị cho thuộc tính tùy thuộc vào việc bài kiểm tra truy vấn media có trả về true hay không.

Bạn có thể sử dụng các loại media. Ví dụ, cặp `<if-test> : <value>` sau đây trả về giá trị `white` trên phương tiện in, trong khi mệnh đề `else` khiến `#eeeeee` được trả về trên phương tiện không in.

```css-nolint
background-color: if(
  media(print): white;
  else: #eeeeee;
)
```

Bạn cũng có thể sử dụng các tính năng media — sau đây trả về giá trị `0 auto` nếu chiều rộng viewport hiện tại nhỏ hơn `700px`, hoặc `20px auto` nếu không phải vậy:

```css-nolint
margin: if(
  media(width < 700px): 0 auto;
  else: 20px auto;
)
```

Điều này thực sự hữu ích khi bạn cần thay đổi một giá trị thuộc tính duy nhất dựa trên kết quả truy vấn media.

Bạn cũng có thể sử dụng logic `and`, `or`, hoặc `not` bên trong truy vấn media. Ví dụ:

```css-nolint
border-color: if(
  media((width > 700px) and (width < 1000px)): blue;
);

border-color: if(
  media((width < 500px) or (orientation: landscape)): blue;
);

background-color: if(
  not media(width < 500px): blue;
  else: red
);
```

Khi bạn muốn đặt nhiều khai báo hoặc quy tắc dựa trên một truy vấn media, cần sử dụng cấu trúc {{cssxref("@media")}} thông thường. Hai cách tiếp cận bổ sung cho nhau và có các ứng dụng khác nhau.

#### Truy vấn tính năng

Một `<if-test>` [truy vấn tính năng](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries) có thể được sử dụng để đặt giá trị cho thuộc tính tùy thuộc vào việc trình duyệt có hỗ trợ một giá trị thuộc tính cụ thể hay không.

Ví dụ, sau đây trả về màu {{cssxref("color_value/lch()")}} nếu màu `lch()` được hỗ trợ, hoặc màu {{cssxref("color_value/rgb()")}} nếu không:

```css-nolint
color: if(
  supports(color: lch(75% 0 0)): lch(75% 0 0);
  else: rgb(185 185 185);
)
```

Các truy vấn hỗ trợ selector cũng hoạt động. Sau đây sẽ trả về giá trị `1em` nếu trình duyệt hỗ trợ lớp giả {{cssxref(":buffering")}}, hoặc `initial` nếu không:

```css-nolint
margin-top: if(
  supports(selector(:buffering)): 1em;
  else: initial;
)
```

Bạn cũng có thể sử dụng logic `and`, `or`, hoặc `not` bên trong truy vấn tính năng. Ví dụ:

```css-nolint
margin-top: if(
  supports((selector(:buffering)) and (color: blue)): 1em;
);

margin-top: if(
  supports((selector(:buffering)) or (color: not-a-color)): 1em;
);

margin-top: if(
  supports(not selector(:buffering)): 1em;
);
```

Truy vấn tính năng thực sự hữu ích bên trong các câu lệnh `if()` khi bạn cần thay đổi một giá trị thuộc tính duy nhất dựa trên hỗ trợ cho một giá trị cụ thể hoặc một thuộc tính riêng biệt. Khi bạn muốn đặt nhiều khai báo hoặc quy tắc dựa trên một truy vấn tính năng, cấu trúc {{cssxref("@supports")}} thông thường tốt hơn. Hai cách tiếp cận bổ sung cho nhau và có các ứng dụng khác nhau.

### Cung cấp giá trị fallback

Câu lệnh `if()` không giảm dần một cách tinh tế; cần cung cấp fallback rõ ràng cho các trình duyệt không hỗ trợ.

Ví dụ, trong trường hợp này chúng ta cung cấp giá trị {{cssxref("padding")}} tĩnh cho các trình duyệt không hỗ trợ `if()`. Các trình duyệt hỗ trợ `if()` sẽ ghi đè khai báo đầu tiên bằng khai báo thứ hai, đặt các giá trị padding khác nhau tùy thuộc vào việc thuộc tính tùy chỉnh `--size: "2xl"` có được đặt hay không.

```css
padding: 1em;
padding: if(style(--size: "2xl"): 1em; else: 0.25em);
```

> [!NOTE]
> Hãy nhớ bao gồm điều kiện `else`. Trong các trình duyệt hỗ trợ `if()`, nếu không có giá trị `else` nào được bao gồm và `--size` không bằng `"2xl"`, padding sẽ được đặt thành `initial`.

### Giá trị toàn bộ và một phần

Hàm `if()` có thể được đặt làm giá trị của bất kỳ thuộc tính CSS nào, nhưng nó cũng có thể được sử dụng để xác định các phần của giá trị thuộc tính. Ví dụ, sau đây đặt một {{cssxref("border-color")}} khác bên trong thuộc tính tắt gọn {{cssxref("border")}}, tùy thuộc vào việc màu {{cssxref("color_value/lch()")}} có được hỗ trợ hay không:

```css-nolint
border: if(
  supports(color: lch(75% 0 0)): 3px solid lch(75% 0 0);
  else: 3px solid silver;
);
```

Tuy nhiên, chúng ta có thể sử dụng hàm `if()` để chỉ xác định thành phần {{cssxref("border-color")}}:

```css-nolint
border: 3px solid
  if(
    supports(color: lch(75% 0 0)): lch(75% 0 0); else: silver;
  );
```

### Lồng các hàm if()

Vì hàm `if()` có thể thay thế toàn bộ giá trị thuộc tính hoặc các thành phần riêng lẻ, có thể lồng các hàm `if()` bên trong các hàm `if()` khác, và bên trong các hàm khác như {{cssxref("calc()")}}.

Ví dụ, trong khai báo này chúng ta đang sử dụng `if()` để đặt giá trị thuộc tính `color` tùy thuộc vào các điều kiện khác nhau. Chúng ta có hàm `if()` bên ngoài trả về một giá trị cụ thể tùy thuộc vào việc thuộc tính tùy chỉnh `--scheme` được đặt thành `ice` hay `fire` (với giá trị `else` là `black` được trả về nếu không có điều kiện nào trả về true).

Tuy nhiên, hai `<value>` cũng là các hàm `if()`. Các hàm `if()` bên trong này trả về giá trị màu sáng nếu người dùng thích lược đồ màu tối (được xác định bằng truy vấn media [`prefers-color-scheme`](/vi/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme)), và giá trị màu tối nếu không.

```css-nolint
color: if(
  style(--scheme: ice):
    if(
      media(prefers-color-scheme: dark): #caf0f8;
      else: #03045e;
    );
  style(--scheme: fire):
    if(
      media(prefers-color-scheme: dark): #ffc971;
      else: #621708;
    );
  else: black
);
```

Trong ví dụ tiếp theo, chúng ta đặt thuộc tính `width` bằng hàm `calc()` trừ `50px` từ một phần trăm của chiều rộng phần tử cha. Phần trăm được đại diện bởi hàm `if()`, kiểm tra xem thuộc tính tùy chỉnh `--scheme: wide` có được đặt hay không. Nếu vậy, phần trăm là `70%`, vì vậy hàm bên ngoài phân giải thành `calc(70% - 50px)`. Nếu không, phần trăm là `50%`, vì vậy hàm bên ngoài phân giải thành `calc(50% - 50px)`.

```css-nolint
width: calc(if(
    style(--scheme: wide): 70%;
    else: 50%;
  ) - 50px);
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Cách dùng cơ bản của `if()`

Trong ví dụ này, chúng ta sẽ trình bày cách dùng cơ bản của từng loại `<if-test>`.

#### HTML

HTML của chúng ta có một phần tử {{htmlelement("section")}} với hai phần tử {{htmlelement("article")}} bên trong nó, chứa các tiêu đề `<h2>`. Phần tử `<section>` có một thuộc tính tùy chỉnh được đặt trên nó bên trong thuộc tính [`style`](/vi/docs/Web/HTML/Reference/Global_attributes/style) — `--show-apple:true` — mà chúng ta sử dụng sau để đặt có điều kiện một giá trị thuộc tính.

```html live-sample___basic
<section style="--show-apple:true">
  <article><h2>Bài viết đầu tiên</h2></article>
  <article><h2>Bài viết thứ hai</h2></article>
</section>
```

#### CSS

Trong CSS, trước tiên chúng ta nhắm mục tiêu phần tử `<section>`, bố cục nó với [flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout) và đặt {{cssxref("gap")}} giữa hai phần tử `<article>` con. Sau đó chúng ta sử dụng hàm `if()` với truy vấn media [`orientation`](/vi/docs/Web/CSS/Reference/At-rules/@media/orientation) `<if-test>` để đặt giá trị của thuộc tính {{cssxref("flex-direction")}} thành `row` nếu tài liệu ở chế độ ngang, hoặc `column` nếu ở chế độ dọc.

```css hidden live-sample___basic
html {
  height: 100%;
  font-family: sans-serif;
}

body,
section {
  height: inherit;
}

h2 {
  text-align: center;
}

article {
  background-color: cyan;
  border: 3px solid gray;
  flex: 1;
}
```

```css-nolint live-sample___basic
section {
  display: flex;
  gap: 16px;
  flex-direction: if(
    media(orientation: landscape): row;
    else: column;
  )
}
```

Tiếp theo, chúng ta nhắm mục tiêu pseudo-element {{cssxref("::before")}} của phần tử `<h2>`, đặt thuộc tính {{cssxref("content")}} của nó thành emoji táo, nhưng chỉ khi `--show-apple: true` được đặt. Chúng ta đạt được điều này bằng cách sử dụng hàm `if()` với `<if-test>` [truy vấn style](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#style_queries_for_custom_properties):

```css-nolint live-sample___basic
h2::before {
  content: if(
    style(--show-apple: true): "🍎 ";
  );
}
```

Cuối cùng, chúng ta nhắm mục tiêu chính phần tử `<h2>`. Chúng ta sử dụng `<if-test>` truy vấn tính năng để kiểm tra xem trình duyệt có hỗ trợ màu `lch()` không, và đặt thuộc tính {{cssxref("color")}} thành màu `lch()` nếu vậy, hoặc tương đương hex nếu không.

```css-nolint live-sample___basic
h2 {
  color: if(
    supports(color: lch(29.57% 43.25 344.44)): lch(29.57% 43.25 344.44);
    else: #792359;
  )
}
```

#### Kết quả

{{EmbedLiveSample("basic", "100%", "240")}}

Lưu ý cách styling được áp dụng. Kiểm tra styling có điều kiện cho hai truy vấn `if()` đầu tiên bằng cách sửa đổi demo đã được render bằng devtools của trình duyệt:

- Xóa thuộc tính `style` của phần tử `<section>` và lưu ý cách các emoji táo không còn được hiển thị.
- Thay đổi thuộc tính `height` của `<iframe>` được nhúng thành `1200px`. Điều này sẽ thay đổi hướng từ ngang sang dọc. Lưu ý cách bố cục thay đổi.

### Kiểm soát lược đồ màu với `if()`

Demo này cho thấy cách bạn có thể bắt đầu có một số niềm vui thực sự với các hàm CSS `if()`. Trong số những thứ khác, chúng ta sử dụng các hàm `if()` để đặt có điều kiện các giá trị của một số thuộc tính tùy chỉnh, cho phép chúng ta kiểm soát toàn bộ lược đồ màu!

#### HTML

HTML của chúng ta chứa một phần tử {{htmlelement("article")}} với một số nội dung bên trong — tiêu đề cấp cao nhất, một vài phần tử {{htmlelement("p")}}, và một {{htmlelement("aside")}}. Chúng ta cũng bao gồm một {{htmlelement("form")}} chứa một thẻ chọn {{htmlelement("select")}} cho phép chọn lược đồ màu.

```html-nolint live-sample___color-scheme
<article>
  <h1>Tiêu đề chính</h1>
  <p>
    Lorem ipsum dolor sit amet consectetur adipiscing elit.
    Quisque faucibus ex sapien vitae pellentesque sem placerat.
    In id cursus mi pretium tellus duis convallis.
  </p>
  <aside>
    <h2>Phần phụ</h2>
    <p>
      Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus
      fringilla lacus nec metus bibendum egestas.
    </p>
  </aside>
  <p>
    Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut
    hendrerit semper vel class aptent taciti sociosqu. Ad litora
    torquent per conubia nostra inceptos himenaeos.
  </p>
</article>
<form>
  <label for="scheme">Chọn lược đồ màu:</label>
  <select id="scheme">
    <option value="">Mặc định</option>
    <option value="ice">Ice</option>
    <option value="fire">Fire</option>
  </select>
</form>
```

### JavaScript

JavaScript của chúng ta thêm trình nghe sự kiện [`change`](/vi/docs/Web/API/HTMLElement/change_event) vào phần tử `<select>`. Khi một giá trị mới được chọn, script của chúng ta đặt thuộc tính [`class`](/vi/docs/Web/HTML/Reference/Global_attributes/class) của phần tử `<article>` bằng giá trị đó.

```js live-sample___color-scheme
const articleElem = document.querySelector("article");
const selectElem = document.querySelector("select");

selectElem.addEventListener("change", () => {
  articleElem.className = selectElem.value;
});
```

### CSS

Trong CSS, chúng ta cho phần tử `<body>` {{cssxref("max-width")}} là `700px` và căn giữa nó bằng các giá trị `auto` {{cssxref("margin")}}. Tuy nhiên, chúng ta sử dụng hàm `if()` với `<if-test>` truy vấn media để đặt thành phần {{cssxref("margin-top")}} bên trong thuộc tính tắt gọn `margin` thành `0` nếu chiều rộng viewport nhỏ hơn `700px`, và `20px` nếu rộng hơn.

```css hidden live-sample___color-scheme
* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
}

p {
  line-height: 1.5;
}

form {
  padding-left: 20px;
  margin-top: 20px;
}

article h2 {
  margin: 0;
  font-size: 1.8rem;
}
```

```css-nolint live-sample___color-scheme
body {
  max-width: 700px;
  margin: if(
    media(width < 700px): 0;
    else: 20px;
  ) auto 0;
}
```

Sau đó chúng ta đặt thuộc tính tùy chỉnh `--scheme` để khớp với tên `class` của phần tử `<article>`. Class sẽ được JavaScript của chúng ta đặt khi một giá trị mới được chọn trong phần tử `<select>`.

```css live-sample___color-scheme
.ice {
  --scheme: ice;
}

.fire {
  --scheme: fire;
}
```

Chúng ta có thể thấy sức mạnh thực sự của các hàm CSS `if()` khi kết hợp chúng với các thuộc tính tùy chỉnh. Ở đây chúng ta sử dụng các hàm `if()` để đặt các thuộc tính tùy chỉnh `--color1` và `--color2` thành các giá trị màu khác nhau tùy thuộc vào giá trị của thuộc tính tùy chỉnh `--scheme`. Sau đó chúng ta sử dụng các giá trị `--color1` và `--color2` trong các thuộc tính {{cssxref("color")}}, {{cssxref("border")}}, và {{cssxref("background-image")}} của phần tử `<article>`, và các thuộc tính `color` và `background-color` của phần tử `<aside>`.

```css-nolint live-sample___color-scheme
article {
  padding: 20px;
  --color1: if(
    style(--scheme: ice): #03045e;
    style(--scheme: fire): #621708;
    else: black;
  );
  --color2: if(
    style(--scheme: ice): #caf0f8;
    style(--scheme: fire): #ffc971;
    else: white;
  );

  color: var(--color1);
  border: 3px solid var(--color1);
  background-image: linear-gradient(
    to left,
    var(--color2),
    white,
    var(--color2)
  );
}

aside {
  color: var(--color2);
  background-color: var(--color1);
  padding: 20px;
}
```

Cuối cùng, chúng ta sử dụng các hàm `if()` ở một vài nơi nữa:

- Chúng ta đặt {{cssxref("font-size")}} của phần tử `<h1>` thành `calc(3rem + 2vw)` nếu viewport rộng hơn `700px`, và `3rem` nếu không. Điều này có nghĩa là kích thước font cập nhật động với các thay đổi chiều rộng viewport trên màn hình rộng hơn, nhưng vẫn giữ nguyên trên màn hình hẹp hơn.
- Chúng ta đặt một emoji phù hợp làm {{cssxref("content")}} của pseudo-class {{cssxref("::before")}} của phần tử `<h1>`, tùy thuộc vào giá trị của thuộc tính tùy chỉnh `--scheme`.

```css-nolint live-sample___color-scheme
h1 {
  margin: 0;
  font-size: if(
    media(width > 700px): calc(3rem + 2vw);
    else: 3rem;
  );
}

h1::before {
  content: if(
    style(--scheme: ice): "❄️ ";
    style(--scheme: fire): "🔥 ";
    else: "";
  );
}
```

#### Kết quả

Demo này được hiển thị như sau:

{{EmbedLiveSample("color-scheme", "100%", "500")}}

Thử chọn các giá trị lược đồ màu khác nhau để xem hiệu ứng lên giao diện.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Truy vấn style container](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries)
- [Truy vấn media](/vi/docs/Web/CSS/Guides/Media_queries/Using)
- [Truy vấn tính năng](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
- [Module giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
