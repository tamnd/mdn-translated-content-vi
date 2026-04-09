---
title: autofocus
slug: Web/SVG/Reference/Attribute/autofocus
page-type: svg-attribute
browser-compat: svg.global_attributes.autofocus
sidebar: svgref
---

Thuộc tính SVG toàn cục **`autofocus`** xác định một phần tử có thể nhận focus để được focus sau khi nó được gắn vào tài liệu. Thuộc tính này không có tác dụng nếu phần tử vốn chưa thể nhận focus.

Thuộc tính `autofocus` có một thuộc tính tương ứng trong HTML: [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus). Trong tài liệu không được có nhiều hơn một phần tử mang thuộc tính `autofocus`. Nếu gán cho nhiều phần tử, phần tử đầu tiên sẽ nhận focus.

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code><a href="/en-US/docs/Glossary/Boolean/HTML">boolean attribute</a></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>(không có)</td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, vui lòng tham khảo thuộc tính [HTML `autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus).

## Vấn đề về trợ năng

Tự động focus vào một SVG có thể làm bối rối những người khiếm thị đang dùng công nghệ đọc màn hình và những người có suy giảm nhận thức. Khi autofocus được gán, trình đọc màn hình sẽ "dịch chuyển tức thời" người dùng của nó tới phần tử có thể nhận focus mà không cảnh báo trước.

Hãy cân nhắc cẩn thận về khả năng truy cập khi áp dụng thuộc tính `autofocus`. Việc tự động focus vào một phần tử có thể khiến trang cuộn khi tải. Việc focus cũng có thể làm bàn phím động xuất hiện trên một số thiết bị cảm ứng. Trong khi trình đọc màn hình sẽ thông báo {{glossary("accessible name")}} của phần tử đang nhận focus, nó sẽ không thông báo bất kỳ nội dung nào đứng trước phần tử đó, nội dung vốn có thể cung cấp thêm ngữ cảnh, và người dùng nhìn bằng mắt trên thiết bị nhỏ cũng sẽ bỏ lỡ ngữ cảnh do phần nội dung đứng trước tạo ra.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("tabindex")}}
- Thuộc tính HTML [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus)
- {{domxref("SVGElement.autofocus")}}
