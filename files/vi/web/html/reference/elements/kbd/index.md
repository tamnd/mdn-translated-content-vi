---
title: "<kbd>: The Keyboard Input element"
slug: Web/HTML/Reference/Elements/kbd
page-type: html-element
browser-compat: html.elements.kbd
sidebar: htmlsidebar
---

Phần tử **`<kbd>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một đoạn văn bản inline biểu thị đầu vào văn bản của người dùng từ bàn phím, đầu vào giọng nói, hoặc bất kỳ thiết bị nhập văn bản nào khác. Theo quy ước, {{Glossary("user agent")}} mặc định hiển thị nội dung của phần tử `<kbd>` bằng phông chữ monospace mặc định, mặc dù điều này không được bắt buộc bởi tiêu chuẩn HTML.

{{InteractiveExample("HTML Demo: &lt;kbd&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  Please press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> to re-render an
  MDN page.
</p>
```

```css interactive-example
kbd {
  background-color: #eeeeee;
  border-radius: 3px;
  border: 1px solid #b4b4b4;
  box-shadow:
    0 1px 1px rgb(0 0 0 / 0.2),
    0 2px 0 0 rgb(255 255 255 / 0.7) inset;
  color: #333333;
  display: inline-block;
  font-size: 0.85em;
  font-weight: bold;
  line-height: 1;
  padding: 2px 4px;
  white-space: nowrap;
}
```

`<kbd>` có thể được lồng nhau trong nhiều kết hợp khác nhau với phần tử {{HTMLElement("samp")}} (Sample Output) để đại diện cho các dạng đầu vào hoặc đầu ra khác nhau dựa trên các gợi ý trực quan.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Các phần tử khác có thể được sử dụng kết hợp với `<kbd>` để đại diện cho các tình huống cụ thể hơn:

- Lồng một phần tử `<kbd>` trong một phần tử `<kbd>` khác đại diện cho một phím thực tế hoặc đơn vị đầu vào khác là một phần của đầu vào lớn hơn. Xem [Đại diện cho các tổ hợp phím trong một đầu vào](#representing_keystrokes_within_an_input) bên dưới.
- Lồng một phần tử `<kbd>` bên trong phần tử {{HTMLElement("samp")}} đại diện cho đầu vào đã được phản hồi lại cho người dùng bởi hệ thống. Xem [Đầu vào được phản hồi](#echoed_input), bên dưới, để có ví dụ.
- Lồng một phần tử `<samp>` bên trong phần tử `<kbd>`, mặt khác, đại diện cho đầu vào dựa trên văn bản được trình bày bởi hệ thống, chẳng hạn như tên menu và mục menu, hoặc tên các nút được hiển thị trên màn hình. Xem ví dụ dưới đây về [Đại diện cho các tùy chọn đầu vào trên màn hình](#representing_onscreen_input_options).

> [!NOTE]
> Bạn có thể xác định một kiểu tùy chỉnh để ghi đè lựa chọn phông chữ mặc định của trình duyệt cho phần tử `<kbd>`, mặc dù tùy chọn của người dùng có thể ghi đè CSS của bạn.

## Ví dụ

### Ví dụ cơ bản

```html
<p>
  Use the command <kbd>help my-command</kbd> to view documentation for the
  command "my-command".
</p>
```

#### Kết quả

{{ EmbedLiveSample('Basic_example', 350, 80) }}

### Đại diện cho các tổ hợp phím trong một đầu vào

Để mô tả một đầu vào bao gồm nhiều tổ hợp phím, bạn có thể lồng nhiều phần tử `<kbd>`, với phần tử `<kbd>` bên ngoài đại diện cho đầu vào tổng thể và mỗi tổ hợp phím riêng lẻ hoặc thành phần của đầu vào được bao bọc trong phần tử `<kbd>` riêng của nó.

#### Không có kiểu dáng

Đầu tiên, hãy xem điều này trông như thế nào chỉ là HTML thuần túy.

##### HTML

```html
<p>
  You can also create a new document using the
  <kbd><kbd>Ctrl</kbd>+<kbd>N</kbd></kbd> keyboard shortcut.
</p>
```

Điều này bao bọc toàn bộ chuỗi phím trong một phần tử `<kbd>` bên ngoài, sau đó mỗi phím riêng lẻ trong phần tử của riêng nó, để biểu thị các thành phần của chuỗi.

> [!NOTE]
> Bạn không cần phải làm tất cả các bọc này; bạn có thể chọn đơn giản hóa nó bằng cách bỏ phần tử `<kbd>` bên ngoài. Nói cách khác, đơn giản hóa điều này chỉ còn `<kbd>Ctrl</kbd>+<kbd>N</kbd>` là hoàn toàn hợp lệ.
>
> Tuy nhiên, tùy thuộc vào stylesheet của bạn, bạn có thể thấy hữu ích khi thực hiện loại lồng nhau này.

##### Kết quả

Đầu ra trông như thế này mà không có stylesheet được áp dụng:

{{EmbedLiveSample("Unstyled", 650, 80)}}

#### Với kiểu dáng tùy chỉnh

Chúng ta có thể hiểu rõ hơn điều này bằng cách thêm một số CSS:

##### CSS

Chúng ta thêm một bộ chọn mới cho các phần tử `<kbd>` lồng nhau, `kbd>kbd`, mà chúng ta có thể áp dụng khi hiển thị các phím bàn phím:

```css
kbd > kbd {
  border-radius: 3px;
  padding: 1px 2px 0;
  border: 1px solid black;
}
```

##### HTML

Sau đó chúng ta cập nhật HTML để sử dụng lớp này trên các phím trong đầu ra được trình bày:

```html
<p>
  You can also create a new document by pressing the
  <kbd><kbd>Ctrl</kbd>+<kbd>N</kbd></kbd> shortcut.
</p>
```

##### Kết quả

Kết quả chính xác là những gì chúng ta muốn!

{{EmbedLiveSample("With_custom_styles", 650, 80)}}

### Đầu vào được phản hồi

Lồng một phần tử `<kbd>` bên trong phần tử {{HTMLElement("samp")}} đại diện cho đầu vào đã được phản hồi lại cho người dùng bởi hệ thống.

```html
<p>
  If a syntax error occurs, the tool will output the initial command you typed
  for your review:
</p>
<blockquote>
  <samp><kbd>custom-git ad my-new-file.cpp</kbd></samp>
</blockquote>
```

#### Kết quả

{{EmbedLiveSample("Echoed_input", 650, 100)}}

### Đại diện cho các tùy chọn đầu vào trên màn hình

Lồng một phần tử `<samp>` bên trong phần tử `<kbd>` đại diện cho đầu vào dựa trên văn bản được trình bày bởi hệ thống, chẳng hạn như tên menu và mục menu, hoặc tên các nút được hiển thị trên màn hình.

Ví dụ, bạn có thể giải thích cách chọn tùy chọn "New Document" trong menu "File" bằng cách sử dụng HTML trông như thế này:

```html-nolint
<p>
  To create a new file, choose the <kbd><kbd><samp>File</samp></kbd>
  ⇒<kbd><samp>New Document</samp></kbd></kbd> menu option.
</p>

<p>
  Don't forget to click the <kbd><samp>OK</samp></kbd> button to confirm once
  you've entered the name of the new file.
</p>
```

Điều này thực hiện một số lồng nhau thú vị. Để mô tả tùy chọn menu, toàn bộ đầu vào được bao bọc trong một phần tử `<kbd>`. Sau đó, bên trong đó, cả tên menu và mục menu đều được chứa trong cả `<kbd>` và `<samp>`, chỉ ra đầu vào được chọn từ một widget màn hình.

#### Kết quả

{{EmbedLiveSample("Representing_onscreen_input_options", 650, 120)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">Nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">Không có vai trò tương ứng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("code")}}
