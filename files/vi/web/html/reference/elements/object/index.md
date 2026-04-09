---
title: "<object>: The External Object element"
slug: Web/HTML/Reference/Elements/object
page-type: html-element
browser-compat: html.elements.object
sidebar: htmlsidebar
---

Phần tử **`<object>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một tài nguyên bên ngoài, có thể được coi là hình ảnh, ngữ cảnh duyệt web lồng nhau, hoặc tài nguyên được xử lý bởi plugin.

{{InteractiveExample("HTML Demo: &lt;object&gt;", "tabbed-standard")}}

```html interactive-example
<object
  type="video/mp4"
  data="/shared-assets/videos/flower.mp4"
  width="250"
  height="200"></object>
```

## Thuộc tính

Phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `archive` {{deprecated_inline}}
  - : Danh sách các URI cách nhau bằng dấu cách dùng cho các kho lưu trữ tài nguyên của đối tượng.
- `border` {{deprecated_inline}}
  - : Chiều rộng của đường viền xung quanh phần điều khiển, tính bằng pixel.
- `classid` {{deprecated_inline}}
  - : URI của phần triển khai đối tượng. Nó có thể được sử dụng cùng với, hoặc thay thế cho, thuộc tính **data**.
- `codebase` {{deprecated_inline}}
  - : Đường dẫn cơ sở dùng để giải quyết các URI tương đối được chỉ định bởi **classid**, **data** hoặc **archive**. Nếu không được chỉ định, mặc định là URI cơ sở của tài liệu hiện tại.
- `codetype` {{deprecated_inline}}
  - : Loại nội dung của dữ liệu được chỉ định bởi **classid**.
- `data`
  - : Địa chỉ của tài nguyên dưới dạng URL hợp lệ. Ít nhất một trong **data** và **type** phải được xác định.
- `declare` {{deprecated_inline}}
  - : Sự hiện diện của thuộc tính Boolean này làm cho phần tử này chỉ là khai báo. Đối tượng phải được khởi tạo bởi phần tử `<object>` tiếp theo. Lặp lại phần tử `<object>` đầy đủ mỗi khi tài nguyên được sử dụng lại.
- [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form)
  - : Phần tử form, nếu có, mà phần tử object được liên kết (chủ sở hữu form của nó). Giá trị của thuộc tính phải là ID của phần tử {{HTMLElement("form")}} trong cùng tài liệu.
- `height`
  - : Chiều cao của tài nguyên được hiển thị, là {{cssxref("&lt;integer&gt;")}} tính bằng {{glossary("CSS pixel", "CSS pixels")}}.
- `name`
  - : Tên của ngữ cảnh duyệt web hợp lệ (HTML5), hoặc tên của phần điều khiển (HTML 4). Tên trở thành thuộc tính của các đối tượng {{domxref("Window")}} và {{domxref("Document")}}, chứa tham chiếu đến cửa sổ nhúng hoặc chính phần tử đó.
- `standby` {{deprecated_inline}}
  - : Thông báo mà trình duyệt có thể hiển thị trong khi đang tải phần triển khai và dữ liệu của đối tượng.
- `type`
  - : [Loại nội dung](/en-US/docs/Glossary/MIME_type) của tài nguyên được chỉ định bởi **data**. Ít nhất một trong **data** và **type** phải được xác định.
- `usemap` {{deprecated_inline}}
  - : Tham chiếu tên-hash đến phần tử {{HTMLElement("map")}}; tức là '#' theo sau bởi giá trị của [`name`](/en-US/docs/Web/HTML/Reference/Elements/map#name) của phần tử map.
- `width`
  - : Chiều rộng của tài nguyên được hiển thị, là {{cssxref("&lt;integer&gt;")}} tính bằng {{glossary("CSS pixel", "CSS pixels")}}.

## Ví dụ

### Nhúng video

#### HTML

```html
<object
  type="video/webm"
  data="/shared-assets/videos/flower.webm"
  width="600"
  height="140">
  <img
    src="/shared-assets/images/examples/flowers.jpg"
    alt="Some beautiful flowers" />
</object>
```

#### Kết quả

{{EmbedLiveSample("Embed a video")}}

Nếu video trong ví dụ không tải được, người dùng sẽ được cung cấp hình ảnh như nội dung dự phòng. Thẻ {{HTMLElement("img")}} được sử dụng để hiển thị hình ảnh. Chúng ta bao gồm thuộc tính `src` được đặt thành đường dẫn đến hình ảnh muốn nhúng. Chúng ta cũng bao gồm thuộc tính `alt`, cung cấp cho hình ảnh một tên có thể tiếp cận. Nếu hình ảnh cũng không tải được, nội dung của thuộc tính `alt` sẽ được hiển thị.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>;
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>;
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#embedded_content">nội dung nhúng</a>, nội dung hữu hình; nếu phần tử có
        thuộc tính <a href="#usemap"><code>usemap</code></a>, <a href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content">nội dung tương tác</a>;
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#listed">liệt kê</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#submittable">có thể gửi</a>
        phần tử <a href="/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content">liên kết form</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Không hoặc nhiều phần tử {{HTMLElement("param")}}, sau đó
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#transparent_content_model">trong suốt</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận <a href="/en-US/docs/Web/HTML/Guides/Content_categories#embedded_content">nội dung nhúng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">Không có vai trò tương ứng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"><code>document</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role"><code>img</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLObjectElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("embed")}}
- {{HTMLElement("param")}}
