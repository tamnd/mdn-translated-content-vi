---
title: text-anchor
slug: Web/SVG/Reference/Attribute/text-anchor
page-type: svg-attribute
browser-compat: svg.global_attributes.text-anchor
sidebar: svgref
---

Thuộc tính **`text-anchor`** được dùng để căn chỉnh một chuỗi văn bản đã được định dạng sẵn hoặc văn bản tự xuống dòng, trong đó vùng ngắt dòng được xác định từ thuộc tính {{cssxref("inline-size")}} tương đối với một điểm cho trước.

Thuộc tính này không áp dụng cho các kiểu văn bản tự xuống dòng khác. Với các trường hợp đó, bạn nên dùng {{cssxref("text-align")}}. Với văn bản nhiều dòng, việc căn chỉnh diễn ra cho từng dòng.

Thuộc tính `text-anchor` được áp dụng cho từng text chunk riêng lẻ bên trong một phần tử {{SVGElement("text")}} nhất định. Mỗi text chunk có một vị trí văn bản hiện tại ban đầu, biểu thị điểm trong hệ tọa độ người dùng thu được từ (tùy ngữ cảnh) việc áp dụng các thuộc tính {{SVGAttr("x")}} và {{SVGAttr("y")}} trên phần tử `<text>`, bất kỳ giá trị thuộc tính `x` hoặc `y` nào trên phần tử {{SVGElement("tspan")}} được gán rõ ràng cho ký tự hiển thị đầu tiên trong một text chunk, hoặc việc xác định vị trí văn bản hiện tại ban đầu cho phần tử {{SVGElement("textPath")}}.

> [!NOTE]
> Là một thuộc tính trình bày, `text-anchor` cũng có một thuộc tính CSS tương ứng: {{cssxref("text-anchor")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiển thị các điểm neo -->
  <path
    d="M60,15 L60,110 M30,40 L90,40 M30,75 L90,75 M30,110 L90,110"
    stroke="grey" />

  <!-- Các điểm neo đang hoạt động -->
  <text text-anchor="start" x="60" y="40">A</text>
  <text text-anchor="middle" x="60" y="75">A</text>
  <text text-anchor="end" x="60" y="110">A</text>

  <!-- Hiển thị các điểm neo -->
  <circle cx="60" cy="40" r="3" fill="red" />
  <circle cx="60" cy="75" r="3" fill="red" />
  <circle cx="60" cy="110" r="3" fill="red" />

  <style>
    <![CDATA[
      text {
        font: bold 36px Verdana, Helvetica, Arial, sans-serif;
      }
      ]]>
  </style>
</svg>
```

{{EmbedLiveSample("Example", "120", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>start</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>start</code> | <code>middle</code> | <code>end</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `start`
  - : Các ký tự được hiển thị được căn sao cho đầu của chuỗi văn bản nằm tại vị trí văn bản hiện tại ban đầu. Với một phần tử có giá trị thuộc tính {{cssxref("direction")}} là `ltr` (điển hình cho hầu hết ngôn ngữ châu Âu), phía trái của văn bản được hiển thị tại vị trí văn bản ban đầu. Với một phần tử có giá trị thuộc tính direction là `rtl` (điển hình cho tiếng Ả Rập và tiếng Do Thái), phía phải của văn bản được hiển thị tại vị trí văn bản ban đầu. Với một phần tử có hướng văn bản chính theo chiều dọc (thường gặp với văn bản châu Á), phía trên của văn bản được hiển thị tại vị trí văn bản ban đầu.
- `middle`
  - : Các ký tự được hiển thị được căn sao cho điểm giữa của chuỗi văn bản nằm tại vị trí văn bản hiện tại. (Với văn bản trên một path, về mặt khái niệm chuỗi văn bản trước tiên được bố trí theo một đường thẳng. Điểm giữa giữa đầu và cuối chuỗi văn bản được xác định. Sau đó chuỗi văn bản được ánh xạ lên path với điểm giữa này đặt tại vị trí văn bản hiện tại.)
- `end`
  - : Các ký tự được hiển thị được dịch chuyển sao cho phần cuối của văn bản hiển thị kết quả (vị trí văn bản hiện tại cuối cùng trước khi áp dụng thuộc tính `text-anchor`) nằm tại vị trí văn bản hiện tại ban đầu. Với một phần tử có giá trị thuộc tính `direction` là `ltr` (điển hình cho hầu hết ngôn ngữ châu Âu), phía phải của văn bản được hiển thị tại vị trí văn bản ban đầu. Với một phần tử có giá trị thuộc tính `direction` là `rtl` (điển hình cho tiếng Ả Rập và tiếng Do Thái), phía trái của văn bản được hiển thị tại vị trí văn bản ban đầu. Với một phần tử có hướng văn bản chính theo chiều dọc (thường gặp với văn bản châu Á), phía dưới của văn bản được hiển thị tại vị trí văn bản ban đầu.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{SVGElement("text")}}
- Thuộc tính CSS {{cssxref('text-anchor')}}
