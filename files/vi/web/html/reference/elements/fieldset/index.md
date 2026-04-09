---
title: "<fieldset>: Phần tử Field Set"
slug: Web/HTML/Reference/Elements/fieldset
page-type: html-element
browser-compat: html.elements.fieldset
sidebar: htmlsidebar
---

Phần tử **`<fieldset>`** trong [HTML](/en-US/docs/Web/HTML) được dùng để nhóm nhiều điều khiển cũng như các nhãn ({{HTMLElement("label")}}) trong một web form.

{{InteractiveExample("HTML Demo: &lt;fieldset&gt;", "tabbed-standard")}}

```html interactive-example
<form>
  <fieldset>
    <legend>Choose your favorite monster</legend>

    <input type="radio" id="kraken" name="monster" value="K" />
    <label for="kraken">Kraken</label><br />

    <input type="radio" id="sasquatch" name="monster" value="S" />
    <label for="sasquatch">Sasquatch</label><br />

    <input type="radio" id="mothman" name="monster" value="M" />
    <label for="mothman">Mothman</label>
  </fieldset>
</form>
```

```css interactive-example
legend {
  background-color: black;
  color: white;
  padding: 3px 6px;
}

input {
  margin: 0.4rem;
}
```

Như ví dụ trên cho thấy, phần tử `<fieldset>` cung cấp nhóm cho một phần của HTML form, với phần tử {{htmlelement("legend")}} lồng bên trong cung cấp chú thích cho `<fieldset>`. Nó nhận một vài thuộc tính, đáng chú ý nhất là `form`, có thể chứa `id` của {{htmlelement("form")}} trên cùng trang, cho phép bạn làm cho `<fieldset>` là một phần của `<form>` đó ngay cả khi nó không được lồng bên trong, và `disabled`, cho phép bạn vô hiệu hóa `<fieldset>` và tất cả nội dung của nó cùng một lúc.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Nếu thuộc tính Boolean này được đặt, tất cả điều khiển form là hậu duệ của `<fieldset>` đều bị vô hiệu hóa, nghĩa là chúng không thể chỉnh sửa và sẽ không được gửi cùng với {{htmlelement("form")}}. Chúng sẽ không nhận bất kỳ sự kiện duyệt nào, như nhấp chuột hoặc sự kiện liên quan đến tiêu điểm. Theo mặc định trình duyệt hiển thị các điều khiển như vậy màu xám. Lưu ý rằng các phần tử form bên trong phần tử {{HTMLElement("legend")}} sẽ không bị vô hiệu hóa.
- [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form)
  - : Thuộc tính này lấy giá trị của thuộc tính [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử {{HTMLElement("form")}} bạn muốn `<fieldset>` là một phần, ngay cả khi nó không ở bên trong form. Xin lưu ý rằng việc sử dụng điều này gây nhầm lẫn — nếu bạn muốn các phần tử {{HTMLElement("input")}} bên trong `<fieldset>` được liên kết với form, bạn cần sử dụng thuộc tính `form` trực tiếp trên các phần tử đó. Bạn có thể kiểm tra phần tử nào được liên kết với form qua JavaScript, sử dụng {{domxref("HTMLFormElement.elements")}}.
- `name`
  - : Tên được liên kết với nhóm.

    > [!NOTE]
    > Chú thích cho fieldset được cung cấp bởi phần tử {{HTMLElement("legend")}} đầu tiên được lồng bên trong nó.

## Tạo kiểu với CSS

Có một số điều cần xem xét đặc biệt về tạo kiểu cho `<fieldset>`.

Giá trị {{cssxref("display")}} của nó là `block` theo mặc định và nó thiết lập một [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context). Nếu `<fieldset>` được tạo kiểu với giá trị `display` cấp nội tuyến, nó sẽ hoạt động như `inline-block`, ngược lại nó sẽ hoạt động như `block`. Theo mặc định có viền `groove` `2px` bao quanh nội dung và một lượng padding mặc định nhỏ. Phần tử có {{cssxref("min-inline-size", "min-inline-size: min-content")}} theo mặc định.

Nếu có {{htmlelement("legend")}}, nó được đặt qua viền `block-start`. `<legend>` thu nhỏ bọc, và cũng thiết lập một formatting context. Giá trị `display` được block hóa. (Ví dụ, `display: inline` hoạt động như `block`.)

Sẽ có một hộp ẩn danh chứa nội dung của `<fieldset>`, kế thừa các thuộc tính nhất định từ `<fieldset>`. Nếu `<fieldset>` được tạo kiểu với `display: grid` hoặc `display: inline-grid`, thì hộp ẩn danh sẽ là grid formatting context. Nếu `<fieldset>` được tạo kiểu với `display: flex` hoặc `display: inline-flex`, thì hộp ẩn danh sẽ là flex formatting context. Ngược lại, nó thiết lập block formatting context.

Bạn có thể tạo kiểu cho `<fieldset>` và `<legend>` theo bất kỳ cách nào bạn muốn phù hợp với thiết kế trang của bạn.

## Ví dụ

### Fieldset cơ bản

Ví dụ này bao gồm `<fieldset>` với `<legend>`, với một điều khiển bên trong nó.

```html
<form action="#">
  <fieldset>
    <legend>Do you agree?</legend>
    <input type="checkbox" id="chbx" name="agree" value="Yes!" />
    <label for="chbx">I agree</label>
  </fieldset>
</form>
```

#### Kết quả

{{ EmbedLiveSample('Basic_fieldset', '100%', '80') }}

### Fieldset bị vô hiệu hóa

Ví dụ này hiển thị `<fieldset>` bị vô hiệu hóa với hai điều khiển bên trong nó. Lưu ý cả hai điều khiển đều bị vô hiệu hóa do nằm trong `<fieldset>` bị vô hiệu hóa.

```html
<form action="#">
  <fieldset disabled>
    <legend>Disabled login fieldset</legend>
    <div>
      <label for="name">Name: </label>
      <input type="text" id="name" value="Chris" />
    </div>
    <div>
      <label for="pwd">Archetype: </label>
      <input type="password" id="pwd" value="Wookie" />
    </div>
  </fieldset>
</form>
```

#### Kết quả

{{ EmbedLiveSample('Disabled_fieldset', '100%', '110') }}

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
        gốc phân đoạn,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#listed"
          >được liệt kê</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content"
          >liên kết form</a
        >
        phần tử, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        Phần tử {{HTMLElement("legend")}} tùy chọn, tiếp theo là nội dung luồng.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role"><code>radiogroup</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLFieldSetElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("legend")}}
- Phần tử {{HTMLElement("input")}}
- Phần tử {{HTMLElement("label")}}
- Phần tử {{HTMLElement("form")}}
