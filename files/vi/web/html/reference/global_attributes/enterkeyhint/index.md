---
title: HTML enterkeyhint global attribute
short-title: enterkeyhint
slug: Web/HTML/Reference/Global_attributes/enterkeyhint
page-type: html-attribute
browser-compat: html.global_attributes.enterkeyhint
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`enterkeyhint`**
là một thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) xác định nhãn hành động (hoặc biểu tượng) hiển thị cho phím Enter trên bàn phím ảo.

{{InteractiveExample("HTML Demo: enterkeyhint", "tabbed-shorter")}}

```html interactive-example
<input enterkeyhint="go" />

<p contenteditable enterkeyhint="go">https://example.org</p>
```

## Mô tả

[Các điều khiển biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms) (chẳng hạn như các phần tử [`<textarea>`](/en-US/docs/Web/HTML/Reference/Elements/textarea)
hay [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input)) hoặc các phần tử sử dụng
[`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) có thể chỉ định thuộc tính
[`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode) để kiểm soát loại bàn phím ảo nào sẽ được sử dụng. Để cải thiện thêm trải nghiệm người dùng, phím Enter có thể được tùy chỉnh cụ thể bằng cách cung cấp thuộc tính `enterkeyhint` cho biết phím Enter nên được gắn nhãn như thế nào (hoặc biểu tượng nào sẽ được hiển thị). Phím Enter thường đại diện cho hành động tiếp theo mà người dùng nên thực hiện; các hành động điển hình bao gồm: gửi văn bản, chèn dòng mới, hoặc tìm kiếm.

Nếu không có thuộc tính `enterkeyhint`, tác nhân người dùng có thể sử dụng thông tin ngữ cảnh từ các thuộc tính
[`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode),
[`type`](/en-US/docs/Web/HTML/Reference/Elements/input#input_types),
hoặc [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern)
để hiển thị nhãn phím Enter phù hợp (hoặc biểu tượng).

## Giá trị

Thuộc tính `enterkeyhint` là thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) và chỉ chấp nhận các giá trị sau:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Giá trị</th>
      <th>Mô tả</th>
      <th>Nhãn mẫu (phụ thuộc vào tác nhân người dùng và ngôn ngữ người dùng)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>enterkeyhint="enter"</code></td>
      <td>Thường dùng để chèn dòng mới.</td>
      <td><kbd>return</kbd>, <kbd>↵</kbd></td>
    </tr>
    <tr>
      <td><code>enterkeyhint="done"</code></td>
      <td>Thường có nghĩa là không còn gì để nhập thêm và trình chỉnh sửa phương thức nhập (IME) sẽ được đóng lại.</td>
      <td><kbd>done</kbd>, <kbd>✅</kbd></td>
    </tr>
    <tr>
      <td><code>enterkeyhint="go"</code></td>
      <td>Thường có nghĩa là đưa người dùng đến đích của văn bản họ đã gõ.</td>
      <td><kbd>go</kbd>, <kbd>🡢</kbd></td>
    </tr>
    <tr>
      <td><code>enterkeyhint="next"</code></td>
      <td>Thường đưa người dùng đến trường tiếp theo sẽ chấp nhận văn bản.</td>
      <td><kbd>next</kbd>, <kbd>⇥</kbd></td>
    </tr>
    <tr>
      <td><code>enterkeyhint="previous"</code></td>
      <td>Thường đưa người dùng đến trường trước đó sẽ chấp nhận văn bản.</td>
      <td><kbd>return</kbd>, <kbd>⇤</kbd></td>
    </tr>
    <tr>
      <td><code>enterkeyhint="search"</code></td>
      <td>Thường đưa người dùng đến kết quả tìm kiếm cho văn bản họ đã gõ.</td>
      <td><kbd>search</kbd>, <kbd>🔍</kbd></td>
    </tr>
    <tr>
      <td><code>enterkeyhint="send"</code></td>
      <td>Thường dùng để gửi văn bản đến đích của nó.</td>
      <td><kbd>send</kbd></td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [`HTMLElement.enterKeyHint`](/en-US/docs/Web/API/HTMLElement/enterKeyHint) phản ánh thuộc tính này
- Thuộc tính toàn cục [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode)
- Thuộc tính toàn cục [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable)
- Các thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#input_types) và
  [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) trên
  các phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input)
