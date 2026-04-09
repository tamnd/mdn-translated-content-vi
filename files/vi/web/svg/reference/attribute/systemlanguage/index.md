---
title: systemLanguage
slug: Web/SVG/Reference/Attribute/systemLanguage
page-type: svg-attribute
browser-compat: svg.global_attributes.systemLanguage
sidebar: svgref
---

Thuộc tính **`systemLanguage`** biểu thị một danh sách các language tag được hỗ trợ. Danh sách này được so khớp với ngôn ngữ được xác định trong tùy chọn của người dùng.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("circle")}}
- {{SVGElement("clipPath")}}
- {{SVGElement("defs")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- {{SVGElement("g")}}
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("mask")}}
- {{SVGElement("path")}}
- {{SVGElement("pattern")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("set")}}
- {{SVGElement("svg")}}
- {{SVGElement("switch")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- {{SVGElement("use")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;language-tags></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<language-tags>`
  - : Giá trị là một tập hợp các token được phân tách bằng dấu phẩy, trong đó mỗi token phải là một {{glossary("BCP 47 language tag")}} hợp lệ.

`systemLanguage` thường được dùng kết hợp với phần tử {{SVGElement("switch")}}. Nếu thuộc tính được dùng trong các tình huống khác, thì nó thể hiện một công tắc đơn giản trên phần tử được cho để quyết định có hiển thị phần tử đó hay không.

> [!NOTE]
> Nếu trong một `<switch>` có nhiều đối tượng ngôn ngữ thay thế và không đối tượng nào khớp, điều này có thể dẫn đến tình huống không có nội dung nào được hiển thị. Vì vậy, nên bao gồm một lựa chọn "bao trùm" ở cuối `<switch>` như vậy, sao cho chấp nhận được trong mọi trường hợp.

Thuộc tính đánh giá thành "true" nếu một trong các language tag được chỉ ra bởi tùy chọn người dùng khớp không phân biệt chữ hoa chữ thường hoặc là tiền tố (theo sau bởi dấu "-") của một trong các language tag được cho trong giá trị của tham số này. Nếu không, nó đánh giá thành "false".

> [!NOTE]
> Quy tắc so khớp theo tiền tố không có nghĩa là nếu người dùng hiểu một ngôn ngữ với một tag nhất định, thì người dùng đó cũng sẽ hiểu tất cả các ngôn ngữ có tag đó làm tiền tố.

Nếu thuộc tính không có mặt, nó sẽ ngầm được đánh giá thành "true". Nếu cung cấp một chuỗi null hoặc chuỗi rỗng, thuộc tính sẽ đánh giá thành "false".

Quy tắc tiền tố cho phép dùng các tag tiền tố trong trường hợp này.

Có thể liệt kê nhiều ngôn ngữ cho nội dung được dự định cho nhiều nhóm người dùng. Ví dụ, nội dung được trình bày đồng thời bằng bản gốc Maori và bản tiếng Anh sẽ cần:

```html
<text systemLanguage="mi, en"><!-- nội dung ở đây --></text>
```

Tuy nhiên, chỉ vì có nhiều ngôn ngữ hiện diện trong đối tượng mà thuộc tính kiểm tra `systemLanguage` được đặt lên không có nghĩa là nó được dự định cho nhiều đối tượng ngôn ngữ. Một ví dụ là sách nhập môn ngôn ngữ cho người mới bắt đầu, chẳng hạn "A First Lesson in Latin", rõ ràng được dự định cho một đối tượng có khả năng đọc tiếng Anh. Trong trường hợp này, thuộc tính chỉ nên bao gồm `en`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("requiredExtensions")}}
