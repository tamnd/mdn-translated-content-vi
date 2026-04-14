---
title: "<param>: Phần tử tham số Object"
slug: Web/HTML/Reference/Elements/param
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.param
sidebar: htmlsidebar
---

{{Deprecated_Header}}

Phần tử **`<param>`** trong [HTML](/vi/docs/Web/HTML) định nghĩa các tham số cho phần tử {{HTMLElement("object")}}.

> [!NOTE]
> Sử dụng phần tử {{HTMLElement("object")}} với thuộc tính [`data`](/vi/docs/Web/HTML/Reference/Elements/object#data) để đặt URL của tài nguyên bên ngoài.

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `name` {{deprecated_inline}}
  - : Tên của tham số.
- `value` {{deprecated_inline}}
  - : Chỉ định giá trị của tham số.
- `type` {{deprecated_inline}}
  - : Chỉ được sử dụng nếu `valuetype` được đặt thành `ref`. Chỉ định loại MIME của các giá trị được tìm thấy tại URI được chỉ định bởi value.
- `valuetype` {{deprecated_inline}}
  - : Chỉ định loại của thuộc tính `value`. Các giá trị có thể là:
    - `data`: Giá trị mặc định. Giá trị được truyền đến cài đặt của đối tượng dưới dạng chuỗi.
    - `ref`: Giá trị là URI đến tài nguyên nơi các giá trị thời gian chạy được lưu trữ.
    - `object`: ID của một {{HTMLElement("object")}} khác trong cùng tài liệu.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Một {{HTMLElement("object")}} trước bất kỳ
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        > nào.
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
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLParamElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("object")}}
