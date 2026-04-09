---
title: Tham chiếu trực tiếp đối tượng không an toàn (IDOR)
slug: Web/Security/Attacks/IDOR
page-type: guide
sidebar: security
---

**Insecure Direct Object Reference (IDOR)** là một lỗ hổng cho phép kẻ tấn công khai thác việc kiểm soát truy cập không đầy đủ và việc công khai không an toàn các mã định danh đối tượng, chẳng hạn khóa cơ sở dữ liệu hoặc đường dẫn tệp.

Website thường muốn phục vụ nội dung khác nhau cho các người dùng khác nhau: ví dụ, một website mua sắm có thể cho mỗi người dùng xem lịch sử mua hàng của riêng họ. Website có thể nhận dạng người dùng bằng cách {{glossary("Authentication", "xác thực")}} họ, dùng một phương thức như mật khẩu hoặc passkey. Thường thì một khi website đã xác thực người dùng, nó sẽ đặt một session cookie trong trình duyệt của người dùng đó: khi người dùng đưa ra một yêu cầu, máy chủ sẽ biết rằng yêu cầu đó đến từ người dùng đã được xác thực này.

Tuy nhiên, ngoài việc kiểm tra rằng yêu cầu đến từ một người dùng đã được xác thực, máy chủ cũng phải triển khai kiểm soát truy cập đối với các tài nguyên mà người dùng yêu cầu: tức là, họ phải kiểm tra rằng người dùng này được phép truy cập tài nguyên cụ thể được yêu cầu. Ví dụ, mỗi người dùng đã được xác thực chỉ được phép xem lịch sử mua hàng của riêng họ.

Nếu máy chủ không triển khai kiểm soát truy cập cho tài nguyên, thì một kẻ tấn công đang đăng nhập vào site có thể truy cập tài nguyên thuộc về một người dùng khác. Đây được gọi là cuộc tấn công Insecure Direct Object Reference (IDOR).

## Kịch bản ví dụ

Kiểu tấn công IDOR cổ điển xảy ra khi máy chủ chỉ kiểm tra rằng người dùng đã được xác thực, nhưng không kiểm tra xem họ có được phép truy cập một tham chiếu đối tượng hay không. Trong một luồng điển hình, kẻ tấn công:

1. Đăng nhập như một người dùng bình thường.
2. Tìm một URL, trường form, hoặc một tệp có tham chiếu tới ID của người dùng hoặc tài nguyên (ví dụ, 1234).
3. Sửa ID thành giá trị khác (ví dụ, 1233).
4. Giành quyền truy cập trái phép vào dữ liệu của người dùng khác.

Trong các phần sau, chúng ta sẽ khám phá một số ví dụ cụ thể của cuộc tấn công này.

### Sửa URL

Một kiểu tấn công IDOR phổ biến liên quan tới việc thao túng các tham chiếu đối tượng trực tiếp trong URL. "1234" trong các URL sau là định danh cho bản ghi của người dùng trong cơ sở dữ liệu của máy chủ. Nếu kẻ tấn công đổi số này thành bất kỳ số nào khác (ví dụ "1235") và truy cập được thông tin của người dùng khác, ứng dụng của bạn dễ bị Insecure Direct Object Reference.

```http
# Kẻ tấn công đang đăng nhập như người dùng 1234
https://example.org/user/id/1234

# Kẻ tấn công đổi id trong URL và truy cập được một người dùng khác
https://example.org/user/id/1235
```

Ví dụ, trong mã [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs) bên dưới, giá trị được đưa trong URL có sẵn dưới dạng `req.params.id`, và chúng ta dùng giá trị đó để lấy bản ghi tương ứng trong cơ sở dữ liệu. Chúng ta cũng kiểm tra rằng yêu cầu đến từ người dùng đã được xác thực, bằng cách (gọi hàm `isAuthenticated`). Nhưng quan trọng là, chúng ta không kiểm tra rằng ID của người dùng đã được xác thực khớp với ID trong URL, và điều này cho phép một người dùng đã xác thực (kẻ tấn công) lấy trang của một người dùng đã xác thực khác (nạn nhân).

```js example-bad
app.get("/user/id/:id", (req, res) => {
  const user = db.users.find(req.params.id);
  if (req.isAuthenticated()) {
    // Chỉ xác thực là chưa đủ!
    res.render("user", { user });
  }
});
```

Thay vào đó, bạn nên triển khai các quy tắc để cho phép truy cập thông tin người dùng. Ví dụ, chỉ render trang người dùng nếu id của người dùng đã đăng nhập khớp với id người dùng được yêu cầu. Nếu không thì trả về phản hồi HTTP {{HTTPStatus("401")}} `Unauthorized`.

```js
app.get("/user/id/:id", (req, res) => {
  const user = db.users.find(req.params.id);
  if (req.isAuthenticated() && req.session.userId === req.params.id) {
    res.render("user", { user });
  } else {
    return res.status(401).json({ message: "Unauthorized" });
  }
});
```

### Sửa đổi tài liệu

Tương tự như sửa URL, phần thân tài liệu của một trang có thể bị kẻ tấn công thao túng bằng cách sửa các giá trị của phần tử {{HTMLElement("form")}}, như radio button, checkbox, hoặc các phần tử {{HTMLElement("input")}} (ẩn) trong công cụ phát triển của trình duyệt.
Ví dụ, có thể ứng dụng của bạn không đưa ID người dùng vào URL mà thay vào đó truyền ID người dùng trong một phần tử form ẩn:

```html
<form action="updateUser" method="POST">
  <input type="hidden" name="user_id" value="1234" />
  <button type="submit">Cập nhật hồ sơ</button>
</form>
```

Nếu không có kiểm soát truy cập phía máy chủ, kẻ tấn công có thể sửa giá trị `user_id` trong phần tử `<input>` ẩn thành ID người dùng khác và có thể sửa hồ sơ mà không được phép.

### Truy cập tệp

Một trường hợp đặc biệt của tấn công IDOR là truy cập vào các tệp hoặc thư mục không được bảo vệ bằng kiểm soát truy cập. Ví dụ, nếu bạn cung cấp một thư mục cho tải lên tệp PDF và các tệp tải lên được đặt tên tuần tự, kẻ tấn công có thể đoán tên tệp và tải xuống tất cả nếu không có kiểm soát truy cập. Có khả năng, các tệp khác trong các thư mục không được bảo vệ, như tệp cấu hình máy chủ, cũng có thể bị lấy, từ đó dẫn tới các lỗ hổng khác.

```http
https://example.org/static/pdfs/1.pdf
https://example.org/static/pdfs/2.pdf
```

## Phòng vệ chống IDOR

### Kiểm soát truy cập cho từng đối tượng

Biện pháp giảm thiểu quan trọng nhất cho tấn công IDOR là triển khai kiểm tra kiểm soát truy cập phía máy chủ cho từng đối tượng mà người dùng cố truy cập. Luôn xác minh rằng người dùng đã được xác thực có quyền truy cập hoặc thực hiện hành động trên đối tượng mục tiêu.

### Độ phức tạp của định danh

Hãy bảo đảm rằng các định danh cho tài nguyên không thể bị kẻ tấn công đoán. Đừng để lộ bất kỳ thông tin nhận dạng cá nhân (PII) nào, như tên người dùng hoặc địa chỉ email trong URL. Thay vào đó, hãy dùng một token duy nhất khó đoán để biểu diễn người dùng. Bạn có thể dùng các ID phức tạp hơn làm khóa chính, như {{glossary("UUID", "UUID")}}, và làm cho việc đoán giá trị hợp lệ khó hơn. Tuy nhiên, điều này chỉ giảm khả năng đoán đúng ID hợp lệ chứ không thay thế cho nhu cầu kiểm soát truy cập đúng cách.

## Danh sách kiểm tra tóm tắt phòng vệ

- Luôn xác minh rằng người dùng đã được xác thực có quyền truy cập hoặc sửa đổi đối tượng.
- Tránh công khai các mã định danh đối tượng có thể đoán trước, tuần tự, hoặc nhạy cảm (như ID người dùng hoặc địa chỉ email).
- Dùng các ID phức tạp hơn, khó dự đoán hơn (ví dụ, UUID).

## Xem thêm

- [OWASP: Insecure Direct Object Reference Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet.html)
