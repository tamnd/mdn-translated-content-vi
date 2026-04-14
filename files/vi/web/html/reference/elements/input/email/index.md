---
title: <input type="email">
slug: Web/HTML/Reference/Elements/input/email
page-type: html-attribute-value
browser-compat: html.elements.input.type_email
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`email`** được dùng để cho phép người dùng nhập và chỉnh sửa địa chỉ email, hoặc nếu thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) được chỉ định, một danh sách các địa chỉ email.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;email&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="email">Enter your example.com email:</label>

<input type="email" id="email" pattern=".+@example\.com" size="30" required />
```

```css interactive-example
label {
  display: block;
  font:
    1rem "Fira Sans",
    sans-serif;
}

input,
label {
  margin: 0.4rem 0;
}
```

Giá trị đầu vào được tự động xác thực để đảm bảo rằng nó trống hoặc là địa chỉ email (hoặc danh sách các địa chỉ) được định dạng đúng trước khi biểu mẫu có thể được gửi. Các pseudo-class CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} được áp dụng tự động khi thích hợp để biểu thị trực quan liệu giá trị hiện tại của trường có phải là địa chỉ email hợp lệ hay không.

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử {{HTMLElement("input")}} chứa một chuỗi được tự động xác thực là phù hợp với cú pháp email. Cụ thể, có ba định dạng giá trị có thể vượt qua xác thực:

1. Chuỗi rỗng ("") cho biết người dùng chưa nhập giá trị hoặc giá trị đã bị xóa.
2. Một địa chỉ email được định dạng đúng. Điều này không nhất thiết có nghĩa là địa chỉ email tồn tại, nhưng ít nhất nó được định dạng đúng. Nghĩa là `username@domain` hoặc `username@domain.tld`. Tất nhiên còn nhiều điều hơn thế; xem [Kiểm tra hợp lệ](#validation) để biết biểu thức chính quy khớp với thuật toán xác thực địa chỉ email.
3. Nếu và chỉ khi thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple) được chỉ định, giá trị có thể là danh sách các địa chỉ email được phân tách bằng dấu phẩy được định dạng đúng. Mọi khoảng trắng đầu và cuối được loại bỏ khỏi mỗi địa chỉ trong danh sách.

Xem [Kiểm tra hợp lệ](#validation) để biết chi tiết về cách các địa chỉ email được xác thực để đảm bảo chúng được định dạng đúng.

## Thuộc tính bổ sung

Ngoài [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và các thuộc tính hoạt động trên tất cả các phần tử {{HTMLElement("input")}} bất kể kiểu, đầu vào `email` hỗ trợ các thuộc tính sau.

> [!NOTE]
> Thuộc tính toàn cục [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) có thể được thêm vào đầu vào email, nhưng trạng thái được lưu trữ luôn là `off`.

### list

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được định nghĩa trước để gợi ý cho người dùng cho đầu vào này. Mọi giá trị trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) đều không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách được xác định trước này hoặc cung cấp giá trị khác.

### maxlength

Độ dài chuỗi tối đa (được đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào đầu vào `email`. Đây phải là giá trị nguyên từ 0 trở lên. Nếu không có `maxlength` được chỉ định hoặc giá trị không hợp lệ, đầu vào `email` không có độ dài tối đa. Giá trị này cũng phải lớn hơn hoặc bằng giá trị của `minlength`.

Đầu vào sẽ thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài giá trị văn bản của trường lớn hơn `maxlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Kiểm tra ràng buộc chỉ áp dụng khi giá trị được người dùng thay đổi.

### minlength

Độ dài chuỗi tối thiểu (được đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào đầu vào `email`. Đây phải là giá trị nguyên không âm nhỏ hơn hoặc bằng giá trị được chỉ định bởi `maxlength`. Nếu không có `minlength` được chỉ định hoặc giá trị không hợp lệ, đầu vào `email` không có độ dài tối thiểu.

Đầu vào sẽ thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường ít hơn `minlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Kiểm tra ràng buộc chỉ áp dụng khi giá trị được người dùng thay đổi.

### multiple

Thuộc tính Boolean mà khi có mặt, cho biết người dùng có thể nhập danh sách nhiều địa chỉ email, phân tách bằng dấu phẩy và tùy chọn ký tự khoảng trắng. Xem [Cho phép nhiều địa chỉ email](#allowing_multiple_email_addresses) để xem ví dụ, hoặc [Thuộc tính HTML: multiple](/en-US/docs/Web/HTML/Reference/Attributes/multiple) để biết thêm chi tiết.

> [!NOTE]
> Thông thường, nếu bạn chỉ định thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required), người dùng phải nhập địa chỉ email hợp lệ để trường được coi là hợp lệ. Tuy nhiên, nếu bạn thêm thuộc tính `multiple`, danh sách không có địa chỉ email (chuỗi rỗng hoặc chuỗi chỉ có khoảng trắng) là giá trị hợp lệ. Nói cách khác, người dùng không cần nhập ngay cả một địa chỉ email khi `multiple` được chỉ định, bất kể giá trị của `required`.

### pattern

Thuộc tính `pattern`, khi được chỉ định, là biểu thức chính quy mà [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của đầu vào phải khớp để giá trị vượt qua [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nó phải là biểu thức chính quy JavaScript hợp lệ, như được sử dụng bởi kiểu {{jsxref("RegExp")}}, và được ghi lại trong [hướng dẫn về biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions); cờ `'u'` được chỉ định khi biên dịch biểu thức chính quy để mẫu được coi như chuỗi điểm mã Unicode, thay vì {{Glossary("ASCII")}}. Không nên chỉ định dấu gạch chéo xung quanh văn bản mẫu.

Nếu mẫu được chỉ định không hợp lệ, không có biểu thức chính quy nào được áp dụng và thuộc tính này hoàn toàn bị bỏ qua.

> [!NOTE]
> Dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để chỉ định văn bản mà hầu hết trình duyệt sẽ hiển thị dưới dạng tooltip để giải thích yêu cầu là gì để khớp với mẫu. Bạn cũng nên bao gồm văn bản giải thích khác gần đó.

Xem phần [Kiểm tra hợp lệ mẫu](#pattern_validation) để biết chi tiết và ví dụ.

### `placeholder`

Thuộc tính `placeholder` là chuỗi cung cấp gợi ý ngắn cho người dùng về loại thông tin được mong đợi trong trường. Nó phải là từ hoặc cụm từ ngắn mô tả kiểu dữ liệu mong đợi, thay vì thông báo giải thích. Văn bản _không được_ bao gồm ký tự xuống dòng hoặc ngắt dòng.

Nếu nội dung của điều khiển có một chiều hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần trình bày placeholder theo chiều hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán hai chiều Unicode để ghi đè chiều hướng trong placeholder; xem [Cách dùng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có ngữ nghĩa hữu ích như các cách khác để giải thích biểu mẫu và có thể gây ra các vấn đề kỹ thuật không mong muốn với nội dung. Xem [Nhãn `<input>`](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để biết thêm.

### `readonly`

Thuộc tính Boolean mà khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên `value` của nó vẫn có thể được thay đổi bởi mã JavaScript đặt trực tiếp thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các đầu vào có thuộc tính `readonly` cũng được chỉ định.

### `size`

Thuộc tính `size` là giá trị số cho biết ô nhập liệu nên rộng bao nhiêu ký tự. Giá trị phải là số lớn hơn không, và giá trị mặc định là 20. Vì chiều rộng ký tự thay đổi, điều này có thể hoặc không thể chính xác và không nên dựa vào đó; đầu vào kết quả có thể hẹp hơn hoặc rộng hơn số ký tự được chỉ định, tùy thuộc vào ký tự và phông chữ (cài đặt {{cssxref("font")}} đang sử dụng).

Điều này _không_ đặt giới hạn về số ký tự người dùng có thể nhập vào trường. Nó chỉ chỉ định xấp xỉ bao nhiêu ký tự có thể được nhìn thấy cùng một lúc. Để đặt giới hạn trên cho độ dài dữ liệu đầu vào, dùng thuộc tính [`maxlength`](#maxlength).

## Sử dụng đầu vào email

Địa chỉ email là một trong những hình thức dữ liệu văn bản được nhập thường xuyên nhất trên web; chúng được dùng khi đăng nhập vào các trang web, khi yêu cầu thông tin, để xác nhận đơn hàng, cho webmail, v.v. Do đó, kiểu đầu vào `email` có thể làm cho công việc của bạn với tư cách là nhà phát triển web dễ dàng hơn nhiều vì nó có thể giúp đơn giản hóa công việc của bạn khi xây dựng giao diện người dùng và logic cho địa chỉ email. Khi bạn tạo đầu vào email với giá trị `type` thích hợp, `email`, bạn nhận được xác thực tự động rằng văn bản đã nhập ít nhất ở dạng đúng để có thể là địa chỉ email hợp lệ. Điều này có thể giúp tránh các trường hợp người dùng gõ sai địa chỉ hoặc cung cấp địa chỉ không hợp lệ.

Tuy nhiên, điều quan trọng cần lưu ý là điều này không đủ để đảm bảo rằng văn bản được chỉ định là địa chỉ email thực sự tồn tại, tương ứng với người dùng của trang web, hoặc được chấp nhận theo bất kỳ cách nào. Nó chỉ đảm bảo rằng giá trị của trường được định dạng đúng để là địa chỉ email.

> [!NOTE]
> Điều quan trọng cần nhớ là người dùng có thể tìm cách sửa đổi HTML của bạn, vì vậy trang web của bạn _không được_ sử dụng xác thực này cho bất kỳ mục đích bảo mật nào. Bạn _phải_ xác minh địa chỉ email ở phía máy chủ của bất kỳ giao dịch nào trong đó văn bản được cung cấp có thể có bất kỳ ý nghĩa bảo mật nào.

### Đầu vào email cơ bản

Hiện tại, tất cả các trình duyệt triển khai phần tử này thực hiện nó như là trường nhập văn bản tiêu chuẩn với các tính năng xác thực cơ bản. Tuy nhiên, đặc tả cho phép trình duyệt có sự linh hoạt trong vấn đề này. Ví dụ: phần tử có thể được tích hợp với sổ địa chỉ tích hợp của thiết bị để cho phép chọn địa chỉ email từ danh sách đó. Ở dạng cơ bản nhất, đầu vào `email` có thể được triển khai như thế này:

```html
<input id="emailAddress" type="email" />
```

{{ EmbedLiveSample('A_basic_email_input', 600, 40) }}

Lưu ý rằng nó được coi là hợp lệ khi trống và khi một địa chỉ email được định dạng hợp lệ được nhập, nhưng nếu không thì không được coi là hợp lệ. Bằng cách thêm thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required), chỉ các địa chỉ email được định dạng hợp lệ mới được cho phép; đầu vào không còn được coi là hợp lệ khi trống.

### Cho phép nhiều địa chỉ email

Bằng cách thêm thuộc tính Boolean [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple), đầu vào có thể được cấu hình để chấp nhận nhiều địa chỉ email.

```html
<input id="emailAddress" type="email" multiple />
```

{{ EmbedLiveSample('Allowing multiple email addresses', 600, 40) }}

Đầu vào hiện được coi là hợp lệ khi một địa chỉ email được nhập, hoặc khi có bất kỳ số lượng địa chỉ email được phân tách bằng dấu phẩy và tùy chọn một số ký tự khoảng trắng.

> [!NOTE]
> Khi `multiple` được sử dụng, giá trị _được_ phép là trống.

Một số ví dụ về chuỗi hợp lệ khi `multiple` được chỉ định:

- `""`
- `"me@example"`
- `"me@example.org"`
- `"me@example.org,you@example.org"`
- `"me@example.org, you@example.org"`
- `"me@example.org,you@example.org, us@example.org"`

Một số ví dụ về chuỗi không hợp lệ:

- `","`
- `"me"`
- `"me@example.org you@example.org"`

### Placeholder

Đôi khi hữu ích khi cung cấp gợi ý trong ngữ cảnh về dạng dữ liệu đầu vào nên có. Điều này đặc biệt quan trọng nếu thiết kế trang không cung cấp nhãn mô tả cho mỗi {{HTMLElement("input")}}. Đây là lúc **placeholder** phát huy tác dụng. Placeholder là giá trị mô tả dạng `value` nên có bằng cách trình bày ví dụ về giá trị hợp lệ, được hiển thị bên trong hộp chỉnh sửa khi `value` của phần tử là "". Khi dữ liệu được nhập vào hộp, placeholder biến mất; nếu hộp bị xóa, placeholder xuất hiện lại.

Ở đây, chúng ta có đầu vào `email` với placeholder `sophie@example.com`. Lưu ý cách placeholder biến mất và xuất hiện khi bạn thao tác nội dung của trường chỉnh sửa.

```html
<input type="email" placeholder="sophie@example.com" />
```

{{ EmbedLiveSample('Placeholders', 600, 40) }}

### Kiểm soát kích thước đầu vào

Bạn có thể kiểm soát không chỉ chiều dài vật lý của ô nhập liệu, mà còn cả độ dài tối thiểu và tối đa được phép cho văn bản đầu vào.

#### Kích thước vật lý của phần tử đầu vào

Kích thước vật lý của ô nhập liệu có thể được kiểm soát bằng thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Với nó, bạn có thể chỉ định số ký tự mà ô nhập liệu có thể hiển thị cùng một lúc. Trong ví dụ này, ô chỉnh sửa `email` rộng 15 ký tự:

```html
<input type="email" size="15" />
```

{{ EmbedLiveSample('Physical_input_element_size', 600, 40) }}

#### Độ dài giá trị phần tử

`size` tách biệt với giới hạn độ dài trên chính địa chỉ email đã nhập để bạn có thể có các trường vừa với không gian nhỏ trong khi vẫn cho phép nhập chuỗi địa chỉ email dài hơn. Bạn có thể chỉ định độ dài tối thiểu, theo ký tự, cho địa chỉ email đã nhập bằng cách dùng thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength); tương tự, dùng [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) để đặt độ dài tối đa của địa chỉ email đã nhập.

Ví dụ dưới đây tạo ô nhập địa chỉ email rộng 32 ký tự, yêu cầu nội dung không ngắn hơn 3 ký tự và không dài hơn 64 ký tự.

```html
<input type="email" size="32" minlength="3" maxlength="64" />
```

{{EmbedLiveSample("Element_value_length", 600, 40) }}

### Cung cấp tùy chọn mặc định

#### Cung cấp một giá trị mặc định duy nhất bằng thuộc tính value

Như thường lệ, bạn có thể cung cấp giá trị mặc định cho ô nhập `email` bằng cách đặt thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của nó:

```html
<input type="email" value="default@example.com" />
```

{{EmbedLiveSample("Providing_a_single_default_using_the_value_attribute", 600, 40)}}

#### Cung cấp các giá trị gợi ý

Tiến thêm một bước, bạn có thể cung cấp danh sách các tùy chọn mặc định mà người dùng có thể chọn bằng cách chỉ định thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list). Điều này không giới hạn người dùng ở các tùy chọn đó, nhưng cho phép họ chọn các địa chỉ email được dùng thường xuyên hơn. Điều này cũng cung cấp gợi ý cho [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete). Thuộc tính `list` chỉ định ID của một {{HTMLElement("datalist")}}, lần lượt chứa một phần tử {{HTMLElement("option")}} mỗi giá trị gợi ý; `value` của mỗi `option` là giá trị gợi ý tương ứng cho ô nhập email.

```html
<input type="email" size="40" list="defaultEmails" />

<datalist id="defaultEmails">
  <option value="jbond007@mi6.defence.gov.uk"></option>
  <option value="jbourne@unknown.net"></option>
  <option value="nfury@shield.org"></option>
  <option value="tony@starkindustries.com"></option>
  <option value="hulk@grrrrrrrr.arg"></option>
</datalist>
```

{{EmbedLiveSample("Offering_suggested_values", 600, 40)}}

Với phần tử {{HTMLElement("datalist")}} và các {{HTMLElement("option")}} của nó, trình duyệt sẽ cung cấp các giá trị được chỉ định làm giá trị tiềm năng cho địa chỉ email; điều này thường được trình bày dưới dạng popup hoặc menu thả xuống chứa các gợi ý. Trong khi trải nghiệm người dùng cụ thể có thể thay đổi từ trình duyệt này sang trình duyệt khác, thường thì việc nhấp vào ô chỉnh sửa sẽ hiển thị menu thả xuống của các địa chỉ email được gợi ý. Sau đó, khi người dùng gõ, danh sách được lọc để chỉ hiển thị các giá trị khớp. Mỗi ký tự được gõ thu hẹp danh sách cho đến khi người dùng chọn hoặc gõ giá trị tùy chỉnh.

## Kiểm tra hợp lệ

Có hai cấp độ xác thực nội dung cho đầu vào `email`. Đầu tiên, có cấp độ xác thực tiêu chuẩn được cung cấp cho tất cả {{HTMLElement("input")}}, tự động đảm bảo nội dung đáp ứng các yêu cầu để là địa chỉ email hợp lệ. Nhưng cũng có tùy chọn thêm bộ lọc bổ sung để đảm bảo các nhu cầu đặc thù của bạn được đáp ứng.

> [!WARNING]
> Kiểm tra hợp lệ biểu mẫu HTML _không phải_ là sự thay thế cho các script đảm bảo dữ liệu nhập có đúng định dạng. Quá dễ dàng để ai đó điều chỉnh HTML cho phép bỏ qua xác thực, hoặc xóa hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn hoàn toàn và gửi dữ liệu trực tiếp đến máy chủ. Nếu mã phía máy chủ không xác thực dữ liệu nhận được, thảm họa có thể xảy ra khi dữ liệu không đúng định dạng (hoặc dữ liệu quá lớn, sai kiểu, v.v.) được nhập vào cơ sở dữ liệu của bạn.

### Kiểm tra hợp lệ cơ bản

Trình duyệt tự động cung cấp xác thực để đảm bảo chỉ có văn bản khớp với định dạng tiêu chuẩn cho địa chỉ email Internet mới được nhập vào ô nhập. Trình duyệt sử dụng thuật toán tương đương với biểu thức chính quy sau:

```js
/^[\w.!#$%&'*+/=?^`{|}~-]+@[a-z\d](?:[a-z\d-]{0,61}[a-z\d])?(?:\.[a-z\d](?:[a-z\d-]{0,61}[a-z\d])?)*$/i;
```

Để tìm hiểu thêm về cách xác thực biểu mẫu hoạt động và cách tận dụng các thuộc tính CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} để tạo kiểu cho đầu vào dựa trên giá trị hiện tại có hợp lệ hay không, xem [Xác thực dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation).

> [!NOTE]
> Có các vấn đề đặc tả đã biết liên quan đến tên miền quốc tế và xác thực địa chỉ email trong HTML. Xem [W3C bug 15489](https://www.w3.org/Bugs/Public/show_bug.cgi?id=15489) và [whatwg/html#4562](https://github.com/whatwg/html/issues/4562) để biết chi tiết.

### Kiểm tra hợp lệ mẫu

Nếu bạn cần địa chỉ email đã nhập bị hạn chế hơn "bất kỳ chuỗi nào trông giống như địa chỉ email", bạn có thể dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để chỉ định {{Glossary("regular expression")}} mà giá trị phải khớp để hợp lệ. Nếu thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple) được chỉ định, mỗi mục riêng lẻ trong danh sách giá trị được phân tách bằng dấu phẩy phải khớp với {{Glossary("regular expression")}}.

Ví dụ: giả sử bạn đang xây dựng trang cho nhân viên của Best Startup Ever, Inc. cho phép họ liên hệ bộ phận IT để được hỗ trợ. Trong biểu mẫu đơn giản hóa của chúng ta, người dùng cần nhập địa chỉ email và tin nhắn mô tả vấn đề họ cần giúp đỡ. Chúng ta muốn đảm bảo không chỉ người dùng cung cấp địa chỉ email hợp lệ, mà vì lý do bảo mật, chúng ta yêu cầu địa chỉ phải là địa chỉ email nội bộ của công ty.

Vì đầu vào kiểu `email` xác thực cả theo định dạng địa chỉ email tiêu chuẩn _và_ [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) được chỉ định, bạn có thể thực hiện điều này dễ dàng. Hãy xem cách:

```css hidden
body {
  font: 16px sans-serif;
}

.emailBox {
  padding-bottom: 20px;
}

.messageBox {
  padding-bottom: 20px;
}

label {
  line-height: 22px;
}

label::after {
  content: ":";
}
```

```html
<form>
  <div class="emailBox">
    <label for="emailAddress">Your email address</label><br />
    <input
      id="emailAddress"
      type="email"
      size="64"
      maxlength="64"
      required
      placeholder="username@beststartupever.com"
      pattern=".+@beststartupever\.com"
      title="Please provide only a Best Startup Ever corporate email address" />
  </div>

  <div class="messageBox">
    <label for="message">Request</label><br />
    <textarea
      id="message"
      cols="80"
      rows="8"
      required
      placeholder="My shoes are too tight, and I have forgotten how to dance."></textarea>
  </div>
  <input type="submit" value="Send Request" />
</form>
```

{{EmbedLiveSample("Pattern_validation", 700, 300)}}

{{HTMLElement("form")}} của chúng ta chứa một {{HTMLElement("input")}} kiểu `email` cho địa chỉ email của người dùng, một {{HTMLElement("textarea")}} để nhập tin nhắn cho IT, và một `<input>` kiểu [`"submit"`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) tạo nút gửi biểu mẫu. Mỗi ô nhập văn bản có {{HTMLElement("label")}} liên kết để cho người dùng biết điều gì được mong đợi từ họ.

Hãy xem kỹ hơn ô nhập địa chỉ email. Cả hai thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) đều được đặt thành 64 để hiển thị chỗ cho 64 ký tự địa chỉ email và giới hạn số ký tự thực sự được nhập tối đa là 64. Thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) được chỉ định, làm cho việc cung cấp địa chỉ email hợp lệ trở thành bắt buộc.

[`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) thích hợp được cung cấp — `username@beststartupever.com` — để mô tả cấu thành một mục hợp lệ. Chuỗi này mô tả cả địa chỉ email nên được nhập và gợi ý đó phải là tài khoản beststartupever.com của công ty. Điều này ngoài việc sử dụng kiểu `email` sẽ xác thực văn bản để đảm bảo nó được định dạng như địa chỉ email. Nếu văn bản trong ô nhập không phải là địa chỉ email, bạn sẽ nhận được thông báo lỗi trông giống như thế này:

![Invalid email address in error state with a popout from the input reading 'please enter an email address'.](enter-valid-email-address.png)

Nếu chúng ta dừng ở đây, ít nhất chúng ta sẽ xác thực trên các địa chỉ email hợp lệ. Nhưng chúng ta muốn đi xa hơn một bước: chúng ta muốn đảm bảo rằng địa chỉ email thực sự ở dạng `[username]@beststartupever.com`. Đây là lúc chúng ta dùng [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern). Chúng ta đặt `pattern` thành `.+@beststartupever.com`. Biểu thức chính quy này yêu cầu chuỗi gồm ít nhất một ký tự thuộc bất kỳ loại nào, sau đó là "@" theo sau là tên miền "beststartupever.com".

Lưu ý rằng đây không phải là bộ lọc đủ cho các địa chỉ email hợp lệ; nó sẽ cho phép những thứ như " @beststartupever.com" (lưu ý khoảng trắng đầu) hoặc "@@beststartupever.com", không cái nào hợp lệ. Tuy nhiên, trình duyệt chạy cả bộ lọc địa chỉ email tiêu chuẩn _và_ mẫu tùy chỉnh của chúng ta so với văn bản được chỉ định. Kết quả là, chúng ta có xác thực nói "đảm bảo điều này giống như địa chỉ email hợp lệ, và nếu có, hãy đảm bảo đó cũng là địa chỉ beststartupever.com."

Bạn nên dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) cùng với `pattern`. Nếu bạn làm như vậy, `title` _phải_ mô tả mẫu. Tức là nó phải giải thích định dạng dữ liệu nên có, thay vì bất kỳ thông tin nào khác. Đó là vì `title` có thể được hiển thị hoặc đọc như một phần của thông báo lỗi xác thực.

![A valid email address, but the input is in error state with a popout from the input reading 'The entered text doesn't match the required pattern. Please provide only a Best Startup Ever corporate email address.'](email-pattern-match-bad.png)

> [!NOTE]
> Nếu bạn gặp sự cố khi viết biểu thức chính quy xác thực và chúng không hoạt động đúng, hãy kiểm tra bảng điều khiển của trình duyệt; có thể có thông báo lỗi hữu ích để giúp bạn giải quyết vấn đề.

## Ví dụ

Ở đây chúng ta có đầu vào email với ID `emailAddress` được phép dài tối đa 256 ký tự. Ô nhập rộng 64 ký tự và hiển thị văn bản `user@example.gov` dưới dạng placeholder mỗi khi trường trống. Ngoài ra, bằng cách dùng thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple), ô được cấu hình để cho phép người dùng nhập không hoặc nhiều địa chỉ email, phân tách bằng dấu phẩy, như được mô tả trong [Cho phép nhiều địa chỉ email](#allowing_multiple_email_addresses). Cuối cùng, thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list) chứa ID của {{HTMLElement("datalist")}} có các {{HTMLElement("option")}} chỉ định một tập hợp các giá trị gợi ý mà người dùng có thể chọn.

Như một điểm bổ sung, phần tử {{HTMLElement("label")}} được dùng để thiết lập nhãn cho ô nhập email, với thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Elements/label#for) tham chiếu đến ID `emailAddress` của phần tử {{HTMLElement("input")}}. Bằng cách liên kết hai phần tử theo cách này, việc nhấp vào nhãn sẽ focus vào phần tử đầu vào.

```html
<label for="emailAddress">Email</label><br />
<input
  id="emailAddress"
  type="email"
  placeholder="user@example.gov"
  list="defaultEmails"
  size="64"
  maxlength="256"
  multiple />

<datalist id="defaultEmails">
  <option value="jbond007@mi6.defence.gov.uk"></option>
  <option value="jbourne@unknown.net"></option>
  <option value="nfury@shield.org"></option>
  <option value="tony@starkindustries.com"></option>
  <option value="hulk@grrrrrrrr.arg"></option>
</datalist>
```

{{EmbedLiveSample('Examples', 600, 80)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho địa chỉ email, hoặc rỗng
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>
        {{domxref("HTMLElement/change_event", "change")}} và
        {{domxref("Element/input_event", "input")}}
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete"><code>autocomplete</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#maxlength"><code>maxlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#minlength"><code>minlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#multiple"><code>multiple</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#name"><code>name</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#pattern"><code>pattern</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#placeholder"><code>placeholder</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#required"><code>required</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#size"><code>size</code></a>, và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#type"><code>type</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><code>list</code> và <code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        không có thuộc tính <code>list</code>:
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code><br />
        có thuộc tính <code>list</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role">combobox</a></code>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}}
- [`<input type="tel">`](/en-US/docs/Web/HTML/Reference/Elements/input/tel)
- [`<input type="url">`](/en-US/docs/Web/HTML/Reference/Elements/input/url)
- Thuộc tính:
  - [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list)
  - [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength)
  - [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength)
  - [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple)
  - [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern)
  - [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder)
  - [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly)
  - [`size`](/en-US/docs/Web/HTML/Reference/Attributes/size)
