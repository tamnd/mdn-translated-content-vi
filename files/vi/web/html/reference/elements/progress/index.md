---
title: "<progress>: Phần tử Chỉ báo Tiến trình"
slug: Web/HTML/Reference/Elements/progress
page-type: html-element
browser-compat: html.elements.progress
sidebar: htmlsidebar
---

Phần tử **`<progress>`** trong [HTML](/vi/docs/Web/HTML) hiển thị một chỉ báo cho thấy tiến độ hoàn thành của một tác vụ, thường được hiển thị dưới dạng thanh tiến trình.

{{InteractiveExample("HTML Demo: &lt;progress&gt;", "tabbed-standard")}}

```html interactive-example
<label for="file">File progress:</label>

<progress id="file" max="100" value="70">70%</progress>
```

```css interactive-example
label {
  padding-right: 10px;
  font-size: 1rem;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- [`max`](/vi/docs/Web/HTML/Reference/Attributes/max)
  - : Thuộc tính này mô tả lượng công việc mà tác vụ được biểu thị bởi phần tử `progress` yêu cầu. Thuộc tính `max`, nếu có, phải có giá trị lớn hơn `0` và là một số dấu phẩy động hợp lệ. Giá trị mặc định là `1`.
- `value`
  - : Thuộc tính này chỉ định lượng tác vụ đã hoàn thành. Nó phải là một số dấu phẩy động hợp lệ trong khoảng từ `0` đến `max`, hoặc từ `0` đến `1` nếu `max` bị bỏ qua. Nếu không có thuộc tính `value`, thanh tiến trình là không xác định; điều này cho biết một hoạt động đang diễn ra mà không có dấu hiệu về thời gian dự kiến hoàn thành.

> [!NOTE]
> Không giống như phần tử {{htmlelement("meter")}}, giá trị nhỏ nhất luôn là 0 và thuộc tính `min` không được phép cho phần tử `<progress>`.

> [!NOTE]
> Pseudo-class {{cssxref(":indeterminate")}} có thể được sử dụng để khớp với các thanh tiến trình không xác định. Để thay đổi thanh tiến trình thành không xác định sau khi đã gán giá trị, bạn phải xóa thuộc tính value bằng {{domxref("Element.removeAttribute", "element.removeAttribute('value')")}}.

## Khả năng tiếp cận

### Gán nhãn

Trong hầu hết các trường hợp, bạn nên cung cấp nhãn dễ tiếp cận khi sử dụng `<progress>`. Mặc dù bạn có thể sử dụng các thuộc tính gán nhãn ARIA tiêu chuẩn [`aria-labelledby`](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-label`](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) như với bất kỳ phần tử nào có `role="progressbar"`, khi sử dụng `<progress>` bạn cũng có thể dùng phần tử {{htmlelement("label")}}.

> [!NOTE]
> Văn bản được đặt giữa các thẻ của phần tử không phải là nhãn dễ tiếp cận, chỉ được khuyến nghị như một phương án dự phòng cho các trình duyệt cũ không hỗ trợ phần tử này.

#### Ví dụ

```html
<label>
  Uploading Document: <progress value="70" max="100">70 %</progress>
</label>

<!-- OR -->
<br />

<label for="progress-bar">Uploading Document</label>
<progress id="progress-bar" value="70" max="100">70 %</progress>
```

#### Kết quả

{{EmbedLiveSample('Labelling')}}

### Mô tả một vùng cụ thể

Nếu phần tử `<progress>` mô tả tiến trình tải của một phần của trang, hãy sử dụng [`aria-describedby`](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để trỏ đến trạng thái, và đặt [`aria-busy="true"`](/vi/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy) trên phần đang được cập nhật, xóa thuộc tính `aria-busy` khi nó đã tải xong.

#### Ví dụ

```html
<div aria-busy="true" aria-describedby="progress-bar">
  <!-- content is for this region is loading -->
</div>

<!-- ... -->

<progress id="progress-bar" aria-label="Content loading…"></progress>
```

##### Kết quả

{{EmbedLiveSample('Describing a particular region')}}

## Ví dụ

```html
<progress value="70" max="100">70 %</progress>
```

### Kết quả

{{ EmbedLiveSample("Examples", 200, 50) }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>, nội dung có thể gán nhãn,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#palpable_content">nội dung rõ ràng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content">Nội dung cụm từ</a>, nhưng không được có phần tử <code>&#x3C;progress></code> nào trong số các phần tử con.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được bỏ qua, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung cụm từ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role"><code>progressbar</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLProgressElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tạo các điều khiển biểu mẫu dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls)
- {{htmlelement("meter")}}
- {{ cssxref(":indeterminate") }}
- {{ cssxref("-moz-orient") }}
- {{ cssxref("::-moz-progress-bar") }}
- {{ cssxref("::-webkit-progress-bar") }}
- {{ cssxref("::-webkit-progress-value") }}
- {{ cssxref("::-webkit-progress-inner-element") }}
