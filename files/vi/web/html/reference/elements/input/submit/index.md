---
title: <input type="submit">
slug: Web/HTML/Reference/Elements/input/submit
page-type: html-attribute-value
browser-compat: html.elements.input.type_submit
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`submit`** được hiển thị dưới dạng nút. Khi sự kiện {{domxref("Element/click_event", "click")}} xảy ra (thường là do người dùng nhấp vào nút), {{Glossary("user agent")}} cố gắng gửi biểu mẫu đến máy chủ.

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử `<input type="submit">` chứa một chuỗi được hiển thị làm nhãn của nút. Các nút không có giá trị thực chất khác. `value` cung cấp {{glossary("accessible description")}} cho nút.

### Đặt thuộc tính value

```html
<input type="submit" value="Send Request" />
```

{{EmbedLiveSample("Setting_the_value_attribute", 650, 30)}}

### Bỏ qua thuộc tính value

Nếu bạn không chỉ định `value`, nút sẽ có nhãn mặc định, được chọn bởi user agent. Nhãn này có thể là "Submit" hoặc "Submit Query." Đây là ví dụ về nút gửi có nhãn mặc định trong trình duyệt của bạn:

```html
<input type="submit" />
```

{{EmbedLiveSample("Omitting_the_value_attribute", 650, 30)}}

## Thuộc tính bổ sung

Ngoài các thuộc tính được chia sẻ bởi tất cả các phần tử {{HTMLElement("input")}}, ô nhập nút `submit` hỗ trợ các thuộc tính sau.

### formaction

Một chuỗi chỉ ra URL để gửi dữ liệu đến. Điều này được ưu tiên hơn thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) trên phần tử {{HTMLElement("form")}} sở hữu {{HTMLElement("input")}}.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) và {{HTMLElement("button")}}.

### formenctype

Một chuỗi xác định phương thức mã hóa để dùng khi gửi dữ liệu biểu mẫu đến máy chủ. Có ba giá trị được phép:

- `application/x-www-form-urlencoded`
  - : Giá trị mặc định này, gửi dữ liệu biểu mẫu dưới dạng chuỗi sau khi {{Glossary("Percent-encoding", "mã hóa phần trăm")}} văn bản bằng thuật toán như {{jsxref("encodeURI", "encodeURI()")}}.
- `multipart/form-data`
  - : Dùng API {{domxref("FormData")}} để quản lý dữ liệu, cho phép gửi tệp đến máy chủ. Bạn _phải_ dùng kiểu mã hóa này nếu biểu mẫu của bạn bao gồm bất kỳ phần tử {{HTMLElement("input")}} nào của [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) `file` ([`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file)).
- `text/plain`
  - : Văn bản thuần; chủ yếu hữu ích chỉ để gỡ lỗi, để bạn có thể dễ dàng xem dữ liệu sẽ được gửi.

Nếu được chỉ định, giá trị của thuộc tính `formenctype` ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu sở hữu.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) và {{HTMLElement("button")}}.

### formmethod

Một chuỗi chỉ ra phương thức HTTP để dùng khi gửi dữ liệu biểu mẫu; giá trị này ghi đè bất kỳ thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) nào được đặt trên biểu mẫu sở hữu. Các giá trị được phép là:

- `get`
  - : URL được xây dựng bằng cách bắt đầu với URL được đưa ra bởi thuộc tính `formaction` hoặc [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action), thêm dấu chấm hỏi ("?"), sau đó thêm dữ liệu biểu mẫu, được mã hóa như được mô tả bởi `formenctype` hoặc thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của biểu mẫu. URL này sau đó được gửi đến máy chủ bằng yêu cầu HTTP {{HTTPMethod("get")}}. Phương thức này hoạt động tốt cho các biểu mẫu chỉ chứa ký tự {{Glossary("ASCII")}} và không có tác dụng phụ. Đây là giá trị mặc định.
- `post`
  - : Dữ liệu biểu mẫu được bao gồm trong nội dung yêu cầu được gửi đến URL được đưa ra bởi thuộc tính `formaction` hoặc [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) bằng phương thức HTTP {{HTTPMethod("post")}}. Phương thức này hỗ trợ dữ liệu phức tạp và tệp đính kèm.
- `dialog`
  - : Phương thức này được dùng để chỉ ra rằng nút đóng hộp thoại mà ô nhập được liên kết và không truyền dữ liệu biểu mẫu chút nào.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) và {{HTMLElement("button")}}.

### formnovalidate

Thuộc tính Boolean, khi có mặt, chỉ định rằng biểu mẫu không nên được xác thực trước khi gửi đến máy chủ. Điều này ghi đè giá trị của thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) trên biểu mẫu sở hữu của phần tử.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) và {{HTMLElement("button")}}.

### formtarget

Một chuỗi chỉ định tên hoặc từ khóa chỉ ra nơi hiển thị phản hồi nhận được sau khi gửi biểu mẫu. Chuỗi phải là tên của **ngữ cảnh duyệt web** (tức là tab, cửa sổ hoặc {{HTMLElement("iframe")}}). Giá trị được chỉ định ở đây ghi đè bất kỳ mục tiêu nào được đưa ra bởi thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) trên {{HTMLElement("form")}} sở hữu ô nhập này.

Ngoài các tên thực tế của tab, cửa sổ hoặc khung nội tuyến, có một vài từ khóa đặc biệt có thể được dùng:

- `_self`
  - : Tải phản hồi vào cùng ngữ cảnh duyệt web với ngữ cảnh chứa biểu mẫu. Điều này sẽ thay thế tài liệu hiện tại bằng dữ liệu nhận được. Đây là giá trị mặc định được dùng nếu không có giá trị nào được chỉ định.
- `_blank`
  - : Tải phản hồi vào ngữ cảnh duyệt web mới, không có tên. Thông thường đây là tab mới trong cùng cửa sổ với tài liệu hiện tại, nhưng có thể khác nhau tùy thuộc vào cấu hình của {{Glossary("user agent")}}.
- `_parent`
  - : Tải phản hồi vào ngữ cảnh duyệt web cha của ngữ cảnh hiện tại. Nếu không có ngữ cảnh cha, điều này hoạt động giống như `_self`.
- `_top`
  - : Tải phản hồi vào ngữ cảnh duyệt web cấp cao nhất; đây là ngữ cảnh duyệt web là tổ tiên cấp cao nhất của ngữ cảnh hiện tại. Nếu ngữ cảnh hiện tại là ngữ cảnh cấp cao nhất, điều này hoạt động giống như `_self`.

Thuộc tính này cũng có sẵn trên các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) và {{HTMLElement("button")}}.

## Sử dụng nút gửi

Các nút `<input type="submit">` được dùng để gửi biểu mẫu. Nếu bạn muốn tạo nút tùy chỉnh rồi tùy chỉnh hành vi bằng JavaScript, bạn cần dùng [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button), hoặc tốt hơn là phần tử {{htmlelement("button")}}.

Nếu bạn chọn dùng các phần tử `<button>` để tạo các nút trong biểu mẫu, hãy nhớ điều này: Nếu `<button>` nằm trong {{HTMLElement("form")}}, nút đó sẽ được coi là nút "gửi". Vì vậy bạn nên có thói quen chỉ định rõ ràng nút nào là nút gửi.

### Nút gửi cơ bản

Chúng ta sẽ bắt đầu bằng cách tạo biểu mẫu với nút gửi cơ bản:

```html
<form>
  <div>
    <label for="example">Let's submit some text</label>
    <input id="example" type="text" name="text" />
  </div>
  <div>
    <input type="submit" value="Send" />
  </div>
</form>
```

Điều này hiển thị như sau:

{{EmbedLiveSample("A_basic_submit_button", 650, 100)}}

Hãy thử nhập một số văn bản vào trường văn bản, rồi gửi biểu mẫu.

Khi gửi, cặp tên/giá trị dữ liệu được gửi đến máy chủ. Trong trường hợp này, chuỗi sẽ là `text=user-text`, trong đó "user-text" là văn bản được người dùng nhập, được mã hóa để bảo toàn các ký tự đặc biệt. Nơi và cách dữ liệu được gửi phụ thuộc vào cấu hình của `<form>`; xem [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data) để biết thêm chi tiết.

### Thêm phím tắt bàn phím vào nút gửi

Phím tắt bàn phím, còn được gọi là phím truy cập và phím tương đương bàn phím, cho phép người dùng kích hoạt nút bằng cách nhấn phím hoặc tổ hợp phím trên bàn phím. Để thêm phím tắt bàn phím vào nút gửi—giống như bạn làm với bất kỳ {{HTMLElement("input")}} nào có nghĩa—bạn dùng thuộc tính toàn cục [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey).

Trong ví dụ này, <kbd>s</kbd> được chỉ định là phím truy cập (bạn sẽ cần nhấn <kbd>s</kbd> cộng với các phím sửa đổi cụ thể cho tổ hợp trình duyệt/hệ điều hành của bạn). Để tránh xung đột với phím tắt của chính user agent, các phím sửa đổi khác nhau được dùng cho phím truy cập so với các phím tắt khác trên máy tính chủ. Xem [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey) để biết thêm chi tiết.

Đây là ví dụ trước với phím truy cập <kbd>s</kbd> được thêm vào:

```html
<form>
  <div>
    <label for="example">Let's submit some text</label>
    <input id="example" type="text" name="text" />
  </div>
  <div>
    <input type="submit" value="Send" accesskey="s" />
  </div>
</form>
```

Ví dụ, trong Firefox cho Mac, nhấn <kbd>Control</kbd>-<kbd>Option</kbd>-<kbd>S</kbd> kích hoạt nút Send, trong khi Chrome trên Windows dùng <kbd>Alt</kbd>+<kbd>S</kbd>.

{{EmbedLiveSample("Adding_a_keyboard_shortcut_to_a_submit_button", 650, 100)}}

Vấn đề với ví dụ trên là người dùng sẽ không biết phím truy cập là gì! Điều này đặc biệt đúng vì các phím sửa đổi thường không chuẩn để tránh xung đột. Khi xây dựng trang web, hãy đảm bảo cung cấp thông tin này theo cách không ảnh hưởng đến thiết kế trang web (ví dụ bằng cách cung cấp liên kết dễ tiếp cận trỏ đến thông tin về các phím truy cập của trang web). Thêm tooltip vào nút (dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title)) cũng có thể giúp ích, mặc dù nó không phải là giải pháp hoàn chỉnh cho mục đích khả năng tiếp cận.

### Vô hiệu hóa và bật nút gửi

Để vô hiệu hóa nút gửi, hãy chỉ định thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) trên nó, như sau:

```html
<input type="submit" value="Send" disabled />
```

Bạn có thể bật và vô hiệu hóa nút trong thời gian chạy bằng cách đặt `disabled` thành `true` hoặc `false`; trong JavaScript điều này trông như `btn.disabled = true` hoặc `btn.disabled = false`.

> [!NOTE]
> Xem trang [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button#disabling_and_enabling_a_button) để biết thêm ý tưởng về việc bật và vô hiệu hóa nút.

## Xác thực

Nút gửi không tham gia xác thực ràng buộc; chúng không có giá trị thực để bị ràng buộc.

## Ví dụ

Chúng ta đã bao gồm các ví dụ cơ bản ở trên. Không có gì thêm để nói về nút gửi. Có lý do tại sao loại điều khiển này đôi khi được gọi là "nút đơn giản."

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
