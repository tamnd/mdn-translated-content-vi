---
title: "<selectedcontent>: Phần tử hiển thị tùy chọn đã chọn"
slug: Web/HTML/Reference/Elements/selectedcontent
page-type: html-element
status:
  - experimental
browser-compat: html.elements.selectedcontent
sidebar: htmlsidebar
---

{{SeeCompatTable}}

Phần tử **`<selectedcontent>`** trong [HTML](/vi/docs/Web/HTML) được sử dụng bên trong phần tử {{htmlelement("select")}} để hiển thị nội dung của {{htmlelement("option")}} hiện đang được chọn trong {{htmlelement("button")}} con đầu tiên của nó. Điều này cho phép bạn tạo kiểu cho tất cả các phần của phần tử `<select>`, được gọi là "[customizable selects](/vi/docs/Learn_web_development/Extensions/Forms/Customizable_select)".

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

## Mô tả

Bạn sử dụng phần tử `<selectedcontent>` như con duy nhất của phần tử {{htmlelement("button")}}, phần tử này phải là con đầu tiên của phần tử {{htmlelement("select")}}. Bất kỳ phần tử {{htmlelement("option")}} nào, con hợp lệ duy nhất khác của `<select>`, phải xuất hiện sau cặp `<button>` và `<selectedcontent>` lồng nhau.

```html
<select>
  <button>
    <selectedcontent></selectedcontent>
  </button>
  <option></option>
  ...
</select>
```

### Cách `<selectedcontent>` hoạt động ở phía sau

Phần tử `<selectedcontent>` chứa bản sao nội dung của {{htmlelement("option")}} hiện đang được chọn. Trình duyệt hiển thị bản sao này bằng {{domxref("Node.cloneNode", "cloneNode()")}}. Khi `<option>` được chọn thay đổi, chẳng hạn trong sự kiện [`change`](/vi/docs/Web/API/HTMLElement/change_event), nội dung của `<selectedcontent>` được thay thế bằng bản sao của `<option>` mới được chọn. Việc biết về hành vi này rất quan trọng, đặc biệt khi làm việc với nội dung động.

> [!WARNING]
> Vì trình duyệt chỉ cập nhật `<selectedcontent>` khi `<option>` được chọn thay đổi, bất kỳ sửa đổi động nào đối với nội dung của `<option>` đang được chọn sau khi `<select>` được hiển thị sẽ không được sao chép vào `<selectedcontent>`. Bạn cần phải cập nhật `<selectedcontent>` thủ công. Chú ý nếu bạn đang sử dụng bất kỳ framework JavaScript front-end phổ biến nào mà các phần tử `<option>` được cập nhật động sau lần hiển thị đầu tiên – kết quả có thể không khớp với những gì bạn mong đợi trong `<selectedcontent>`.

### Tính bất hoạt của `<selectedcontent>`

Theo mặc định, bất kỳ `<button>` nào bên trong phần tử `<select>` đều [bất hoạt (inert)](/vi/docs/Web/HTML/Reference/Global_attributes/inert). Kết quả là, tất cả nội dung bên trong button đó—bao gồm cả `<selectedcontent>`—cũng bất hoạt.
Điều này có nghĩa là người dùng không thể tương tác hoặc focus vào nội dung bên trong `<selectedcontent>`.

### Tạo kiểu nội dung của tùy chọn đã chọn bằng CSS

Bạn có thể nhắm vào nội dung của phần tử `<option>` hiện đang được chọn và tạo kiểu cho cách nó xuất hiện bên trong nút select. Tạo kiểu cho nút không ảnh hưởng đến kiểu của nội dung `<option>` đã được sao chép. Điều này cho phép bạn tùy chỉnh cách tùy chọn đã chọn xuất hiện trong nút, tách biệt với cách nó xuất hiện trong danh sách thả xuống.

Ví dụ: các phần tử `<option>` của bạn có thể chứa biểu tượng, hình ảnh, hoặc thậm chí video hiển thị đẹp trong danh sách thả xuống, nhưng có thể khiến `<button>` select tăng kích thước, trông lộn xộn và ảnh hưởng đến bố cục xung quanh. Bằng cách nhắm vào nội dung bên trong `<selectedcontent>`, bạn có thể ẩn các phần tử như hình ảnh trong nút, mà không ảnh hưởng đến cách chúng xuất hiện trong danh sách thả xuống, như được hiển thị trong đoạn mã sau:

```css
selectedcontent img {
  display: none;
}
```

> [!NOTE]
> Nếu các phần tử `<button>` và/hoặc `<selectedcontent>` không được bao gồm bên trong `<select>`, trình duyệt sẽ tạo một `<button>` ngầm định để hiển thị nội dung của `<option>` đã chọn. Nút dự phòng này không thể được nhắm đến bằng CSS sử dụng bộ chọn loại `button` hoặc `selectedcontent`.

## Ví dụ

Bạn có thể xem ví dụ đầy đủ bao gồm phần tử `<selectedcontent>` trong hướng dẫn [Customizable select elements](/vi/docs/Learn_web_development/Extensions/Forms/Customizable_select) của chúng tôi.

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
       Không có
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Phản chiếu nội dung từ {{htmlelement("option")}} đang được chọn.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Một phần tử {{htmlelement("button")}} là con đầu tiên của phần tử {{htmlelement("select")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        Không có
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        Không có
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLSelectedContentElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("select")}}
- Phần tử {{HTMLElement("option")}}
- Phần tử {{HTMLElement("optgroup")}}
- [Customizable select elements](/vi/docs/Learn_web_development/Extensions/Forms/Customizable_select)
