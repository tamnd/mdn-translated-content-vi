---
title: "HTML attribute: autocomplete"
short-title: autocomplete
slug: Web/HTML/Reference/Attributes/autocomplete
page-type: html-attribute
browser-compat:
  - html.elements.form.autocomplete
  - html.elements.input.autocomplete
  - html.elements.select.autocomplete
  - html.elements.textarea.autocomplete
sidebar: htmlsidebar
---

Thuộc tính HTML `autocomplete` cho phép các nhà phát triển web chỉ định quyền hạn mà {{Glossary("user agent")}} có để cung cấp hỗ trợ tự động điền giá trị trường biểu mẫu, cũng như hướng dẫn cho trình duyệt về loại thông tin được mong đợi trong trường.

Nó khả dụng trên các phần tử {{HTMLElement("input")}} nhận giá trị văn bản hoặc số làm đầu vào, các phần tử {{HTMLElement("textarea")}}, {{HTMLElement("select")}} và {{HTMLElement("form")}}.

{{InteractiveExample("HTML Demo: autocomplete", "tabbed-shorter")}}

```html interactive-example
<label for="firstName">First Name:</label>
<input name="firstName" id="firstName" type="text" autocomplete="given-name" />

<label for="lastName">Last Name:</label>
<input name="lastName" id="lastName" type="text" autocomplete="family-name" />

<label for="email">Email:</label>
<input name="email" id="email" type="email" autocomplete="off" />
```

```css interactive-example
label {
  display: block;
  margin-top: 1rem;
}
```

## Mô tả

Thuộc tính `autocomplete` cung cấp gợi ý cho user agent chỉ định cách điền trước một điều khiển biểu mẫu. Giá trị thuộc tính là từ khóa `off` hoặc `on`, hoặc danh sách được sắp xếp theo thứ tự của các token được phân tách bằng dấu cách.

```html
<input autocomplete="off" />
<input autocomplete="on" />
<textarea autocomplete="shipping street-address"></textarea>
<input autocomplete="section-user1 billing postal-code" />
```

Nếu phần tử {{HTMLElement("input")}}, {{HTMLElement("select")}} hoặc {{HTMLElement("textarea")}} không có thuộc tính `autocomplete`, trình duyệt sẽ sử dụng [thuộc tính `autocomplete` của **biểu mẫu sở hữu** phần tử](/en-US/docs/Web/HTML/Reference/Elements/form#autocomplete). Biểu mẫu sở hữu là {{HTMLElement("form")}} khớp với `id` được chỉ định bởi thuộc tính [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form) của phần tử (nếu có) hoặc, phổ biến hơn, `<form>` mà phần tử được lồng trong đó.

> [!NOTE]
> Để cung cấp tự động hoàn thành, user-agents có thể yêu cầu các phần tử `<input>`/`<select>`/`<textarea>` phải:
>
> 1. Có thuộc tính `name` và/hoặc `id`
> 2. Là con của phần tử `<form>`
> 3. Được sở hữu bởi một biểu mẫu có nút {{HTMLElement("input/submit", "submit")}}

Nếu cùng một danh sách token được sử dụng trong nhiều hơn một điều khiển biểu mẫu, user-agent sẽ tự động hoàn thành tất cả các lần xuất hiện của cùng một giá trị `autocomplete` với cùng giá trị dữ liệu.

Một số token có thể được sử dụng nhiều lần với các giá trị mong đợi có khả năng khác nhau, chẳng hạn như token `zip-code` trong biểu mẫu chứa cả địa chỉ giao hàng và địa chỉ thanh toán. Bao gồm nhiều token khác nhau trong danh sách được phân tách bằng dấu cách khiến các điều khiển biểu mẫu liên quan được cung cấp các giá trị tự động hoàn thành duy nhất: trong trường hợp này, `autocomplete="shipping zip-code"` và `autocomplete="billing zip-code"`.

Một số giá trị tự động hoàn thành có thể cần được sử dụng nhiều lần. Ví dụ: biểu mẫu có thể chứa nhiều địa chỉ giao hàng và do đó nhiều lần xuất hiện của `"shipping zip-code"` trong khi vẫn mong đợi các giá trị khác nhau. Để làm cho giá trị tự động hoàn thành duy nhất trong những trường hợp này, token đầu tiên trong danh sách token được phân tách bằng dấu cách có thể là token `section-*`, trong đó tám ký tự đầu tiên của token luôn là chuỗi "section-", theo sau là chuỗi chữ và số. Tất cả các trường biểu mẫu được cung cấp token `section-*` với cùng chuỗi chữ và số đều thuộc cùng một **nhóm được đặt tên**.

Nếu bao gồm thuộc tính `autocomplete` trên các phần tử input ẩn {{HTMLElement("input/hidden", "hidden")}} (`<input type="hidden">`), giá trị của nó phải là danh sách token được phân tách bằng dấu cách được sắp xếp; các từ khóa `on` và `off` không được phép.

Nguồn giá trị được gợi ý thường do trình duyệt quyết định; thông thường các giá trị đến từ các giá trị đã nhập trước đó của người dùng, nhưng chúng cũng có thể đến từ các giá trị được cấu hình sẵn. Ví dụ: trình duyệt có thể cho phép người dùng lưu tên, địa chỉ, số điện thoại và địa chỉ email để tự động hoàn thành. Trình duyệt cũng có thể cung cấp khả năng lưu thông tin thẻ tín dụng được mã hóa, để tự động hoàn thành sau quy trình xác thực.

> [!NOTE]
> Thuộc tính `autocomplete` cũng kiểm soát liệu Firefox có — không giống các trình duyệt khác — [duy trì trạng thái disabled động và (nếu có) trạng thái checked động](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing) của phần tử `<input>`, phần tử `<textarea>`, hoặc toàn bộ `<form>` khi tải lại trang hay không. Tính năng duy trì được bật theo mặc định. Đặt giá trị của thuộc tính `autocomplete` thành `off` sẽ vô hiệu hóa tính năng này. Điều này hoạt động ngay cả khi thuộc tính `autocomplete` thông thường sẽ không áp dụng do kiểu của nó. Xem [Firefox bug 654072](https://bugzil.la/654072).

## Giá trị

Giá trị thuộc tính là từ khóa `off` hoặc `on`, hoặc danh sách `<token-list>` được phân tách bằng dấu cách mô tả ý nghĩa của giá trị tự động hoàn thành.

- `off`
  - : Trình duyệt không được phép tự động nhập hoặc chọn giá trị cho trường này. Có thể tài liệu hoặc ứng dụng cung cấp tính năng tự động hoàn thành riêng, hoặc có lo ngại về bảo mật yêu cầu giá trị của trường không được tự động nhập.

    > [!NOTE]
    > Trong hầu hết các trình duyệt hiện đại, đặt `autocomplete` thành `"off"` sẽ không ngăn trình quản lý mật khẩu hỏi người dùng xem họ có muốn lưu thông tin tên người dùng và mật khẩu không, hoặc tự động điền các giá trị đó trong biểu mẫu đăng nhập của trang web. Xem [Quản lý autofill cho trường đăng nhập](/en-US/docs/Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion#managing_autofill_for_login_fields).

- `on`
  - : Trình duyệt được phép tự động hoàn thành đầu vào. Không có hướng dẫn nào được cung cấp về loại dữ liệu mong đợi trong trường, vì vậy trình duyệt có thể sử dụng phán xét của mình.

- `<token-list>`
  - : Tập hợp được sắp xếp của [các token được phân tách bằng dấu cách](#token_list_tokens) bao gồm các token chi tiết autofill đi trước các token nhóm phân đoạn tùy chọn và nhóm giao hàng hoặc thanh toán. Số điện thoại, địa chỉ email và các token giao thức nhắn tin đứng trước token xác định loại người nhận.

Xem [Tiêu chuẩn WHATWG](https://html.spec.whatwg.org/multipage/forms.html#autofill) để biết thêm thông tin chi tiết.

### Các token trong danh sách token

Các tùy chọn `<token-list>` bao gồm, theo thứ tự:

1. [Token đặt tên nhóm](#named_groups)
2. [Định danh nhóm](#grouping_identifier)
3. [Token chi tiết](#detail_tokens)
4. [Ủy quyền web](#web_authorization_token)

#### Nhóm được đặt tên

Để tạo một nhóm trường biểu mẫu được đặt tên, token `section-*` tùy chọn có thể được sử dụng. Nếu có, token này phải là token đầu tiên trong danh sách token được phân tách bằng dấu cách.

- `section-*`
  - : Xác định tên cho một nhóm điều khiển biểu mẫu. Token có tám ký tự đầu tiên là chuỗi "section-", không phân biệt hoa thường, theo sau là các ký tự bổ sung. Tất cả các điều khiển biểu mẫu bắt đầu bằng cùng một token thuộc nhóm được đặt tên.

#### Định danh nhóm

Định danh nhóm tùy chọn `shipping` hoặc `billing`

- `shipping`
  - : Trường được xác định bởi các token tiếp theo là một phần của địa chỉ giao hàng hoặc thông tin liên hệ
- `billing`
  - : Trường được xác định bởi các token tiếp theo là một phần của địa chỉ thanh toán hoặc thông tin liên hệ

#### Token chi tiết

Mỗi danh sách token chi tiết được phân tách bằng dấu cách bao gồm loại người nhận với thông tin liên lạc kỹ thuật số, theo thứ tự đó, hoặc danh sách token được phân tách bằng dấu cách của các token khác.

##### Loại người nhận

Các token xác định loại người nhận bao gồm:

- `home`
  - : Loại liên lạc được xác định bởi các token tiếp theo là để liên hệ với người nhận tại nơi ở của họ.
- `work`
  - : Loại liên lạc được xác định bởi các token tiếp theo là để liên hệ với người nhận tại nơi làm việc của họ.
- `mobile`
  - : Loại liên lạc được xác định bởi các token tiếp theo là để liên hệ với người nhận bất kể vị trí.
- `fax`
  - : Người nhận được xác định bởi các token tiếp theo là cho máy fax.
- `pager`
  - : Người nhận được xác định bởi các token tiếp theo là cho máy nhắn tin hoặc pager.

##### Token liên lạc kỹ thuật số

Token hoặc nhóm token cho số điện thoại hoặc các bộ phận cấu thành của số, phần mở rộng điện thoại, địa chỉ email hoặc giao thức nhắn tin tức thì.

- `tel`
  - : Số điện thoại đầy đủ, bao gồm mã quốc gia. Nếu bạn cần chia nhỏ số điện thoại thành các bộ phận, bạn có thể sử dụng các giá trị này cho các trường đó:
    - `tel-country-code`
      - : Mã quốc gia, chẳng hạn như "1" cho Hoa Kỳ, Canada và các khu vực khác ở Bắc Mỹ và một phần của vùng Caribe.
    - `tel-national`
      - : Toàn bộ số điện thoại không có bộ phận mã quốc gia, bao gồm tiền tố nội bộ quốc gia nếu có. Đối với số điện thoại "1-855-555-6502", giá trị của trường này sẽ là "855-555-6502".
    - `tel-area-code`
      - : Mã vùng, với bất kỳ tiền tố nội bộ quốc gia nào được áp dụng nếu thích hợp.
    - `tel-local`
      - : Số điện thoại không có mã quốc gia hoặc vùng. Điều này có thể được chia nhỏ hơn thành hai phần, đối với số điện thoại có số tổng đài và sau đó là số trong tổng đài. Đối với số điện thoại "555-6502", hãy sử dụng `tel-local-prefix` cho "555" và `tel-local-suffix` cho "6502".

- `tel-extension`
  - : Mã phần mở rộng điện thoại trong số điện thoại, chẳng hạn như số phòng hoặc dãy phòng trong khách sạn hoặc phần mở rộng văn phòng trong công ty.
- `email`
  - : Địa chỉ email.
- `impp`
  - : URL cho điểm cuối giao thức nhắn tin tức thì, chẳng hạn như `xmpp:username@example.net`.

##### Các token khác

Khi trường biểu mẫu không phải là số điện thoại, địa chỉ email hoặc giao thức nhắn tin tức thì, danh sách token được phân tách bằng dấu cách không được đứng trước loại liên lạc:

- `name`
  - : Trường mong đợi giá trị là tên đầy đủ của người. Sử dụng `name` thay vì chia tên thành các bộ phận của nó thường được ưu tiên hơn vì nó tránh phải xử lý sự đa dạng của tên người và cách chúng được cấu trúc; tuy nhiên, bạn có thể sử dụng các giá trị `autocomplete` sau đây nếu bạn cần chia nhỏ tên thành các bộ phận:
    - `honorific-prefix`
      - : Tiền tố hoặc chức danh, chẳng hạn như "Mrs.", "Mr.", "Miss", "Ms.", "Dr.", hoặc "Mlle.".
    - `given-name`
      - : Tên đệm (hoặc "tên đầu").
    - `additional-name`
      - : Tên đệm.
    - `family-name`
      - : Họ (hoặc "tên cuối").
    - `honorific-suffix`
      - : Hậu tố, chẳng hạn như "Jr.", "B.Sc.", "PhD.", "MBASW", hoặc "IV".
    - `nickname`
      - : Biệt danh hoặc tên người dùng.

- `username`
  - : Tên người dùng hoặc tên tài khoản.
- `new-password`
  - : Mật khẩu mới. Khi tạo tài khoản mới hoặc thay đổi mật khẩu, điều này nên được sử dụng cho trường "Nhập mật khẩu mới" hoặc "Xác nhận mật khẩu mới", trái ngược với trường "Nhập mật khẩu hiện tại" thông thường có thể có mặt. Điều này có thể được sử dụng bởi trình duyệt cả để tránh vô tình điền mật khẩu hiện có và để cung cấp hỗ trợ tạo mật khẩu an toàn.
- `current-password`
  - : Mật khẩu hiện tại của người dùng.
- `one-time-code`
  - : Mật khẩu một lần (OTP) để xác minh danh tính người dùng được sử dụng như một yếu tố bổ sung trong quy trình đăng nhập.
    Thường gặp nhất đây là mã nhận qua một số cơ chế ngoài kênh, chẳng hạn như SMS, email hoặc ứng dụng xác thực.
- `organization-title`
  - : Chức danh công việc, hoặc chức danh một người có trong tổ chức, chẳng hạn như "Kỹ sư kỹ thuật cao cấp", "Chủ tịch", hoặc "Trưởng nhóm".
- `organization`
  - : Tên công ty hoặc tổ chức, chẳng hạn như "Acme Widget Company" hoặc "Girl Scouts of America".
- `street-address`
  - : Địa chỉ đường phố. Điều này có thể là nhiều dòng văn bản và phải xác định đầy đủ vị trí địa chỉ trong cấp hành chính thứ hai (thường là thành phố hoặc thị trấn), nhưng không nên bao gồm tên thành phố, mã bưu chính hoặc tên quốc gia.
    - `address-line1`, `address-line2`, `address-line3`
      - : Mỗi dòng riêng lẻ của địa chỉ đường phố. Chỉ nên có mặt nếu `street-address` vắng mặt.
- `address-level4`
  - : Cấp [hành chính](#administrative_levels_in_addresses) chi tiết nhất, trong địa chỉ có bốn cấp.
- `address-level3`
  - : Cấp [hành chính](#administrative_levels_in_addresses) thứ ba, trong địa chỉ có ít nhất ba cấp hành chính.
- `address-level2`
  - : Cấp [hành chính](#administrative_levels_in_addresses) thứ hai, trong địa chỉ có ít nhất hai cấp. Ở các quốc gia có hai cấp hành chính, đây thường là thành phố, thị trấn, làng hoặc địa phương khác nơi địa chỉ tọa lạc.
- `address-level1`
  - : Cấp [hành chính](#administrative_levels_in_addresses) đầu tiên trong địa chỉ. Đây thường là tỉnh nơi địa chỉ tọa lạc. Ở Hoa Kỳ, đây sẽ là tiểu bang. Ở Thụy Sĩ, bang. Ở Vương quốc Anh, quận.
- `country`
  - : Mã quốc gia hoặc vùng lãnh thổ.
- `country-name`
  - : Tên quốc gia hoặc vùng lãnh thổ.
- `postal-code`
  - : Mã bưu chính (ở Hoa Kỳ, đây là mã ZIP).

- `cc-name`
  - : Tên đầy đủ được in trên hoặc liên kết với phương tiện thanh toán như thẻ tín dụng. Sử dụng trường tên đầy đủ thường được ưu tiên hơn, so với việc chia tên thành các phần.
    - `cc-given-name`
      - : Tên (đầu) như được ghi trên phương tiện thanh toán như thẻ tín dụng.
    - `cc-additional-name`
      - : Tên đệm như được ghi trên phương tiện thanh toán hoặc thẻ tín dụng.
    - `cc-family-name`
      - : Họ, như được ghi trên thẻ tín dụng.
- `cc-number`
  - : Số thẻ tín dụng hoặc số khác xác định phương thức thanh toán, chẳng hạn như số tài khoản.
- `cc-exp`
  - : Ngày hết hạn của phương thức thanh toán, thường ở dạng "MM/YY" hoặc "MM/YYYY".
    - `cc-exp-month`
      - : Tháng phương thức thanh toán hết hạn.
    - `cc-exp-year`
      - : Năm phương thức thanh toán hết hạn.
- `cc-csc`
  - : Mã bảo mật cho phương tiện thanh toán; trên thẻ tín dụng, đây là số xác minh 3 chữ số ở mặt sau của thẻ.
- `cc-type`
  - : Loại phương tiện thanh toán (chẳng hạn như "Visa" hoặc "Master Card").
- `transaction-currency`
  - : Tiền tệ giao dịch sẽ diễn ra.
- `transaction-amount`
  - : Số tiền, tính theo đơn vị tiền tệ được chỉ định bởi `transaction-currency`, của giao dịch, cho biểu mẫu thanh toán.
- `language`
  - : Ngôn ngữ ưu tiên, được cung cấp dưới dạng {{glossary("BCP 47 language tag")}} hợp lệ.
- `bday`
  - : Ngày sinh, dưới dạng ngày đầy đủ.
    - `bday-day`
      - : Ngày trong tháng của ngày sinh.
    - `bday-month`
      - : Tháng trong năm của ngày sinh.
    - `bday-year`
      - : Năm của ngày sinh.
- `sex`
  - : Nhận dạng giới tính (chẳng hạn như "Female", "Fa'afafine", "Hijra", "Male", "Nonbinary"), dưới dạng văn bản tự do không có dòng mới.
- `url`
  - : URL, chẳng hạn như trang chủ hoặc địa chỉ trang web công ty khi phù hợp với ngữ cảnh của các trường khác trong biểu mẫu.
- `photo`
  - : URL của hình ảnh đại diện cho người, công ty hoặc thông tin liên hệ được đưa ra trong các trường khác trong biểu mẫu.

#### Token ủy quyền web

Với {{htmlelement("input")}} và {{htmlelement("textarea")}}, token `webauthn` có thể được bao gồm sau cùng để chỉ ra rằng user agent nên hiển thị thông tin đăng nhập khóa công khai khi người dùng tương tác với điều khiển.

- `webauthn`
  - : Passkey được tạo bởi [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API), được yêu cầu bởi lệnh gọi {{domxref("CredentialsContainer.get()", "navigator.credentials.get()")}} có điều kiện (tức là lệnh gọi bao gồm `mediation: 'conditional'`). Nếu được bao gồm, đây là token cuối cùng trong danh sách token được phân tách bằng dấu cách. Xem [Đăng nhập bằng passkey qua autofill biểu mẫu](https://web.dev/articles/passkey-form-autofill) để biết thêm chi tiết.

## Khả năng tiếp cận

Sử dụng các giá trị `autocomplete` thích hợp giúp người dùng bị khuyết tật nhận thức, khiếm khuyết vận động và các tình trạng khác điền biểu mẫu nhanh hơn và chính xác hơn bằng cách giảm nhu cầu nhập và ghi nhớ thông tin. Khi trình duyệt có thể xác định mục đích của trường biểu mẫu thông qua giá trị `autocomplete` của nó, nó có thể cung cấp dữ liệu đã lưu như tên, địa chỉ và thông tin thanh toán, điều này có lợi cho tất cả người dùng nhưng đặc biệt quan trọng cho những người khó nhập dữ liệu thủ công.

Cung cấp các token autocomplete hợp lệ cũng thỏa mãn [WCAG 2.2 Success Criterion 1.3.5: Xác định mục đích đầu vào](https://www.w3.org/WAI/WCAG22/Understanding/identify-input-purpose) (Cấp AA), yêu cầu mục đích của các trường đầu vào thu thập thông tin người dùng có thể được xác định theo chương trình. Điều này cho phép user agents và công nghệ hỗ trợ áp dụng các trình bày được cá nhân hóa, chẳng hạn như hiển thị các biểu tượng quen thuộc bên cạnh các trường, để giúp người dùng hiểu và hoàn thành biểu mẫu.

### Tránh vô hiệu hóa autocomplete

Đặt `autocomplete="off"` ngăn trình duyệt cung cấp dữ liệu đã lưu cho một trường. Mặc dù các nhà phát triển đôi khi sử dụng điều này để ngăn tự động điền vì lý do bảo mật (chẳng hạn như mã một lần), nhưng nó loại bỏ một tính năng mà nhiều người dùng phụ thuộc vào. Người dùng bị khuyết tật nhận thức có thể dựa vào autocomplete để nhớ lại thông tin cá nhân, và người dùng bị khiếm khuyết vận động hưởng lợi từ việc giảm nhập liệu. Trình duyệt cũng có thể bỏ qua `autocomplete="off"` trên các trường đăng nhập để hỗ trợ trình quản lý mật khẩu.

### Tránh các giá trị autocomplete không hợp lệ

Sử dụng các giá trị không hợp lệ hoặc không chuẩn (chẳng hạn như các chuỗi tự tạo để tránh autofill) có hiệu ứng tương tự: trình duyệt không thể khớp trường với bất kỳ mục đích nào đã biết, vì vậy nó không thể cung cấp các gợi ý liên quan. Điều này cũng không đáp ứng yêu cầu WCAG nêu trên, vì mục đích đầu vào không còn có thể xác định theo chương trình. Nếu bạn cần tắt autofill cho một trường cụ thể, hãy cân nhắc chỉ sử dụng `autocomplete="off"` khi thực sự cần thiết (chẳng hạn như cho CAPTCHA hoặc các trường token một lần) thay vì áp dụng rộng rãi trên một biểu mẫu.

## Ví dụ

```html
<div>
  <label for="cc-number">Enter your credit card number</label>
  <input name="cc-number" id="cc-number" autocomplete="off" />
</div>
```

### Các cấp hành chính trong địa chỉ

Bốn trường cấp hành chính (`address-level1` đến `address-level4`) mô tả địa chỉ theo các cấp độ chính xác ngày càng tăng trong quốc gia nơi địa chỉ tọa lạc. Mỗi quốc gia có hệ thống cấp hành chính riêng và có thể sắp xếp các cấp theo thứ tự khác nhau khi viết địa chỉ.

`address-level1` luôn đại diện cho phân chia hành chính rộng nhất; đây là phần ít cụ thể nhất của địa chỉ ngoài tên quốc gia.

### Tính linh hoạt bố cục biểu mẫu

Do các quốc gia khác nhau viết địa chỉ theo những cách khác nhau, với mỗi trường ở các vị trí khác nhau trong địa chỉ, và thậm chí là các bộ và số lượng trường khác nhau, sẽ hữu ích nếu khi có thể, trang web của bạn có thể chuyển sang bố cục mà người dùng mong đợi khi hiển thị biểu mẫu nhập địa chỉ, cho quốc gia mà địa chỉ tọa lạc.

### Biến thể

Cách sử dụng mỗi cấp hành chính sẽ thay đổi từ quốc gia này sang quốc gia khác. Dưới đây là một số ví dụ; đây không phải là danh sách đầy đủ.

#### Hoa Kỳ

Địa chỉ nhà điển hình ở Hoa Kỳ trông như thế này:

432 Anywhere St
Exampleville CA 95555

Ở Hoa Kỳ, phần ít cụ thể nhất của địa chỉ là tiểu bang, trong trường hợp này là "CA" (viết tắt chính thức của US Postal Service cho "California"). Vì vậy `address-level1` là tiểu bang, hoặc "CA" trong trường hợp này.

Phần ít cụ thể thứ hai của địa chỉ là tên thành phố hoặc thị trấn, vì vậy `address-level2` là "Exampleville" trong địa chỉ ví dụ này.

Địa chỉ Hoa Kỳ không sử dụng cấp 3 trở lên.

#### Vương quốc Anh

Các biểu mẫu nhập địa chỉ ở Anh nên chứa một hoặc hai cấp địa chỉ và một, hai hoặc ba dòng địa chỉ, tùy thuộc vào địa chỉ. Một địa chỉ đầy đủ sẽ trông như thế này:

103 Frogmarch Street
Upper-Wapping
Winchelsea
Whereshire
TN99 8ZZ

Các cấp địa chỉ là:

- `address-level1`: Quận — "Whereshire" trong trường hợp này.
- `address-level2`: Thị trấn bưu chính — "Winchelsea" trong trường hợp này.
- `address-line2`: Địa phương — "Upper-Wapping" trong trường hợp này.
- `address-line1`: Thông tin nhà/đường phố — "103 Frogmarch Street".

Mã bưu chính là riêng biệt. Lưu ý rằng bạn thực sự chỉ có thể sử dụng mã bưu chính và `address-line1` để giao thư thành công ở Anh, vì vậy chúng nên là các mục bắt buộc duy nhất, nhưng thông thường mọi người cung cấp thêm chi tiết.

#### Trung Quốc

Trung Quốc có thể sử dụng tới ba cấp hành chính: tỉnh, thành phố và quận.

Mã bưu chính 6 chữ số không phải lúc nào cũng cần thiết nhưng khi được cung cấp thì được đặt riêng với nhãn để rõ ràng. Ví dụ:

北京市东城区建国门北大街 8 号华润大厦 17 层 1708 单元
邮编：100005

#### Nhật Bản

Địa chỉ ở Nhật Bản thường được **viết theo một dòng**, theo thứ tự từ phần ít cụ thể nhất đến cụ thể hơn (theo **thứ tự ngược lại so với Hoa Kỳ**). Có hai hoặc ba cấp hành chính trong một địa chỉ. Dòng bổ sung có thể được sử dụng để hiển thị tên tòa nhà và số phòng. Mã bưu chính là riêng biệt. Ví dụ:

〒 381-0000
長野県長野市某町 123

"〒" và bảy chữ số tiếp theo là mã bưu chính.

`address-level1` được sử dụng cho các tỉnh hoặc Tokyo Metropolis; "長野県" (Tỉnh Nagano) trong trường hợp này. `address-level2` thường được sử dụng cho các thành phố, hạt, thị trấn và làng; "長野市" (Thành phố Nagano) trong trường hợp này. "某町 123" là `address-line1` bao gồm tên khu vực và số lô.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("input")}}
- Phần tử {{htmlelement("select")}}
- Phần tử {{htmlelement("textarea")}}
- Phần tử {{htmlelement("form")}}
- [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
