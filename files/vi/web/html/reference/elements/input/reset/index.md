---
title: <input type="reset">
slug: Web/HTML/Reference/Elements/input/reset
page-type: html-attribute-value
browser-compat: html.elements.input.type_reset
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`reset`** được hiển thị dưới dạng nút, với trình xử lý sự kiện {{domxref("Element/click_event", "click")}} mặc định đặt lại tất cả ô nhập trong biểu mẫu về giá trị ban đầu.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;reset&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<form>
  <div class="controls">
    <label for="id">User ID:</label>
    <input type="text" id="id" name="id" />

    <input type="reset" value="Reset" />
    <input type="submit" value="Submit" />
  </div>
</form>
```

```css interactive-example
.controls {
  padding-top: 1rem;
  display: grid;
  grid-template-rows: repeat(3, 1fr);
  grid-template-columns: 1fr 2fr;
  gap: 0.7rem;
}

label {
  font-size: 0.8rem;
  justify-self: end;
}

input[type="reset"],
input[type="submit"] {
  width: 5rem;
  justify-self: end;
}

input[type="reset"] {
  grid-column: 2;
  grid-row: 2;
}

input[type="submit"] {
  grid-column: 2;
  grid-row: 3;
}
```

> [!NOTE]
> Thông thường bạn nên tránh đưa nút đặt lại vào biểu mẫu của mình. Chúng hiếm khi hữu ích và thay vào đó dễ gây thất vọng cho người dùng nhấp vào chúng do nhầm lẫn (thường là khi đang cố nhấp vào [nút gửi](/en-US/docs/Web/HTML/Reference/Elements/input/submit)).

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử `<input type="reset">` chứa một chuỗi được dùng làm nhãn của nút, cung cấp cho nút một {{glossary("accessible description")}}. Các nút như `reset` không có giá trị thực chất khác.

### Đặt thuộc tính value

```html
<input type="reset" value="Reset the form" />
```

{{EmbedLiveSample("Setting_the_value_attribute", 650, 30)}}

### Bỏ qua thuộc tính value

Nếu bạn không chỉ định `value`, bạn nhận được nút có nhãn mặc định (thường là "Reset," nhưng điều này sẽ thay đổi tùy thuộc vào {{Glossary("user agent")}}):

```html
<input type="reset" />
```

{{EmbedLiveSample("Omitting_the_value_attribute", 650, 30)}}

## Sử dụng nút đặt lại

Các nút `<input type="reset">` được dùng để đặt lại biểu mẫu. Nếu bạn muốn tạo nút tùy chỉnh rồi tùy chỉnh hành vi bằng JavaScript, bạn cần dùng [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button), hoặc tốt hơn là phần tử {{htmlelement("button")}}.

### Nút đặt lại cơ bản

Chúng ta sẽ bắt đầu bằng cách tạo nút đặt lại cơ bản:

```html
<form>
  <div>
    <label for="example">Type in some sample text</label>
    <input id="example" type="text" />
  </div>
  <div>
    <input type="reset" value="Reset the form" />
  </div>
</form>
```

Nó hiển thị như sau:

{{EmbedLiveSample("A_basic_reset_button", 650, 100)}}

Hãy thử nhập một số văn bản vào trường văn bản, rồi nhấn nút đặt lại.

### Thêm phím tắt đặt lại

Để thêm phím tắt bàn phím cho nút đặt lại—giống như bạn làm với bất kỳ {{HTMLElement("input")}} nào có nghĩa—bạn dùng thuộc tính toàn cục [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey).

Trong ví dụ này, <kbd>r</kbd> được chỉ định là phím truy cập (bạn sẽ cần nhấn <kbd>r</kbd> cộng với các phím sửa đổi cụ thể cho tổ hợp trình duyệt/hệ điều hành của bạn; xem [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey) để biết danh sách hữu ích về những phím đó).

```html
<form>
  <div>
    <label for="example">Type in some sample text</label>
    <input id="example" type="text" />
  </div>
  <div>
    <input type="reset" value="Reset the form" accesskey="r" />
  </div>
</form>
```

{{EmbedLiveSample("Adding_a_reset_keyboard_shortcut", 650, 100)}}

Vấn đề với ví dụ trên là người dùng không có cách biết phím truy cập là gì! Điều này đặc biệt đúng vì các phím sửa đổi thường không chuẩn để tránh xung đột. Khi xây dựng trang web, hãy đảm bảo cung cấp thông tin này theo cách không ảnh hưởng đến thiết kế trang web (ví dụ bằng cách cung cấp liên kết dễ tiếp cận trỏ đến thông tin về các phím truy cập của trang web). Thêm tooltip vào nút (dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title)) cũng có thể giúp ích, mặc dù nó không phải là giải pháp hoàn chỉnh cho mục đích khả năng tiếp cận.

### Vô hiệu hóa và bật nút đặt lại

Để vô hiệu hóa nút đặt lại, hãy chỉ định thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/input#disabled) trên nó, như sau:

```html
<input type="reset" value="Disabled" disabled />
```

Bạn có thể bật và vô hiệu hóa nút trong thời gian chạy bằng cách đặt `disabled` thành `true` hoặc `false`; trong JavaScript điều này trông như `btn.disabled = true` hoặc `btn.disabled = false`.

> [!NOTE]
> Xem trang [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button#disabling_and_enabling_a_button) để biết thêm ý tưởng về việc bật và vô hiệu hóa nút.

## Xác thực

Các nút không tham gia xác thực ràng buộc; chúng không có giá trị thực để bị ràng buộc.

## Ví dụ

Chúng ta đã bao gồm các ví dụ cơ bản ở trên. Không có gì thêm để nói về nút đặt lại.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>Một chuỗi được dùng làm nhãn của nút</td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>{{domxref("Element/click_event", "click")}}</td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#type"><code>type</code></a> và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#value"><code>value</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>Không có</td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"><code>button</code></a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} triển khai nó.
- [Biểu mẫu và nút](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls#actual_buttons)
- [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- Phần tử {{HTMLElement("button")}}
