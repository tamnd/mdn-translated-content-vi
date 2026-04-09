---
title: "<label>: Phần tử Label"
slug: Web/HTML/Reference/Elements/label
page-type: html-element
browser-compat: html.elements.label
sidebar: htmlsidebar
---

Phần tử **`<label>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho chú thích cho một mục trong giao diện người dùng.

{{InteractiveExample("HTML Demo: &lt;label&gt;", "tabbed-shorter")}}

```html interactive-example
<div class="preference">
  <label for="cheese">I like cheese.</label>
  <input type="checkbox" name="cheese" id="cheese" />
</div>

<div class="preference">
  <label for="peas">I like peas.</label>
  <input type="checkbox" name="peas" id="peas" />
</div>
```

```css interactive-example
.preference {
  display: flex;
  justify-content: space-between;
  width: 60%;
  margin: 0.5rem;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- [`for`](/en-US/docs/Web/HTML/Reference/Attributes/for)
  - : Giá trị là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của điều khiển form [có thể gắn nhãn](/en-US/docs/Web/HTML/Guides/Content_categories#labelable) trong cùng tài liệu, [liên kết `<label>` với điều khiển form đó](#associating_a_label_with_a_form_control). Lưu ý rằng thuộc tính phản ánh JavaScript của nó là [`htmlFor`](/en-US/docs/Web/API/HTMLLabelElement/htmlFor).

## Ghi chú sử dụng

### Liên kết nhãn với điều khiển form

Phần tử đầu tiên trong tài liệu có thuộc tính `id` khớp với giá trị của thuộc tính `for` là _điều khiển được gắn nhãn_ cho phần tử `label` này — nếu phần tử có `id` đó thực sự là [phần tử có thể gắn nhãn](/en-US/docs/Web/HTML/Guides/Content_categories#labelable). Nếu nó _không phải_ là phần tử có thể gắn nhãn, thì thuộc tính `for` không có tác dụng. Nếu có các phần tử khác cũng khớp với giá trị `id`, ở sau trong tài liệu, chúng không được xem xét.

Nhiều phần tử `<label>` có thể được liên kết với cùng một điều khiển form bằng cách có nhiều phần tử `<label>` với cùng giá trị thuộc tính `for`, cung cấp cho điều khiển form nhiều nhãn.

Liên kết `<label>` với điều khiển form, chẳng hạn {{htmlelement("input")}} hoặc {{htmlelement("textarea")}} mang lại một số lợi ích lớn:

- Văn bản nhãn không chỉ được liên kết trực quan với input văn bản tương ứng; nó cũng được liên kết về mặt chương trình. Điều này có nghĩa là ví dụ, trình đọc màn hình sẽ đọc nhãn khi người dùng tập trung vào input form, giúp người dùng công nghệ hỗ trợ dễ hiểu hơn dữ liệu nào cần được nhập.
- Khi người dùng nhấp hoặc chạm/gõ nhẹ vào nhãn, trình duyệt chuyển tiêu điểm đến input liên kết (sự kiện kết quả cũng được kích hoạt cho input). Diện tích nhấn tăng để lấy tiêu điểm cho input cung cấp lợi ích cho bất kỳ ai đang cố kích hoạt nó — bao gồm những người sử dụng thiết bị màn hình cảm ứng.

Có hai cách để liên kết `<label>` với điều khiển form, thường được gọi là liên kết _rõ ràng_ và _ngầm định_.

Để liên kết rõ ràng phần tử `<label>` với phần tử `<input>`, trước tiên bạn cần thêm thuộc tính `id` vào phần tử `<input>`. Tiếp theo, bạn thêm thuộc tính `for` vào phần tử `<label>`, trong đó giá trị của `for` giống với `id` trong phần tử `<input>`.

```html
<label for="peas">I like peas.</label>
<input type="checkbox" name="peas" id="peas" />
```

Ngoài ra, bạn có thể lồng `<input>` trực tiếp bên trong `<label>`, trong trường hợp đó không cần các thuộc tính `for` và `id` vì liên kết là ngầm định:

```html
<label>
  I like peas.
  <input type="checkbox" name="peas" />
</label>
```

> [!NOTE]
> Phần tử `<label>` có thể có cả thuộc tính `for` và phần tử điều khiển chứa, miễn là thuộc tính `for` trỏ đến phần tử điều khiển chứa.

Hai phương pháp này tương đương, nhưng có một số điều cần xem xét:

- Mặc dù kết hợp trình duyệt và {{glossary("screen reader")}} phổ biến hỗ trợ liên kết ngầm định, không phải tất cả công nghệ hỗ trợ đều làm vậy.
- Tùy thuộc vào thiết kế của bạn, loại liên kết có thể ảnh hưởng đến khả năng tạo kiểu. Làm cho `<label>` và điều khiển form là phần tử anh em thay vì cha-con có nghĩa là chúng là các hộp riêng biệt, kề nhau, cho phép bố cục tùy chỉnh hơn như căn hàng chúng với các phương pháp bố cục grid hoặc flex.
- Liên kết rõ ràng yêu cầu điều khiển form có `id`, phải là duy nhất trong toàn bộ tài liệu. Điều này khó đặc biệt trong ứng dụng được thành phần hóa. Các framework thường cung cấp giải pháp của riêng họ, chẳng hạn như [`useId()`](https://react.dev/reference/react/useId) của React, nhưng vẫn cần thêm điều phối để làm đúng.

Nhìn chung, chúng tôi khuyến nghị sử dụng liên kết rõ ràng với thuộc tính `for`, để đảm bảo tương thích với các công cụ bên ngoài và công nghệ hỗ trợ. Thực ra, bạn có thể đồng thời lồng _và_ cung cấp `id`/`for` để tương thích tối đa.

Điều khiển form mà nhãn đang gắn nhãn được gọi là _điều khiển được gắn nhãn_ của phần tử nhãn. Nhiều nhãn có thể được liên kết với cùng một điều khiển form:

```html
<label for="username">Enter your username:</label>
<input id="username" name="username" type="text" />
<label for="username">Forgot your username?</label>
```

Các phần tử có thể được liên kết với phần tử `<label>` bao gồm {{HTMLElement('button')}}, {{HTMLElement('input')}} (ngoại trừ `type="hidden"`), {{HTMLElement('meter')}}, {{HTMLElement('output')}}, {{HTMLElement('progress')}}, {{HTMLElement('select')}} và {{HTMLElement('textarea')}}.

## Khả năng tiếp cận

### Nội dung tương tác

Ngoài [điều khiển form được liên kết ngầm định](#associating_a_label_with_a_form_control), đừng đặt thêm các phần tử tương tác như {{HTMLElement("a", "anchors")}} hoặc {{HTMLElement("button", "buttons")}} bên trong `<label>`. Làm vậy khiến người dùng khó kích hoạt input form liên kết với `label`.

**Đừng làm thế này:**

```html example-bad
<label for="tac">
  <input id="tac" type="checkbox" name="terms-and-conditions" />
  I agree to the <a href="terms-and-conditions.html">Terms and Conditions</a>
</label>
```

**Nên làm thế này:**

```html example-good
<p>
  <a href="terms-and-conditions.html">Read our Terms and Conditions</a>
</p>
<label for="tac">
  <input id="tac" type="checkbox" name="terms-and-conditions" />
  I agree to the Terms and Conditions
</label>
```

> [!NOTE]
> Đặt bất kỳ ngữ cảnh cần thiết nào, chẳng hạn như liên kết đến điều khoản và điều kiện, trước điều khiển form là thực hành tốt, để người dùng có thể đọc nó trước khi tương tác với điều khiển.

### Tiêu đề

Đặt [các phần tử tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) trong `<label>` gây trở ngại cho nhiều loại công nghệ hỗ trợ, vì các tiêu đề thường được dùng như [công cụ hỗ trợ điều hướng](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements#navigation). Nếu văn bản nhãn cần được điều chỉnh trực quan, hãy sử dụng các lớp CSS áp dụng cho phần tử `<label>` thay thế.

Nếu [form](/en-US/docs/Web/HTML/Reference/Elements/form) hoặc một phần của form cần tiêu đề, hãy sử dụng phần tử {{HTMLElement("legend")}} được đặt trong {{HTMLElement("fieldset")}}.

**Đừng làm thế này:**

```html example-bad
<label for="your-name">
  <h3>Your name</h3>
  <input id="your-name" name="your-name" type="text" />
</label>
```

**Nên làm thế này:**

```html example-good
<label class="large-label" for="your-name">
  Your name
  <input id="your-name" name="your-name" type="text" />
</label>
```

### Nút

Phần tử {{HTMLElement("input")}} với khai báo `type="button"` và thuộc tính `value` hợp lệ không cần nhãn liên kết. Làm vậy thực sự có thể gây trở ngại cho cách công nghệ hỗ trợ phân tích input nút. Điều tương tự áp dụng cho phần tử {{HTMLElement("button")}}.

## Ví dụ

### Định nghĩa nhãn ngầm định

```html
<label>Click me <input type="text" /></label>
```

{{EmbedLiveSample('Defining an implicit label', '200', '50')}}

### Định nghĩa nhãn rõ ràng với thuộc tính "for"

```html
<label for="username">Click me to focus on the input field</label>
<input type="text" id="username" />
```

{{EmbedLiveSample('Using_the_for_attribute', '200', '50')}}

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
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >nội dung tương tác</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content"
          >phần tử liên kết form</a
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >, nhưng không có phần tử <code>label</code> hậu duệ. Không có
        phần tử
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#labelable"
          >có thể gắn nhãn</a
        >
        nào khác ngoài điều khiển được gắn nhãn được cho phép.
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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
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
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLLabelElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
