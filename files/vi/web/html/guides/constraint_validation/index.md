---
title: Using HTML form validation and the Constraint Validation API
short-title: Constraint validation
slug: Web/HTML/Guides/Constraint_validation
page-type: guide
sidebar: htmlsidebar
---

Việc tạo biểu mẫu web luôn là một tác vụ phức tạp. Trong khi việc đánh dấu bản thân biểu mẫu thì dễ dàng, việc kiểm tra xem mỗi trường có giá trị hợp lệ và nhất quán hay không thì khó hơn, và việc thông báo cho người dùng về vấn đề có thể trở thành một bài toán đau đầu. [HTML5](/en-US/docs/Glossary/HTML5) đã giới thiệu các cơ chế mới cho biểu mẫu: nó đã thêm các loại ngữ nghĩa mới cho phần tử {{ HTMLElement("input") }} và _constraint validation_ để dễ dàng kiểm tra nội dung biểu mẫu ở phía client. Các ràng buộc cơ bản, thông thường có thể được kiểm tra mà không cần JavaScript, bằng cách đặt các thuộc tính mới; các ràng buộc phức tạp hơn có thể được kiểm tra bằng cách sử dụng Constraint Validation API.

Để có phần giới thiệu cơ bản về các khái niệm này, với ví dụ, hãy xem [hướng dẫn xác thực biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation).

> [!NOTE]
> HTML Constraint validation không loại bỏ nhu cầu xác thực ở _phía server_. Mặc dù ít yêu cầu biểu mẫu không hợp lệ hơn được mong đợi, các yêu cầu không hợp lệ vẫn có thể được gửi theo nhiều cách:
>
> - Bằng cách sửa đổi HTML qua công cụ dành cho nhà phát triển của trình duyệt.
> - Bằng cách tạo thủ công một yêu cầu HTTP mà không sử dụng biểu mẫu.
> - Bằng cách lập trình viết nội dung vào biểu mẫu (một số xác thực ràng buộc _chỉ chạy_ cho đầu vào của người dùng, và không chạy nếu bạn đặt giá trị của trường biểu mẫu bằng JavaScript).
>
> Do đó, bạn nên luôn xác thực dữ liệu biểu mẫu ở phía server, nhất quán với những gì được thực hiện ở phía client.

## Ràng buộc nội tại và cơ bản

Trong HTML, các ràng buộc cơ bản được khai báo theo hai cách:

- Bằng cách chọn giá trị ngữ nghĩa phù hợp nhất cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) của phần tử {{ HTMLElement("input") }}, ví dụ, chọn loại `email` tự động tạo ra một ràng buộc kiểm tra xem giá trị có phải là địa chỉ email hợp lệ hay không.
- Bằng cách đặt giá trị trên các thuộc tính liên quan đến xác thực, cho phép mô tả các ràng buộc cơ bản mà không cần JavaScript.

### Loại input ngữ nghĩa

Các ràng buộc nội tại cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là:

| Loại Input                                                                    | Mô tả ràng buộc                                                                                                                                                                      | Vi phạm liên quan                                                                    |
| ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| [`<input type="URL">`](/en-US/docs/Web/HTML/Reference/Elements/input/url)     | Giá trị phải là [URL](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL) tuyệt đối, như được định nghĩa trong [URL Living Standard](https://url.spec.whatwg.org/). | Vi phạm ràng buộc **[TypeMismatch](/en-US/docs/Web/API/ValidityState/typeMismatch)** |
| [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email) | Giá trị phải là địa chỉ email hợp lệ về mặt cú pháp, thường có dạng `username@hostname.tld` nhưng cũng có thể là địa phương như `username@hostname`.                                 | Vi phạm ràng buộc **[TypeMismatch](/en-US/docs/Web/API/ValidityState/typeMismatch)** |

Đối với loại input `email`, nếu thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple) được đặt, có thể đặt nhiều giá trị dưới dạng danh sách phân cách bởi dấu phẩy. Nếu bất kỳ giá trị nào trong danh sách không thỏa mãn điều kiện được mô tả ở đây, vi phạm ràng buộc **Type mismatch** sẽ được kích hoạt.

Lưu ý rằng hầu hết các loại input không có ràng buộc nội tại, vì một số bị ngăn khỏi constraint validation hoặc có thuật toán làm sạch chuyển đổi các giá trị không đúng sang giá trị mặc định đúng.

### Thuộc tính liên quan đến xác thực

Ngoài thuộc tính `type` được mô tả ở trên, các thuộc tính sau được sử dụng để mô tả các ràng buộc cơ bản:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Thuộc tính</th>
      <th scope="col">Loại input hỗ trợ thuộc tính</th>
      <th scope="col">Giá trị có thể</th>
      <th scope="col">Mô tả ràng buộc</th>
      <th scope="col">Vi phạm liên quan</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/HTML/Reference/Attributes/pattern">pattern</a></code
        >
      </td>
      <td>
        <code>text</code>, <code>search</code>, <code>url</code>,
        <code>tel</code>, <code>email</code>, <code>password</code>
      </td>
      <td>
        Một
        <a href="/en-US/docs/Web/JavaScript/Guide/Regular_expressions"
          >biểu thức chính quy JavaScript</a
        >
        (được biên dịch với các cờ {{jsxref("RegExp.global", "global")}}, {{jsxref("RegExp.ignoreCase", "ignoreCase")}}, và
        {{jsxref("RegExp.multiline", "multiline")}} bị <em>vô hiệu hóa</em>)
      </td>
      <td>Giá trị phải khớp với pattern.</td>
      <td>
        Vi phạm ràng buộc
        <a href="/en-US/docs/Web/API/ValidityState/patternMismatch"
          ><strong><code>patternMismatch</code></strong></a
        >
      </td>
    </tr>
    <tr>
      <td rowspan="3">
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/min">min</a></code>
      </td>
      <td><code>range</code>, <code>number</code></td>
      <td>Một số hợp lệ</td>
      <td rowspan="3">Giá trị phải lớn hơn hoặc bằng giá trị.</td>
      <td rowspan="3">
        Vi phạm ràng buộc
        <strong
          ><code
            ><a href="/en-US/docs/Web/API/ValidityState/rangeUnderflow"
              >rangeUnderflow</a
            ></code
          ></strong
        >
      </td>
    </tr>
    <tr>
      <td><code>date</code>, <code>month</code>, <code>week</code></td>
      <td>Một ngày hợp lệ</td>
    </tr>
    <tr>
      <td>
        <code>datetime-local</code>, <code>time</code>
      </td>
      <td>Một ngày và giờ hợp lệ</td>
    </tr>
    <tr>
      <td rowspan="3">
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/max">max</a></code>
      </td>
      <td><code>range</code>, <code>number</code></td>
      <td>Một số hợp lệ</td>
      <td rowspan="3">Giá trị phải nhỏ hơn hoặc bằng giá trị</td>
      <td rowspan="3">
        Vi phạm ràng buộc
        <strong
          ><code
            ><a href="/en-US/docs/Web/API/ValidityState/rangeOverflow"
              >rangeOverflow</a
            ></code
          ></strong
        >
      </td>
    </tr>
    <tr>
      <td><code>date</code>, <code>month</code>, <code>week</code></td>
      <td>Một ngày hợp lệ</td>
    </tr>
    <tr>
      <td>
        <code>datetime-local</code>, <code>time</code>
      </td>
      <td>Một ngày và giờ hợp lệ</td>
    </tr>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/HTML/Reference/Attributes/required">required</a></code
        >
      </td>
      <td>
        <code>text</code>, <code>search</code>, <code>url</code>,
        <code>tel</code>, <code>email</code>, <code>password</code>,
        <code>date</code>, <code>datetime-local</code>,
        <code>month</code>, <code>week</code>, <code>time</code>,
        <code>number</code>, <code>checkbox</code>, <code>radio</code>,
        <code>file</code>; cũng trên các phần tử {{ HTMLElement("select") }} và
        {{ HTMLElement("textarea") }}
      </td>
      <td>
        <em>không có</em> vì đây là thuộc tính Boolean: sự hiện diện của nó có nghĩa là
        <em>true</em>, sự vắng mặt của nó có nghĩa là <em>false</em>
      </td>
      <td>Phải có giá trị (nếu được đặt).</td>
      <td>
        Vi phạm ràng buộc
        <strong
          ><code
            ><a href="/en-US/docs/Web/API/ValidityState/valueMissing"
              >valueMissing</a
            ></code
          ></strong
        >
      </td>
    </tr>
    <tr>
      <td rowspan="5">
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/step">step</a></code>
      </td>
      <td><code>date</code></td>
      <td>Một số nguyên số ngày</td>
      <td rowspan="5">
        Trừ khi step được đặt thành literal <code>any</code>, giá trị phải
        là <strong>min</strong> + bội số nguyên của step.
      </td>
      <td rowspan="5">
        Vi phạm ràng buộc
        <strong
          ><code
            ><a href="/en-US/docs/Web/API/ValidityState/stepMismatch"
              >stepMismatch</a
            ></code
          ></strong
        >
      </td>
    </tr>
    <tr>
      <td><code>month</code></td>
      <td>Một số nguyên số tháng</td>
    </tr>
    <tr>
      <td><code>week</code></td>
      <td>Một số nguyên số tuần</td>
    </tr>
    <tr>
      <td>
        <code>datetime-local</code>, <code>time</code>
      </td>
      <td>Một số nguyên số giây</td>
    </tr>
    <tr>
      <td><code>range</code>, <code>number</code></td>
      <td>Một số nguyên</td>
    </tr>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/HTML/Reference/Attributes/minlength"
            >minlength</a
          ></code
        >
      </td>
      <td>
        <code>text</code>, <code>search</code>, <code>url</code>,
        <code>tel</code>, <code>email</code>, <code>password</code>; cũng trên
        phần tử {{ HTMLElement("textarea") }}
      </td>
      <td>Độ dài nguyên</td>
      <td>
        Số ký tự (code point) không được ít hơn giá trị
        của thuộc tính, nếu không rỗng. Tất cả các ký tự xuống dòng được chuẩn hóa thành một
        ký tự duy nhất (thay vì cặp CRLF) cho
        {{ HTMLElement("textarea") }}.
      </td>
      <td>
        Vi phạm ràng buộc
        <strong
          ><code
            ><a href="/en-US/docs/Web/API/ValidityState/tooShort"
              >tooShort</a
            ></code
          ></strong
        >
      </td>
    </tr>
    <tr>
      <td>
        <code
          ><a href="/en-US/docs/Web/HTML/Reference/Attributes/maxlength"
            >maxlength</a
          ></code
        >
      </td>
      <td>
        <code>text</code>, <code>search</code>, <code>url</code>,
        <code>tel</code>, <code>email</code>, <code>password</code>; cũng trên
        phần tử {{ HTMLElement("textarea") }}
      </td>
      <td>Độ dài nguyên</td>
      <td>
        Số ký tự (code point) không được vượt quá giá trị của
        thuộc tính.
      </td>
      <td>
        Vi phạm ràng buộc
        <strong
          ><code
            ><a href="/en-US/docs/Web/API/ValidityState/tooLong"
              >tooLong</a
            ></code
          ></strong
        >
      </td>
    </tr>
  </tbody>
</table>

## Quy trình constraint validation

Constraint validation được thực hiện thông qua Constraint Validation API trên một phần tử biểu mẫu đơn lẻ hoặc ở mức độ biểu mẫu, trên chính phần tử {{ HTMLElement("form") }}. Constraint validation được thực hiện theo các cách sau:

- Bằng một lệnh gọi đến phương thức `checkValidity()` hoặc `reportValidity()` của interface DOM liên quan đến biểu mẫu, ([`HTMLInputElement`](/en-US/docs/Web/API/HTMLInputElement), [`HTMLSelectElement`](/en-US/docs/Web/API/HTMLSelectElement), [`HTMLButtonElement`](/en-US/docs/Web/API/HTMLButtonElement), [`HTMLOutputElement`](/en-US/docs/Web/API/HTMLOutputElement) hoặc [`HTMLTextAreaElement`](/en-US/docs/Web/API/HTMLTextAreaElement)), chỉ đánh giá các ràng buộc trên phần tử này, cho phép script lấy thông tin này. Phương thức `checkValidity()` trả về Boolean cho biết giá trị của phần tử có vượt qua các ràng buộc của nó hay không. (Điều này thường được thực hiện bởi user-agent khi xác định pseudo-class CSS nào, {{ Cssxref(":valid") }} hay {{ Cssxref(":invalid") }}, áp dụng.) Ngược lại, phương thức `reportValidity()` báo cáo bất kỳ sự cố ràng buộc nào cho người dùng.
- Bằng một lệnh gọi đến phương thức `checkValidity()` hoặc `reportValidity()` trên interface [`HTMLFormElement`](/en-US/docs/Web/API/HTMLFormElement).
- Bằng cách gửi chính biểu mẫu.

Gọi `checkValidity()` được gọi là _tĩnh_ để xác thực các ràng buộc, trong khi gọi `reportValidity()` hoặc gửi biểu mẫu được gọi là _tương tác_ để xác thực các ràng buộc.

> [!NOTE]
>
> - Nếu thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) được đặt trên phần tử {{ HTMLElement("form") }}, xác thực ràng buộc tương tác sẽ không xảy ra.
> - Gọi phương thức `submit()` trên interface [`HTMLFormElement`](/en-US/docs/Web/API/HTMLFormElement) không kích hoạt constraint validation. Nói cách khác, phương thức này gửi dữ liệu biểu mẫu đến server ngay cả khi nó không thỏa mãn các ràng buộc. Thay vào đó, hãy gọi phương thức `click()` trên nút submit.
> - Các ràng buộc `minlength` và `maxlength` chỉ được kiểm tra trên đầu vào do người dùng cung cấp. Chúng không được kiểm tra nếu giá trị được đặt theo cách lập trình, ngay cả khi gọi `checkValidity()` hoặc `reportValidity()` một cách rõ ràng.

## Các ràng buộc phức tạp sử dụng Constraint Validation API

Sử dụng JavaScript và Constraint API, có thể triển khai các ràng buộc phức tạp hơn, ví dụ, các ràng buộc kết hợp nhiều trường, hoặc các ràng buộc liên quan đến các phép tính phức tạp.

Về cơ bản, ý tưởng là kích hoạt JavaScript trên một số sự kiện trường biểu mẫu (như **onchange**) để tính toán xem ràng buộc có bị vi phạm hay không, và sau đó sử dụng phương thức `field.setCustomValidity()` để đặt kết quả của việc xác thực: một chuỗi rỗng có nghĩa là ràng buộc được thỏa mãn, và bất kỳ chuỗi nào khác có nghĩa là có một lỗi và chuỗi này là thông báo lỗi để hiển thị cho người dùng.

### Ràng buộc kết hợp nhiều trường: Xác thực mã bưu chính

Định dạng mã bưu chính thay đổi theo từng quốc gia. Nhiều quốc gia cho phép tiền tố tùy chọn với mã quốc gia (như `D-` ở Đức, `F-` ở Pháp, và `CH-` ở Thụy Sĩ). Một số quốc gia chỉ sử dụng số cố định trong mã bưu chính, trong khi các quốc gia khác, như Anh, có các định dạng phức tạp hơn cho phép chữ cái ở một số vị trí cụ thể.

> [!NOTE]
> Đây không phải là thư viện xác thực mã bưu chính toàn diện, mà là minh họa các khái niệm chính.

Ví dụ, chúng ta sẽ thêm một script kiểm tra constraint validation cho một biểu mẫu:

```html
<form>
  <label for="postal-code">Postal Code: </label>
  <input type="text" id="postal-code" />
  <label for="country">Country: </label>
  <select id="country">
    <option value="ch">Switzerland</option>
    <option value="fr">France</option>
    <option value="de">Germany</option>
    <option value="nl">The Netherlands</option>
  </select>
  <input type="submit" value="Validate" />
</form>
```

Điều này hiển thị biểu mẫu sau:

{{EmbedLiveSample("Constraint_combining_several_fields_Postal_code_validation")}}

Đầu tiên, chúng ta viết một hàm kiểm tra chính ràng buộc:

```js
const countrySelect = document.getElementById("country");
const postalCodeField = document.getElementById("postal-code");

function checkPostalCode() {
  // For each country, defines the pattern that the postal code has to follow
  const constraints = {
    ch: [
      "^(CH-)?\\d{4}$",
      "Swiss postal codes must have exactly 4 digits: e.g. CH-1950 or 1950",
    ],
    fr: [
      "^(F-)?\\d{5}$",
      "French postal codes must have exactly 5 digits: e.g. F-75012 or 75012",
    ],
    de: [
      "^(D-)?\\d{5}$",
      "German postal codes must have exactly 5 digits: e.g. D-12345 or 12345",
    ],
    nl: [
      "^(NL-)?\\d{4}\\s*([A-RT-Z][A-Z]|S[BCE-RT-Z])$",
      "Dutch postal codes must have exactly 4 digits, followed by 2 letters except SA, SD and SS",
    ],
  };

  // Read the country id
  const country = countrySelect.value;

  // Build the constraint checker
  const constraint = new RegExp(constraints[country][0], "");
  console.log(constraint);

  // Check it!
  if (constraint.test(postalCodeField.value)) {
    // The postal code follows the constraint, we use the ConstraintAPI to tell it
    postalCodeField.setCustomValidity("");
  } else {
    // The postal code doesn't follow the constraint, we use the ConstraintAPI to
    // give a message about the format required for this country
    postalCodeField.setCustomValidity(constraints[country][1]);
  }
}
```

Sau đó chúng ta liên kết nó với sự kiện `change` cho {{ HTMLElement("select") }} và sự kiện `input` cho {{ HTMLElement("input") }}:

```js
countrySelect.addEventListener("change", checkPostalCode);
postalCodeField.addEventListener("input", checkPostalCode);
```

### Giới hạn kích thước tệp trước khi tải lên

Một ràng buộc phổ biến khác là giới hạn kích thước tệp được tải lên. Kiểm tra điều này ở phía client trước khi tệp được truyền đến server yêu cầu kết hợp Constraint Validation API, và đặc biệt là phương thức `field.setCustomValidity()`, với một API JavaScript khác, ở đây là File API.

Đây là phần HTML:

```html
<label for="fs">Select a file smaller than 75 kB: </label>
<input type="file" id="fs" />
```

Điều này hiển thị:

{{EmbedLiveSample("Limiting_the_size_of_a_file_before_its_upload")}}

JavaScript đọc tệp được chọn, sử dụng phương thức `File.size()` để lấy kích thước của nó, so sánh với giới hạn (được hardcode), và gọi Constraint API để thông báo cho trình duyệt nếu có vi phạm:

```js
const fs = document.getElementById("fs");

function checkFileSize() {
  const files = fs.files;

  // If there is (at least) one file selected
  if (files.length > 0) {
    if (files[0].size > 75 * 1000) {
      // Check the constraint
      fs.setCustomValidity("The selected file must not be larger than 75 kB");
      fs.reportValidity();
      return;
    }
  }
  // No custom constraint violation
  fs.setCustomValidity("");
}
```

Cuối cùng, chúng ta hook phương thức với sự kiện đúng:

```js
fs.addEventListener("change", checkFileSize);
```

## Tạo kiểu trực quan cho constraint validation

Ngoài việc đặt các ràng buộc, các nhà phát triển web muốn kiểm soát những thông báo nào được hiển thị cho người dùng và cách chúng được tạo kiểu.

### Kiểm soát giao diện của các phần tử

Giao diện của các phần tử có thể được kiểm soát thông qua các pseudo-class CSS.

#### Pseudo-class CSS :required và :optional

Các [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) {{cssxref(':required')}} và {{cssxref(':optional')}} cho phép viết các selector khớp với các phần tử biểu mẫu có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required), hoặc không có nó.

#### Pseudo-class CSS :placeholder-shown

Xem {{cssxref(':placeholder-shown')}}.

#### Pseudo-class CSS :valid :invalid

Các [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) {{cssxref(':valid')}} và {{cssxref(':invalid')}} được sử dụng để biểu diễn các phần tử \<input> có nội dung xác thực và không xác thực tương ứng theo cài đặt loại của input. Các lớp này cho phép người dùng tạo kiểu cho các phần tử biểu mẫu hợp lệ hoặc không hợp lệ để giúp dễ nhận biết các phần tử được định dạng đúng hoặc sai.

### Kiểm soát văn bản của vi phạm ràng buộc

Các mục sau có thể giúp kiểm soát văn bản của vi phạm ràng buộc:

- Phương thức `setCustomValidity(message)` trên các phần tử sau:
  - {{HTMLElement("fieldset")}}. Lưu ý: Đặt thông báo hợp lệ tùy chỉnh trên các phần tử fieldset sẽ không ngăn việc gửi biểu mẫu trong hầu hết các trình duyệt.
  - {{HTMLElement("input")}}
  - {{HTMLElement("output")}}
  - {{HTMLElement("select")}}
  - Các nút submit (được tạo bằng phần tử {{HTMLElement("button")}} với loại `submit`, hoặc phần tử `input` với loại {{HTMLElement("input/submit", "submit")}}. Các loại nút khác không tham gia vào constraint validation.
  - {{HTMLElement("textarea")}}

- Interface [`ValidityState`](/en-US/docs/Web/API/ValidityState) mô tả đối tượng được trả về bởi thuộc tính `validity` của các loại phần tử được liệt kê ở trên. Nó biểu diễn các cách khác nhau mà một giá trị được nhập có thể không hợp lệ. Kết hợp với nhau, chúng giúp giải thích lý do tại sao giá trị của một phần tử không xác thực được, nếu nó không hợp lệ.
