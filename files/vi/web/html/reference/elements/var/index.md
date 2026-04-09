---
title: "<var>: Phần tử Biến số"
slug: Web/HTML/Reference/Elements/var
page-type: html-element
browser-compat: html.elements.var
sidebar: htmlsidebar
---

Phần tử **`<var>`** [HTML](/en-US/docs/Web/HTML) đại diện cho tên của một biến trong biểu thức toán học hoặc ngữ cảnh lập trình. Nó thường được trình bày bằng phiên bản in nghiêng của kiểu chữ hiện tại, mặc dù hành vi đó phụ thuộc vào trình duyệt.

{{InteractiveExample("HTML Demo: &lt;var&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  The volume of a box is <var>l</var> × <var>w</var> × <var>h</var>, where
  <var>l</var> represents the length, <var>w</var> the width and
  <var>h</var> the height of the box.
</p>
```

```css interactive-example
var {
  font-weight: bold;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

### Các phần tử liên quan

Các phần tử khác được sử dụng trong các ngữ cảnh thường dùng `<var>` bao gồm:

- {{HTMLElement("code")}}: Phần tử Mã HTML
- {{HTMLElement("kbd")}}: Phần tử Đầu vào Bàn phím HTML
- {{HTMLElement("samp")}}: Phần tử Đầu ra Mẫu HTML

Nếu bạn gặp mã nguồn đang sử dụng `<var>` nhầm lẫn cho mục đích tạo kiểu thay vì mục đích ngữ nghĩa, bạn nên sử dụng {{HTMLElement("span")}} với CSS phù hợp, hoặc một phần tử ngữ nghĩa phù hợp trong các phần tử sau:

- {{HTMLElement("em")}}
- {{HTMLElement("i")}}
- {{HTMLElement("q")}}

### Kiểu dáng mặc định

Hầu hết các trình duyệt áp dụng {{cssxref("font-style")}} thành `"italic"` khi hiển thị `<var>`. Điều này có thể được ghi đè trong CSS, như sau:

```css
var {
  font-style: normal;
}
```

## Ví dụ

### Ví dụ cơ bản

Dưới đây là một ví dụ cơ bản, sử dụng `<var>` để biểu thị tên biến trong một phương trình toán học.

```html
<p>An algebraic equation: <var>x</var> = <var>y</var> + 2</p>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 650,80)}}

### Ghi đè kiểu dáng mặc định

Sử dụng CSS, bạn có thể ghi đè kiểu dáng mặc định của phần tử `<var>`. Trong ví dụ này, tên biến được hiển thị in đậm, sử dụng Courier nếu có, nếu không thì sẽ dùng phông chữ đơn cách mặc định.

#### CSS

```css
var {
  font:
    bold 15px "Courier",
    "Courier New",
    monospace;
}
```

#### HTML

```html
<p>
  The variables <var>minSpeed</var> and <var>maxSpeed</var> control the minimum
  and maximum speed of the apparatus in revolutions per minute (RPM).
</p>
```

HTML này sử dụng `<var>` để bao hai tên biến.

#### Kết quả

{{EmbedLiveSample("Overriding_the_default_style", 650, 140)}}

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
        >, nội dung có thể nhìn thấy.
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
      <th scope="row">Bỏ qua thẻ</th>
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
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
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
