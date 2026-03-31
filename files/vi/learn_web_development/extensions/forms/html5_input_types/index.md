---
title: The HTML5 input types
slug: Learn_web_development/Extensions/Forms/HTML5_input_types
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Basic_native_form_controls", "Learn_web_development/Extensions/Forms/Other_form_controls", "Learn_web_development/Extensions/Forms")}}

Trong [bài viết trước](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls) chúng ta đã xem xét phần tử {{htmlelement("input")}}, đề cập đến các giá trị ban đầu của thuộc tính `type` có sẵn từ những ngày đầu của HTML. Bây giờ chúng ta sẽ xem xét chi tiết chức năng của một số loại trường nhập liệu được thêm vào sau này.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >HTML</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu các giá trị loại trường nhập liệu mới hơn có sẵn để tạo điều khiển biểu mẫu gốc, và cách triển khai chúng bằng HTML.
      </td>
    </tr>
  </tbody>
</table>

Vì giao diện điều khiển biểu mẫu HTML có thể khá khác so với thông số kỹ thuật của nhà thiết kế, các nhà phát triển web đôi khi xây dựng điều khiển biểu mẫu tùy chỉnh của riêng họ. Chúng ta đề cập đến điều này trong một hướng dẫn nâng cao: [Cách xây dựng widget biểu mẫu tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls).

## Trường địa chỉ email

Loại trường này được thiết lập bằng cách sử dụng giá trị `email` cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type):

```html hidden live-sample___email
<label for="email">Enter your email address:</label><br />
```

```html live-sample___email
<input type="email" id="email" name="email" />
```

{{EmbedLiveSample('email','100%','50')}}

Khi [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) này được sử dụng, giá trị phải là địa chỉ email để hợp lệ. Bất kỳ nội dung nào khác khiến trình duyệt hiển thị lỗi khi biểu mẫu được gửi. Bạn có thể thấy điều này trong ảnh chụp màn hình bên dưới.

![An invalid email input showing the message "Please enter an email address."](email_address_invalid.png)

Bạn có thể sử dụng thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) kết hợp với loại trường nhập liệu `email` để cho phép nhập nhiều địa chỉ email được phân tách bằng dấu phẩy trong cùng một trường nhập liệu:

```html
<input type="email" id="email" name="email" multiple />
```

Trên một số thiết bị — đặc biệt là các thiết bị cảm ứng với bàn phím động như điện thoại thông minh — có thể hiển thị bàn phím ảo khác phù hợp hơn để nhập địa chỉ email, bao gồm cả phím `@`:

![Firefox for Android email keyboard, with the at sign displayed by default.](fx-android-email-type-keyboard.jpg)

> [!NOTE]
> Bạn có thể tìm ví dụ về các loại trường nhập văn bản cơ bản tại [basic input examples](https://mdn.github.io/learning-area/html/forms/basic-input-examples/) (cũng xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/forms/basic-input-examples/index.html)).

Đây là một lý do tốt khác để sử dụng các loại trường nhập liệu mới hơn này, cải thiện trải nghiệm người dùng cho người dùng các thiết bị này.

### Kiểm tra hợp lệ phía máy khách

Như bạn thấy ở trên, `email` — cùng với các loại `input` mới hơn khác — cung cấp tính năng kiểm tra lỗi _phía máy khách_ tích hợp sẵn, được thực hiện bởi trình duyệt trước khi dữ liệu được gửi lên máy chủ. Nó _là_ hỗ trợ hữu ích để hướng dẫn người dùng điền biểu mẫu chính xác, và nó có thể tiết kiệm thời gian: thật hữu ích khi biết dữ liệu của bạn không đúng ngay lập tức, thay vì phải đợi một vòng khứ hồi đến máy chủ.

Nhưng nó _không nên được coi là_ một biện pháp bảo mật toàn diện! Ứng dụng của bạn phải luôn thực hiện kiểm tra bảo mật trên bất kỳ dữ liệu nào được gửi qua biểu mẫu ở phía _máy chủ_ cũng như phía máy khách, bởi vì kiểm tra hợp lệ phía máy khách quá dễ bị vô hiệu hóa, nên người dùng độc hại vẫn có thể dễ dàng gửi dữ liệu xấu đến máy chủ của bạn. Đọc [Bảo mật trang web](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security) để biết ý tưởng về những gì _có thể_ xảy ra; việc triển khai kiểm tra hợp lệ phía máy chủ phần nào nằm ngoài phạm vi của mô-đun này, nhưng bạn nên ghi nhớ điều đó.

Lưu ý rằng `a@b` là địa chỉ email hợp lệ theo các ràng buộc được cung cấp mặc định. Điều này là do loại trường nhập liệu `email` cho phép địa chỉ email mạng nội bộ theo mặc định. Để triển khai hành vi kiểm tra hợp lệ khác, bạn có thể sử dụng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern). Bạn cũng có thể tùy chỉnh các thông báo lỗi. Chúng ta sẽ nói về cách sử dụng các tính năng này trong bài viết [Kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation) sau.

> [!NOTE]
> Nếu dữ liệu được nhập không phải là địa chỉ email, lớp giả {{cssxref(':invalid')}} sẽ khớp và thuộc tính {{domxref('validityState.typeMismatch')}} sẽ trả về `true`.

## Trường tìm kiếm

Các trường tìm kiếm được thiết kế để sử dụng trong các hộp tìm kiếm trên các trang và ứng dụng. Loại trường này được thiết lập bằng cách sử dụng giá trị `search` cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type):

```html hidden
<label for="search">Enter a search term:</label><br />
```

```html
<input type="search" id="search" name="search" />
```

{{EmbedLiveSample('search field','100%','50')}}

Sự khác biệt chính giữa trường `text` và trường `search` là cách trình duyệt tạo kiểu giao diện của chúng. Trong một số trình duyệt, trường `search` được hiển thị với các góc tròn. Trong một số trình duyệt, biểu tượng "Ⓧ" xóa sẽ hiển thị, xóa trường khỏi bất kỳ giá trị nào khi nhấp. Biểu tượng xóa này chỉ xuất hiện nếu trường có giá trị, và ngoại trừ Safari, nó chỉ được hiển thị khi trường được focus. Ngoài ra, trên các thiết bị có bàn phím động, phím Enter của bàn phím có thể đọc "**search**", hoặc hiển thị biểu tượng kính lúp.

Một tính năng đáng chú ý khác là các giá trị của trường `search` có thể được tự động lưu và sử dụng lại để cung cấp tự động hoàn thành trên nhiều trang của cùng một trang web; điều này thường xảy ra tự động trong hầu hết các trình duyệt hiện đại.

## Trường số điện thoại

Một trường đặc biệt để điền số điện thoại có thể được tạo bằng cách sử dụng `tel` làm giá trị của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type):

```html hidden
<label for="tel">Enter a telephone number:</label><br />
```

```html
<input type="tel" id="tel" name="tel" />
```

{{EmbedLiveSample('phone number field','100%','50')}}

Khi truy cập qua thiết bị cảm ứng có bàn phím động, hầu hết các thiết bị sẽ hiển thị bàn phím số khi gặp `type="tel"`, có nghĩa là loại này hữu ích bất cứ khi nào bàn phím số hữu ích, và không chỉ phải được sử dụng cho số điện thoại.

-![Firefox for Android email keyboard, with ampersand displayed by default.](fx-android-tel-type-keyboard.jpg)

Do sự đa dạng rộng lớn của các định dạng số điện thoại trên thế giới, loại trường này không áp đặt bất kỳ ràng buộc nào đối với giá trị được nhập bởi người dùng (điều này có nghĩa là nó có thể bao gồm chữ cái, v.v.).

Như chúng ta đã đề cập trước đó, thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) có thể được sử dụng để áp đặt các ràng buộc, bạn sẽ học về điều này trong [Kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation).

## Trường URL

Một loại trường đặc biệt để nhập URL có thể được tạo bằng cách sử dụng giá trị `url` cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type):

```html hidden
<label for="url">Enter a URL:</label><br />
```

```html
<input type="url" id="url" name="url" />
```

{{EmbedLiveSample('URL field','100%','50')}}

Nó thêm các ràng buộc kiểm tra hợp lệ đặc biệt vào trường. Trình duyệt sẽ báo lỗi nếu không nhập giao thức (như `http:`) hoặc nếu URL được định dạng không đúng. Trên các thiết bị có bàn phím động, bàn phím mặc định thường sẽ hiển thị một số hoặc tất cả dấu hai chấm, dấu chấm và dấu gạch chéo làm phím mặc định.

> [!NOTE]
> Chỉ vì URL được định dạng đúng không có nghĩa là nó trỏ đến vị trí thực sự tồn tại!

## Trường số

Các điều khiển để nhập số có thể được tạo bằng {{HTMLElement("input")}} với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) là `number`. Điều khiển này trông giống như trường văn bản nhưng chỉ cho phép số dấu phẩy động và thường cung cấp các nút ở dạng con quay số để tăng và giảm giá trị của điều khiển. Trên các thiết bị có bàn phím động, bàn phím số thường được hiển thị.

```html hidden live-sample___number
<label for="number">Enter a number:</label><br />
```

```html live-sample___number
<input type="number" id="number" name="number" />
```

{{EmbedLiveSample('number','100%','50')}}

Với loại trường nhập liệu `number`, bạn có thể ràng buộc các giá trị tối thiểu và tối đa được phép bằng cách đặt thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max).

Bạn cũng có thể sử dụng thuộc tính `step` để đặt mức tăng/giảm khi nhấn các nút con quay số. Theo mặc định, loại trường nhập liệu số chỉ kiểm tra hợp lệ nếu số là số nguyên, vì thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) mặc định là `1`. Để cho phép số thực, hãy chỉ định `step="any"` hoặc một giá trị cụ thể, như `step="0.01"` để giới hạn số thực dấu phẩy động. Nếu bỏ qua, vì giá trị `step` mặc định là `1`, chỉ các số nguyên mới hợp lệ.

Hãy xem một số ví dụ:

Ví dụ này tạo một điều khiển số có giá trị hợp lệ bị giới hạn là số lẻ từ `1` đến `10`. Các nút tăng và giảm thay đổi giá trị theo `2`, bắt đầu từ giá trị `min`.

```html hidden live-sample___number2
<label for="number">Enter an odd number between 1 and 10:</label><br />
```

```html live-sample___number2
<input type="number" name="age" id="age" min="1" max="10" step="2" />
```

{{EmbedLiveSample('number2','100%','50')}}

Ví dụ này tạo một điều khiển số có giá trị bị giới hạn trong bất kỳ giá trị nào từ `0` đến `1` bao gồm, và các nút tăng/giảm thay đổi giá trị theo `0.01`.

```html hidden live-sample___number3
<label for="number">Enter a number between 0 and 1, inclusive:</label><br />
```

```html live-sample___number3
<input type="number" name="change" id="pennies" min="0" max="1" step="0.01" />
```

{{EmbedLiveSample('number3','100%','50')}}

Loại trường nhập liệu `number` có ý nghĩa khi phạm vi các giá trị hợp lệ bị giới hạn, chẳng hạn như tuổi hoặc chiều cao của người. Nếu phạm vi quá lớn để các mức tăng không có ý nghĩa (chẳng hạn như mã ZIP của Hoa Kỳ, có phạm vi từ `00001` đến `99999`), loại `tel` có thể là tùy chọn tốt hơn; nó cung cấp bàn phím số trong khi bỏ qua tính năng con quay số.

## Điều khiển thanh trượt

Một cách khác để chọn số là sử dụng **thanh trượt**. Bạn thấy những thứ này khá thường xuyên trên các trang web như trang web mua sắm nơi bạn muốn đặt giá tài sản tối đa để lọc. Hãy xem một ví dụ trực tiếp để minh họa điều này:

{{EmbedLiveSample('Slider controls','100%','50')}}

Về mặt sử dụng, thanh trượt kém chính xác hơn trường văn bản. Do đó, chúng được sử dụng để chọn một số mà giá trị _chính xác_ không nhất thiết quan trọng.

Thanh trượt được tạo bằng {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành giá trị `range`. Con trỏ thanh trượt có thể được di chuyển bằng chuột hoặc cảm ứng, hoặc với các mũi tên của bàn phím.

Điều quan trọng là phải cấu hình đúng thanh trượt của bạn. Để làm điều đó, bạn nên đặt các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min), [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max) và [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) để đặt giá trị tối thiểu, tối đa và mức tăng tương ứng.

Hãy xem mã đằng sau ví dụ trên để bạn có thể thấy cách thực hiện. Đầu tiên là HTML cơ bản:

```html
<label for="price">Choose a maximum house price: </label>
<input
  type="range"
  name="price"
  id="price"
  min="50000"
  max="500000"
  step="1000"
  value="250000" />
<output class="price-output" for="price"></output>
```

Ví dụ này tạo một thanh trượt có giá trị có thể nằm trong khoảng từ `50000` đến `500000`, tăng/giảm theo 1000 mỗi lần. Chúng ta đã cung cấp cho nó giá trị mặc định là `250000`, sử dụng thuộc tính `value`.

Một vấn đề với thanh trượt là chúng không cung cấp bất kỳ loại phản hồi trực quan nào về giá trị hiện tại là gì. Đó là lý do tại sao chúng ta đã thêm phần tử {{htmlelement("output")}} để chứa giá trị hiện tại. Bạn có thể hiển thị giá trị đầu vào hoặc kết quả của tính toán trong bất kỳ phần tử nào, nhưng `<output>` đặc biệt — giống như `<label>` — và nó có thể nhận thuộc tính `for` cho phép bạn liên kết nó với phần tử hoặc các phần tử mà giá trị đầu ra đến từ đó.

Để thực sự hiển thị giá trị hiện tại và cập nhật nó khi thay đổi, bạn phải sử dụng JavaScript, điều này có thể được thực hiện với một vài câu lệnh:

```js
const price = document.querySelector("#price");
const output = document.querySelector(".price-output");

output.textContent = price.value;

price.addEventListener("input", () => {
  output.textContent = price.value;
});
```

```css hidden
body {
  text-align: center;
}
label,
output {
  display: block;
}
```

Ở đây chúng ta lưu trữ tham chiếu đến trường nhập liệu `range` và `output` trong hai biến. Sau đó chúng ta ngay lập tức đặt [`textContent`](/en-US/docs/Web/API/Node/textContent) của `output` thành `value` hiện tại của trường nhập liệu. Cuối cùng, một trình lắng nghe sự kiện được đặt để đảm bảo rằng bất cứ khi nào thanh trượt phạm vi được di chuyển, `textContent` của `output` được cập nhật thành giá trị mới.

## Bộ chọn ngày và giờ

Nói chung, để có trải nghiệm người dùng tốt khi thu thập các giá trị ngày và giờ, điều quan trọng là cung cấp giao diện chọn lịch. Điều này cho phép người dùng chọn ngày mà không cần phải chuyển đổi ngữ cảnh sang ứng dụng lịch gốc hoặc có khả năng nhập chúng ở các định dạng khác nhau khó phân tích. Phút cuối cùng của thiên niên kỷ trước có thể được biểu thị theo các cách khác nhau sau: `1999/12/31`, `23:59`, hoặc `12/31/99T11:59PM`.

Các điều khiển ngày HTML có sẵn để xử lý loại dữ liệu cụ thể này, cung cấp các widget lịch và làm cho dữ liệu đồng nhất.

Một điều khiển ngày và giờ được tạo bằng phần tử {{HTMLElement("input")}} và giá trị phù hợp cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type), tùy thuộc vào việc bạn muốn thu thập ngày, giờ, hay cả hai. Đây là ví dụ trực tiếp:

```html hidden live-sample___date1
<label for="party">Choose a date and time for your party:</label>
<input type="datetime-local" id="party" name="bday" />
<span class="validity"></span>
```

```css hidden live-sample___date1
input:invalid + span::after {
  content: " ✖";
}

input:valid + span::after {
  content: " ✓";
}
```

{{EmbedLiveSample('date1','100%','50')}}

Hãy xem qua các loại có sẵn một cách ngắn gọn. Lưu ý rằng việc sử dụng các loại này khá phức tạp, đặc biệt là xem xét hỗ trợ trình duyệt (xem bên dưới); để tìm hiểu đầy đủ chi tiết, hãy theo dõi các liên kết bên dưới đến các trang tham chiếu cho từng loại, bao gồm các ví dụ chi tiết.

### `date`

[`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date) tạo widget để hiển thị và chọn ngày (năm, tháng và ngày, không có giờ).

```html hidden
<label for="date">Enter the date:</label><br />
```

```html
<input type="date" name="date" id="date" />
```

{{EmbedLiveSample('date','100%','50')}}

### `datetime-local`

[`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local) tạo widget để hiển thị và chọn ngày kèm giờ mà không có thông tin múi giờ cụ thể.

```html hidden
<label for="month">Enter the date and time:</label><br />
```

```html
<input type="datetime-local" name="datetime" id="datetime" />
```

{{EmbedLiveSample('datetime-local','100%','50')}}

### `month`

[`<input type="month">`](/en-US/docs/Web/HTML/Reference/Elements/input/month) tạo widget để hiển thị và chọn tháng kèm năm.

```html hidden
<label for="month">Enter the month:</label><br />
```

```html
<input type="month" name="month" id="month" />
```

{{EmbedLiveSample('month','100%','50')}}

### `time`

[`<input type="time">`](/en-US/docs/Web/HTML/Reference/Elements/input/time) tạo widget để hiển thị và chọn giá trị giờ. Mặc dù giờ có thể _hiển thị_ ở định dạng 12 giờ, _giá trị trả về_ ở định dạng 24 giờ.

```html hidden
<label for="time">Enter a time:</label><br />
```

```html
<input type="time" name="time" id="time" />
```

{{EmbedLiveSample('time','100%','50')}}

### `week`

[`<input type="week">`](/en-US/docs/Web/HTML/Reference/Elements/input/week) tạo widget để hiển thị và chọn số tuần và năm của nó.

Các tuần bắt đầu vào thứ Hai và kết thúc vào Chủ Nhật. Ngoài ra, tuần 1 đầu tiên của mỗi năm chứa thứ Năm đầu tiên của năm đó — có thể không bao gồm ngày đầu tiên của năm, hoặc có thể bao gồm vài ngày cuối của năm trước.

```html hidden
<label for="week">Enter the week:</label><br />
```

```html
<input type="week" name="week" id="week" />
```

{{EmbedLiveSample('week','100%','50')}}

### Ràng buộc các giá trị ngày/giờ

Tất cả các điều khiển ngày và giờ đều có thể bị ràng buộc bằng thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min) và [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max), với khả năng ràng buộc thêm thông qua thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Attributes/step) (giá trị của nó thay đổi theo loại trường nhập liệu).

```html
<label for="myDate">When are you available this summer?</label><br />
<input
  type="date"
  name="myDate"
  min="2025-06-01"
  max="2025-08-31"
  step="7"
  id="myDate" />
```

{{EmbedLiveSample('constraining date/time values','100%','50')}}

## Điều khiển bộ chọn màu

Màu sắc luôn khó xử lý một chút. Có nhiều cách để biểu thị chúng: giá trị RGB (thập phân hoặc thập lục phân), giá trị HSL, từ khóa, v.v.

Điều khiển `color` có thể được tạo bằng phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành giá trị `color`:

```html hidden
<label for="color">Pick a color:</label><br />
```

```html
<input type="color" name="color" id="color" />
```

{{EmbedLiveSample('Color picker control','100%','50')}}

Nhấp vào điều khiển màu thường hiển thị chức năng chọn màu mặc định của hệ điều hành để bạn chọn. Giá trị trả về luôn là màu thập lục phân 6 giá trị chữ thường.

## Tóm tắt

Điều đó đưa chúng ta đến cuối hành trình khám phá các loại trường nhập liệu biểu mẫu HTML5. Có một số loại điều khiển khác không thể dễ dàng nhóm lại do hành vi rất cụ thể của chúng nhưng vẫn cần thiết để biết. Chúng ta đề cập đến những thứ đó trong bài viết tiếp theo.

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Basic_native_form_controls", "Learn_web_development/Extensions/Forms/Other_form_controls", "Learn_web_development/Extensions/Forms")}}
