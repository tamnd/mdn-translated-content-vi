---
title: Khóa học cấp tốc về namespace
slug: Web/SVG/Guides/Namespaces_crash_course
page-type: guide
sidebar: svgref
---

Là một phương ngữ [XML](/en-US/docs/Glossary/XML), [SVG](/en-US/docs/Web/SVG) có sử dụng namespace. Nếu bạn dự định tạo nội dung SVG, điều quan trọng là phải hiểu khái niệm namespace và cách chúng được dùng. Namespace là yếu tố thiết yếu đối với các user agent hỗ trợ nhiều phương ngữ XML; trình duyệt phải rất nghiêm ngặt. Dành thời gian để hiểu namespace ngay bây giờ sẽ giúp bạn tránh rắc rối sau này.

## Bối cảnh

Một mục tiêu lâu dài của các đặc tả W3C khác nhau là làm cho việc trộn nhiều loại nội dung dựa trên XML vào cùng một tệp XML hoặc HTML trở nên khả thi. Ví dụ, SVG và [MathML](/en-US/docs/Web/MathML) có thể được nhúng trực tiếp vào một tài liệu khoa học dựa trên HTML. Việc có thể trộn các loại nội dung như vậy mang lại nhiều lợi ích, nhưng nó cũng đòi hỏi phải giải quyết một vấn đề rất thực tế.

Hiển nhiên, mỗi phương ngữ XML đều định nghĩa ý nghĩa của các tên phần tử đánh dấu được mô tả trong đặc tả của nó. Vấn đề khi trộn nội dung từ các phương ngữ XML khác nhau trong cùng một tài liệu là các phần tử do một phương ngữ định nghĩa có thể trùng tên với phần tử của phương ngữ khác. Ví dụ, cả HTML và SVG đều có phần tử `<title>`. User agent phân biệt hai phần tử này như thế nào? CSS phân biệt kiểu của chúng ra sao? Thực ra, user agent làm sao biết nội dung nào là thứ nó hiểu được, thay vì chỉ là một custom element HTML vô nghĩa chưa được định nghĩa hoặc một tệp XML chứa những tên phần tử tùy ý mà nó không biết?

Trái với quan niệm phổ biến, câu trả lời cho câu hỏi này không phải là "nó có thể nhận ra từ khai báo `DOCTYPE`". DTD vốn không được thiết kế để xử lý nội dung pha trộn, và những nỗ lực trước đây nhằm tạo DTD cho nội dung pha trộn nay được xem là đã thất bại. XML, và một số phương ngữ XML (bao gồm SVG và HTML), không yêu cầu khai báo `DOCTYPE`. SVG 1.2 thậm chí còn không có nó. Việc các khai báo `DOCTYPE` (thường) khớp với nội dung trong các tệp đơn kiểu nội dung chỉ là ngẫu nhiên. DTD chỉ dùng để kiểm tra hợp lệ, không phải để xác định nội dung. Bất kỳ user agent nào xác định nội dung XML dựa trên khai báo `DOCTYPE` đều không đáng tin cậy.

Câu trả lời thực sự là nội dung XML cho user agent biết các tên phần tử thuộc về phương ngữ nào bằng cách cung cấp các "khai báo namespace" rõ ràng.

## Khai báo namespace

Vậy các khai báo namespace trông như thế nào, và chúng được đặt ở đâu? Sau đây là một ví dụ ngắn.

```svg
<svg xmlns="http://www.w3.org/2000/svg">
  <!-- more tags here -->
</svg>
```

Khai báo namespace được cung cấp bởi tham số `xmlns`. Tham số này cho biết phần tử `<svg>` và các phần tử con của nó thuộc về phương ngữ XML nào có tên namespace là `http://www.w3.org/2000/svg`, tất nhiên chính là SVG. Lưu ý rằng khai báo namespace chỉ được cung cấp một lần trên phần tử gốc (và được ngầm hiểu nếu bỏ qua). Khai báo này xác định namespace _mặc định_, vì vậy user agent biết rằng tất cả các phần tử con của `<svg>` cũng thuộc về cùng namespace đó. User agent sẽ kiểm tra xem nó có nhận ra tên namespace hay không để xác định liệu nó có biết cách xử lý phần đánh dấu đó hay không.

Lưu ý rằng tên namespace chỉ là các chuỗi, nên việc tên namespace của SVG cũng giống một URI không có ý nghĩa gì đặc biệt. URI thường được dùng vì chúng là duy nhất, nhưng mục đích không phải là để "liên kết" đến đâu đó. (Thực tế, URI được dùng thường xuyên đến mức người ta hay dùng thuật ngữ "namespace URI" thay vì "namespace name".)

### Khai báo lại namespace mặc định

Nếu tất cả phần tử con của phần tử gốc cũng được định nghĩa là nằm trong namespace mặc định, thì làm sao trộn thêm nội dung từ namespace khác? Để đưa namespace SVG vào HTML, bạn chèn `<svg>`. Trong XML, bạn khai báo một namespace. Sau đây là một ví dụ ngắn.

```xml
<report xmlns="https://www.acme.org/reports">
  <title>Some stats</title>
  <summary>...</summary>
  <statTable xmlns="https://www.acme.org/tables">
    <content>...</content>
    <!-- redeclaring root's default namespace -->
    <summary xmlns="https://www.acme.org/reports">...</summary>
  </statTable>
</report>
```

Trong ví dụ này, thuộc tính `xmlns` trên phần tử gốc `<report>` khai báo namespace mặc định là `https://www.acme.org/reports`, hay `reports`. Kết quả là nó và tất cả phần tử con của nó được user agent diễn giải là thuộc về `reports`, ngoại trừ phần tử `<content>`, phần tử này tồn tại trong namespace `https://www.acme.org/tables`, hay `tables`. Phần tử `<summary>` có tham số `xmlns` riêng, và bằng cách khai báo lại namespace `reports`, nó cho user agent biết rằng phần tử `<summary>` và các phần tử con của nó (trừ khi chúng cũng khai báo lại một namespace khác) thuộc về `reports`.

Với HTML, `http://www.w3.org/1999/xhtml` là namespace ngầm định. Với SVG, đó là `http://www.w3.org/2000/svg`. MathML là `http://www.w3.org/1998/Math/MathML`.

### Khai báo tiền tố namespace

Không chỉ các phương ngữ XML định nghĩa phần tử riêng của chúng, mà chúng còn khai báo các tham số riêng.

Mặc định, các tham số không có namespace nào cả. Chúng chỉ được xem là duy nhất vì chúng xuất hiện trên một phần tử vốn tự nó có tên duy nhất. Tuy nhiên, đôi khi cần định nghĩa các tham số sao cho chúng có thể được dùng lại trên nhiều phần tử khác nhau nhưng vẫn được xem là cùng một tham số, độc lập với phần tử mà chúng được dùng cùng. Một ví dụ rất điển hình là tham số `href` được định nghĩa bởi đặc tả {{glossary("XLink")}}. Tham số này thường được các phương ngữ XML khác dùng như một cách để liên kết đến tài nguyên bên ngoài. Nhưng làm sao bạn cho user agent biết tham số này thuộc về phương ngữ nào, trong trường hợp này là `XLink`? Hãy xem ví dụ sau.

```xml
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <script xlink:href="cool-script.js" type="text/javascript" />
</svg>
```

Ví dụ này có tham số trông khá lạ là `xmlns:xlink`. Như bạn có thể đoán từ phần `xmlns` đầu tiên, đây cũng là một khai báo namespace khác. Tuy nhiên, thay vì thiết lập namespace mặc định, khai báo namespace này thiết lập namespace cho một thứ gọi là "[tiền tố namespace](/en-US/docs/Web/API/CSSNamespaceRule/prefix)". Trong trường hợp này, chúng ta chọn dùng tiền tố `xlink` (phần thứ hai) vì tiền tố này sẽ được dùng để cho user agent biết về các thuộc tính thuộc về `XLink`.

Đúng như tên gọi của chúng, tiền tố namespace được dùng để đặt tiền tố cho tên tham số và phần tử. Việc này được thực hiện bằng cách đặt tiền tố namespace và dấu hai chấm trước tên tham số như trong phần tử `<script>` ở ví dụ trên. Điều này cho user agent biết rằng tham số cụ thể đó thuộc về namespace được gán cho tiền tố namespace (`XLink`), và là một tham số có thể được dùng với cùng ý nghĩa trên các phần tử khác.

Lưu ý rằng, trong XML, việc dùng một tiền tố chưa được liên kết với tên namespace là một lỗi XML. Việc liên kết được tạo bởi tham số `xmlns:xlink` trong ví dụ trên là cần thiết để tham số `xlink:href` không gây lỗi. Tham số XLink này cũng thường được dùng trong SVG trên các phần tử `<a>`, `<use>` và `<image>` cùng nhiều phần tử khác, vì vậy tốt nhất là luôn đưa khai báo XLink vào tài liệu của bạn.

Nhân tiện, cũng hữu ích khi biết rằng tiền tố namespace còn có thể dùng cho tên phần tử. Điều này cho user agent biết rằng phần tử cụ thể đó (nhưng lần này không bao gồm các phần tử con của nó!) thuộc về namespace được gán cho tiền tố. Biết điều này sẽ giúp bạn tránh nhầm lẫn nếu gặp phần đánh dấu như ví dụ sau:

```xml
<html
  lang="en"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:svg="http://www.w3.org/2000/svg">
  <body>
    <h1>SVG embedded inline in XHTML</h1>
    <svg:svg width="300px" height="200px">
      <svg:circle cx="150" cy="100" r="50" fill="red" />
    </svg:svg>
  </body>
</html>
```

> [!NOTE]
> Đây là một tệp {{Glossary("XHTML")}}, không phải tệp HTML. XML namespace không hợp lệ trong HTML. Để thử ví dụ này, bạn phải lưu tệp với đuôi `.xhtml`.

Lưu ý rằng vì tiền tố namespace được dùng cho phần tử `<svg:svg>` và phần tử con `<svg:circle>`, nên không cần khai báo lại namespace mặc định. Nói chung, tốt hơn là khai báo lại namespace mặc định thay vì gắn tiền tố cho nhiều phần tử theo cách này.

## Viết script trong XML có namespace

Namespace ảnh hưởng đến phần đánh dấu và cả script ([và thậm chí cả CSS](/en-US/docs/Web/CSS/Guides/Namespaces)). Nếu bạn viết script cho XML có namespace như SVG, hãy đọc tiếp.

Khuyến nghị [DOM Level 1](https://www.w3.org/TR/DOM-Level-1/) được tạo ra trước khi đặc tả [Namespaces in XML](https://www.w3.org/TR/xml-names/) gốc được công bố; vì vậy DOM1 không nhận biết namespace. Điều này gây ra vấn đề cho XML có namespace như SVG. Để giải quyết các vấn đề này, [DOM Level 2 Core](https://www.w3.org/TR/DOM-Level-2-Core/) đã bổ sung các tương đương có nhận biết namespace cho tất cả các phương thức DOM Level 1 áp dụng được. Khi viết script cho SVG, điều quan trọng là phải dùng [các phương thức có nhận biết namespace](https://www.w3.org/TR/DOM-Level-2-Core/core.html#Namespaces-Considerations). Bảng dưới đây liệt kê các phương thức DOM1 không nên dùng trong SVG, cùng với các phương thức DOM2 tương đương nên dùng thay thế.

<table class="fullwidth-table">
  <tbody>
    <tr>
      <th>DOM1 (không dùng)</th>
      <th>DOM2 (hãy dùng các phương thức này thay thế!)</th>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Document/createAttribute"
          ><code>createAttribute()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/Document/createAttributeNS"><code>createAttributeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Document/createElement"
          ><code>createElement()</code></a
        >
      </td>
      <td>
        <a href="/en-US/docs/Web/API/Document/createElementNS"><code>createElementNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/getAttributeNode"
          ><code>getAttributeNode()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/getAttributeNodeNS"><code>getAttributeNodeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/getAttribute"
          ><code>getAttribute()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/getAttributeNS"><code>getAttributeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Document/getElementsByTagName"
          ><code>getElementsByTagName()</code></a
        >
      </td>
      <td>
        <a href="/en-US/docs/Web/API/Document/getElementsByTagNameNS"><code>getElementsByTagNameNS()</code></a
        >
        (cũng được <a href="/en-US/docs/Web/API/Element/getElementsByTagNameNS">thêm vào Element</a>)
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/NamedNodeMap/getNamedItem"
          ><code>getNamedItem()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/NamedNodeMap/getNamedItemNS"><code>getNamedItemNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a href="/en-US/docs/Web/API/Element/hasAttribute"><code>hasAttribute()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/hasAttributeNS"><code>hasAttributeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/removeAttribute"
          ><code>removeAttribute()</code></a
        >
      </td>
      <td>
        <a href="/en-US/docs/Web/API/Element/removeAttributeNS"><code>removeAttributeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/NamedNodeMap/removeNamedItem"
          ><code>removeNamedItem()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/NamedNodeMap/removeNamedItemNS"><code>removeNamedItemNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/setAttribute"
          ><code>setAttribute()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/setAttributeNS"><code>setAttributeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/setAttributeNode"
          ><code>setAttributeNode()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/Element/setAttributeNodeNS"><code>setAttributeNodeNS()</code></a
        >
      </td>
    </tr>
    <tr>
      <td>
        <a
          href="/en-US/docs/Web/API/NamedNodeMap/setNamedItem"
          ><code>setNamedItem()</code></a
        >
      </td>
      <td>
        <a
          href="/en-US/docs/Web/API/NamedNodeMap/setNamedItemNS"><code>setNamedItemNS()</code></a
        >
      </td>
    </tr>
  </tbody>
</table>
