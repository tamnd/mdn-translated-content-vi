---
title: "<area>: Phần tử vùng Image Map"
slug: Web/HTML/Reference/Elements/area
page-type: html-element
browser-compat: html.elements.area
sidebar: htmlsidebar
---

Phần tử **`<area>`** trong [HTML](/en-US/docs/Web/HTML) định nghĩa một vùng bên trong image map có các vùng có thể nhấp được xác định trước. Một _image map_ cho phép các vùng hình học trên ảnh được liên kết với {{Glossary("Hyperlink", "liên kết siêu văn bản")}}.

Phần tử này chỉ được sử dụng bên trong phần tử {{HTMLElement("map")}}.

{{InteractiveExample("HTML Demo: &lt;area&gt;", "tabbed-taller")}}

```html interactive-example
<map name="infographic">
  <area
    shape="poly"
    coords="129,0,260,95,129,138"
    href="https://developer.mozilla.org/docs/Web/HTTP"
    alt="HTTP" />
  <area
    shape="poly"
    coords="260,96,209,249,130,138"
    href="https://developer.mozilla.org/docs/Web/HTML"
    alt="HTML" />
  <area
    shape="poly"
    coords="209,249,49,249,130,139"
    href="https://developer.mozilla.org/docs/Web/JavaScript"
    alt="JavaScript" />
  <area
    shape="poly"
    coords="48,249,0,96,129,138"
    href="https://developer.mozilla.org/docs/Web/API"
    alt="Web APIs" />
  <area
    shape="poly"
    coords="0,95,128,0,128,137"
    href="https://developer.mozilla.org/docs/Web/CSS"
    alt="CSS" />
</map>
<img
  usemap="#infographic"
  src="/shared-assets/images/examples/mdn-info.png"
  alt="MDN infographic" />
```

```css interactive-example
img {
  display: block;
  margin: 0 auto;
  width: 260px;
  height: 260px;
}
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `alt`
  - : Chuỗi văn bản thay thế để hiển thị trên các trình duyệt không hiển thị hình ảnh.
    Văn bản nên được diễn đạt sao cho cung cấp cho người dùng cùng loại lựa chọn như hình ảnh sẽ cung cấp khi được hiển thị mà không có văn bản thay thế.
    Thuộc tính này chỉ bắt buộc nếu thuộc tính [`href`](#href) được sử dụng.
- `coords`
  - : Thuộc tính `coords` mô tả chi tiết tọa độ của thuộc tính [`shape`](#shape) về kích thước, hình dạng và vị trí của `<area>`.
    Thuộc tính này không được dùng nếu `shape` được đặt thành `default`.
    - `rect`: giá trị là `x1,y1,x2,y2`.
      Giá trị chỉ định tọa độ của góc trên bên trái và góc dưới bên phải của hình chữ nhật.
      Ví dụ: trong `<area shape="rect" coords="0,0,253,27" href="#" target="_blank" alt="Mozilla">` tọa độ là `0,0` và `253,27`, lần lượt chỉ ra các góc trên bên trái và dưới bên phải của hình chữ nhật.
    - `circle`: giá trị là `x,y,radius`. Giá trị chỉ định tọa độ tâm hình tròn và bán kính.
      Ví dụ: `<area shape="circle" coords="130,136,60" href="#" target="_blank" alt="MDN">`
    - `poly`: giá trị là `x1,y1,x2,y2,..,xn,yn`. Giá trị chỉ định tọa độ các cạnh của đa giác.
      Nếu cặp tọa độ đầu và cuối không giống nhau, trình duyệt sẽ thêm cặp tọa độ cuối để đóng đa giác

    Các giá trị là số pixel CSS. [Trình tạo hình dạng](/en-US/docs/Web/CSS/Guides/Shapes/Shape_generator) của chúng tôi có thể giúp bạn tạo cú pháp `coords` bằng cách chọn các điểm trên ảnh bạn tải lên.

- `download`
  - : Thuộc tính này, nếu có, cho biết tài nguyên được liên kết có ý định được tải xuống thay vì hiển thị trong trình duyệt.
    Xem {{HTMLElement("a")}} để biết mô tả đầy đủ về thuộc tính [`download`](/en-US/docs/Web/HTML/Reference/Elements/a#download).
- `href`
  - : Đích liên kết siêu văn bản của vùng.
    Giá trị của nó là một URL hợp lệ.
    Thuộc tính này có thể bị bỏ qua; nếu vậy, phần tử `<area>` không đại diện cho một liên kết siêu văn bản.
- `interestfor` {{experimental_inline}} {{non-standard_inline}}
  - : Định nghĩa phần tử `<area>` là **invoker quan tâm**. Giá trị của nó là `id` của phần tử đích, phần tử này sẽ bị ảnh hưởng theo một cách nào đó (thường là hiển thị hoặc ẩn) khi sự quan tâm được hiển thị hoặc mất đi trên phần tử invoker (ví dụ, bằng cách di chuột vào/ra hoặc lấy/mất tiêu điểm). Xem [Sử dụng interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) để biết thêm chi tiết và ví dụ.
- `ping`
  - : Chứa danh sách URL cách nhau bởi khoảng trắng, khi theo liên kết siêu văn bản, các yêu cầu {{HTTPMethod("POST")}} với nội dung `PING` sẽ được gửi bởi trình duyệt (ở chế độ nền).
    Thường được dùng để theo dõi.
- `referrerpolicy`
  - : Chuỗi chỉ ra referrer nào sẽ dùng khi tải tài nguyên:
    - `no-referrer`: Header {{HTTPHeader("Referer")}} sẽ không được gửi.
    - `no-referrer-when-downgrade`: Header {{HTTPHeader("Referer")}} sẽ không được gửi đến {{Glossary("origin")}} không có {{Glossary("TLS")}} ({{Glossary("HTTPS")}}).
    - `origin`: Referrer được gửi sẽ bị giới hạn ở origin của trang tham chiếu: [scheme](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL), {{Glossary("host")}}, và {{Glossary("port")}}.
    - `origin-when-cross-origin`: Referrer gửi đến các origin khác sẽ bị giới hạn ở scheme, host và port. Điều hướng trên cùng một origin vẫn bao gồm path.
    - `same-origin`: Referrer sẽ được gửi cho {{Glossary("Same-origin policy", "cùng origin")}}, nhưng các yêu cầu cross-origin sẽ không chứa thông tin referrer.
    - `strict-origin`: Chỉ gửi origin của tài liệu làm referrer khi mức bảo mật giao thức vẫn giữ nguyên (HTTPS→HTTPS), nhưng không gửi đến đích kém an toàn hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin` (mặc định): Gửi URL đầy đủ khi thực hiện yêu cầu cùng origin, chỉ gửi origin khi mức bảo mật giao thức vẫn giữ nguyên (HTTPS→HTTPS), và không gửi header đến đích kém an toàn hơn (HTTPS→HTTP).
    - `unsafe-url`: Referrer sẽ bao gồm origin _và_ path (nhưng không bao gồm [fragment](/en-US/docs/Web/API/HTMLAnchorElement/hash), [password](/en-US/docs/Web/API/HTMLAnchorElement/password), hoặc [username](/en-US/docs/Web/API/HTMLAnchorElement/username)).
      **Giá trị này không an toàn**, vì nó tiết lộ origin và path từ các tài nguyên được bảo vệ bởi TLS đến các origin không an toàn.

- [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel)
  - : Đối với các anchor chứa thuộc tính [`href`](#href), thuộc tính này chỉ định mối quan hệ của đối tượng đích với đối tượng liên kết.
    Giá trị là danh sách các loại liên kết cách nhau bởi khoảng trắng.
    Các giá trị và ngữ nghĩa của chúng sẽ được đăng ký bởi một số cơ quan có thể có ý nghĩa với tác giả tài liệu.
    Mối quan hệ mặc định, nếu không có mối quan hệ nào khác được đưa ra, là rỗng. Chỉ sử dụng thuộc tính này nếu thuộc tính [`href`](#href) có mặt.
- `shape`
  - : Hình dạng của vùng nóng liên quan. Các đặc tả HTML định nghĩa các giá trị `rect`, định nghĩa vùng hình chữ nhật; `circle`, định nghĩa vùng hình tròn; `poly`, định nghĩa đa giác; và `default`, chỉ ra toàn bộ vùng ngoài các hình dạng đã định nghĩa.
- `target`
  - : Từ khóa hoặc tên do tác giả định nghĩa của {{Glossary("browsing context")}} để hiển thị tài nguyên được liên kết.
    Các từ khóa sau có ý nghĩa đặc biệt:
    - `_self` (mặc định): Hiển thị tài nguyên trong browsing context hiện tại.
    - `_blank`: Hiển thị tài nguyên trong một browsing context mới, chưa được đặt tên.
    - `_parent`: Hiển thị tài nguyên trong browsing context cha của trang hiện tại, nếu trang hiện tại nằm trong một frame.
      Nếu không có cha, hoạt động giống như `_self`.
    - `_top`: Hiển thị tài nguyên trong browsing context trên cùng (browsing context là tổ tiên của trang hiện tại và không có cha).
      Nếu không có cha, hoạt động giống như `_self`.

    Chỉ sử dụng thuộc tính này nếu thuộc tính [`href`](#href) có mặt.

    > [!NOTE]
    > Đặt `target="_blank"` trên các phần tử `<area>` ngầm cung cấp cùng hành vi `rel` như đặt [`rel="noopener"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) không đặt `window.opener`. Xem [tương thích trình duyệt](#browser_compatibility) để biết trạng thái hỗ trợ.

## Ví dụ

### Ảnh với các vùng có thể nhấp

```html
<map name="primary">
  <area
    shape="circle"
    coords="75,75,75"
    href="left.html"
    alt="Click to go Left" />
  <area
    shape="circle"
    coords="275,75,75"
    href="right.html"
    alt="Click to go Right" />
</map>
<img
  usemap="#primary"
  src="https://dummyimage.com/350x150"
  alt="350 x 150 pic" />
```

{{ EmbedLiveSample('Image with clickable areas', 360, 160) }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>. Phần tử <code>&#x3C;area></code> phải có tổ tiên là {{HTMLElement("map")}}, nhưng không nhất thiết phải là cha trực tiếp.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role"><code>link</code></a> khi thuộc tính <a href="#href"><code>href</code></a> có mặt, ngược lại là
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"><code>generic</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLAreaElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
