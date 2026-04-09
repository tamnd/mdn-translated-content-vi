---
title: "<embed>: The Embed External Content element"
slug: Web/HTML/Reference/Elements/embed
page-type: html-element
browser-compat: html.elements.embed
sidebar: htmlsidebar
---

Phần tử **`<embed>`** trong [HTML](/en-US/docs/Web/HTML) nhúng nội dung bên ngoài vào vị trí được chỉ định trong tài liệu. Nội dung này được cung cấp bởi một ứng dụng bên ngoài hoặc nguồn nội dung tương tác khác như plugin trình duyệt.

{{InteractiveExample("HTML Demo: &lt;embed&gt;", "tabbed-standard")}}

```html interactive-example
<embed
  type="image/jpeg"
  src="/shared-assets/images/examples/flowers.jpg"
  width="250"
  height="200" />
```

> [!NOTE]
> Chủ đề này chỉ ghi lại phần tử được định nghĩa là một phần của [HTML Living Standard](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-embed-element). Nó không đề cập đến việc triển khai phần tử trước đó, chưa được chuẩn hóa.

Hãy lưu ý rằng hầu hết các trình duyệt hiện đại đã ngừng hỗ trợ plugin trình duyệt, vì vậy việc phụ thuộc vào `<embed>` thường không phải là lựa chọn khôn ngoan nếu bạn muốn trang web của mình hoạt động được trên trình duyệt của người dùng trung bình.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `height`
  - : Chiều cao hiển thị của tài nguyên, tính bằng [CSS pixels](https://drafts.csswg.org/css-values/#px). Đây phải là giá trị tuyệt đối; không được phép sử dụng phần trăm.
- `src`
  - : URL của tài nguyên đang được nhúng.
- `type`
  - : {{glossary("MIME type")}} để sử dụng khi chọn plugin cần khởi tạo.
- `width`
  - : Chiều rộng hiển thị của tài nguyên, tính bằng [CSS pixels](https://drafts.csswg.org/css-values/#px). Đây phải là giá trị tuyệt đối; không được phép sử dụng phần trăm.

## Ghi chú sử dụng

Bạn có thể sử dụng thuộc tính {{cssxref("object-position")}} để điều chỉnh vị trí của đối tượng được nhúng trong khung phần tử.

> [!NOTE]
> Thuộc tính {{cssxref("object-fit")}} không có hiệu lực trên các phần tử `<embed>`.

## Khả năng tiếp cận

Hãy sử dụng [thuộc tính `title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) trên phần tử `embed` để gán nhãn nội dung của nó, để những người điều hướng bằng công nghệ hỗ trợ như trình đọc màn hình có thể hiểu nội dung đó chứa gì. Giá trị của tiêu đề cần mô tả ngắn gọn nội dung được nhúng. Không có tiêu đề, họ có thể không thể xác định nội dung nhúng là gì. Sự thay đổi ngữ cảnh này có thể gây nhầm lẫn và tốn thời gian, đặc biệt nếu phần tử `embed` chứa nội dung tương tác như video hoặc âm thanh.

## Ví dụ

```html
<embed
  type="video/quicktime"
  src="movie.mov"
  width="640"
  height="480"
  title="Title of my video" />
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
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung nhúng, nội dung tương tác,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content"
          >nội dung hữu hình</a
        >.
      </td>
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
      <td>Bất kỳ phần tử nào chấp nhận nội dung nhúng.</td>
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
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"><code>document</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role"><code>img</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLEmbedElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử khác được sử dụng để nhúng nội dung của các loại khác nhau bao gồm {{HTMLElement("audio")}}, {{HTMLElement("canvas")}}, {{HTMLElement("iframe")}}, {{HTMLElement("img")}}, {{MathMLElement("math")}}, {{HTMLElement("object")}}, {{SVGElement("svg")}}, và {{HTMLElement("video")}}.
- Định vị và đặt kích thước nội dung được nhúng trong khung: {{cssxref("object-position")}} và {{cssxref("object-fit")}}
