---
title: hyphenate-character
slug: Web/CSS/Reference/Properties/hyphenate-character
page-type: css-property
browser-compat: css.properties.hyphenate-character
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`hyphenate-character`** đặt ký tự (hoặc chuỗi) được sử dụng ở cuối dòng trước một điểm ngắt gạch nối.

Cả gạch nối tự động lẫn gạch nối mềm đều được hiển thị theo giá trị `hyphenate-character` được chỉ định.

{{InteractiveExample("CSS Demo: hyphenate-character")}}

```css interactive-example-choice
hyphenate-character: auto;
```

```css interactive-example-choice
hyphenate-character: "=";
```

```css interactive-example-choice
hyphenate-character: "—";
```

```html interactive-example
<section id="default-example">
  <p id="example-element">An extra­ordinarily long English word!</p>
</section>
```

```css interactive-example
#example-element {
  border: 2px dashed #999999;
  font-size: 1.5rem;
  text-align: left;
  width: 7rem;
  hyphens: auto;
}
```

## Cú pháp

```css
hyphenate-character: <string>;
hyphenate-character: auto;
```

Giá trị này đặt chuỗi dùng thay cho gạch nối, hoặc cho biết tác nhân người dùng nên chọn một chuỗi phù hợp dựa trên các quy ước kiểu chữ hiện hành (mặc định).

### Giá trị

- `<string>`
  - : {{cssxref("&lt;string&gt;")}} được sử dụng ở cuối dòng trước một điểm ngắt gạch nối.
    Tác nhân người dùng có thể cắt bớt giá trị này nếu quá nhiều ký tự được dùng.
- `auto`
  - : Tác nhân người dùng chọn một chuỗi phù hợp dựa trên các quy ước kiểu chữ của ngôn ngữ nội dung.
    Đây là giá trị mặc định của thuộc tính và chỉ cần đặt tường minh khi muốn ghi đè một giá trị kế thừa khác.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Ví dụ này hiển thị hai khối văn bản giống nhau có {{cssxref("hyphens")}} được đặt để đảm bảo chúng ngắt dòng bất cứ khi nào cần thiết, và tại các điểm ngắt gạch nối mềm (được tạo bằng `&shy;`).
Khối đầu tiên có giá trị của gạch nối được đổi thành ký hiệu bằng (`=`).
Khối thứ hai không đặt `hyphenate-character`, tương đương với `hyphenate-character: auto` đối với các tác nhân người dùng hỗ trợ thuộc tính này.

### HTML

```html
<dl>
  <dt><code>hyphenate-character: "="</code></dt>
  <dd id="string" lang="en">Superc&shy;alifragilisticexpialidocious</dd>
  <dt><code>hyphenate-character is not set</code></dt>
  <dd lang="en">Superc&shy;alifragilisticexpialidocious</dd>
</dl>
```

### CSS

```css
dd {
  width: 90px;
  border: 1px solid black;
  hyphens: auto;
}

dd#string {
  -webkit-hyphenate-character: "=";
  hyphenate-character: "=";
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 350)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS liên quan: {{cssxref("hyphens")}}, {{cssxref("overflow-wrap")}}.
