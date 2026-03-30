---
title: Biểu mẫu và nút trong HTML
short-title: Biểu mẫu và nút
slug: Learn_web_development/Core/Structuring_content/HTML_forms
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Planet_data_table", "Learn_web_development/Core/Structuring_content/Test_your_skills/Forms_and_buttons", "Learn_web_development/Core/Structuring_content")}}

Biểu mẫu và nút HTML là công cụ mạnh mẽ để tương tác với người dùng của trang web. Phổ biến nhất, chúng cung cấp cho người dùng các điều khiển để thao tác giao diện người dùng (UI) hoặc nhập dữ liệu khi cần thiết.

Trong bài viết này, chúng ta cung cấp phần giới thiệu về kiến thức cơ bản của biểu mẫu và nút. Còn nhiều điều cần biết hơn — nhiều loại input và tính năng biểu mẫu không được đề cập — nhưng bài viết này sẽ cung cấp cho bạn nền tảng vững chắc cho hầu hết các trường hợp. Bạn có thể tìm hiểu các cách sử dụng nâng cao hoặc chuyên biệt theo nhu cầu như một phần của việc học liên tục bạn sẽ làm trong suốt sự nghiệp.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >. Ngữ nghĩa ở cấp độ văn bản như <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs"
          >tiêu đề và đoạn văn</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists"
          >danh sách</a
        >. <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Structuring_documents"
          >HTML cấu trúc</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Nhận thức rằng biểu mẫu và nút là công cụ chính để người dùng tương tác với trang web, cùng với các liên kết.</li>
          <li>Các loại nút khác nhau.</li>
          <li>Các loại <code>&lt;input&gt;</code> phổ biến.</li>
          <li>Các thuộc tính phổ biến như <code>name</code> và <code>value</code>.</li>
          <li>Phần tử <code>&lt;form&gt;</code>, và kiến thức cơ bản về gửi biểu mẫu.</li>
          <li>Làm cho biểu mẫu có thể tiếp cận với nhãn và ngữ nghĩa đúng.</li>
          <li>Các loại điều khiển khác: <code>&lt;textarea&gt;</code>, <code>&lt;select&gt;</code>, và <code>&lt;option&gt;</code>.</li>
          <li>Kiến thức cơ bản về xác thực phía máy khách.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tương tác với người dùng

Cho đến nay trong khóa học, bạn đã thấy một vài cách người dùng có thể tương tác với web:

- [Liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links) có thể được sử dụng để điều hướng đến các phần nội dung khác nhau, trên cùng trang hoặc trang khác.
- Các phần tử [`<video>` và `<audio>`](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) thường có các điều khiển như phát/tạm dừng, tua nhanh, tua lại, v.v., cho phép người dùng sử dụng nội dung phương tiện theo cách họ muốn.

Tuy nhiên, những tính năng này có xu hướng hỗ trợ tương tác một chiều, với người dùng thụ động tiêu thụ nội dung. Điều này ổn, nhưng web là trải nghiệm hai chiều. Người dùng trang web đặt tùy chọn về cách họ muốn trải nghiệm nội dung và dịch vụ. Họ đặt taxi và yêu cầu gọi lại. Họ cung cấp phản hồi và khiếu nại. Họ mua sản phẩm và nhận chúng tại nhà.

Để cung cấp trải nghiệm hai chiều này, bạn cần sử dụng nút và biểu mẫu.

Nút thường được tạo bằng cách sử dụng các phần tử HTML {{htmlelement("button")}} (chúng đôi khi cũng được tạo bằng cách sử dụng các phần tử {{htmlelement("input")}} với thuộc tính `type` được đặt thành giá trị như `button` hoặc `submit`). Những nút push này là đa năng — bạn có thể kết nối chúng để kích hoạt bất kỳ chức năng nào bạn muốn, chỉ bị giới hạn bởi trí tưởng tượng và kỹ năng lập trình của bạn.

Biểu mẫu được tạo bằng các phần tử như {{htmlelement("form")}}, {{htmlelement("label")}}, {{htmlelement("input")}}, và {{htmlelement("select")}}. Các phần tử biểu mẫu có thể được sử dụng để tạo ra các điều khiển phức tạp hơn những gì nút đơn giản cho phép — ví dụ như menu thả xuống chứa nhiều tùy chọn cho phép bạn chọn giữa các chủ đề khác nhau cho phần tử giao diện người dùng.

Tuy nhiên, quan trọng nhất, chúng cũng có thể được sử dụng để tạo biểu mẫu để người dùng điền vào khi cần gửi thông tin đến máy chủ trang web. Hãy nghĩ về các trang thương mại điện tử — khi bạn muốn tìm kiếm sản phẩm để mua, bạn sử dụng biểu mẫu để nhập từ khóa tìm kiếm. Khi bạn muốn thanh toán cho một số mặt hàng và hoàn tất việc giao hàng, bạn sử dụng biểu mẫu để nhập địa chỉ bưu điện, và một biểu mẫu khác để nhập thông tin thẻ tín dụng.

Chúng ta sẽ tập trung chủ yếu vào cách sử dụng — theo nghĩa truyền thống hơn — này của các phần tử biểu mẫu trong bài viết này. Lưu ý rằng nút cũng thường được sử dụng bên trong biểu mẫu, để gửi dữ liệu đã nhập đến máy chủ.

Với lý thuyết quan trọng này đã được trình bày, hãy tiếp tục khám phá mã và xem cách nút và biểu mẫu được triển khai.

## Nút

Như đã gợi ý ở trên, nút có một vài cách sử dụng chính trên web. Trước hết, chúng được sử dụng để kích hoạt chức năng, điều này hữu ích khi tạo các điều khiển UI. Nút đơn giản nhất được triển khai bằng mã sau:

```html live-sample___basic-button
<button>Press me</button>
```

Điều này được hiển thị như sau:

{{EmbedLiveSample("basic-button", "100%", "60")}}

Văn bản xuất hiện giữa các thẻ `<button></button>` được hiển thị bên trong nút, và nó được cung cấp một số tạo kiểu cơ bản bởi trình duyệt để nó sẽ trông và hoạt động như một nút theo mặc định. Cho đến đây, mọi thứ đều ổn. Tuy nhiên, có một vấn đề ở đây — nút đơn độc của chúng ta sẽ không làm gì hữu ích theo ý nghĩa riêng của nó. Để làm cho nó làm điều gì đó hữu ích, bạn sẽ cần đặt nó bên trong biểu mẫu (mà chúng ta sẽ đề cập sau), hoặc thêm một số JavaScript.

Ví dụ, nếu bạn áp dụng JavaScript sau vào nút ở trên:

```html hidden live-sample___basic-button-with-js
<button>Press me</button>
```

```js live-sample___basic-button-with-js
const btn = document.querySelector("button");
btn.addEventListener("click", () => {
  btn.textContent = "YOU CLICKED ME!! ❤️";
  setTimeout(() => {
    btn.textContent = "Press me";
  }, 1000);
});
```

Nó sẽ cho bạn đầu ra sau — hãy thử nhấp vào nó:

{{EmbedLiveSample("basic-button-with-js", "100%", "60")}}

Bạn không cần phải hiểu JavaScript hoạt động như thế nào bây giờ. Bạn sẽ tìm hiểu thêm về nó sau này trong khóa học.

Trong phần tiếp theo, bạn sẽ thấy một minh chứng về cách sử dụng nút chính thứ hai — gửi biểu mẫu.

## Cấu trúc của biểu mẫu

Biểu mẫu cơ bản chứa ba thứ:

- Một phần tử {{htmlelement("form")}}, bao gồm tất cả nội dung biểu mẫu khác. Bất kỳ điều khiển biểu mẫu nào bên trong thẻ `<form></form>` đều là một phần của cùng một biểu mẫu, và dữ liệu của chúng được bao gồm khi biểu mẫu được gửi.
- Một hoặc nhiều cặp mỗi cặp bao gồm phần tử {{htmlelement("label")}} và một phần tử điều khiển biểu mẫu (thường là phần tử {{htmlelement("input")}}, nhưng cũng có các loại khác, ví dụ như {{htmlelement("select")}}):
  - Phần tử điều khiển biểu mẫu cho phép người dùng chọn hoặc nhập một số dữ liệu, sẽ được gửi đến máy chủ khi biểu mẫu được gửi.
  - Phần tử `<label>` cung cấp nhãn nhận dạng được liên kết với điều khiển biểu mẫu mô tả dữ liệu nên được nhập vào đó.
- Một phần tử {{htmlelement("button")}}, được sử dụng để gửi biểu mẫu.

Hãy xem một ví dụ cơ bản bao gồm ba mục trên. Biểu mẫu này có thể được sử dụng để hỏi tên và email của người dùng, để đăng ký họ vào bản tin (đừng lo — nó không được kết nối với bất kỳ máy chủ nào, vì vậy hiện tại sẽ không làm gì cả).

```html live-sample___form-anatomy
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>First form</title>
  </head>
  <body>
    <form action="./submit_page" method="get">
      <h2>Subscribe to our newsletter</h2>
      <p>
        <label for="name">Name (required):</label>
        <input type="text" name="name" id="name" required />
      </p>
      <p>
        <label for="email">Email (required):</label>
        <input type="email" name="email" id="email" required />
      </p>
      <p>
        <button>Sign me up!</button>
      </p>
    </form>
  </body>
</html>
```

Điều này được hiển thị như sau:

{{EmbedLiveSample("form-anatomy", "100%", "200", , , , , "allow-forms")}}

Nếu bạn nhấp vào "Sign me up!" ngay lập tức, bạn sẽ thấy lỗi xác thực vì không có dữ liệu nào được nhập. Nếu bạn điền vào các trường với tên và địa chỉ email rồi nhấp "Sign me up!", bạn sẽ thấy thông báo lỗi `404`.

Chúng ta sẽ giải thích lý do sau. Trước khi tiếp tục, sao chép danh sách mã HTML trước vào tệp HTML mới bằng [trình soạn thảo mã](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Code_editors) của bạn và mở nó trong tab trình duyệt mới.

### Phần tử `<form>`

Như chúng ta đã nói trước đó, phần tử {{htmlelement("form")}} hoạt động như bao bọc bên ngoài của biểu mẫu, nhóm tất cả các điều khiển biểu mẫu bên trong nó lại với nhau. Khi `<button>` được nhấn, tất cả dữ liệu được đại diện bởi các điều khiển biểu mẫu sẽ được gửi đến máy chủ. Phần tử `<form>` có thể nhận nhiều thuộc tính, nhưng hai thuộc tính quan trọng nhất, mà chúng ta đã bao gồm trong ví dụ, như sau:

- `action`: Chứa đường dẫn đến trang mà chúng ta muốn gửi dữ liệu biểu mẫu đã gửi đến, để được xử lý. Sau này, sau khi bạn gửi biểu mẫu, bạn sẽ thấy `/submit_page` được bao gồm trong URL. Bạn cũng sẽ nhận được phản hồi lỗi {{HTTPStatus("404")}} vì trang thực sự không tồn tại, nhưng điều đó ổn cho bây giờ.
- `method`: Chỉ định [phương thức](/en-US/docs/Web/HTTP/Reference/Methods) truyền dữ liệu bạn muốn sử dụng để gửi dữ liệu biểu mẫu đến máy chủ. Đừng lo lắng về điều này quá nhiều bây giờ; giá trị `get` làm cho dữ liệu được gửi dưới dạng tham số được đính kèm vào cuối URL.

#### Kiểm tra dữ liệu đã gửi

1. Đến ví dụ trong tab riêng, hãy thử nhập tên "Bob" và địa chỉ email "bob@bob.com".
2. Nhấn `<button>`.

Các thuộc tính `action` và `method` làm cho dữ liệu biểu mẫu được gửi trong URL theo các dòng sau:

```plain
/some/url/submit_page?name=Bob&email=bob%40bob.com
```

#### Cấu trúc biểu mẫu

Bạn có thể bao gồm bất kỳ phần tử HTML nào bạn thích bên trong phần tử `<form>` để cấu trúc các phần tử biểu mẫu và cung cấp các container để nhắm mục tiêu với CSS để tạo kiểu, v.v.

Trong ví dụ của chúng ta, chúng ta đã bao gồm [phần tử tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) (`<h2>`) để mô tả mục đích của biểu mẫu.

Chúng ta cũng đã đặt mỗi cặp input/label và nút gửi bên trong một {{htmlelement("p")}} riêng biệt, để mỗi cái sẽ xuất hiện trên một dòng riêng. Những phần tử này đều là nội tuyến theo mặc định, có nghĩa là nếu chúng ta không làm điều này, chúng sẽ ngồi trên cùng một dòng.

Đây là mẫu phổ biến cho việc cấu trúc biểu mẫu. Một số người sử dụng các phần tử `<p>` để phân tách các phần tử biểu mẫu, một số sử dụng {{htmlelement("div")}}, {{htmlelement("section")}}, hoặc thậm chí các phần tử {{htmlelement("li")}}. Không quan trọng lắm, miễn là các phần tử được sử dụng có ý nghĩa ngữ nghĩa. Ví dụ, có ý nghĩa khi chia các nhóm phần tử biểu mẫu thành các đoạn hoặc phần nội dung riêng biệt, hoặc thậm chí các mục trong danh sách. Sẽ ít có ý nghĩa hơn khi biểu diễn chúng như [blockquote](/en-US/docs/Web/HTML/Reference/Elements/blockquote), [aside](/en-US/docs/Web/HTML/Reference/Elements/aside), hoặc [address](/en-US/docs/Web/HTML/Reference/Elements/address).

Có một phần tử chuyên biệt để nhóm các phần tử biểu mẫu lại gọi là {{htmlelement("fieldset")}}. Điều này hữu ích trong một số trường hợp, chẳng hạn như trong các biểu mẫu phức tạp, và khi nhóm nhiều hộp kiểm và nút radio lại. Chúng ta sẽ xem xét một vài ví dụ `<fieldset>` sau.

### Phần tử `<input>`

Các phần tử {{htmlelement("input")}} đại diện cho các mục dữ liệu khác nhau được nhập vào biểu mẫu. Hãy nghiên cứu một trong các ví dụ từ biểu mẫu cơ bản của chúng ta:

```html
<input type="text" name="name" id="name" required />
```

Các thuộc tính như sau:

- `type`: Chỉ định loại điều khiển biểu mẫu cần tạo. Có nhiều loại điều khiển biểu mẫu khác nhau, từ các trường văn bản đơn giản của các loại khác nhau đến nút radio, hộp kiểm, và nhiều hơn nữa. Loại `text` hiển thị trường văn bản cơ bản có thể chấp nhận bất kỳ giá trị nào.
- `name`: Chỉ định tên cho mục dữ liệu. Khi biểu mẫu được gửi, dữ liệu được gửi theo cặp tên/giá trị. Trong mỗi trường hợp, tên bằng giá trị thuộc tính `name` này, và giá trị bằng văn bản được nhập vào trường văn bản.
- `id`: Chỉ định ID có thể được sử dụng để nhận dạng phần tử. Trong trường hợp này, nó được sử dụng để liên kết điều khiển biểu mẫu với `<label>` của nó.
- `required`: Chỉ định rằng một giá trị phải được nhập vào phần tử biểu mẫu trước khi biểu mẫu có thể được gửi. Điều này chỉ nên được đặt trên các input mà bạn yêu cầu, không phải trên các trường tùy chọn.

Bạn nên biết rằng một số loại input thường không nhận giá trị của chúng từ văn bản được nhập vào trường. Ví dụ, [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color) hiển thị widget chọn màu mà bạn chọn màu từ đó, trong khi [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio) hiển thị điều khiển nút radio có thể được chọn hoặc không.

Trong trường hợp nút radio, bạn thường cần cung cấp giá trị sẽ được gửi nếu nó được chọn bên trong thuộc tính `value` cụ thể. Lưu ý rằng bạn _có thể_ chỉ định thuộc tính `value` trên các loại input như `text` và `color` — hiệu ứng là giá trị được điền trước vào trường biểu mẫu khi nó lần đầu được hiển thị.

#### Thuộc tính `required` và `value` trong hành động

1. Một lần nữa, hãy đến ví dụ bạn đã tải trong tab riêng, và thử gửi biểu mẫu mà không có giá trị nào được nhập vào bất kỳ trường nào. Bạn sẽ thấy thông báo lỗi xuất hiện bên cạnh trường "Name" với nội dung đại loại "Please fill in this field" (nó sẽ thay đổi giữa các trình duyệt khác nhau). Đây là thuộc tính `required` — và xác thực biểu mẫu mặc định phía máy khách của trình duyệt — đang hoạt động.
2. Bây giờ hãy thử gửi biểu mẫu với tên hợp lệ được nhập vào trường đầu tiên, nhưng giá trị không phải là địa chỉ email hợp lệ vào trường thứ hai (điều gì đó như "aaaa" sẽ làm được). Lần này bạn sẽ thấy thông báo lỗi xuất hiện bên cạnh trường "Email" với nội dung đại loại "Please enter an email address".
3. Hãy thử chỉnh sửa biểu mẫu để bao gồm `value="Bob"` trên input đầu tiên. Khi bạn tải lại mã, bạn sẽ thấy trường đầu tiên có giá trị "Bob" được nhập vào theo mặc định.

#### Các input trường văn bản chuyên biệt

Bài tập thứ hai ở trên đặt ra một điểm thú vị. Trường input thứ hai cụ thể mong đợi địa chỉ email, và xác thực các giá trị được nhập như vậy. Nếu bạn nhìn lại mã biểu mẫu, bạn sẽ thấy lý do — `<input>` thứ hai có `type` là `email`. Có một số loại input trường văn bản chuyên biệt được thiết kế để xử lý các loại dữ liệu cụ thể — [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number), [`<input type="password">`](/en-US/docs/Web/HTML/Reference/Elements/input/password), [`<input type="tel">`](/en-US/docs/Web/HTML/Reference/Elements/input/tel), v.v.

Hãy theo một số liên kết ở trên để tìm hiểu những loại input này được sử dụng cho gì. Hãy xem xét tham chiếu [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input) của chúng ta và xem bạn có thể tìm thấy bất kỳ loại input trường văn bản chuyên biệt nào khác không.

### Phần tử `<label>`

Như chúng ta đã nói ở trên, các phần tử {{htmlelement("label")}} cung cấp nhãn nhận dạng được liên kết với các điều khiển biểu mẫu mô tả dữ liệu nên được nhập vào chúng. Bạn có thể đặt bất kỳ nội dung văn bản nào bạn thích trong các phần tử `<label>`, nhưng chúng nên mô tả chính xác dữ liệu mà điều khiển biểu mẫu liên kết mong đợi. Sự liên kết được tạo ra bằng cách cung cấp cho điều khiển biểu mẫu thuộc tính `id`, sau đó cung cấp cho phần tử `<label>` thuộc tính `for` với cùng giá trị với `id` của điều khiển.

Ví dụ:

```html
<label for="name">Name (required):</label>
<input type="text" name="name" id="name" required />
```

Các phần tử `<label>` quan trọng vì một số lý do, đáng chú ý nhất là:

- Khi người dùng khiếm thị sử dụng trình đọc màn hình để giúp họ đọc và tương tác với nội dung trang web, trình đọc màn hình sẽ đọc to văn bản nhãn liên kết khi mỗi điều khiển được gặp. Điều này giúp người dùng dễ dàng hiểu nội dung nào nên được nhập vào mỗi điều khiển hơn.
- Chúng cho phép bạn tập trung các phần tử biểu mẫu bằng cách nhấp vào văn bản nhãn của chúng cũng như các điều khiển. Điều này đặc biệt hữu ích cho người dùng điện thoại di động, nơi có thể khó chính xác chọn phần tử biểu mẫu bằng ngón tay trên màn hình cảm ứng. Làm cho **vùng nhấp** lớn hơn hữu ích trong những trường hợp như vậy.

#### Nhãn biểu mẫu rõ ràng và ngụ ý

Kiểu nhãn biểu mẫu bạn thấy ở trên được gọi là **nhãn biểu mẫu rõ ràng** — sự liên kết giữa điều khiển và nhãn được thực hiện một cách rõ ràng thông qua các thuộc tính `id` và `for`. Bạn cũng có thể triển khai **nhãn biểu mẫu ngụ ý** bằng cách lồng điều khiển bên trong nhãn, như sau:

```html
<label>
  Name (required):
  <input type="text" name="name" required />
</label>
```

Việc lồng tạo ra sự liên kết ngụ ý giữa điều khiển và nhãn, và bạn không cần các thuộc tính `id` và `for` nữa.

Cả hai cách tiếp cận đều ổn, nhưng chúng tôi khuyến nghị sử dụng cách tiếp cận gán nhãn rõ ràng. Điều này vì sự liên kết rõ ràng thường dễ xác định và hiểu hơn, đặc biệt khi mã HTML của bạn trở nên phức tạp hơn. Ngoài ra, các trình đọc màn hình (và các công nghệ hỗ trợ khác) không phải lúc nào cũng xử lý nhãn ngụ ý đúng cách.

Bạn có thể đọc thêm về các phương pháp tốt nhất gán nhãn biểu mẫu trong [HTML Inputs and Labels: A Love Story](https://css-tricks.com/html-inputs-and-labels-a-love-story/), csstricks.com (2021).

### Phần tử `<button>`

Khi phần tử {{htmlelement("button")}} được bao gồm bên trong phần tử `<form>`, hành vi mặc định của nó là sẽ gửi biểu mẫu, miễn là không có dữ liệu không hợp lệ hiện diện gây ra việc gửi bị chặn bởi xác thực biểu mẫu phía máy khách. Bạn đã thấy hành vi này khi chơi với ví dụ biểu mẫu cơ bản ở trên.

Có các hành vi nút khác có thể được chỉ định thông qua thuộc tính `type` của phần tử `<button>`:

- `<button type="submit">` khai báo rõ ràng rằng nút nên hoạt động như nút gửi. Bạn thực sự không bao giờ cần khai báo điều này, trừ khi vì lý do nào đó bạn đang bao gồm các nút khác bên trong `<form>` của bạn, và bạn muốn làm rõ nút gửi là nút nào. Điều này sẽ rất hiếm.
- `<button type="reset">` tạo _nút đặt lại_ — điều này ngay lập tức xóa tất cả dữ liệu ra khỏi biểu mẫu, đặt lại về trạng thái ban đầu. **Đừng sử dụng nút đặt lại** — chúng phổ biến vào những ngày đầu của web, nhưng chúng thường gây khó chịu hơn là hữu ích. Hầu hết mọi người đều đã trải qua việc điền vào một biểu mẫu dài chỉ để vô tình nhấp vào nút đặt lại thay vì nút gửi, có nghĩa là họ phải bắt đầu lại.
- `<button type="button">` tạo một nút có cùng hành vi như các nút được chỉ định bên ngoài các phần tử `<form>`. Như chúng ta đã thấy trước đó, chúng hoàn toàn không làm gì theo mặc định, và JavaScript được cần để cung cấp chức năng cho chúng.

Mặc dù bạn có thể tạo các loại nút này bằng cách sử dụng phần tử `<input>` với cùng giá trị `type` — như [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit), [`<input type="reset">`](/en-US/docs/Web/HTML/Reference/Elements/input/reset), và [`<input type="button">`](/en-US/docs/Web/HTML/Reference/Elements/input/button) — chúng có nhiều nhược điểm so với các phiên bản `<button>`. Vì vậy, bạn nên sử dụng `<button>` thay thế.

> [!NOTE]
> Scrimba<sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> có một bài học miễn phí — [The very basics of forms](https://scrimba.com/learn-responsive-web-design-c029/~031?via=mdn) — cung cấp tóm tắt tương tác hữu ích về kiến thức cơ bản biểu mẫu mà chúng ta đã đề cập trước đó trong bài viết này.

## Ghi chú về khả năng tiếp cận

Chúng ta đã nói về tầm quan trọng của nhãn biểu mẫu cho khả năng tiếp cận, nhưng chúng ta cũng muốn bao gồm một số nhận xét về tầm quan trọng chung của việc sử dụng các phần tử ngữ nghĩa đúng để tạo biểu mẫu (ví dụ: sử dụng `<button>` để gửi biểu mẫu của bạn, không phải `<div>` được lập trình để hoạt động như `<button>`.) Hoàn toàn có thể sử dụng kết hợp CSS và JavaScript để làm cho hầu hết mọi phần tử HTML trông và hoạt động như phần tử biểu mẫu. Các nhà phát triển thường làm điều này vì lý do thiết kế — một số điều khiển biểu mẫu khó tạo kiểu.

Tuy nhiên, khi bạn làm điều này, bạn đang làm cho cuộc sống của bạn và người dùng của bạn khó khăn hơn. Trình duyệt cung cấp một số tính năng `<button>` và điều khiển biểu mẫu theo mặc định, không cần JavaScript hay mã bổ sung nào khác, để làm cho biểu mẫu có thể sử dụng được cho tất cả người dùng.

Ví dụ:

- Các phần tử ngữ nghĩa được công nghệ hỗ trợ như trình đọc màn hình hiểu, truyền đạt ý nghĩa của chúng cho người dùng không thể nhìn thấy chúng.
- Các điều khiển biểu mẫu và nút có thể truy cập bằng bàn phím theo mặc định. Trong ví dụ trước, hãy thử di chuyển tiến và lùi giữa các phần tử biểu mẫu bằng <kbd>Tab</kbd> và <kbd>Shift</kbd> + <kbd>Tab</kbd> (được gọi là "tabbing").
- Cũng lưu ý cách việc tab giữa các phần tử biểu mẫu làm cho phần tử được tập trung được làm nổi bật bằng một đường viền màu xanh lam (được gọi là **đường viền tập trung**). Đây là tính năng quan trọng để người dùng bàn phím biết họ hiện đang ở đâu trong biểu mẫu.

Nếu bạn không sử dụng các phần tử ngữ nghĩa đúng để triển khai biểu mẫu của mình, bạn sẽ phải tự triển khai lại tất cả chức năng này, nếu không các phần tử biểu mẫu của bạn sẽ không hoạt động như người dùng mong đợi và do đó có vẻ bị hỏng. Tất cả cộng lại.

## Các loại điều khiển khác

Có nhiều loại điều khiển khác bạn có thể sử dụng để thu thập dữ liệu trong biểu mẫu. Hãy xem xét một ví dụ phức tạp hơn một chút, sau đó chúng ta sẽ khám phá và giải thích nó.

> [!NOTE]
> Trong ví dụ này, chúng ta giả sử người dùng đã đăng ký và đăng nhập, do đó không cần thu thập thông tin như tên và email.

```html live-sample___form-other-controls
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Second form</title>
  </head>
  <body>
    <form action="./payment_page" method="get">
      <h2>Register for the meetup</h2>
      <fieldset>
        <legend>Choose hotel room type:</legend>
        <div>
          <input
            type="radio"
            id="hotelChoice1"
            name="hotel"
            value="economy"
            checked />
          <label for="hotelChoice1">Economy (+$0)</label>

          <input type="radio" id="hotelChoice2" name="hotel" value="superior" />
          <label for="hotelChoice2">Superior (+$50)</label>

          <input
            type="radio"
            id="hotelChoice3"
            name="hotel"
            value="penthouse"
            disabled />
          <label for="hotelChoice3">Penthouse (+$150)</label>
        </div>
      </fieldset>
      <fieldset>
        <legend>Choose classes to attend:</legend>
        <div>
          <input type="checkbox" id="yoga" name="yoga" />
          <label for="yoga">Yoga (+$10)</label>

          <input type="checkbox" id="coffee" name="coffee" />
          <label for="coffee">Coffee roasting (+$20)</label>

          <input type="checkbox" id="balloon" name="balloon" />
          <label for="balloon">Balloon animal art (+$5)</label>
        </div>
      </fieldset>
      <p>
        <label for="transport">How are you getting here:</label>
        <select name="transport" id="transport">
          <option value="">--Please choose an option--</option>
          <option value="plane">Plane</option>
          <option value="bike">Bike</option>
          <option value="walk">Walk</option>
          <option value="bus">Bus</option>
          <option value="train">Train</option>
          <option value="jetPack">Jet pack</option>
        </select>
      </p>
      <p>
        <label for="comments">Any other comments:</label>
        <textarea id="comments" name="comments" rows="5" cols="33"></textarea>
      </p>
      <p>
        <button>Continue to payment</button>
      </p>
    </form>
  </body>
</html>
```

Điều này được hiển thị như sau:

{{EmbedLiveSample("form-other-controls", "100%", "500", , , , , "allow-forms")}}

Chúng tôi khuyến nghị bạn mở ví dụ này trong tab trình duyệt riêng khi bạn xem qua các phần tiếp theo, trong đó chúng ta xem xét từng loại điều khiển lần lượt. Để thực hiện điều này, hãy sao chép mã vào tệp HTML bằng trình soạn thảo mã của bạn, và mở nó trong tab trình duyệt.

Trước khi tiếp tục, hãy chơi với các điều khiển biểu mẫu khác nhau trong bản sao cục bộ của bạn và chọn một số giá trị. Hãy thử gửi biểu mẫu và xem dữ liệu được gửi trong URL trông như thế nào.

### Nút radio

Các nút "Choose hotel room type" được triển khai bằng điều khiển [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio). Chúng hiển thị như một bộ điều khiển nút push nơi chỉ một trong số chúng có thể được chọn tại bất kỳ thời điểm nào — bạn không thể chọn nhiều hơn một lúc. Chúng được đặt tên theo các nút tìm thấy trên radio cũ, nơi bạn nhấn một nút và nút đã chọn trước đó bật ra.

Mã ví dụ của chúng ta trông như thế này:

```html
<fieldset>
  <legend>Choose hotel room type:</legend>
  <div>
    <input
      type="radio"
      id="hotelChoice1"
      name="hotel"
      value="economy"
      checked />
    <label for="hotelChoice1">Economy (+$0)</label>

    <input type="radio" id="hotelChoice2" name="hotel" value="superior" />
    <label for="hotelChoice2">Superior (+$50)</label>

    <input
      type="radio"
      id="hotelChoice3"
      name="hotel"
      value="penthouse"
      disabled />
    <label for="hotelChoice3">Penthouse (+$150)</label>
  </div>
</fieldset>
```

Các loại input `radio` hầu hết hoạt động giống như các loại input `text`, nhưng có một vài điểm khác biệt:

- Các thuộc tính `name` cho mỗi bộ nút radio phải chứa cùng một giá trị, để liên kết chúng lại với nhau như một bộ. Nếu chúng chứa các giá trị khác nhau, chúng sẽ là các bộ riêng biệt, với các giá trị khác nhau khi gửi.
- Bạn phải bao gồm thuộc tính `value` chứa giá trị để gửi cho mỗi nút radio. Giá trị được gửi sẽ là cặp tên/giá trị, nhưng tên luôn giống nhau, ví dụ `hotel=economy` hoặc `hotel=superior`.
- `<label>` cho mỗi nút radio nên mô tả lựa chọn giá trị cụ thể đó, thay vì giá trị tổng thể bạn đang chọn. Cách ưu tiên để cung cấp mô tả về lựa chọn giá trị tổng thể là bọc chúng trong {{htmlelement("fieldset")}}, nhận phần tử {{htmlelement("legend")}} làm con chứa mô tả.

> [!NOTE]
> Ngoài việc cấu trúc và gán nhãn biểu mẫu, fieldset có các cách sử dụng khác, chẳng hạn như [vô hiệu hóa](#disabling_form_controls) toàn bộ bộ điều khiển như một đơn vị.

Cũng đáng lưu ý rằng chúng ta đã áp dụng thuộc tính `checked` vào nút radio đầu tiên — điều này khiến nó được chọn khi trang lần đầu tải. Điều này có nghĩa là một tùy chọn sẽ luôn được chọn, và bạn không thể bỏ chọn nút radio mà không chọn nút khác.

Thử xóa thuộc tính `checked` khỏi nút radio đầu tiên, lưu, sau đó tải lại, để xem hiệu ứng nó có. Đặt lại trước khi bạn tiếp tục.

#### Vô hiệu hóa điều khiển biểu mẫu

Trong ví dụ nút radio, bạn sẽ nhận thấy rằng nút radio thứ ba có thuộc tính `disabled` được đặt trên nó. Điều này khiến điều khiển được hiển thị trở nên xám và không thể chọn được. Điều này hữu ích trong nhiều tình huống khi một tùy chọn thường có sẵn, chỉ là không phải bây giờ. Ví dụ, một sản phẩm có thể hết hàng, hoặc như trong trường hợp ví dụ của chúng ta, các phòng suite penthouse đều đã được đặt!

Bạn có thể đặt thuộc tính `disabled` trên bất kỳ điều khiển biểu mẫu nào, bao gồm cả các phần tử `<button>`. Các phần tử `<fieldset>` cũng có thể chấp nhận thuộc tính `disabled` — điều này khiến mọi điều khiển biểu mẫu bên trong fieldset bị vô hiệu hóa.

Thử đặt thuộc tính `disabled` trên hai phần tử `<fieldset>`, lưu, sau đó tải lại, để xem hiệu ứng nó có. Xóa chúng trước khi tiếp tục.

### Hộp kiểm

Các bộ chọn "classes to attend" của chúng ta được triển khai bằng điều khiển [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox). Chúng hiển thị như một bộ hộp kiểm trạng thái bật/tắt. Không giống như nút radio, bạn có thể chọn nhiều hơn một lúc.

```html
<fieldset>
  <legend>Choose classes to attend:</legend>
  <div>
    <input type="checkbox" id="yoga" name="yoga" />
    <label for="yoga">Yoga (+$10)</label>

    <input type="checkbox" id="coffee" name="coffee" />
    <label for="coffee">Coffee roasting (+$20)</label>

    <input type="checkbox" id="balloon" name="balloon" />
    <label for="balloon">Balloon animal art (+$5)</label>
  </div>
</fieldset>
```

Như bạn có thể thấy từ các đoạn mã, nút radio và hộp kiểm được triển khai theo cách rất giống nhau (chúng cũng có thể có thuộc tính `checked` để hiển thị chúng được chọn trước khi trang tải). Chúng cũng hoạt động theo cách khá tương tự, ngoại trừ nút radio cho phép bạn chọn không hoặc một mục trong số nhiều mục, và hộp kiểm cho phép bạn chọn không hoặc nhiều mục trong số nhiều mục.

Sự khác biệt chính (ngoài giá trị `type`!) là mỗi hộp kiểm có giá trị `name` khác nhau, và chúng thường không được đặt thuộc tính `value`. Về hành vi, điều này có nghĩa là chúng đại diện cho các giá trị dữ liệu khác nhau, trong khi một bộ nút radio chỉ đại diện cho một. Khi gửi, mỗi giá trị được gửi với giá trị `on` nếu hộp kiểm được chọn — `yoga=on`, `balloon=on`, v.v.

> [!NOTE]
> Có thể thay đổi giá trị được gửi cho hộp kiểm bằng cách cung cấp thuộc tính `value`, ví dụ: `<input type="checkbox" id="yoga" name="yoga" value="yes" />` sẽ dẫn đến `yoga=yes` được gửi nếu được chọn. Tuy nhiên, làm điều này không có nhiều ý nghĩa. Hộp kiểm hoặc được gửi với một giá trị duy nhất nếu được chọn, hoặc không được gửi. Không thực sự quan trọng giá trị nào được gửi đến máy chủ.

### Menu thả xuống

Menu thả xuống, ví dụ như điều khiển lựa chọn "How are you getting here" trong ví dụ của chúng ta, được triển khai không phải với loại `<input>`, mà với các phần tử {{htmlelement("select")}} và {{htmlelement("option")}}:

```html
<label for="transport">How are you getting here:</label>
<select name="transport" id="transport">
  <option value="">--Please choose an option--</option>
  <option value="plane">Plane</option>
  <option value="bike">Bike</option>
  <option value="walk">Walk</option>
  <option value="bus">Bus</option>
  <option value="train">Train</option>
  <option value="jetPack">Jet pack</option>
</select>
```

Phần tử `<select>` bao gồm tất cả các lựa chọn giá trị khác nhau. Đây là nơi bạn đặt thuộc tính `id` liên kết điều khiển với nhãn của nó, và thuộc tính `name` đặt tên của mục dữ liệu cần gửi.

Mỗi giá trị có thể cho mục dữ liệu được đại diện bởi phần tử `<option>`, được lồng bên trong phần tử `<select>`. Mỗi phần tử `<option>` có thể có thuộc tính `value`, chỉ định giá trị cần gửi nếu tùy chọn đó được chọn từ danh sách thả xuống. Nếu bạn không chỉ định `value`, văn bản bên trong thẻ `<option></option>` được sử dụng làm giá trị.

> [!NOTE]
> Nếu bạn muốn có một tùy chọn cụ thể được chọn khi trang tải, bạn có thể thêm thuộc tính `selected` vào phần tử `<option>` liên quan.

### Trường nhập văn bản nhiều dòng

Các trường nhập văn bản nhiều dòng được tạo bằng cách sử dụng các phần tử {{htmlelement("textarea")}}:

```html
<label for="comments">Any other comments:</label>
<textarea id="comments" name="comments" rows="5" cols="33"></textarea>
```

Chúng hoạt động theo cùng cách như các phần tử `<input type="text">`, ngoại trừ chúng cho phép nhập nhiều dòng văn bản. Thuộc tính `rows` chỉ định số hàng cao mà vùng văn bản sẽ có theo mặc định, trong khi thuộc tính `cols` chỉ định số cột rộng mà vùng văn bản sẽ có theo mặc định. Nếu chúng không được chỉ định, các giá trị được sử dụng là `cols="20"` và `rows="2"`.

Hầu hết các trình duyệt hiển thị vùng văn bản với tay cầm kéo ở một góc, có thể được sử dụng để thay đổi kích thước nó. Hãy thử sử dụng điều này để thay đổi kích thước vùng văn bản trong bản demo của chúng ta.

## Xác thực biểu mẫu

Trước đó, chúng ta đã xem xét một số xác thực biểu mẫu cơ bản phía máy khách do trình duyệt cung cấp. Thuộc tính `required` được sử dụng để chỉ định rằng một trường phải được điền vào trước khi biểu mẫu có thể được gửi; nó cũng kiểm tra loại giá trị đúng được nhập cho các loại giá trị cụ thể như địa chỉ email, URL, số, v.v. Xác thực quan trọng vì hai lý do chính:

- Đảm bảo rằng dữ liệu được gửi theo định dạng đúng để không gây ra lỗi trong ứng dụng của bạn.
- Đảm bảo dữ liệu không gây ra vấn đề bảo mật. Những người xấu biết cách gửi dữ liệu được định dạng cụ thể để, trên các ứng dụng không an toàn, nó có thể thực thi các lệnh để xóa cơ sở dữ liệu hoặc chiếm quyền kiểm soát hệ thống.

Xác thực biểu mẫu là một chủ đề lớn nằm ngoài phạm vi của bài viết này, vì vậy chúng ta sẽ dừng ở đây. Chỉ cần ghi nhớ rằng có hai loại xác thực biểu mẫu:

- Xác thực phía máy khách, xảy ra trong trình duyệt, được triển khai bằng cách sử dụng kết hợp các thuộc tính xác thực biểu mẫu (như `required`) và JavaScript. Xác thực phía máy khách hữu ích để cung cấp cho người dùng gợi ý ngay lập tức khi họ đã nhập dữ liệu sai, nhưng không hiệu quả trong việc ngăn dữ liệu độc hại đi qua. Quá dễ dàng để tắt JavaScript hoặc thay đổi mã phía máy khách để xác thực không còn hoạt động.
- Xác thực phía máy chủ, xảy ra trên máy chủ, được triển khai bằng bất kỳ ngôn ngữ nào máy chủ đang sử dụng. Các thông điệp không đúng định dạng có thể được gửi đến máy chủ vô tình hoặc có chủ ý. Kiến thức thông thường là đảm bảo rằng máy chủ của bạn không tin tưởng bất kỳ thứ gì máy khách đang gửi để tránh lỗi hoặc vấn đề bảo mật do các thông điệp không đúng định dạng. Xác thực phía máy chủ rất tốt để ngăn các thông điệp độc hại, vì khó hơn để giả mạo mã chạy trên máy chủ. Xác thực phía máy chủ không tốt trong việc cung cấp cho người dùng gợi ý về dữ liệu không chính xác vì dữ liệu phải đến máy chủ để được xác thực, sau đó kết quả phải được gửi lại cho máy khách trước khi người dùng có thể được thông báo.

Tóm lại, đừng quyết định giữa việc sử dụng xác thực phía máy khách hay phía máy chủ — bạn sẽ cần cả hai. Bạn cần xác thực phía máy khách để phản hồi người dùng về input của họ và xác thực phía máy chủ để đảm bảo các thông điệp có định dạng mà máy chủ của bạn có thể xử lý an toàn. Nếu bạn muốn bắt đầu tìm hiểu thêm về xác thực, một nơi tốt để bắt đầu là [Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation).

## Tóm tắt

Đó là tất cả cho bây giờ. Còn nhiều điều cần biết về biểu mẫu, nhưng bây giờ, chúng ta đã cung cấp cho bạn đủ hiểu biết để tiếp tục học tập của mình.

Tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ thông tin chúng tôi đã cung cấp về biểu mẫu HTML.

## Xem thêm

- [Biểu mẫu web — Làm việc với dữ liệu người dùng](/en-US/docs/Learn_web_development/Extensions/Forms)

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Planet_data_table", "Learn_web_development/Core/Structuring_content/Test_your_skills/Forms_and_buttons", "Learn_web_development/Core/Structuring_content")}}
