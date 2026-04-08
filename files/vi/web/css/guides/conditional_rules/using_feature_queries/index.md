---
title: Using feature queries
slug: Web/CSS/Guides/Conditional_rules/Using_feature_queries
page-type: guide
sidebar: cssref
---

**Feature queries** là các conditional group rules kiểm tra xem user agent có hỗ trợ hay không hỗ trợ một hoặc nhiều tính năng CSS, chẳng hạn như các thuộc tính CSS và giá trị thuộc tính. Feature queries cung cấp cho các web developer cách kiểm tra xem trình duyệt có hỗ trợ tính năng nhất định không, và sau đó cung cấp CSS chỉ chạy dựa trên kết quả kiểm tra đó. Trong hướng dẫn này, bạn sẽ học cách triển khai progressive enhancement bằng feature queries.

Feature queries được tạo bằng CSS at-rule {{cssxref("@supports")}} (hoặc hàm `supports()` trong at-rule {{cssxref("@import")}}).

## Cú pháp

CSS feature queries là một phần của module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules), cũng định nghĩa at-rule media query {{cssxref("@media")}}. Feature queries hoạt động tương tự như [media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using). Sự khác biệt là với media query, bạn đang kiểm tra điều gì đó về môi trường mà trang web đang chạy, trong khi với feature queries bạn đang kiểm tra hỗ trợ trình duyệt cho các tính năng CSS.

Feature query bao gồm at-rule `@supports` theo sau là điều kiện hỗ trợ hoặc hàm `supports()` và tham số khai báo trong khai báo at-rule `@import`:

```plain
/* `@supports` at-rule */
@supports <support-condition> {
  /* CSS rules to apply */
}

/* `supports()` function */
@import url_to_import supports(<declaration>);
```

Ví dụ, chúng ta có thể áp dụng một tập hợp style hoặc nhập toàn bộ stylesheet nếu user-agent hỗ trợ `red` là giá trị hợp lệ cho thuộc tính CSS {{cssxref("color")}}:

```css
/* `@supports` at-rule */
@supports (color: red) {
  /* CSS rules to apply */
}

/* `supports()` function */
@import "/css/styles.css" supports(color: red);
```

Ví dụ khác, nếu bạn muốn kiểm tra xem trình duyệt có hỗ trợ thuộc tính `row-gap` không, bạn sẽ viết feature query sau. Không quan trọng giá trị bạn sử dụng trong nhiều trường hợp: nếu tất cả những gì bạn muốn là kiểm tra rằng trình duyệt hỗ trợ thuộc tính này, thì bất kỳ giá trị hợp lệ nào đều được.

```html live-sample___simple
<div class="box">
  If your browser supports the row-gap property, the border will be dashed and
  text will be red.
</div>
```

```css live-sample___simple
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  border: 4px solid blue;
  color: blue;
  padding: 1em;
}
@supports (row-gap: 10px) {
  .box {
    border: 4px dashed darkgreen;
    color: red;
  }
}
```

{{EmbedLiveSample("simple")}}

Phần giá trị của cặp property-value quan trọng hơn nếu bạn đang kiểm tra các giá trị mới của một thuộc tính cụ thể. Tất cả các trình duyệt đều hỗ trợ `color: red`: điều này có từ CSS1. Tuy nhiên, thường có các giá trị bổ sung được thêm vào thuộc tính trong CSS, như [relative colors](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors), có thể không được hỗ trợ. Feature queries cho phép kiểm tra cặp thuộc tính và giá trị, nghĩa là chúng ta có thể phát hiện hỗ trợ cho các giá trị.

Mở rộng ví dụ thuộc tính `color` ở trên, ở đây chúng ta kiểm tra xem trình duyệt có hỗ trợ khai báo `color: AccentColor` không:

```css
/* `@supports` at-rule */
@supports (color: AccentColor) {
  /* CSS rules to apply */
}

/* `supports()` function */
@import "/css/styles.css" supports(color: AccentColor);
```

Trong các ví dụ này, chúng ta đã dùng feature queries để kiểm tra xem user-agent có hỗ trợ một giá trị cụ thể của thuộc tính CSS không, liệt kê khai báo đơn lẻ trong ngoặc đơn. Bạn có thể kiểm tra nhiều giá trị thuộc tính hoặc thiếu hỗ trợ.

## Kiểm tra thiếu hỗ trợ

Ngoài việc hỏi trình duyệt xem nó có hỗ trợ tính năng không, bạn có thể kiểm tra điều ngược lại bằng cách thêm keyword `not`:

```css
/* `@supports` at-rule with `not` */
@supports not (property: value) {
  /* CSS rules to apply */
}
```

CSS bên trong feature query ví dụ sau sẽ chạy nếu trình duyệt không hỗ trợ `row-gap`.

```html live-sample___not
<div class="box">
  If your browser does not support row-gap, the content will be darkgreen with a
  dashed border.
</div>
```

```css live-sample___not
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  border: 4px solid blue;
  color: blue;
  padding: 1em;
}
@supports not (row-gap: 10px) {
  .box {
    border: 4px dashed darkgreen;
    color: darkgreen;
  }
}
```

{{EmbedLiveSample("not")}}

## Kiểm tra nhiều hơn một tính năng

Bạn có thể cần kiểm tra hỗ trợ cho nhiều hơn một thuộc tính trong feature query. Để làm vậy, bạn có thể bao gồm danh sách các tính năng để kiểm tra, được phân tách bằng keyword `and`:

```css
/* multiple feature `@supports` at-rule */
@supports (property1: value) and (property2: value) {
  /* CSS rules to apply */
}
```

Ví dụ, nếu CSS bạn muốn chạy yêu cầu trình duyệt hỗ trợ CSS Shapes và CSS grid, bạn có thể tạo quy tắc kiểm tra hỗ trợ trình duyệt cho cả hai tính năng này. Quy tắc sau chỉ trả về true nếu cả `shape-outside: circle()` và `display: grid` đều được hỗ trợ bởi trình duyệt.

```html live-sample___and
<div class="box">
  If your browser supports <code>display: grid</code> and
  <code>shape-outside: circle()</code>, the content will be darkgreen with a
  dashed border.
</div>
```

```css live-sample___and
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  border: 4px solid blue;
  color: blue;
  padding: 1em;
}
@supports (display: grid) and (shape-outside: circle()) {
  .box {
    border: 4px dashed darkgreen;
    color: darkgreen;
  }
}
```

{{EmbedLiveSample("and")}}

## Kiểm tra ít nhất một trong nhiều tính năng

Bạn cũng có thể dùng `or` để áp dụng CSS chỉ khi một hoặc nhiều khai báo được hỗ trợ:

```css
/* any feature `@supports` at-rule */
@supports (property1: value) or (property2: value) {
  /* CSS rules to apply */
}
```

Điều này có thể đặc biệt hữu ích nếu một tính năng có vendor prefix, vì bạn có thể kiểm tra thuộc tính tiêu chuẩn cộng với bất kỳ vendor prefix nào.

```html live-sample___or
<div class="box">
  The text and border will be green if your browser supports font smoothing.
</div>
```

```css live-sample___or
body {
  font: 1.2em / 1.5 sans-serif;
}
.box {
  border: 4px solid blue;
  color: blue;
  padding: 1em;
}
@supports (font-smooth: always) or (-webkit-font-smoothing: antialiased) {
  .box {
    border: 4px dashed darkgreen;
    color: darkgreen;
  }
}
```

{{EmbedLiveSample("or")}}

## Tùy chọn feature query bổ sung

Feature queries không bị giới hạn ở các cặp property-value. Bạn có thể bao gồm các hàm [`font-tech()`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-tech), [`font-format()`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-format), và [`selector()`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#function_syntax) trong feature queries để áp dụng CSS có chọn lọc dựa trên việc user-agent có hỗ trợ công nghệ font, định dạng font, hoặc cú pháp selector được chỉ định hay không.

Ví dụ, hàm `selector()` có thể được dùng để nhập stylesheet cho các trình duyệt hỗ trợ pseudo-element có vendor-prefix:

```css
/* A `selector()` query within a `supports()` function */
@import "/css/webkitShadowStyles.css"
  supports(selector(::-webkit-inner-spin-button));
```

## Ví dụ

### Kiểm tra hỗ trợ trình duyệt

Trong ví dụ này, chúng ta kiểm tra xem trình duyệt có hỗ trợ `AccentColor` {{cssxref("system-color")}} không và sử dụng `display: none` để thay đổi thông báo mặc định "not supported" thành thông báo "supported" nếu kiểu màu được hỗ trợ.

#### HTML

```html
<p class="accentcolor">
  Your browser does <span>not</span> support <code>AccentColor</code> as a color
  value.
</p>
```

#### CSS

```css
body {
  font: 1.2em / 1.5 sans-serif;
}
p {
  padding: 1em;
}
@supports (color: AccentColor) {
  p {
    color: green;
    border: 2px solid;
  }
  span {
    display: none;
  }
}
@supports not (color: AccentColor) {
  p {
    color: red;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Browser support test")}}

## Hạn chế của feature queries

Quy tắc `@supports` kiểm tra xem các trình duyệt có thể phân tích cú pháp một hoặc nhiều cặp property/value không, và do đó xem chúng có xác nhận hỗ trợ các tính năng liên quan không. Nếu các cặp property/value được trình duyệt hiểu, nó trả về phản hồi dương tính. Feature queries kiểm tra rằng các khai báo được trình duyệt coi là hợp lệ, nhưng không thể được dùng để kiểm tra xem nó có hỗ trợ tính năng đúng cách mà không có lỗi hay vi phạm spec không. Feature queries không thể kiểm tra _triển khai một phần_.

## Tóm tắt

Feature queries là công cụ hữu ích để cải thiện dần dần một trang web. Chúng cho phép bạn cung cấp giải pháp tốt cho tất cả các trình duyệt, và giải pháp nâng cao cho các trình duyệt hỗ trợ các thuộc tính và giá trị mới hơn.

Bạn không cần dùng feature queries để bắt đầu sử dụng các tính năng CSS mới; xử lý lỗi CSS có nghĩa là trình duyệt đơn giản bỏ qua CSS mà nó chưa nhận ra. Tuy nhiên, feature queries là một thay thế hữu ích cho các khai báo fallback, và cho phép viết code một lần có thể cuối cùng được hỗ trợ ở khắp mọi nơi.

## Xem thêm

- Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
- [Using CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Supporting older browsers: feature queries](/en-US/docs/Learn_web_development/Core/CSS_layout/Supporting_Older_Browsers#feature_queries)
- [Browser feature detection: CSS `@supports`](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection#supports)
