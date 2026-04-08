---
title: "<samp>: The Sample Output element"
slug: Web/HTML/Reference/Elements/samp
page-type: html-element
browser-compat: html.elements.samp
sidebar: htmlsidebar
---

Phần tử **`<samp>`** trong [HTML](/en-US/docs/Web/HTML) được dùng để bao quanh văn bản nội tuyến đại diện cho đầu ra mẫu (hoặc trích dẫn) từ một chương trình máy tính. Nội dung của nó thường được hiển thị bằng phông chữ monospace mặc định của trình duyệt (chẳng hạn như [Courier](<https://en.wikipedia.org/wiki/Courier_(typeface)>) hoặc Lucida Console).

{{InteractiveExample("HTML Demo: &lt;samp&gt;", "tabbed-shorter")}}

```html interactive-example
<p>I was trying to boot my computer, but I got this hilarious message:</p>

<p>
  <samp>Keyboard not found <br />Press F1 to continue</samp>
</p>
```

```css interactive-example
samp {
  font-weight: bold;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Bạn có thể dùng quy tắc CSS để ghi đè phông chữ mặc định của trình duyệt cho phần tử `<samp>`; tuy nhiên, tùy chọn của trình duyệt có thể được ưu tiên hơn bất kỳ CSS nào bạn chỉ định.

CSS để ghi đè phông chữ mặc định sẽ trông như thế này:

```css
samp {
  font-family: "Courier";
}
```

> [!NOTE]
> Nếu bạn cần một phần tử sẽ đóng vai trò là vùng chứa cho đầu ra được tạo bởi mã JavaScript của trang web hoặc ứng dụng, bạn nên dùng phần tử {{HTMLElement("output")}} thay thế.

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ cơ bản này, một đoạn văn bao gồm ví dụ về đầu ra của một chương trình.

```html
<p>
  When the process is complete, the utility will output the text
  <samp>Scan complete. Found <em>N</em> results.</samp> You can then proceed to
  the next step.
</p>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 650, 100)}}

### Đầu ra mẫu bao gồm đầu vào của người dùng

Bạn có thể lồng phần tử {{HTMLElement("kbd")}} trong một khối `<samp>` để trình bày ví dụ bao gồm văn bản được nhập bởi người dùng. Ví dụ, hãy xem đoạn văn bản trình bày bản ghi phiên làm việc trên console Linux (hoặc macOS):

#### HTML

```html
<pre>
<samp><span class="prompt">mike@interwebz:~$</span> <kbd>md5 -s "Hello world"</kbd>
MD5 ("Hello world") = 3e25960a79dbc69b674cd4ec67a72c62

<span class="prompt">mike@interwebz:~$</span> <span class="cursor">█</span></samp></pre>
```

Lưu ý việc sử dụng {{HTMLElement("span")}} để cho phép tùy chỉnh giao diện của các phần cụ thể trong văn bản mẫu như các dấu nhắc shell và con trỏ. Cũng lưu ý việc sử dụng `<kbd>` để đại diện cho lệnh người dùng nhập tại dấu nhắc trong văn bản mẫu.

#### CSS

CSS để đạt được giao diện mong muốn là:

```css
.prompt {
  color: #bb0000;
}

samp > kbd {
  font-weight: bold;
}

.cursor {
  color: #0000bb;
}
```

Đây là cách tô màu khá tinh tế cho dấu nhắc và con trỏ, và in đậm đầu vào bàn phím trong văn bản mẫu.

#### Kết quả

Đầu ra kết quả là:

{{EmbedLiveSample("Sample_output_including_user_input", 650, 120)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan: {{HTMLElement("kbd")}}, {{HTMLElement("code")}}, {{HTMLElement("pre")}}
- Phần tử {{HTMLElement("output")}}: vùng chứa cho đầu ra được tạo bởi script
