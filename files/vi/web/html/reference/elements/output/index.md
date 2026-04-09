---
title: "<output>: Phần tử Đầu ra"
slug: Web/HTML/Reference/Elements/output
page-type: html-element
browser-compat: html.elements.output
sidebar: htmlsidebar
---

Phần tử **`<output>`** trong [HTML](/vi/docs/Web/HTML) là một phần tử chứa mà trang web hoặc ứng dụng có thể đưa vào đó kết quả của một phép tính hoặc kết quả của một hành động người dùng.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- [`for`](/vi/docs/Web/HTML/Reference/Attributes/for)
  - : Danh sách [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id) của các phần tử khác, phân tách bằng dấu cách, cho biết rằng các phần tử đó đã đóng góp giá trị đầu vào (hoặc có ảnh hưởng khác) vào phép tính.
- [`form`](/vi/docs/Web/HTML/Reference/Attributes/form)
  - : Phần tử {{HTMLElement("form")}} để liên kết đầu ra với (chủ sở hữu biểu mẫu của nó). Giá trị của thuộc tính này phải là [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id) của một `<form>` trong cùng tài liệu. (Nếu thuộc tính này không được đặt, `<output>` sẽ được liên kết với phần tử `<form>` tổ tiên của nó, nếu có.)

    Thuộc tính này cho phép bạn liên kết các phần tử `<output>` với các `<form>` ở bất kỳ đâu trong tài liệu, không chỉ bên trong `<form>`. Nó cũng có thể ghi đè phần tử `<form>` tổ tiên. Tên và nội dung của phần tử `<output>` không được gửi khi biểu mẫu được gửi.

- `name`
  - : Tên của phần tử. Được sử dụng trong API {{domxref("HTMLFormElement.elements", "form.elements")}}.

Giá trị, tên và nội dung của `<output>` KHÔNG được gửi trong quá trình gửi biểu mẫu.

## Khả năng tiếp cận

Nhiều trình duyệt triển khai phần tử này như một vùng [`aria-live`](/vi/docs/Web/Accessibility/ARIA/Guides/Live_regions). Công nghệ hỗ trợ do đó sẽ thông báo kết quả của các tương tác UI được đăng bên trong nó mà không cần tiêu điểm phải chuyển khỏi các điều khiển tạo ra những kết quả đó.

## Ví dụ

Trong ví dụ sau, biểu mẫu cung cấp một thanh trượt có giá trị có thể thay đổi từ `0` đến `100`, và một phần tử {{HTMLElement("input")}} mà bạn có thể nhập một số thứ hai vào đó. Hai số được cộng lại với nhau, và kết quả được hiển thị trong phần tử `<output>` mỗi khi giá trị của bất kỳ điều khiển nào thay đổi.

```html
<form id="example-form">
  <input type="range" id="b" name="b" value="50" /> +
  <input type="number" id="a" name="a" value="10" /> =
  <output name="result" for="a b">60</output>
</form>
```

```js
const form = document.getElementById("example-form");
const a = form.elements["a"];
const b = form.elements["b"];
const result = form.elements["result"];

function updateResult() {
  const aValue = a.valueAsNumber;
  const bValue = b.valueAsNumber;
  result.value = aValue + bValue;
}

form.addEventListener("input", updateResult);

updateResult();
```

### Kết quả

{{ EmbedLiveSample('Examples')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#listed"
          >được liệt kê</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#labelable"
          >có thể gán nhãn</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#resettable"
          >có thể đặt lại</a
        >
        <a
          href="/vi/docs/Web/HTML/Guides/Content_categories#form-associated_content"
          >phần tử liên kết biểu mẫu</a
        >, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được bỏ qua, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role"><code>status</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLOutputElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
