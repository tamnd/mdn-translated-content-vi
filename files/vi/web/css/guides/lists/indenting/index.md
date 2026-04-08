---
title: Consistent list indentation
short-title: Indenting lists
slug: Web/CSS/Guides/Lists/Indenting
page-type: guide
sidebar: cssref
---

Một trong những thay đổi style phổ biến nhất được thực hiện với danh sách là thay đổi khoảng thụt lề — tức là khoảng cách các list item bị đẩy sang phải bao xa. Bài viết này sẽ giúp bạn hiểu cách thụt lề list items để các marker của list item hiển thị rõ ràng.

Để hiểu tại sao điều này xảy ra, và quan trọng hơn là cách tránh hoàn toàn vấn đề, cần phải xem xét chi tiết về cấu trúc danh sách.

## Tạo một danh sách

### List item độc lập

Đầu tiên, chúng ta xem xét list item thuần túy, không được lồng trong danh sách các items. Khi sử dụng phần tử HTML {{htmlelement("li")}}, trình duyệt đặt giá trị {{cssxref("display")}} thành `list-item`. Việc các list items không được lồng trong danh sách có được cung cấp marker (còn được gọi là "bullet") hay không phụ thuộc vào trình duyệt. Chúng ta có thể xóa bullet đó bằng {{cssxref("list-style-type", "list-style-type: none")}}.

```css
li {
  border: 1px dashed red;
}
li:nth-of-type(n + 4) {
  list-style-type: none;
}
```

```css hidden
li {
  width: 15em;
}
```

```html hidden
<p>Default bullets depend on the browser:</p>
<li>A list item</li>
<li>A list item</li>
<li>A list item</li>
<p>These list items have their bullets removed:</p>
<li>A list item</li>
<li>A list item</li>
<li>A list item</li>
```

{{EmbedLiveSample("The stand-alone list item", "100%", 200)}}

Viền đỏ chấm chấm đó đại diện cho các cạnh ngoài của vùng nội dung của mỗi list item. Tại thời điểm này, các list items không có padding hoặc border.

### List items được lồng

Bây giờ chúng ta bao gồm các items này trong một phần tử cha; trong trường hợp này, chúng ta sẽ bao gồm chúng trong một unordered list (tức là `<ul>`). Theo CSS box model, các hộp của list item phải được hiển thị trong vùng nội dung của phần tử cha.

```css
ul {
  border: 1px dashed blue;
}
li {
  border: 1px dashed red;
  list-style-type: none;
}
```

```css hidden
body {
  width: 15em;
}
```

```html hidden
<ul>
  <li>A list item</li>
  <li>A list item</li>
  <li>A list item</li>
</ul>
```

{{EmbedLiveSample("List items nested in a list", "100%", 150)}}

Viền màu xanh chấm chấm cho chúng ta thấy các cạnh của vùng nội dung của phần tử `<ul>`. Phần tử cha đó có cả margin và padding. Các trình duyệt đặt các style mặc định sau trên unordered lists:

```css
ul {
  /* user-agent styles */
  display: block;
  list-style-type: disc;
  margin-block-start: 1em;
  margin-block-end: 1em;
  padding-inline-start: 40px;
}
```

### Vị trí bullet mặc định

Bây giờ chúng ta đặt lại các marker của list item. Vì đây là unordered list, các list items kế thừa style trình duyệt `list-style-type: disc;`, đó là các "bullet" hình tròn đầy, từ phần tử cha `<ul>`.

```css
li {
  border: 1px dashed red;
}
ul {
  border: 1px dotted blue;
}
ul:last-of-type {
  list-style-position: inside;
}
```

```css hidden
ul {
  width: 15em;
}
```

```html hidden
<p>These default to <code>list-style-position: outside</code>.</p>
<ul>
  <li>A list item</li>
  <li>A list item</li>
  <li>A list item</li>
</ul>
<p>These have <code>list-style-position: inside</code> set.</p>
<ul>
  <li>A list item</li>
  <li>A list item</li>
  <li>A list item</li>
</ul>
```

{{EmbedLiveSample("Inheriting `list-style-type`", "100%", 220)}}

Về mặt trực quan, các markers nằm _bên ngoài_ vùng nội dung của `<ul>`, nhưng đó không phải là điểm quan trọng ở đây. Điều quan trọng là các markers được đặt bên ngoài "principal box" của các phần tử `<li>`, không phải `<ul>`. Chúng giống như những phụ lục của list items, treo bên ngoài vùng nội dung của `<li>` nhưng vẫn gắn với `<li>`.

Đây là lý do tại sao, trong mọi trình duyệt hiện đại, các markers được đặt bên ngoài bất kỳ border nào được đặt cho phần tử `<li>` khi giá trị của {{cssxref("list-style-position")}} mặc định hoặc được đặt rõ ràng là `outside`. Khi chúng ta thay đổi nó thành `inside`, các markers được đưa vào bên trong nội dung của `<li>`, như thể chúng là một inline box được đặt ở đầu `<li>`.

## Thụt lề mặc định

Như đã lưu ý ở trên, tất cả các trình duyệt cung cấp cả margin và padding cho phần tử cha `<ul>`. Mặc dù CSS của user agents có đôi chút khác nhau, tất cả đều bao gồm:

```css
ul,
ol {
  /* user-agent styles */
  display: block;
  list-style-type: disc;
  margin-block-start: 1em;
  margin-block-end: 1em;
  padding-inline-start: 40px;
}
ol {
  list-style-type: decimal;
}
li {
  display: list-item;
  text-align: match-parent;
}
::marker {
  unicode-bidi: isolate;
  font-variant-numeric: tabular-nums;
  text-transform: none;
}
```

Tất cả các trình duyệt đặt {{cssxref("padding-inline-start")}} là 40 pixel cho phần tử `<ul>` theo mặc định. Trong các ngôn ngữ viết từ trái sang phải, như tiếng Anh, đây là _padding_ bên trái. Bất kỳ padding nào được đặt trong stylesheet của tác giả (đó là stylesheet của bạn) đều có độ ưu tiên cao hơn.

Nếu bạn muốn rõ ràng, hãy đặt điều sau trong stylesheets của bạn để đảm bảo, trừ khi có ghi đè khác, các list items trong vùng nội dung chính của tài liệu, được chứa trong phần {{htmlelement("main")}}, được thụt lề đúng cách:

```css
:where(main ol, main ul) {
  margin-inline-start: 0;
  padding-inline-start: 40px;
}
```

Và luôn lồng các phần tử `<li>` trong `<ul>` hoặc `<ol>`.
