---
title: Kiểm tra hợp lệ biểu mẫu phía máy khách
slug: Learn_web_development/Extensions/Forms/Form_validation
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/UI_pseudo-classes", "Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data", "Learn_web_development/Extensions/Forms")}}

Điều quan trọng là đảm bảo tất cả các điều khiển biểu mẫu bắt buộc được điền đầy đủ, đúng định dạng, trước khi gửi dữ liệu biểu mẫu do người dùng nhập lên máy chủ. **Kiểm tra hợp lệ biểu mẫu phía máy khách** này giúp đảm bảo dữ liệu được nhập khớp với các yêu cầu đã đặt ra trong các điều khiển biểu mẫu khác nhau.

Bài viết này hướng dẫn bạn qua các khái niệm cơ bản và ví dụ về kiểm tra hợp lệ biểu mẫu phía máy khách.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết về máy tính, hiểu biết hợp lý về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu kiểm tra hợp lệ biểu mẫu phía máy khách là gì, tại sao nó quan trọng,
        và cách áp dụng các kỹ thuật khác nhau để triển khai nó.
      </td>
    </tr>
  </tbody>
</table>

Kiểm tra hợp lệ phía máy khách là kiểm tra ban đầu và là tính năng quan trọng của trải nghiệm người dùng tốt; bằng cách phát hiện dữ liệu không hợp lệ ở phía máy khách, người dùng có thể sửa nó ngay lập tức.
Nếu nó đến máy chủ và sau đó bị từ chối, sẽ có độ trễ đáng chú ý do một chuyến đi vòng đến máy chủ và sau đó trở lại phía máy khách để thông báo cho người dùng sửa dữ liệu của họ.

Tuy nhiên, kiểm tra hợp lệ phía máy khách _không nên được coi_ là biện pháp bảo mật đầy đủ! Ứng dụng của bạn phải luôn thực hiện kiểm tra hợp lệ, bao gồm kiểm tra bảo mật, trên bất kỳ dữ liệu nào được gửi từ biểu mẫu ở phía _máy chủ_ **cũng như** phía máy khách, vì kiểm tra hợp lệ phía máy khách quá dễ bị bỏ qua, vì vậy người dùng độc hại vẫn có thể dễ dàng gửi dữ liệu xấu đến máy chủ của bạn.

> [!NOTE]
> Đọc [Bảo mật trang web](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security) để có ý tưởng về những gì _có thể_ xảy ra; triển khai kiểm tra hợp lệ phía máy chủ nằm ngoài phạm vi của mô-đun này, nhưng bạn nên ghi nhớ điều đó.

## Kiểm tra hợp lệ biểu mẫu là gì?

Hãy đến bất kỳ trang web phổ biến nào có biểu mẫu đăng ký, và bạn sẽ nhận thấy rằng họ cung cấp phản hồi khi bạn không nhập dữ liệu theo định dạng họ mong đợi.
Bạn sẽ nhận được các thông báo như:

- "Trường này là bắt buộc" (Bạn không thể để trống trường này).
- "Vui lòng nhập số điện thoại của bạn theo định dạng xxx-xxxx" (Định dạng dữ liệu cụ thể được yêu cầu để được coi là hợp lệ).
- "Vui lòng nhập địa chỉ email hợp lệ" (dữ liệu bạn nhập không đúng định dạng).
- "Mật khẩu của bạn cần dài từ 8 đến 30 ký tự và chứa một chữ hoa, một ký hiệu và một số." (Định dạng dữ liệu rất cụ thể được yêu cầu cho dữ liệu của bạn).

Đây được gọi là **kiểm tra hợp lệ biểu mẫu**.
Khi bạn nhập dữ liệu, trình duyệt (và máy chủ web) sẽ kiểm tra để xem liệu dữ liệu có đúng định dạng và trong các ràng buộc được đặt ra bởi ứng dụng không. Kiểm tra hợp lệ được thực hiện trong trình duyệt được gọi là kiểm tra hợp lệ **phía máy khách**, trong khi kiểm tra hợp lệ được thực hiện trên máy chủ được gọi là kiểm tra hợp lệ **phía máy chủ**.
Trong chương này chúng ta tập trung vào kiểm tra hợp lệ phía máy khách.

Nếu thông tin được định dạng đúng, ứng dụng cho phép dữ liệu được gửi đến máy chủ và (thường) được lưu trong cơ sở dữ liệu; nếu thông tin không được định dạng đúng, nó đưa ra thông báo lỗi cho người dùng giải thích những gì cần được sửa, và để họ thử lại.

Chúng ta muốn làm cho việc điền vào biểu mẫu web càng dễ dàng càng tốt. Vậy tại sao chúng ta nhấn mạnh vào việc kiểm tra hợp lệ biểu mẫu?
Có ba lý do chính:

- **Chúng ta muốn lấy dữ liệu đúng, đúng định dạng.** Ứng dụng của chúng ta sẽ không hoạt động đúng nếu dữ liệu của người dùng được lưu trữ sai định dạng, sai hoặc bị bỏ qua hoàn toàn.
- **Chúng ta muốn bảo vệ dữ liệu của người dùng**. Buộc người dùng nhập mật khẩu an toàn giúp bảo vệ thông tin tài khoản của họ dễ dàng hơn.
- **Chúng ta muốn bảo vệ chính mình**. Có nhiều cách mà người dùng độc hại có thể lợi dụng các biểu mẫu không được bảo vệ để làm hỏng ứng dụng. Xem [Bảo mật trang web](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security).

  > [!WARNING]
  > Không bao giờ tin tưởng dữ liệu được truyền đến máy chủ của bạn từ máy khách. Ngay cả khi biểu mẫu của bạn đang kiểm tra hợp lệ chính xác và ngăn chặn đầu vào không đúng định dạng ở phía máy khách, người dùng độc hại vẫn có thể thay đổi yêu cầu mạng.

## Các loại kiểm tra hợp lệ phía máy khách khác nhau

Có hai loại kiểm tra hợp lệ phía máy khách khác nhau mà bạn sẽ gặp trên web:

- **Kiểm tra hợp lệ biểu mẫu HTML**
  Các thuộc tính biểu mẫu HTML có thể xác định điều khiển biểu mẫu nào là bắt buộc và định dạng nào dữ liệu do người dùng nhập phải có để hợp lệ.
- **Kiểm tra hợp lệ biểu mẫu JavaScript**
  JavaScript thường được đưa vào để nâng cao hoặc tùy chỉnh kiểm tra hợp lệ biểu mẫu HTML.

Kiểm tra hợp lệ phía máy khách có thể được thực hiện với ít hoặc không có JavaScript. Kiểm tra hợp lệ HTML nhanh hơn JavaScript, nhưng ít có thể tùy chỉnh hơn so với kiểm tra hợp lệ JavaScript. Thông thường được khuyến nghị bắt đầu biểu mẫu của bạn bằng các tính năng HTML mạnh mẽ, sau đó nâng cao trải nghiệm người dùng bằng JavaScript khi cần.

## Sử dụng kiểm tra hợp lệ biểu mẫu tích hợp

Một trong những tính năng quan trọng nhất của [điều khiển biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types) là khả năng kiểm tra hợp lệ hầu hết dữ liệu người dùng mà không cần dựa vào JavaScript.
Điều này được thực hiện bằng cách sử dụng các thuộc tính kiểm tra hợp lệ trên các phần tử biểu mẫu.
Chúng ta đã thấy nhiều trong số này trước đây trong khóa học, nhưng để tóm tắt lại:

- [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required): Chỉ định liệu trường biểu mẫu có cần được điền trước khi biểu mẫu có thể được gửi hay không.
- [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength): Chỉ định độ dài tối thiểu và tối đa của dữ liệu dạng văn bản (chuỗi).
- [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min), [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max), và [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step): Chỉ định giá trị tối thiểu và tối đa của các loại trường nhập liệu số, và gia số, hoặc bước, cho các giá trị, bắt đầu từ giá trị tối thiểu.
- [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#input_types): Chỉ định liệu dữ liệu có cần là số, địa chỉ email, hoặc một số loại định sẵn cụ thể khác hay không.
- [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern): Chỉ định một [biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) xác định mẫu mà dữ liệu đã nhập cần tuân theo.

Nếu dữ liệu được nhập vào trường biểu mẫu tuân theo tất cả các quy tắc được chỉ định bởi các thuộc tính áp dụng cho trường, nó được coi là hợp lệ. Nếu không, nó được coi là không hợp lệ.

Khi một phần tử hợp lệ, những điều sau đây là đúng:

- Phần tử khớp với lớp giả CSS {{cssxref(":valid")}}, cho phép bạn áp dụng kiểu cụ thể cho các phần tử hợp lệ. Điều khiển cũng sẽ khớp {{cssxref(":user-valid")}} nếu người dùng đã tương tác với điều khiển, và có thể khớp các lớp giả giao diện người dùng khác, chẳng hạn như {{cssxref(":in-range")}}, tùy thuộc vào loại trường nhập liệu và thuộc tính.
- Nếu người dùng cố gắng gửi dữ liệu, trình duyệt sẽ gửi biểu mẫu, miễn là không có gì khác ngăn cản nó làm như vậy (ví dụ: JavaScript).

Khi một phần tử không hợp lệ, những điều sau đây là đúng:

- Phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}. Nếu người dùng đã tương tác với điều khiển, nó cũng khớp với lớp giả CSS {{cssxref(":user-invalid")}}. Các lớp giả giao diện người dùng khác cũng có thể khớp, chẳng hạn như {{cssxref(":out-of-range")}}, tùy thuộc vào lỗi. Chúng cho phép bạn áp dụng kiểu cụ thể cho các phần tử không hợp lệ.
- Nếu người dùng cố gắng gửi dữ liệu, trình duyệt sẽ chặn việc gửi biểu mẫu và hiển thị thông báo lỗi. Thông báo lỗi sẽ khác nhau tùy thuộc vào loại lỗi. [API Kiểm tra hợp lệ Ràng buộc](#the_constraint_validation_api) được mô tả bên dưới.

## Ví dụ kiểm tra hợp lệ biểu mẫu tích hợp

Trong phần này, chúng ta sẽ kiểm tra một số thuộc tính mà chúng ta đã thảo luận ở trên.

### Tệp bắt đầu cơ bản

Hãy bắt đầu với một ví dụ cơ bản: trường nhập liệu cho phép bạn chọn liệu bạn thích chuối hay anh đào.
Ví dụ này liên quan đến một {{HTMLElement("input")}} văn bản với một {{htmlelement("label")}} liên quan và một {{htmlelement("button")}} gửi.

```html live-sample___simple-start-file
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Favorite fruit start</title>
    <style>
      input:invalid {
        border: 2px dashed red;
      }

      input:valid {
        border: 2px solid black;
      }
    </style>
  </head>

  <body>
    <form>
      <label for="choose">Would you prefer a banana or a cherry?</label>
      <input id="choose" name="i_like" />
      <button>Submit</button>
    </form>
  </body>
</html>
```

{{EmbedLiveSample("simple-start-file", "100%", 80)}}

Để bắt đầu, hãy tạo một bản sao của HTML ở trên trong một tệp `index.html` mới. Lưu nó trong một thư mục mới trên ổ cứng của bạn.

### Thuộc tính required

Một tính năng kiểm tra hợp lệ HTML phổ biến là thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required).
Thêm thuộc tính này vào một trường nhập liệu để làm cho phần tử bắt buộc.
Khi thuộc tính này được đặt, phần tử khớp với lớp giả giao diện người dùng {{cssxref(':required')}} và biểu mẫu sẽ không gửi, hiển thị thông báo lỗi khi gửi, nếu trường nhập liệu trống.
Trong khi trống, trường nhập liệu cũng sẽ được coi là không hợp lệ, khớp với lớp giả giao diện người dùng {{cssxref(':invalid')}}.

Nếu bất kỳ nút chọn nào trong một nhóm cùng tên có thuộc tính `required`, một trong các nút chọn trong nhóm đó phải được chọn để nhóm hợp lệ; nút chọn được đánh dấu không cần phải là nút có thuộc tính được đặt.

> [!NOTE]
> Chỉ yêu cầu người dùng nhập dữ liệu bạn cần: Ví dụ, có thực sự cần thiết phải biết giới tính hoặc danh xưng của ai đó không?

Thêm thuộc tính `required` vào trường nhập liệu của bạn, như hiển thị bên dưới.

```html live-sample___the-required-attribute
<form>
  <label for="choose">Would you prefer a banana or cherry? *</label>
  <input id="choose" name="i-like" required />
  <button>Submit</button>
</form>
```

> [!NOTE]
> Thực tiễn thông thường là đặt dấu hoa thị (hoặc một số đánh dấu khác) sau nhãn của các điều khiển biểu mẫu bắt buộc, để chúng nổi bật với người dùng thị giác. Chỉ ra cho người dùng khi các trường biểu mẫu là bắt buộc không chỉ là trải nghiệm người dùng tốt, nó còn được yêu cầu bởi hướng dẫn [khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility) WCAG.

Chúng ta bao gồm các kiểu CSS được áp dụng dựa trên việc phần tử bắt buộc, hợp lệ và không hợp lệ:

```css live-sample___the-required-attribute
input:invalid {
  border: 2px dashed red;
}

input:invalid:required {
  background-image: linear-gradient(to right, pink, lightgreen);
}

input:valid {
  border: 2px solid black;
}
```

```js hidden live-sample___the-required-attribute live-sample___validate-regular-expression live-sample___constraining-values
const form = document.querySelector("form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

CSS này khiến trường nhập liệu có đường viền đứt nét đỏ khi không hợp lệ và đường viền liền đen tinh tế hơn khi hợp lệ.
Chúng ta cũng thêm gradient nền khi trường nhập liệu bắt buộc _và_ không hợp lệ. Hãy thử hành vi mới trong ví dụ bên dưới:

{{EmbedLiveSample("the-required-attribute", "100%", 80, , , , , "allow-forms")}}

Hãy thử gửi biểu mẫu mà không có giá trị. Lưu ý cách trường nhập liệu không hợp lệ nhận được focus, và thông báo lỗi mặc định ("Please fill out this field") xuất hiện. Biểu mẫu cũng bị ngăn gửi (mặc dù lưu ý rằng ngay cả khi giá trị được nhập, chúng ta ngăn biểu mẫu được gửi để tránh lỗi do cách MDN xử lý các biểu mẫu nhúng).

### Kiểm tra hợp lệ dựa trên biểu thức chính quy

Một tính năng kiểm tra hợp lệ hữu ích khác là thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern), nhận một [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) làm giá trị của nó.
Biểu thức chính quy (regexp) là mẫu có thể được sử dụng để khớp các tổ hợp ký tự trong chuỗi văn bản, vì vậy các regexp lý tưởng cho kiểm tra hợp lệ biểu mẫu và phục vụ nhiều mục đích sử dụng khác nhau trong JavaScript.

Các regexp khá phức tạp, và chúng ta không có ý định dạy bạn chúng một cách toàn diện trong bài viết này.
Dưới đây là một số ví dụ để cho bạn ý tưởng cơ bản về cách chúng hoạt động.

- `a` — Khớp một ký tự là `a` (không phải `b`, không phải `aa`, v.v.).
- `abc` — Khớp `a`, theo sau là `b`, theo sau là `c`.
- `ab?c` — Khớp `a`, tùy chọn theo sau là một `b`, theo sau là `c`. (`ac` hoặc `abc`)
- `ab*c` — Khớp `a`, tùy chọn theo sau là bất kỳ số `b` nào, theo sau là `c`. (`ac`, `abc`, `abbbbbc`, v.v.).
- `a|b` — Khớp một ký tự là `a` hoặc `b`.
- `abc|xyz` — Khớp chính xác `abc` hoặc chính xác `xyz` (nhưng không phải `abcxyz` hoặc `a` hoặc `y`, v.v.).

Có nhiều khả năng hơn mà chúng ta không đề cập ở đây.
Để có danh sách đầy đủ và nhiều ví dụ, hãy tham khảo tài liệu [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) của chúng ta.

Hãy triển khai một ví dụ.
Cập nhật HTML của bạn để thêm thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) như thế này:

```html live-sample___validate-regular-expression
<form>
  <label for="choose">Would you prefer a banana or a cherry? *</label>
  <input id="choose" name="i-like" required pattern="[Bb]anana|[Cc]herry" />
  <button>Submit</button>
</form>
```

```css hidden live-sample___validate-regular-expression
input:invalid {
  border: 2px dashed red;
}

input:valid {
  border: 2px solid black;
}
```

Điều này cung cấp cho chúng ta bản cập nhật sau — hãy thử:

{{EmbedLiveSample("validate-regular-expression", "100%", 80, , , , , "allow-forms")}}

Bạn cũng có thể nhấn nút **Play** để mở ví dụ trong MDN Playground và chỉnh sửa mã nguồn ở đó.

Trong ví dụ này, phần tử {{HTMLElement("input")}} chấp nhận một trong bốn giá trị có thể: các chuỗi "banana", "Banana", "cherry", hoặc "Cherry". Biểu thức chính quy phân biệt chữ hoa-thường, nhưng chúng ta đã làm cho nó hỗ trợ cả phiên bản viết hoa và viết thường bằng cách sử dụng mẫu "Aa" thêm được lồng bên trong dấu ngoặc vuông.

Tại thời điểm này, hãy thử thay đổi giá trị bên trong thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) để bằng với một số ví dụ bạn đã thấy trước đó, và xem điều đó ảnh hưởng đến các giá trị bạn có thể nhập để làm cho giá trị trường nhập liệu hợp lệ như thế nào.
Hãy thử viết một số của riêng bạn, và xem nó diễn ra như thế nào.
Hãy làm cho chúng liên quan đến trái cây nếu có thể để các ví dụ của bạn có ý nghĩa!

Nếu giá trị không trống của {{HTMLElement("input")}} không khớp với mẫu biểu thức chính quy, `input` sẽ khớp với lớp giả {{cssxref(':invalid')}}. Nếu trống, và phần tử không bắt buộc, nó không được coi là không hợp lệ.

Một số loại phần tử {{HTMLElement("input")}} không cần thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) để được kiểm tra hợp lệ dựa trên biểu thức chính quy. Ví dụ, chỉ định loại `email` kiểm tra giá trị đầu vào dựa trên mẫu địa chỉ email được định dạng tốt hoặc mẫu khớp với danh sách địa chỉ email được phân cách bằng dấu phẩy nếu nó có thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple).

> [!NOTE]
> Phần tử {{HTMLElement("textarea")}} không hỗ trợ thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern).

### Giới hạn độ dài các mục nhập của bạn

Bạn có thể giới hạn độ dài ký tự của tất cả các trường văn bản được tạo bởi {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}} bằng cách sử dụng các thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength).
Trường không hợp lệ nếu có giá trị và giá trị đó có ít ký tự hơn giá trị [`minlength`](/en-US/docs/Web/HTML/Reference/Attributes/minlength) hoặc nhiều hơn giá trị [`maxlength`](/en-US/docs/Web/HTML/Reference/Attributes/maxlength).

Trình duyệt thường không cho phép người dùng nhập giá trị dài hơn mong đợi vào các trường văn bản. Trải nghiệm người dùng tốt hơn so với chỉ sử dụng `maxlength` là cũng cung cấp phản hồi đếm ký tự theo cách dễ tiếp cận và để người dùng chỉnh sửa nội dung của họ xuống kích thước.
Ví dụ về điều này là giới hạn ký tự khi đăng trên mạng xã hội. JavaScript, bao gồm [các giải pháp sử dụng `maxlength`](https://github.com/mimo84/bootstrap-maxlength), có thể được sử dụng để cung cấp điều này.

> [!NOTE]
> Ràng buộc độ dài không bao giờ được báo cáo nếu giá trị được đặt theo chương trình. Chúng chỉ được báo cáo cho đầu vào do người dùng cung cấp.

### Giới hạn giá trị các mục nhập của bạn

Đối với các trường số, bao gồm [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number) và các loại trường nhập liệu ngày tháng khác nhau, các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min) và [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max) có thể được sử dụng để cung cấp phạm vi giá trị hợp lệ.
Nếu trường chứa giá trị ngoài phạm vi này, nó sẽ không hợp lệ.

Hãy xem xét một ví dụ khác.
Tạo một bản sao mới của tệp [bắt đầu cơ bản](#basic_starter_file) và lưu nó trong cùng thư mục là `index2.html`.

Bây giờ xóa nội dung của phần tử `<body>`, và thay thế bằng những gì sau:

```html live-sample___constraining-values
<form>
  <div>
    <label for="choose">Would you prefer a banana or a cherry? *</label>
    <input
      type="text"
      id="choose"
      name="i-like"
      required
      minlength="6"
      maxlength="6" />
  </div>
  <div>
    <label for="number">How many would you like?</label>
    <input type="number" id="number" name="amount" value="1" min="1" max="10" />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

- Ở đây bạn sẽ thấy rằng chúng ta đã cho trường `text` `minlength` và `maxlength` là sáu, bằng với độ dài của banana và cherry.
- Chúng ta cũng đã cho trường `number` `min` là một và `max` là mười.
  Các số được nhập ngoài phạm vi này sẽ hiển thị là không hợp lệ; người dùng sẽ không thể sử dụng các mũi tên tăng/giảm để di chuyển giá trị ra ngoài phạm vi này.
  Nếu người dùng nhập thủ công một số ngoài phạm vi này, dữ liệu không hợp lệ.
  Số không bắt buộc, vì vậy việc xóa giá trị sẽ dẫn đến giá trị hợp lệ.

```css hidden live-sample___constraining-values
input:invalid {
  border: 2px dashed red;
}

input:valid {
  border: 2px solid black;
}

div {
  margin-bottom: 10px;
}
```

Đây là ví dụ đang chạy trực tiếp:

{{EmbedLiveSample("constraining-values", "100%", 100)}}

Bạn cũng có thể nhấn nút **Play** để mở ví dụ trong MDN Playground và chỉnh sửa mã nguồn ở đó.

Các loại trường nhập liệu số, như `number`, `range` và `date`, cũng có thể nhận thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step). Thuộc tính này chỉ định gia số mà giá trị sẽ tăng hoặc giảm khi các điều khiển trường nhập liệu được sử dụng (chẳng hạn như các nút số lên và xuống, hoặc trượt thumb của range). Thuộc tính `step` bị bỏ qua trong ví dụ của chúng ta, vì vậy giá trị mặc định là `1`. Điều này có nghĩa là các số thập phân, như 3.2, cũng sẽ hiển thị là không hợp lệ.

### Ví dụ đầy đủ

Đây là ví dụ đầy đủ để hiển thị việc sử dụng các tính năng kiểm tra hợp lệ tích hợp của HTML.
Đầu tiên, một số HTML:

```html
<form>
  <p>Please complete all required (*) fields.</p>
  <fieldset>
    <legend>Do you have a driver's license? *</legend>
    <input type="radio" required name="driver" id="r1" value="yes" />
    <label for="r1">Yes</label>
    <input type="radio" required name="driver" id="r2" value="no" />
    <label for="r2">No</label>
  </fieldset>
  <p>
    <label for="n1">How old are you?</label>
    <input type="number" min="12" max="120" step="1" id="n1" name="age" />
  </p>
  <p>
    <label for="t1">What's your favorite fruit? *</label>
    <input
      type="text"
      id="t1"
      name="fruit"
      list="l1"
      required
      pattern="[Bb]anana|[Cc]herry|[Aa]pple|[Ss]trawberry|[Ll]emon|[Oo]range" />
    <datalist id="l1">
      <option>Banana</option>
      <option>Cherry</option>
      <option>Apple</option>
      <option>Strawberry</option>
      <option>Lemon</option>
      <option>Orange</option>
    </datalist>
  </p>
  <p>
    <label for="t2">What's your email address?</label>
    <input type="email" id="t2" name="email" />
  </p>
  <p>
    <label for="t3">Leave a short message</label>
    <textarea id="t3" name="msg" maxlength="140" rows="5"></textarea>
  </p>
  <p>
    <button>Submit</button>
  </p>
</form>
```

Và bây giờ một số CSS để tạo kiểu cho HTML:

```css
form {
  font: 1em sans-serif;
  max-width: 320px;
}

p > label {
  display: block;
}

input[type="text"],
input[type="email"],
input[type="number"],
textarea,
fieldset {
  width: 100%;
  border: 1px solid #333333;
  box-sizing: border-box;
}

input:invalid {
  box-shadow: 0 0 5px 1px red;
}

input:focus:invalid {
  box-shadow: none;
}
```

Kết quả hiển thị như sau:

{{EmbedLiveSample("Full_example", "100%", 420)}}

Bạn cũng có thể nhấn nút **Play** để mở ví dụ trong MDN Playground và chỉnh sửa mã nguồn ở đó.

Xem [Các thuộc tính liên quan đến kiểm tra hợp lệ](/en-US/docs/Web/HTML/Guides/Constraint_validation#validation-related_attributes) để có danh sách đầy đủ các thuộc tính có thể được sử dụng để ràng buộc giá trị đầu vào và các loại trường nhập liệu hỗ trợ chúng.

## Kiểm tra hợp lệ biểu mẫu bằng JavaScript

Nếu bạn muốn thay đổi văn bản của các thông báo lỗi gốc, JavaScript là cần thiết.
Trong phần này chúng ta sẽ xem xét các cách khác nhau để làm điều này.

### API Kiểm tra hợp lệ Ràng buộc

API Kiểm tra hợp lệ Ràng buộc bao gồm một tập hợp các phương thức và thuộc tính có sẵn trên các giao diện DOM phần tử biểu mẫu sau:

- [`HTMLButtonElement`](/en-US/docs/Web/API/HTMLButtonElement) (đại diện cho phần tử [`<button>`](/en-US/docs/Web/HTML/Reference/Elements/button))
- [`HTMLFieldSetElement`](/en-US/docs/Web/API/HTMLFieldSetElement) (đại diện cho phần tử [`<fieldset>`](/en-US/docs/Web/HTML/Reference/Elements/fieldset))
- [`HTMLInputElement`](/en-US/docs/Web/API/HTMLInputElement) (đại diện cho phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input))
- [`HTMLOutputElement`](/en-US/docs/Web/API/HTMLOutputElement) (đại diện cho phần tử [`<output>`](/en-US/docs/Web/HTML/Reference/Elements/output))
- [`HTMLSelectElement`](/en-US/docs/Web/API/HTMLSelectElement) (đại diện cho phần tử [`<select>`](/en-US/docs/Web/HTML/Reference/Elements/select))
- [`HTMLTextAreaElement`](/en-US/docs/Web/API/HTMLTextAreaElement) (đại diện cho phần tử [`<textarea>`](/en-US/docs/Web/HTML/Reference/Elements/textarea))

API Kiểm tra hợp lệ Ràng buộc cung cấp các thuộc tính sau trên các phần tử trên.

- `validationMessage`: Trả về thông báo địa phương hóa mô tả các ràng buộc kiểm tra hợp lệ mà điều khiển không thỏa mãn (nếu có). Nếu điều khiển không phải là ứng viên cho kiểm tra hợp lệ ràng buộc (`willValidate` là `false`) hoặc giá trị của phần tử thỏa mãn các ràng buộc của nó (là hợp lệ), điều này sẽ trả về một chuỗi trống.
- `validity`: Trả về một đối tượng `ValidityState` chứa một số thuộc tính mô tả trạng thái hợp lệ của phần tử. Bạn có thể tìm thấy chi tiết đầy đủ về tất cả các thuộc tính có sẵn trong trang tham khảo {{domxref("ValidityState")}}; bên dưới liệt kê một số thuộc tính phổ biến hơn:
  - {{domxref("ValidityState.patternMismatch", "patternMismatch")}}: Trả về `true` nếu giá trị không khớp với [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) được chỉ định, và `false` nếu nó khớp. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
  - {{domxref("ValidityState.tooLong", "tooLong")}}: Trả về `true` nếu giá trị dài hơn độ dài tối đa được chỉ định bởi thuộc tính [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength), hoặc `false` nếu nó ngắn hơn hoặc bằng tối đa. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
  - {{domxref("ValidityState.tooShort", "tooShort")}}: Trả về `true` nếu giá trị ngắn hơn độ dài tối thiểu được chỉ định bởi thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength), hoặc `false` nếu nó lớn hơn hoặc bằng tối thiểu. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
  - {{domxref("ValidityState.rangeOverflow", "rangeOverflow")}}: Trả về `true` nếu giá trị lớn hơn tối đa được chỉ định bởi thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max), hoặc `false` nếu nó nhỏ hơn hoặc bằng tối đa. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
  - {{domxref("ValidityState.rangeUnderflow", "rangeUnderflow")}}: Trả về `true` nếu giá trị nhỏ hơn tối thiểu được chỉ định bởi thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min), hoặc `false` nếu nó lớn hơn hoặc bằng tối thiểu. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}} và {{cssxref(":out-of-range")}}.
  - {{domxref("ValidityState.typeMismatch", "typeMismatch")}}: Trả về `true` nếu giá trị không theo cú pháp yêu cầu (khi [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `email` hoặc `url`), hoặc `false` nếu cú pháp đúng. Nếu `true`, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.
  - `valid`: Trả về `true` nếu phần tử đáp ứng tất cả các ràng buộc kiểm tra hợp lệ của nó, và do đó được coi là hợp lệ, hoặc `false` nếu nó không đáp ứng bất kỳ ràng buộc nào. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":valid")}}; lớp giả CSS {{cssxref(":invalid")}} nếu ngược lại.
  - `valueMissing`: Trả về `true` nếu phần tử có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required), nhưng không có giá trị, hoặc `false` nếu ngược lại. Nếu đúng, phần tử khớp với lớp giả CSS {{cssxref(":invalid")}}.

- `willValidate`: Trả về `true` nếu phần tử sẽ được kiểm tra hợp lệ khi biểu mẫu được gửi; `false` nếu ngược lại.

API Kiểm tra hợp lệ Ràng buộc cũng cung cấp các phương thức sau trên các phần tử trên và phần tử [`form`](/en-US/docs/Web/HTML/Reference/Elements/form).

- `checkValidity()`: Trả về `true` nếu giá trị của phần tử không có vấn đề hợp lệ; `false` nếu ngược lại. Nếu phần tử không hợp lệ, phương thức này cũng kích hoạt [sự kiện `invalid`](/en-US/docs/Web/API/HTMLInputElement/invalid_event) trên phần tử.
- `reportValidity()`: Báo cáo (các) trường không hợp lệ bằng cách sử dụng sự kiện. Phương thức này hữu ích kết hợp với `preventDefault()` trong trình xử lý sự kiện `onSubmit`.
- `setCustomValidity(message)`: Thêm thông báo lỗi tùy chỉnh vào phần tử; nếu bạn đặt thông báo lỗi tùy chỉnh, phần tử được coi là không hợp lệ, và lỗi được chỉ định được hiển thị. Điều này cho phép bạn sử dụng mã JavaScript để thiết lập lỗi kiểm tra hợp lệ khác với những lỗi được cung cấp bởi các ràng buộc kiểm tra hợp lệ HTML tiêu chuẩn. Thông báo được hiển thị cho người dùng khi báo cáo vấn đề.

#### Triển khai thông báo lỗi tùy chỉnh

Như bạn đã thấy trong các ví dụ ràng buộc kiểm tra hợp lệ HTML trước đó, mỗi lần người dùng cố gắng gửi biểu mẫu không hợp lệ, trình duyệt hiển thị thông báo lỗi. Cách thông báo này được hiển thị phụ thuộc vào trình duyệt.

Các thông báo tự động này có hai hạn chế:

- Không có cách tiêu chuẩn để thay đổi giao diện và cảm giác của chúng bằng CSS.
- Chúng phụ thuộc vào ngôn ngữ trình duyệt, có nghĩa là bạn có thể có trang bằng một ngôn ngữ nhưng thông báo lỗi được hiển thị bằng ngôn ngữ khác, như được thấy trong ảnh chụp màn hình Firefox sau.

![Example of an error message with Firefox in French on an English page](error-firefox-win7.png)

Tùy chỉnh các thông báo lỗi này là một trong những trường hợp sử dụng phổ biến nhất của API Kiểm tra hợp lệ Ràng buộc.
Hãy xem qua một ví dụ về cách làm điều này.

Chúng ta sẽ bắt đầu với một số HTML. Hãy thoải mái đặt nó vào một bản sao khác của tệp [bắt đầu cơ bản](#basic_starter_file), nếu bạn muốn:

```html
<form>
  <label for="mail">
    I would like you to provide me with an email address:
  </label>
  <input type="email" id="mail" name="mail" />
  <button>Submit</button>
</form>
```

Thêm JavaScript sau vào trang:

```js
const email = document.getElementById("mail");

email.addEventListener("input", (event) => {
  if (email.validity.typeMismatch) {
    email.setCustomValidity("I am expecting an email address!");
  } else {
    email.setCustomValidity("");
  }
});
```

Ở đây chúng ta lưu trữ tham chiếu đến trường nhập liệu email, sau đó thêm trình lắng nghe sự kiện chạy mã chứa mỗi lần giá trị bên trong trường nhập liệu thay đổi.

Bên trong mã chứa, chúng ta kiểm tra liệu thuộc tính `validity.typeMismatch` của trường nhập liệu email có trả về `true` không, có nghĩa là giá trị chứa không khớp với mẫu cho địa chỉ email được định dạng tốt. Nếu có, chúng ta gọi phương thức {{domxref("HTMLInputElement.setCustomValidity()","setCustomValidity()")}} với thông báo tùy chỉnh. Điều này làm cho trường nhập liệu không hợp lệ, vì vậy khi bạn cố gắng gửi biểu mẫu, gửi thất bại và thông báo lỗi tùy chỉnh được hiển thị.

Nếu thuộc tính `validity.typeMismatch` trả về `false`, chúng ta gọi phương thức `setCustomValidity()` với chuỗi trống. Điều này làm cho trường nhập liệu hợp lệ, vì vậy biểu mẫu sẽ gửi. Trong quá trình kiểm tra hợp lệ, nếu bất kỳ điều khiển biểu mẫu nào có `customError` không phải là chuỗi trống, việc gửi biểu mẫu bị chặn.

Bạn có thể thử nó bên dưới (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___custom-error-message
<form>
  <label for="mail"
    >I would like you to provide me with an email address:</label
  >
  <input type="email" id="mail" name="mail" />
  <button>Submit</button>
</form>
```

```css hidden live-sample___custom-error-message
input:invalid {
  border: 2px dashed red;
}

input:valid {
  border: 2px solid black;
}
form {
  margin: 3rem 0;
}
```

```js hidden live-sample___custom-error-message
const email = document.getElementById("mail");

email.addEventListener("input", (event) => {
  if (email.validity.typeMismatch) {
    email.setCustomValidity("I am expecting an email address!");
  } else {
    email.setCustomValidity("");
  }
});

const form = document.querySelector("form");
form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

{{EmbedLiveSample("custom-error-message", "100%", 120, , , , , "allow-forms")}}

#### Mở rộng kiểm tra hợp lệ biểu mẫu tích hợp

Ví dụ trước đã chỉ ra cách bạn có thể thêm thông báo tùy chỉnh cho một loại lỗi cụ thể (`validity.typeMismatch`).
Cũng có thể sử dụng tất cả kiểm tra hợp lệ biểu mẫu tích hợp, và sau đó thêm vào bằng `setCustomValidity()`.

Ở đây chúng ta minh họa cách bạn có thể mở rộng kiểm tra hợp lệ [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email) tích hợp để chỉ chấp nhận các địa chỉ có tên miền `@example.com`.
Chúng ta bắt đầu với {{htmlelement("form")}} HTML bên dưới.

```html
<form>
  <label for="mail">Email address (@example.com only):</label>
  <input type="email" id="mail" />
  <button>Submit</button>
</form>
```

Mã kiểm tra hợp lệ được hiển thị bên dưới.
Trong trường hợp có bất kỳ đầu vào mới nào, mã trước tiên đặt lại thông báo hợp lệ tùy chỉnh bằng cách gọi `setCustomValidity("")`.
Sau đó nó sử dụng `email.validity.valid` để kiểm tra xem địa chỉ được nhập có không hợp lệ không và nếu vậy, trả về từ trình xử lý sự kiện.
Điều này đảm bảo rằng tất cả các kiểm tra kiểm tra hợp lệ tích hợp thông thường được chạy trong khi văn bản được nhập không phải là địa chỉ email hợp lệ.

Khi địa chỉ email hợp lệ, mã thêm ràng buộc tùy chỉnh, gọi `setCustomValidity()` với thông báo lỗi nếu địa chỉ không kết thúc bằng `@example.com`.

```js
const email = document.getElementById("mail");

email.addEventListener("input", (event) => {
  // Validate with the built-in constraints
  email.setCustomValidity("");
  if (!email.validity.valid) {
    return;
  }

  // Extend with a custom constraints
  if (!email.value.endsWith("@example.com")) {
    email.setCustomValidity("Please enter an email address of @example.com");
  }
});
```

Hãy thử gửi địa chỉ email không hợp lệ, địa chỉ email hợp lệ nhưng không kết thúc bằng `@example.com`, và một địa chỉ kết thúc bằng `@example.com`.

{{EmbedLiveSample("extending built-in form validation", "", 200, , , , , "allow-forms")}}

#### Ví dụ chi tiết hơn

Bây giờ chúng ta đã thấy một ví dụ thực sự cơ bản, hãy xem cách chúng ta có thể sử dụng API này để xây dựng một số kiểm tra hợp lệ tùy chỉnh phức tạp hơn một chút.

Trước tiên, HTML. Một lần nữa, hãy thoải mái xây dựng điều này cùng với chúng ta:

```html
<form novalidate>
  <p>
    <label for="mail">
      <span>Please enter an email address *:</span>
      <input type="email" id="mail" name="mail" required minlength="8" />
      <span class="error" aria-live="polite"></span>
    </label>
  </p>
  <button>Submit</button>
</form>
```

Biểu mẫu này sử dụng thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) để tắt kiểm tra hợp lệ tự động của trình duyệt. Đặt thuộc tính `novalidate` trên biểu mẫu ngăn biểu mẫu hiển thị các bong bóng thông báo lỗi của riêng nó, và cho phép chúng ta thay vào đó hiển thị các thông báo lỗi tùy chỉnh trong DOM theo một cách nào đó mà chúng ta lựa chọn.
Tuy nhiên, điều này không vô hiệu hóa hỗ trợ cho API kiểm tra hợp lệ ràng buộc cũng như việc áp dụng các lớp giả CSS như {{cssxref(":valid")}}, v.v.
Điều đó có nghĩa là mặc dù trình duyệt không tự động kiểm tra tính hợp lệ của biểu mẫu trước khi gửi dữ liệu của nó, bạn vẫn có thể tự làm và tạo kiểu biểu mẫu theo đó.

Trường nhập liệu của chúng ta để kiểm tra hợp lệ là một [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email), là `required`, và có `minlength` là 8 ký tự. Hãy kiểm tra những điều này bằng mã của riêng chúng ta, và hiển thị thông báo lỗi tùy chỉnh cho mỗi điều.

Chúng ta đang nhắm đến việc hiển thị các thông báo lỗi bên trong một phần tử `<span>`.
Thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) được đặt trên `<span>` đó để đảm bảo rằng thông báo lỗi tùy chỉnh của chúng ta sẽ được trình bày cho mọi người, bao gồm việc đọc to cho người dùng trình đọc màn hình.

Bây giờ đến một số CSS cơ bản để cải thiện giao diện của biểu mẫu một chút, và cung cấp một số phản hồi hình ảnh khi dữ liệu đầu vào không hợp lệ:

```css
body {
  font: 1em sans-serif;
  width: 200px;
  padding: 0;
  margin: 0 auto;
}

p * {
  display: block;
}

input[type="email"] {
  appearance: none;

  width: 100%;
  border: 1px solid #333333;
  margin: 0;

  font-family: inherit;
  font-size: 90%;

  box-sizing: border-box;
}

/* invalid fields */
input:invalid {
  border-color: #990000;
  background-color: #ffdddd;
}

input:focus:invalid {
  outline: none;
}

/* error message styles */
.error {
  width: 100%;
  padding: 0;

  font-size: 80%;
  color: white;
  background-color: #990000;
  border-radius: 0 0 5px 5px;

  box-sizing: border-box;
}

.error.active {
  padding: 0.3em;
}
```

Bây giờ hãy xem JavaScript triển khai kiểm tra hợp lệ lỗi tùy chỉnh.
Có nhiều cách để chọn nút DOM; ở đây chúng ta lấy chính biểu mẫu và hộp nhập liệu email, cũng như phần tử span mà chúng ta sẽ đặt thông báo lỗi.

Sử dụng trình xử lý sự kiện, chúng ta kiểm tra liệu các trường biểu mẫu có hợp lệ hay không mỗi lần người dùng gõ vào đó. Nếu có lỗi, chúng ta hiển thị nó. Nếu không có lỗi, chúng ta xóa bất kỳ thông báo lỗi nào.

```js
const form = document.querySelector("form");
const email = document.getElementById("mail");
const emailError = document.querySelector("#mail + span.error");

email.addEventListener("input", (event) => {
  if (email.validity.valid) {
    emailError.textContent = ""; // Remove the message content
    emailError.className = "error"; // Removes the `active` class
  } else {
    // If there is still an error, show the correct error
    showError();
  }
});

form.addEventListener("submit", (event) => {
  // if the email field is invalid
  if (!email.validity.valid) {
    // display an appropriate error message
    showError();
    // prevent form submission
    event.preventDefault();
  }
});

function showError() {
  if (email.validity.valueMissing) {
    // If empty
    emailError.textContent = "You need to enter an email address.";
  } else if (email.validity.typeMismatch) {
    // If it's not an email address,
    emailError.textContent = "Entered value needs to be an email address.";
  } else if (email.validity.tooShort) {
    // If the value is too short,
    emailError.textContent = `Email should be at least ${email.minLength} characters; you entered ${email.value.length}.`;
  }
  // Add the `active` class
  emailError.className = "error active";
}
```

Mỗi lần chúng ta thay đổi giá trị của trường nhập liệu, chúng ta kiểm tra xem nó có chứa dữ liệu hợp lệ không. Nếu có thì chúng ta xóa bất kỳ thông báo lỗi nào đang hiển thị. Nếu dữ liệu không hợp lệ, chúng ta chạy `showError()` để hiển thị lỗi thích hợp.

Mỗi lần chúng ta cố gắng gửi biểu mẫu, chúng ta kiểm tra lại xem dữ liệu có hợp lệ không. Nếu vậy, chúng ta cho phép biểu mẫu gửi. Nếu không, chúng ta chạy `showError()` để hiển thị lỗi thích hợp, và dừng gửi biểu mẫu bằng [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault).

Hàm `showError()` sử dụng các thuộc tính khác nhau của đối tượng `validity` của trường nhập liệu để xác định lỗi là gì, và sau đó hiển thị thông báo lỗi thích hợp.

Đây là kết quả trực tiếp (nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn):

```html hidden live-sample___detailed-custom-validation
<form novalidate>
  <p>
    <label for="mail">
      <span>Please enter an email address *:</span>
      <input type="email" id="mail" name="mail" required minlength="8" />
      <span class="error" aria-live="polite"></span>
    </label>
  </p>
  <button>Submit</button>
</form>
```

```css hidden live-sample___detailed-custom-validation
body {
  font: 1em sans-serif;
  width: 200px;
  padding: 0;
  margin: 0 auto;
}

p * {
  display: block;
}

input[type="email"] {
  -webkit-appearance: none;
  appearance: none;

  width: 100%;
  border: 1px solid #333333;
  margin: 0;

  font-family: inherit;
  font-size: 90%;

  box-sizing: border-box;
}

/* This is our style for the invalid fields */
input:invalid {
  border-color: #990000;
  background-color: #ffdddd;
}

input:focus:invalid {
  outline: none;
}

/* This is the style of our error messages */
.error {
  width: 100%;
  padding: 0;

  font-size: 80%;
  color: white;
  background-color: #990000;
  border-radius: 0 0 5px 5px;

  box-sizing: border-box;
}

.error.active {
  padding: 0.3em;
}
```

```js hidden live-sample___detailed-custom-validation
// There are many ways to pick a DOM node; here we get the form itself and the email
// input box, as well as the span element into which we will place the error message.
const form = document.getElementsByTagName("form")[0];

const email = document.getElementById("mail");
const emailError = document.querySelector("#mail + span.error");

email.addEventListener("input", (event) => {
  // Each time the user types something, we check if the
  // form fields are valid.

  if (email.validity.valid) {
    // In case there is an error message visible, if the field
    // is valid, we remove the error message.
    emailError.innerHTML = ""; // Reset the content of the message
    emailError.className = "error"; // Reset the visual state of the message
  } else {
    // If there is still an error, show the correct error
    showError();
  }
});

form.addEventListener("submit", (event) => {
  // if the form contains valid data, we let it submit

  if (!email.validity.valid) {
    // If it isn't, we display an appropriate error message
    showError();
    // Then we prevent the form from being sent by canceling the event
    event.preventDefault();
  }
});

function showError() {
  if (email.validity.valueMissing) {
    // If the field is empty
    // display the following error message.
    emailError.textContent = "You need to enter an email address.";
  } else if (email.validity.typeMismatch) {
    // If the field doesn't contain an email address
    // display the following error message.
    emailError.textContent = "Entered value needs to be an email address.";
  } else if (email.validity.tooShort) {
    // If the data is too short
    // display the following error message.
    emailError.textContent = `Email should be at least ${email.minLength} characters; you entered ${email.value.length}.`;
  }

  // Set the styling appropriately
  emailError.className = "error active";
}

form.addEventListener("submit", (e) => {
  e.preventDefault();
});
```

{{EmbedLiveSample("detailed-custom-validation", "100%", 150, , , , , "allow-forms")}}

API kiểm tra hợp lệ ràng buộc cung cấp cho bạn một công cụ mạnh mẽ để xử lý kiểm tra hợp lệ biểu mẫu, cho phép bạn kiểm soát giao diện người dùng rộng lớn hơn những gì bạn có thể làm với chỉ HTML và CSS.

### Kiểm tra hợp lệ biểu mẫu mà không cần API tích hợp

Trong một số trường hợp, chẳng hạn như [điều khiển tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls), bạn sẽ không thể hoặc không muốn sử dụng API Kiểm tra hợp lệ Ràng buộc. Bạn vẫn có thể sử dụng JavaScript để kiểm tra hợp lệ biểu mẫu của mình, nhưng bạn chỉ cần viết mã của riêng mình.

Để kiểm tra hợp lệ biểu mẫu, hãy tự hỏi mình một vài câu hỏi:

- Tôi nên thực hiện loại kiểm tra hợp lệ nào?
  - : Bạn cần xác định cách kiểm tra hợp lệ dữ liệu của mình: thao tác chuỗi, chuyển đổi loại, biểu thức chính quy, v.v. Tùy bạn quyết định.
- Tôi nên làm gì nếu biểu mẫu không kiểm tra hợp lệ?
  - : Đây rõ ràng là vấn đề giao diện người dùng. Bạn phải quyết định biểu mẫu sẽ hành xử như thế nào. Biểu mẫu có gửi dữ liệu dù sao không?
    Bạn có nên làm nổi bật các trường đang có lỗi không?
    Bạn có nên hiển thị thông báo lỗi không?
- Tôi có thể giúp người dùng sửa dữ liệu không hợp lệ như thế nào?
  - : Để giảm sự thất vọng của người dùng, điều rất quan trọng là cung cấp càng nhiều thông tin hữu ích càng tốt để hướng dẫn họ trong việc sửa đầu vào của mình.
    Bạn nên đưa ra các gợi ý trước để họ biết những gì được mong đợi, cũng như các thông báo lỗi rõ ràng.
    Nếu bạn muốn đào sâu vào các yêu cầu về giao diện người dùng kiểm tra hợp lệ biểu mẫu, đây là một số bài viết hữu ích bạn nên đọc:
    - [Help users enter the right data in forms](https://web.dev/learn/forms/form-fields)
    - [Validating input](https://www.w3.org/WAI/tutorials/forms/validation/)
    - [How to Report Errors in Forms: 10 Design Guidelines](https://www.nngroup.com/articles/errors-forms-design-guidelines/)

#### Ví dụ không sử dụng API kiểm tra hợp lệ ràng buộc

Để minh họa điều này, sau đây là phiên bản đơn giản hóa của ví dụ trước mà không có API Kiểm tra hợp lệ Ràng buộc.

HTML gần như giống nhau; chúng ta chỉ loại bỏ các tính năng kiểm tra hợp lệ HTML.

```html
<form>
  <p>
    <label for="mail">
      <span>Please enter an email address:</span>
    </label>
    <input type="text" id="mail" name="mail" />
    <span id="error" aria-live="polite"></span>
  </p>
  <button>Submit</button>
</form>
```

Tương tự, CSS không cần thay đổi nhiều; chúng ta chỉ chuyển lớp giả CSS {{cssxref(":invalid")}} thành lớp thực và tránh sử dụng bộ chọn thuộc tính.

```css
body {
  font: 1em sans-serif;
  width: 200px;
  padding: 0;
  margin: 0 auto;
}

form {
  max-width: 200px;
}

p * {
  display: block;
}

input {
  appearance: none;
  width: 100%;
  border: 1px solid #333333;
  margin: 0;

  font-family: inherit;
  font-size: 90%;

  box-sizing: border-box;
}

/* invalid fields */
input.invalid {
  border: 2px solid #990000;
  background-color: #ffdddd;
}

input:focus.invalid {
  outline: none;
  /* make sure keyboard-only users see a change when focusing */
  border-style: dashed;
}

/* error messages */
#error {
  width: 100%;
  font-size: 80%;
  color: white;
  background-color: #990000;
  border-radius: 0 0 5px 5px;
  box-sizing: border-box;
}

.active {
  padding: 0.3rem;
}
```

Những thay đổi lớn là trong mã JavaScript, cần phải làm nhiều hơn nhiều.

```js
const form = document.querySelector("form");
const email = document.getElementById("mail");
const error = document.getElementById("error");

// Regular expression for email validation as per HTML specification
const emailRegExp = /^[\w.!#$%&'*+/=?^`{|}~-]+@[a-z\d-]+(?:\.[a-z\d-]+)*$/i;

// Check if the email is valid
const isValidEmail = () => {
  const validity = email.value.length !== 0 && emailRegExp.test(email.value);
  return validity;
};

// Update email input class based on validity
const setEmailClass = (isValid) => {
  email.className = isValid ? "valid" : "invalid";
};

// Update error message and visibility
const updateError = (isValid) => {
  if (isValid) {
    error.textContent = "";
    error.removeAttribute("class");
  } else {
    error.textContent = "I expect an email, darling!";
    error.setAttribute("class", "active");
  }
};

// Handle input event to update email validity
const handleInput = () => {
  const validity = isValidEmail();
  setEmailClass(validity);
  updateError(validity);
};

// Handle form submission to show error if email is invalid
const handleSubmit = (event) => {
  event.preventDefault();

  const validity = isValidEmail();
  setEmailClass(validity);
  updateError(validity);
};

// Now we can rebuild our validation constraint
// Because we do not rely on CSS pseudo-class, we have to
// explicitly set the valid/invalid class on our email field
const validity = isValidEmail();
setEmailClass(validity);
// This defines what happens when the user types in the field
email.addEventListener("input", handleInput);
// This defines what happens when the user tries to submit the data
form.addEventListener("submit", handleSubmit);
```

Kết quả trông như thế này:

{{EmbedLiveSample("An_example_that_doesnt_use_the_constraint_validation_API", "100%", 150)}}

Như bạn có thể thấy, việc xây dựng hệ thống kiểm tra hợp lệ của riêng bạn không quá khó. Phần khó là làm cho nó đủ chung để sử dụng cả trên nhiều nền tảng và trên bất kỳ biểu mẫu nào bạn có thể tạo. Có nhiều thư viện sẵn có để thực hiện kiểm tra hợp lệ biểu mẫu, chẳng hạn như [Validate.js](https://rickharrison.github.io/validate.js/).

## Tóm tắt

Kiểm tra hợp lệ biểu mẫu phía máy khách đôi khi yêu cầu JavaScript nếu bạn muốn tùy chỉnh kiểu và thông báo lỗi, nhưng nó _luôn_ yêu cầu bạn suy nghĩ cẩn thận về người dùng.
Luôn nhớ giúp người dùng sửa dữ liệu họ cung cấp. Để đạt được mục đích đó, hãy đảm bảo:

- Hiển thị thông báo lỗi rõ ràng.
- Linh hoạt về định dạng đầu vào.
- Chỉ rõ chính xác nơi lỗi xảy ra, đặc biệt là trên các biểu mẫu lớn.

Sau khi bạn đã kiểm tra xem biểu mẫu được điền đúng, biểu mẫu có thể được gửi.
Chúng ta sẽ đề cập đến [gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data) tiếp theo.

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/UI_pseudo-classes", "Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data", "Learn_web_development/Extensions/Forms")}}
