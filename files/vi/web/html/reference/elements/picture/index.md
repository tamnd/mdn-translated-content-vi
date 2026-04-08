---
title: "<picture>: Phần tử Picture"
slug: Web/HTML/Reference/Elements/picture
page-type: html-element
browser-compat: html.elements.picture
sidebar: htmlsidebar
---

Phần tử **`<picture>`** [HTML](/en-US/docs/Web/HTML) chứa không hoặc nhiều phần tử {{HTMLElement("source")}} và một phần tử {{HTMLElement("img")}} để cung cấp các phiên bản hình ảnh thay thế cho các kịch bản hiển thị/thiết bị khác nhau.

Trình duyệt sẽ xem xét từng phần tử con `<source>` và chọn phần tử phù hợp nhất trong số chúng. Nếu không tìm thấy kết quả phù hợp — hoặc trình duyệt không hỗ trợ phần tử `<picture>` — URL của thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) của phần tử `<img>` được chọn. Hình ảnh được chọn sau đó được trình bày trong không gian chiếm bởi phần tử `<img>`.

{{InteractiveExample("HTML Demo: &lt;picture&gt;", "tabbed-standard")}}

```html interactive-example
<!--Change the browser window width to see the image change.-->

<picture>
  <source
    srcset="/shared-assets/images/examples/surfer.jpg"
    media="(orientation: portrait)" />
  <img src="/shared-assets/images/examples/painted-hand.jpg" alt="" />
</picture>
```

Để quyết định URL nào cần tải, {{Glossary("user agent")}} kiểm tra các thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/source#srcset), [`media`](/en-US/docs/Web/HTML/Reference/Elements/source#media), và [`type`](/en-US/docs/Web/HTML/Reference/Elements/source#type) của từng `<source>` để chọn hình ảnh tương thích phù hợp nhất với bố cục và khả năng hiện tại của thiết bị hiển thị.

Phần tử `<img>` phục vụ hai mục đích:

1. Nó mô tả kích thước và các thuộc tính khác của hình ảnh và cách trình bày của nó.
2. Nó cung cấp phương án dự phòng trong trường hợp không có phần tử `<source>` nào cung cấp được hình ảnh có thể sử dụng.

Các trường hợp sử dụng phổ biến của `<picture>`:

- **Chỉ đạo nghệ thuật.** Cắt xén hoặc sửa đổi hình ảnh cho các điều kiện `media` khác nhau (ví dụ: tải phiên bản đơn giản hơn của hình ảnh có quá nhiều chi tiết, trên màn hình nhỏ hơn).
- **Cung cấp các định dạng hình ảnh thay thế**, cho các trường hợp một số định dạng không được hỗ trợ.

  > [!NOTE]
  > Ví dụ, các định dạng mới hơn như [AVIF](/en-US/docs/Web/Media/Guides/Formats/Image_types#avif_image) hoặc [WEBP](/en-US/docs/Web/Media/Guides/Formats/Image_types#webp_image) có nhiều ưu điểm, nhưng có thể không được trình duyệt hỗ trợ. Danh sách các định dạng hình ảnh được hỗ trợ có thể tìm thấy tại: [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types).

- **Tiết kiệm băng thông và tăng tốc thời gian tải trang** bằng cách tải hình ảnh phù hợp nhất cho màn hình của người xem.

Nếu cung cấp các phiên bản mật độ cao hơn của hình ảnh cho màn hình mật độ cao (Retina), hãy sử dụng [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) trên phần tử `<img>` thay thế. Điều này cho phép các trình duyệt chọn phiên bản mật độ thấp hơn trong chế độ tiết kiệm dữ liệu, và bạn không cần phải viết các điều kiện `media` tường minh.

## Thuộc tính

Phần tử này chỉ bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Bạn có thể sử dụng thuộc tính {{cssxref("object-position")}} để điều chỉnh vị trí của hình ảnh trong khung của phần tử, và thuộc tính {{cssxref("object-fit")}} để kiểm soát cách hình ảnh được thay đổi kích thước để vừa với khung.

> [!NOTE]
> Sử dụng các thuộc tính này trên phần tử con `<img>`, **không phải** phần tử `<picture>`.

## Ví dụ

Các ví dụ này minh họa cách các thuộc tính khác nhau của phần tử {{HTMLElement("source")}} thay đổi việc chọn hình ảnh bên trong `<picture>`.

### Thuộc tính media

Thuộc tính `media` chỉ định điều kiện media (tương tự như truy vấn media) mà tác nhân người dùng sẽ đánh giá cho mỗi phần tử {{HTMLElement("source")}}.

Nếu điều kiện media của {{HTMLElement("source")}} đánh giá thành `false`, trình duyệt bỏ qua nó và đánh giá phần tử tiếp theo bên trong `<picture>`.

```html
<picture>
  <source srcset="mdn-logo-wide.png" media="(width >= 600px)" />
  <img src="mdn-logo-narrow.png" alt="MDN" />
</picture>
```

Bạn có thể hoán đổi tài nguyên hình ảnh cho chủ đề sáng và tối bằng tính năng media {{cssxref("@media/prefers-color-scheme")}}:

```html
<picture>
  <source srcset="logo-dark.png" media="(prefers-color-scheme: dark)" />
  <source srcset="logo-light.png" media="(prefers-color-scheme: light)" />
  <img src="logo-light.png" alt="Product logo" />
</picture>
```

### Thuộc tính srcset

Thuộc tính [srcset](/en-US/docs/Web/HTML/Reference/Elements/source#srcset) được sử dụng để cung cấp danh sách các hình ảnh có thể dựa trên kích thước hoặc mật độ pixel của màn hình.

Nó bao gồm danh sách mô tả hình ảnh được phân tách bằng dấu phẩy. Mỗi mô tả hình ảnh bao gồm URL của hình ảnh, và _một trong_:

- _mô tả chiều rộng_, theo sau là `w` (chẳng hạn `300w`);
  _HOẶC_
- _mô tả mật độ pixel_, theo sau là `x` (chẳng hạn `2x`) để phục vụ hình ảnh độ phân giải cao cho màn hình DPI cao.

Hãy lưu ý rằng:

- mô tả chiều rộng và mật độ pixel không nên được sử dụng cùng nhau
- mô tả mật độ pixel bị thiếu ngụ ý `1x`
- giá trị mô tả trùng lặp không được phép (2x & 2x, 100w & 100w)

Ví dụ sau minh họa việc sử dụng thuộc tính `srcset` với phần tử `<source>` để chỉ định hình ảnh mật độ cao và độ phân giải tiêu chuẩn:

```html
<picture>
  <source srcset="logo.png, logo-1.5x.png 1.5x" />
  <img src="logo.png" alt="MDN Web Docs logo" height="320" width="320" />
</picture>
```

Thuộc tính `srcset` cũng có thể được sử dụng trên phần tử `<img>` mà không cần phần tử `<picture>`. Ví dụ sau minh họa cách sử dụng thuộc tính `srcset` để chỉ định hình ảnh độ phân giải tiêu chuẩn và mật độ cao:

```html
<img
  srcset="logo.png, logo-2x.png 2x"
  src="logo.png"
  height="320"
  width="320"
  alt="MDN Web Docs logo" />
```

### Thuộc tính sizes

Thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/source#sizes) của phần tử `<source>` cho phép bạn chỉ định một tập hợp các cặp điều kiện media-chiều dài và chỉ định kích thước hiển thị hình ảnh cho từng điều kiện. Điều này giúp trình duyệt chọn hình ảnh phù hợp nhất từ thuộc tính `srcset`, liệt kê các hình ảnh với chiều rộng [nội tại](/en-US/docs/Glossary/Intrinsic_Size) của chúng.

Trình duyệt đánh giá các điều kiện media trong thuộc tính sizes trước khi nó tải bất kỳ hình ảnh nào. Xem thuộc tính sizes của các phần tử [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) và [`<source>`](/en-US/docs/Web/HTML/Reference/Elements/source#sizes) để biết thêm thông tin.

Ví dụ:

```html
<picture>
  <source
    srcset="small.jpg 480w, medium.jpg 800w, large.jpg 1200w"
    sizes="(max-width: 600px) 400px, 800px"
    type="image/jpeg" />
  <img src="fallback.jpg" alt="Example image" />
</picture>
```

Trong ví dụ này:

- Nếu vùng hiển thị rộng 600px hoặc ít hơn, kích thước slot là 400px; ngược lại là 800px.
- Trình duyệt nhân kích thước slot với tỷ lệ pixel thiết bị để xác định chiều rộng hình ảnh lý tưởng, sau đó chọn hình ảnh gần nhất có sẵn từ `srcset`.

Không có sizes, trình duyệt sẽ sử dụng kích thước mặc định của hình ảnh như được chỉ định bởi kích thước theo pixel của nó. Điều này có thể không phù hợp nhất với tất cả các thiết bị, đặc biệt nếu hình ảnh được hiển thị trên các kích thước màn hình khác nhau hoặc trong các ngữ cảnh khác nhau.

Lưu ý rằng sizes sẽ chỉ có hiệu lực nếu mô tả kích thước chiều rộng được cung cấp với srcset thay vì giá trị tỷ lệ pixel (200w thay vì 2x chẳng hạn).
Để biết thêm thông tin về việc sử dụng `srcset`, xem tài liệu [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images).

### Thuộc tính type

Thuộc tính `type` chỉ định [loại MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) cho (các) URL tài nguyên trong thuộc tính `srcset` của phần tử {{HTMLElement("source")}}. Nếu tác nhân người dùng không hỗ trợ loại được đưa ra, phần tử {{HTMLElement("source")}} bị bỏ qua.

```html
<picture>
  <source srcset="photo.avif" type="image/avif" />
  <source srcset="photo.webp" type="image/webp" />
  <img src="photo.jpg" alt="photo" />
</picture>
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >, nội dung cụm từ, nội dung nhúng
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Không hoặc nhiều phần tử {{HTMLElement("source")}}, theo sau là một
        phần tử {{HTMLElement("img")}}, tùy chọn xen kẽ với
        các phần tử hỗ trợ script.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào cho phép nội dung nhúng.</td>
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
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLPictureElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("img")}}
- Phần tử {{HTMLElement("source")}}
- Định vị và điều chỉnh kích thước hình ảnh trong khung: {{cssxref("object-position")}} và {{cssxref("object-fit")}}
- [Hướng dẫn về loại và định dạng tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)
- Tính năng media {{cssxref("@media/prefers-color-scheme")}}
