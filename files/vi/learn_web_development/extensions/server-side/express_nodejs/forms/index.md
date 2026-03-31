---
title: "Express Tutorial Part 6: Working with forms"
short-title: "6: Working with forms"
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data", "Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}

Trong hướng dẫn này, chúng ta sẽ hướng dẫn bạn cách làm việc với HTML Forms trong Express sử dụng Pug. Cụ thể, chúng ta sẽ thảo luận cách viết các biểu mẫu để tạo, cập nhật và xóa tài liệu khỏi cơ sở dữ liệu của trang web.

<table>
  <tbody>
    <tr>
      <th scope="row">Yêu cầu:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data">Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu cách viết các biểu mẫu để lấy dữ liệu từ người dùng và cập nhật cơ sở dữ liệu với dữ liệu này.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Một [HTML Form](/en-US/docs/Learn_web_development/Extensions/Forms) là một nhóm gồm một hoặc nhiều trường/widget trên một trang web có thể được sử dụng để thu thập thông tin từ người dùng để gửi đến máy chủ. Các biểu mẫu là cơ chế linh hoạt để thu thập đầu vào người dùng vì có sẵn các đầu vào biểu mẫu phù hợp để nhập nhiều loại dữ liệu khác nhau — hộp văn bản, hộp kiểm, nút radio, bộ chọn ngày, v.v. Biểu mẫu cũng là một cách tương đối an toàn để chia sẻ dữ liệu với máy chủ, vì chúng cho phép chúng ta gửi dữ liệu trong các yêu cầu `POST` với bảo vệ cross-site request forgery.

Làm việc với các biểu mẫu có thể phức tạp! Các nhà phát triển cần viết HTML cho biểu mẫu, kiểm tra hợp lệ và làm sạch dữ liệu đã nhập trên máy chủ (và có thể cũng trong trình duyệt), đăng lại biểu mẫu với các thông báo lỗi để thông báo cho người dùng về bất kỳ trường không hợp lệ nào, xử lý dữ liệu khi nó đã được gửi thành công, và cuối cùng phản hồi với người dùng theo cách nào đó để chỉ ra thành công.

Trong hướng dẫn này, chúng ta sẽ chỉ cho bạn cách các hoạt động trên có thể được thực hiện trong _Express_. Trên đường đi, chúng ta sẽ mở rộng trang web _LocalLibrary_ để cho phép người dùng tạo, chỉnh sửa và xóa các mục từ thư viện.

> [!NOTE]
> Chúng ta chưa xem xét cách hạn chế các tuyến đường cụ thể đối với người dùng được xác thực hoặc ủy quyền, vì vậy tại thời điểm này, bất kỳ người dùng nào cũng có thể thực hiện thay đổi trong cơ sở dữ liệu.

### HTML Forms

Trước tiên là tổng quan ngắn gọn về [HTML Forms](/en-US/docs/Learn_web_development/Extensions/Forms). Hãy xem xét một biểu mẫu HTML đơn giản, với một trường văn bản duy nhất để nhập tên của một "team" nào đó, và nhãn liên kết của nó:

![Simple name field example in HTML form](form_example_name_field.png)

Biểu mẫu được định nghĩa trong HTML như một tập hợp các phần tử bên trong các thẻ `<form>…</form>`, chứa ít nhất một phần tử `input` kiểu `type="submit"`.

```html
<form action="/team_name_url/" method="post">
  <label for="team_name">Enter name: </label>
  <input
    id="team_name"
    type="text"
    name="name_field"
    value="Default name for team." />
  <input type="submit" value="OK" />
</form>
```

Trong khi ở đây chúng ta chỉ có một trường (văn bản) để nhập tên nhóm, một biểu mẫu _có thể_ chứa bất kỳ số lượng phần tử đầu vào nào khác và nhãn liên kết của chúng. Thuộc tính `type` của trường xác định loại widget nào sẽ được hiển thị. `name` và `id` của trường được sử dụng để xác định trường trong JavaScript/CSS/HTML, trong khi `value` xác định giá trị ban đầu cho trường khi nó được hiển thị lần đầu. Nhãn nhóm phù hợp được chỉ định bằng thẻ `label` (xem "Enter name" ở trên), với trường `for` chứa giá trị `id` của `input` liên kết.

Đầu vào `submit` sẽ được hiển thị dưới dạng nút (theo mặc định) — điều này có thể được người dùng nhấn để tải lên dữ liệu được chứa bởi các phần tử đầu vào khác lên máy chủ (trong trường hợp này, chỉ có `team_name`). Các thuộc tính biểu mẫu xác định `method` HTTP được sử dụng để gửi dữ liệu và đích đến của dữ liệu trên máy chủ (`action`):

- `action`: Tài nguyên/URL nơi dữ liệu sẽ được gửi để xử lý khi biểu mẫu được gửi. Nếu điều này không được đặt (hoặc được đặt thành chuỗi rỗng), thì biểu mẫu sẽ được gửi trở lại URL trang hiện tại.
- `method`: Phương thức HTTP được sử dụng để gửi dữ liệu: `POST` hoặc `GET`.
  - Phương thức `POST` phải luôn được sử dụng nếu dữ liệu sẽ dẫn đến thay đổi cơ sở dữ liệu của máy chủ, vì điều này có thể được làm kháng cự hơn với các cuộc tấn công cross-site forgery request.
  - Phương thức `GET` chỉ nên được sử dụng cho các biểu mẫu không thay đổi dữ liệu người dùng (ví dụ: biểu mẫu tìm kiếm). Nó được khuyến nghị khi bạn muốn có thể đánh dấu hoặc chia sẻ URL.

### Quy trình xử lý biểu mẫu

Xử lý biểu mẫu sử dụng tất cả các kỹ thuật tương tự mà chúng ta đã học để hiển thị thông tin về các model của mình: tuyến đường gửi yêu cầu của chúng ta đến một hàm bộ điều khiển thực hiện bất kỳ hành động cơ sở dữ liệu nào được yêu cầu, bao gồm đọc dữ liệu từ các model, sau đó tạo và trả về một trang HTML. Điều làm cho mọi thứ phức tạp hơn là máy chủ cũng cần có khả năng xử lý dữ liệu do người dùng cung cấp, và hiển thị lại biểu mẫu với thông tin lỗi nếu có bất kỳ vấn đề nào.

Sơ đồ luồng quy trình để xử lý các yêu cầu biểu mẫu được hiển thị dưới đây, bắt đầu với yêu cầu cho một trang chứa biểu mẫu (hiển thị màu xanh lá):

![Web server form request processing flowchart. Browser requests for the page containing the form by sending an HTTP GET request. The server creates an empty default form and returns it to the user. The user populates or updates the form, submitting it via HTTP POST with form data. The server validates the received form data. If the user-provided data is invalid, the server recreates the form with the user-entered data and error messages and sends it back to the user for the user to update and resubmits via HTTP Post, and it validates again. If the data is valid, the server performs actions on the valid data and redirects the user to the success URL.](web_server_form_handling.png)

Như được hiển thị trong sơ đồ trên, những điều chính mà mã xử lý biểu mẫu cần làm là:

1. Hiển thị biểu mẫu mặc định lần đầu tiên khi người dùng yêu cầu.
   - Biểu mẫu có thể chứa các trường trống (ví dụ: nếu bạn đang tạo một bản ghi mới), hoặc nó có thể được điền sẵn các giá trị ban đầu (ví dụ: nếu bạn đang thay đổi một bản ghi, hoặc có các giá trị ban đầu mặc định hữu ích).

2. Nhận dữ liệu được gửi bởi người dùng, thường trong yêu cầu HTTP `POST`.
3. Kiểm tra hợp lệ và làm sạch dữ liệu.
4. Nếu bất kỳ dữ liệu nào không hợp lệ, hiển thị lại biểu mẫu — lần này với bất kỳ giá trị nào người dùng đã điền và thông báo lỗi cho các trường có vấn đề.
5. Nếu tất cả dữ liệu hợp lệ, thực hiện các hành động cần thiết (ví dụ: lưu dữ liệu vào cơ sở dữ liệu, gửi email thông báo, trả về kết quả tìm kiếm, tải lên tệp, v.v.)
6. Khi tất cả các hành động hoàn tất, chuyển hướng người dùng đến trang khác.

Thường thì mã xử lý biểu mẫu được triển khai bằng một tuyến đường `GET` để hiển thị biểu mẫu ban đầu và một tuyến đường `POST` đến cùng đường dẫn để xử lý kiểm tra hợp lệ và xử lý dữ liệu biểu mẫu. Đây là cách tiếp cận sẽ được sử dụng trong hướng dẫn này.

Express bản thân không cung cấp bất kỳ hỗ trợ cụ thể nào cho các hoạt động xử lý biểu mẫu, nhưng nó có thể sử dụng middleware để xử lý các tham số `POST` và `GET` từ biểu mẫu, và để kiểm tra hợp lệ/làm sạch các giá trị của chúng.

### Kiểm tra hợp lệ và làm sạch

Trước khi dữ liệu từ biểu mẫu được lưu trữ, nó phải được kiểm tra hợp lệ và làm sạch:

- Kiểm tra hợp lệ kiểm tra xem các giá trị đã nhập có phù hợp với từng trường (trong phạm vi đúng, định dạng, v.v.) và các giá trị đã được cung cấp cho tất cả các trường bắt buộc.
- Làm sạch loại bỏ/thay thế các ký tự trong dữ liệu có thể được sử dụng để gửi nội dung độc hại đến máy chủ.

Trong hướng dẫn này, chúng ta sẽ sử dụng module [express-validator](https://www.npmjs.com/package/express-validator) phổ biến để thực hiện cả kiểm tra hợp lệ và làm sạch dữ liệu biểu mẫu của chúng ta.

#### Cài đặt

Cài đặt module bằng cách chạy lệnh sau ở thư mục gốc của dự án.

```bash
npm install express-validator
```

#### Sử dụng express-validator

> [!NOTE]
> Hướng dẫn [express-validator](https://express-validator.github.io/docs/#basic-guide) trên GitHub cung cấp tổng quan tốt về API. Chúng tôi khuyến nghị bạn đọc để có ý tưởng về tất cả các khả năng của nó (bao gồm sử dụng [kiểm tra hợp lệ schema](https://express-validator.github.io/docs/guides/schema-validation/) và [tạo validator tùy chỉnh](https://express-validator.github.io/docs/guides/customizing/#custom-validators-and-sanitizers)). Dưới đây chúng ta chỉ đề cập đến một tập con hữu ích cho _LocalLibrary_.

Để sử dụng validator trong các bộ điều khiển của chúng ta, chúng ta chỉ định các hàm cụ thể mà chúng ta muốn import từ module [express-validator](https://www.npmjs.com/package/express-validator), như được hiển thị dưới đây:

```js
const { body, validationResult } = require("express-validator");
```

Có nhiều hàm có sẵn, cho phép bạn kiểm tra và làm sạch dữ liệu từ các tham số yêu cầu, body, headers, cookies, v.v., hoặc tất cả cùng một lúc. Trong hướng dẫn này, chúng ta sẽ chủ yếu sử dụng `body` và `validationResult` (như được "require" ở trên).

Các hàm được định nghĩa như sau:

- [`body(fields, message)`](https://express-validator.github.io/docs/api/check/#body): Chỉ định một tập hợp các trường trong body yêu cầu (tham số `POST`) để kiểm tra hợp lệ và/hoặc làm sạch cùng với một thông báo lỗi tùy chọn có thể được hiển thị nếu nó không vượt qua các bài kiểm tra. Tiêu chí kiểm tra hợp lệ và làm sạch được nối với phương thức `body()`.

  Ví dụ, dòng dưới đây đầu tiên định nghĩa rằng chúng ta đang kiểm tra trường "name" và rằng lỗi kiểm tra hợp lệ sẽ đặt thông báo lỗi "Empty name". Sau đó chúng ta gọi phương thức làm sạch `trim()` để xóa khoảng trắng từ đầu và cuối chuỗi, sau đó `isLength()` để kiểm tra chuỗi kết quả không rỗng. Cuối cùng, chúng ta gọi `escape()` để xóa các ký tự HTML khỏi biến có thể được sử dụng trong các cuộc tấn công cross-site scripting JavaScript.

  ```js
  [
    // …
    body("name", "Empty name").trim().isLength({ min: 1 }).escape(),
    // …
  ];
  ```

  Bài kiểm tra này kiểm tra xem trường tuổi có phải là ngày hợp lệ và sử dụng `optional()` để chỉ định rằng chuỗi null và rỗng sẽ không thất bại trong kiểm tra hợp lệ.

  ```js
  [
    // …
    body("age", "Invalid age")
      .optional({ values: "falsy" })
      .isISO8601()
      .toDate(),
    // …
  ];
  ```

  Bạn cũng có thể nối các validator khác nhau, và thêm các thông báo được hiển thị nếu các validator trước đó là false.

  ```js
  [
    // …
    body("name")
      .trim()
      .isLength({ min: 1 })
      .withMessage("Name empty.")
      .isAlpha()
      .withMessage("Name must be alphabet letters."),
    // …
  ];
  ```

- [`validationResult(req)`](https://express-validator.github.io/docs/api/validation-result/#validationresult): Chạy kiểm tra hợp lệ, làm cho các lỗi có sẵn dưới dạng đối tượng kết quả `validation`. Điều này được gọi trong một callback riêng biệt, như được hiển thị dưới đây:

  ```js
  async (req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      // There are errors. Render form again with sanitized values/errors messages.
      // Error messages can be returned in an array using `errors.array()`.
    } else {
      // Data from form is valid.
    }
  };
  ```

  Chúng ta sử dụng phương thức `isEmpty()` của kết quả kiểm tra hợp lệ để kiểm tra xem có lỗi hay không, và phương thức `array()` của nó để lấy tập hợp các thông báo lỗi. Xem phần [Xử lý kiểm tra hợp lệ](https://express-validator.github.io/docs/guides/getting-started/#handling-validation-errors) để biết thêm thông tin.

Các chuỗi kiểm tra hợp lệ và làm sạch là middleware nên được truyền vào trình xử lý tuyến đường Express (chúng ta thực hiện điều này gián tiếp, thông qua bộ điều khiển). Khi middleware chạy, mỗi validator/sanitizer được chạy theo thứ tự được chỉ định.

Chúng ta sẽ đề cập đến một số ví dụ thực tế khi chúng ta triển khai các biểu mẫu _LocalLibrary_ dưới đây.

### Thiết kế biểu mẫu

Nhiều model trong thư viện có quan hệ/phụ thuộc lẫn nhau — ví dụ, một `Book` _yêu cầu_ một `Author`, và _có thể_ cũng có một hoặc nhiều `Genres`. Điều này đặt ra câu hỏi về cách chúng ta nên xử lý trường hợp mà người dùng muốn:

- Tạo một đối tượng khi các đối tượng liên quan của nó chưa tồn tại (ví dụ: một cuốn sách mà đối tượng tác giả chưa được định nghĩa).
- Xóa một đối tượng vẫn đang được sử dụng bởi một đối tượng khác (ví dụ: xóa một `Genre` vẫn đang được sử dụng bởi một `Book`).

Cho dự án này, chúng ta sẽ đơn giản hóa việc triển khai bằng cách nói rằng một biểu mẫu chỉ có thể:

- Tạo một đối tượng sử dụng các đối tượng đã tồn tại (vì vậy người dùng sẽ phải tạo bất kỳ phiên bản `Author` và `Genre` cần thiết nào trước khi cố gắng tạo bất kỳ đối tượng `Book` nào).
- Xóa một đối tượng nếu nó không được tham chiếu bởi các đối tượng khác (vì vậy, ví dụ, bạn sẽ không thể xóa một `Book` cho đến khi tất cả các đối tượng `BookInstance` liên quan đã được xóa).

> [!NOTE]
> Một triển khai linh hoạt hơn có thể cho phép bạn tạo các đối tượng phụ thuộc khi tạo một đối tượng mới, và xóa bất kỳ đối tượng nào bất kỳ lúc nào (ví dụ: bằng cách xóa các đối tượng phụ thuộc, hoặc bằng cách xóa các tham chiếu đến đối tượng đã xóa khỏi cơ sở dữ liệu).

### Tuyến đường

Để triển khai mã xử lý biểu mẫu của chúng ta, chúng ta sẽ cần hai tuyến đường có cùng mẫu URL. Tuyến đường đầu tiên (`GET`) được sử dụng để hiển thị một biểu mẫu rỗng mới để tạo đối tượng. Tuyến đường thứ hai (`POST`) được sử dụng để kiểm tra hợp lệ dữ liệu do người dùng nhập, và sau đó lưu thông tin và chuyển hướng đến trang chi tiết (nếu dữ liệu hợp lệ) hoặc hiển thị lại biểu mẫu với lỗi (nếu dữ liệu không hợp lệ).

Chúng ta đã tạo các tuyến đường cho tất cả các trang tạo model của mình trong **/routes/catalog.js** (trong [hướng dẫn trước](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes)). Ví dụ, các tuyến đường thể loại được hiển thị dưới đây:

```js
// GET request for creating a Genre. NOTE This must come before route that displays Genre (uses id).
router.get("/genre/create", genre_controller.genre_create_get);

// POST request for creating Genre.
router.post("/genre/create", genre_controller.genre_create_post);
```

## Các bài viết con về biểu mẫu Express

Các bài viết con sau đây sẽ đưa chúng ta qua quá trình thêm các biểu mẫu cần thiết vào ứng dụng ví dụ của chúng ta. Bạn cần đọc và làm việc qua từng bài theo thứ tự, trước khi chuyển sang bài tiếp theo.

1. [Biểu mẫu tạo Thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_genre_form) — Định nghĩa một trang để tạo các đối tượng `Genre`.
2. [Biểu mẫu tạo Tác giả](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_author_form) — Định nghĩa một trang để tạo các đối tượng `Author`.
3. [Biểu mẫu tạo Sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_book_form) — Định nghĩa một trang/biểu mẫu để tạo các đối tượng `Book`.
4. [Biểu mẫu tạo BookInstance](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Create_BookInstance_form) — Định nghĩa một trang/biểu mẫu để tạo các đối tượng `BookInstance`.
5. [Biểu mẫu xóa Tác giả](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Delete_author_form) — Định nghĩa một trang để xóa các đối tượng `Author`.
6. [Biểu mẫu cập nhật Sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Update_Book_form) — Định nghĩa trang để cập nhật các đối tượng `Book`.

## Tự thách thức

Triển khai các trang xóa cho các model `Book`, `BookInstance`, và `Genre`, liên kết chúng từ các trang chi tiết liên quan theo cách tương tự như trang _xóa Tác giả_ của chúng ta. Các trang nên tuân theo cùng cách tiếp cận thiết kế:

- Nếu có các tham chiếu đến đối tượng từ các đối tượng khác, thì các đối tượng khác này nên được hiển thị cùng với ghi chú rằng bản ghi này không thể bị xóa cho đến khi các đối tượng được liệt kê đã bị xóa.
- Nếu không có tham chiếu nào khác đến đối tượng, thì view nên nhắc xóa nó. Nếu người dùng nhấn nút **Delete**, bản ghi sẽ được xóa.

Một vài gợi ý:

- Xóa một `Genre` giống như xóa một `Author`, vì cả hai đối tượng đều là phụ thuộc của `Book` (vì vậy trong cả hai trường hợp bạn chỉ có thể xóa đối tượng khi các sách liên quan đã bị xóa).
- Xóa một `Book` cũng tương tự vì bạn cần kiểm tra trước xem không có `BookInstances` liên quan nào.
- Xóa một `BookInstance` là dễ nhất trong tất cả vì không có đối tượng phụ thuộc. Trong trường hợp này, bạn chỉ có thể tìm bản ghi liên quan và xóa nó.

Triển khai các trang cập nhật cho các model `BookInstance`, `Author`, và `Genre`, liên kết chúng từ các trang chi tiết liên quan theo cách tương tự như trang _cập nhật Sách_ của chúng ta.

Một vài gợi ý:

- _Trang cập nhật Sách_ mà chúng ta vừa triển khai là khó nhất! Các mẫu tương tự có thể được sử dụng cho các trang cập nhật cho các đối tượng khác.
- Các trường ngày mất và ngày sinh của `Author` và trường due_date của `BookInstance` có định dạng sai để nhập vào trường date input trên biểu mẫu (nó yêu cầu dữ liệu theo dạng "YYYY-MM-DD"). Cách dễ nhất để giải quyết vấn đề này là định nghĩa một thuộc tính ảo mới cho các ngày tháng định dạng ngày tháng phù hợp, và sau đó sử dụng trường này trong các template view liên quan.
- Nếu bạn bị mắc kẹt, có các ví dụ về các trang cập nhật trong [ví dụ ở đây](https://github.com/mdn/express-locallibrary-tutorial).

## Tóm tắt

_Express_, node, và các gói của bên thứ ba trên npm cung cấp mọi thứ bạn cần để thêm biểu mẫu vào trang web của mình. Trong bài viết này, bạn đã học cách tạo biểu mẫu bằng _Pug_, kiểm tra hợp lệ và làm sạch đầu vào bằng _express-validator_, và thêm, xóa, và sửa đổi bản ghi trong cơ sở dữ liệu.

Bây giờ bạn nên hiểu cách thêm biểu mẫu cơ bản và mã xử lý biểu mẫu vào trang web node của riêng bạn!

## Xem thêm

- [express-validator](https://www.npmjs.com/package/express-validator) (npm docs).

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data", "Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment", "Learn_web_development/Extensions/Server-side/Express_Nodejs")}}
