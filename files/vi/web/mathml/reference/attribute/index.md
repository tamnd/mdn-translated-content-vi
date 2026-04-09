---
title: Các thuộc tính MathML
short-title: Attributes
slug: Web/MathML/Reference/Attribute
page-type: landing-page
sidebar: mathmlref
---

Đây là danh sách các thuộc tính MathML theo thứ tự bảng chữ cái. Chi tiết hơn cho từng thuộc tính có trên các [trang phần tử MathML](/en-US/docs/Web/MathML/Reference/Element) liên quan và trên [trang thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes). Trang [giá trị](/en-US/docs/Web/MathML/Reference/Values) cũng mô tả một số ghi chú về các giá trị thông dụng được dùng bởi các thuộc tính MathML.

> [!NOTE]
> Như đã giải thích trên trang chính [MathML](/en-US/docs/Web/MathML), MDN dùng [MathML Core](https://w3c.github.io/mathml-core/) làm đặc tả tham chiếu. Tuy nhiên, các tính năng cũ vẫn được một số trình duyệt triển khai cũng được ghi tài liệu. Bạn có thể tìm thấy thêm chi tiết về các tính năng này và các tính năng khác trong [MathML 4](https://w3c.github.io/mathml/).

<table class="standard-table">
  <thead>
    <tr>
      <th>Tên</th>
      <th>Phần tử chấp nhận thuộc tính</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>accent</code></td>
      <td>{{ MathMLElement("mo") }}</td>
      <td>
        Một <a href="/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types"><code>&lt;boolean&gt;</code></a> cho biết toán tử có nên được xử lý như một dấu nhấn khi dùng làm chỉ số dưới hoặc chỉ số trên hay không.
      </td>
    </tr>
    <tr>
      <td><code>accent</code></td>
      <td>{{ MathMLElement("mover") }}, {{ MathMLElement("munderover") }}</td>
      <td>
        Một <a href="/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types"><code>&lt;boolean&gt;</code></a> cho biết phần chỉ số dưới có nên được xử lý như một dấu nhấn hay không.
      </td>
    </tr>
    <tr>
      <td><code>accentunder</code></td>
      <td>{{ MathMLElement("munder") }}, {{ MathMLElement("munderover") }}</td>
      <td>
        Một <a href="/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types"><code>&lt;boolean&gt;</code></a> cho biết phần chỉ số trên có nên được xử lý như một dấu nhấn hay không.
      </td>
    </tr>
    <tr>
      <td><code>actiontype</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("maction") }}</td>
      <td>Giá trị chuỗi chỉ định hành động diễn ra cho phần tử này.</td>
    </tr>
    <tr>
      <td><code>align</code></td>
      <td>{{ MathMLElement("mtable") }}</td>
      <td>Chỉ định căn chỉnh dọc của bảng so với môi trường bao quanh.</td>
    </tr>
    <tr>
      <td><code>background</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mstyle") }}</td>
      <td>
        Hãy dùng CSS <a href="/en-US/docs/Web/CSS/Reference/Properties/background-color"><code>background-color</code></a> thay thế.
      </td>
    </tr>
    <tr>
      <td><code>close</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mfenced") }}</td>
      <td>Một chuỗi cho dấu phân cách đóng.</td>
    </tr>
    <tr>
      <td><code>color</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mstyle") }}</td>
      <td>
        Hãy dùng CSS <a href="/en-US/docs/Web/CSS/Reference/Properties/color"><code>color</code></a> thay thế.
      </td>
    </tr>
    <tr>
      <td><code>columnalign</code></td>
      <td>{{ MathMLElement("mtable") }}, {{ MathMLElement("mtd") }}, {{ MathMLElement("mtr") }}</td>
      <td>Chỉ định căn chỉnh ngang của các ô bảng.</td>
    </tr>
    <tr>
      <td><code>columnlines</code></td>
      <td>{{ MathMLElement("mtable") }}</td>
      <td>Chỉ định đường viền cột của bảng.</td>
    </tr>
    <tr>
      <td><code>columnspacing</code></td>
      <td>{{ MathMLElement("mtable") }}</td>
      <td>Chỉ định khoảng cách giữa các cột của bảng.</td>
    </tr>
    <tr>
      <td><code>columnspan</code></td>
      <td>{{ MathMLElement("mtd") }}</td>
      <td>Một số nguyên không âm cho biết ô trải qua bao nhiêu cột của bảng.</td>
    </tr>
    <tr>
      <td><code>denomalign</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mfrac") }}</td>
      <td>Căn chỉnh của mẫu số bên dưới phân số.</td>
    </tr>
    <tr>
      <td><code>depth</code></td>
      <td>{{ MathMLElement("mpadded") }}</td>
      <td>Một {{cssxref("length-percentage")}} cho biết độ sâu mong muốn (bên dưới baseline).</td>
    </tr>
    <tr>
      <td><code>dir</code></td>
      <td><a href="/en-US/docs/Web/MathML/Reference/Global_attributes">Tất cả phần tử MathML</a></td>
      <td>Hướng văn bản. Các giá trị có thể là <code>ltr</code> hoặc <code>rtl</code>.</td>
    </tr>
    <tr>
      <td><code>display</code></td>
      <td>{{ MathMLElement("math") }}</td>
      <td>Chỉ định chế độ hiển thị. Các giá trị <code>block</code> và <code>inline</code> được cho phép.</td>
    </tr>
    <tr>
      <td><code>displaystyle</code></td>
      <td><a href="/en-US/docs/Web/MathML/Reference/Global_attributes">Tất cả phần tử MathML</a></td>
      <td>
        <p>Một <a href="/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types"><code>&lt;boolean&gt;</code></a> chỉ định có đặt <a href="/en-US/docs/Web/CSS/Reference/Properties/math-style">math-style</a> thành <code>normal</code> hay <code>compact</code>.</p>
      </td>
    </tr>
    <tr>
      <td><code>fence</code></td>
      <td>{{ MathMLElement("mo") }}</td>
      <td>Một <a href="/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types"><code>&lt;boolean&gt;</code></a> cho biết toán tử có phải là dấu bao hay không. Thuộc tính này không có tác động trực quan.</td>
    </tr>
    <tr>
      <td><code>fontfamily</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mstyle") }}</td>
      <td>
        Hãy dùng CSS <a href="/en-US/docs/Web/CSS/Reference/Properties/font-family"><code>font-family</code></a> thay thế.
      </td>
    </tr>
    <tr>
      <td><code>fontsize</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mstyle") }}</td>
      <td>
        Hãy dùng CSS <a href="/en-US/docs/Web/CSS/Reference/Properties/font-size"><code>font-size</code></a> thay thế.
      </td>
    </tr>
    <tr>
      <td><code>fontstyle</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mstyle") }}</td>
      <td>
        Hãy dùng CSS <a href="/en-US/docs/Web/CSS/Reference/Properties/font-style"><code>font-style</code></a> thay thế.
      </td>
    </tr>
    <tr>
      <td><code>fontweight</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("mstyle") }}</td>
      <td>
        Hãy dùng CSS <a href="/en-US/docs/Web/CSS/Reference/Properties/font-weight"><code>font-weight</code></a> thay thế.
      </td>
    </tr>
    <tr>
      <td><code>frame</code></td>
      <td>{{ MathMLElement("mtable") }}</td>
      <td>Chỉ định đường viền của toàn bộ {{ MathMLElement("mtable") }}. Giá trị có thể là <code>none</code> (mặc định), <code>solid</code> và <code>dashed</code>.</td>
    </tr>
    <tr>
      <td><code>framespacing</code></td>
      <td>{{ MathMLElement("mtable") }}</td>
      <td>Chỉ định khoảng trống bổ sung giữa bảng và <code>frame</code>.</td>
    </tr>
    <tr>
      <td><code>height</code></td>
      <td>{{ MathMLElement("mpadded") }}, {{ MathMLElement("mspace") }}</td>
      <td>Một {{cssxref("length-percentage")}} cho biết chiều cao mong muốn (phía trên baseline).</td>
    </tr>
    <tr>
      <td><code>href</code></td>
      <td><a href="/en-US/docs/Web/MathML/Reference/Global_attributes">Tất cả phần tử MathML</a></td>
      <td>Dùng để đặt siêu liên kết tới một URI được chỉ định.</td>
    </tr>
    <tr>
      <td><code>id</code></td>
      <td><a href="/en-US/docs/Web/MathML/Reference/Global_attributes">Tất cả phần tử MathML</a></td>
      <td>Thiết lập một mã định danh duy nhất gắn với phần tử.</td>
    </tr>
    <tr>
      <td><code>linethickness</code></td>
      <td>{{ MathMLElement("mfrac") }}</td>
      <td>Một {{cssxref("length-percentage")}} cho biết độ dày của đường phân số ngang.</td>
    </tr>
    <tr>
      <td><code>lspace</code></td>
      <td>{{ MathMLElement("mo") }}</td>
      <td>Một {{cssxref("length-percentage")}} cho biết lượng khoảng trắng trước toán tử.</td>
    </tr>
    <tr>
      <td><code>lspace</code></td>
      <td>{{ MathMLElement("mpadded") }}</td>
      <td>Một {{cssxref("length-percentage")}} cho biết vị trí ngang của điểm định vị của nội dung con so với điểm định vị của phần tử.</td>
    </tr>
    <tr>
      <td><code>lquote</code> {{deprecated_inline}}</td>
      <td>{{ MathMLElement("ms") }}</td>
      <td>Dấu ngoặc mở để bao quanh nội dung. Giá trị mặc định là <code>&amp;quot;</code>.</td>
    </tr>
    <tr>
      <td><code>mathbackground</code></td>
      <td><a href="/en-US/docs/Web/MathML/Reference/Global_attributes">Tất cả phần tử MathML</a></td>
      <td>Một <a href="/en-US/docs/Web/CSS/Reference/Properties/background-color">background-color</a> cho phần tử.</td>
    </tr>
  </tbody>
</table>
