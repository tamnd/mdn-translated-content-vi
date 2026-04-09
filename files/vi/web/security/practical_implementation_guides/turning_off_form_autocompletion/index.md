---
title: Cách tắt tự động hoàn thành biểu mẫu
slug: Web/Security/Practical_implementation_guides/Turning_off_form_autocompletion
page-type: guide
sidebar: security
---

Bài viết này giải thích cách vô hiệu hóa tự động hoàn thành cho các trường biểu mẫu trên một website.

## Hiểu về autocompletion và autofill

Theo mặc định, trình duyệt ghi nhớ thông tin mà người dùng gửi qua các trường {{HTMLElement("input")}} trên website. Điều này cho phép trình duyệt cung cấp autocompletion (tức là, gợi ý các giá trị hoàn thành có thể cho những trường mà người dùng đã bắt đầu nhập) hoặc autofill (tức là, tự điền sẵn một số trường nhất định khi tải trang).

Những tính năng này thường được bật theo mặc định, nhưng chúng có thể là mối lo về quyền riêng tư đối với người dùng, vì vậy trình duyệt có thể cho phép người dùng vô hiệu hóa chúng. Tuy nhiên, một số dữ liệu được gửi trong biểu mẫu chỉ không hữu ích ngoài tương tác hiện tại (ví dụ: mã xác thực một lần) hoặc chứa thông tin nhạy cảm (ví dụ: mã định danh chính phủ duy nhất hoặc mã bảo mật thẻ tín dụng). Là tác giả website, bạn có thể muốn trình duyệt không ghi nhớ giá trị của những trường như vậy, ngay cả khi tính năng autocomplete của trình duyệt đang bật.

> [!NOTE]
> [WCAG 2.1 Success Criterion 1.3.5: Identify Input Purpose](https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose.html) không yêu cầu autocomplete hoặc autofill phải hoạt động; nó chỉ yêu cầu các trường biểu mẫu liên quan đến thông tin cá nhân cụ thể của người dùng được xác định bằng chương trình. Điều này có nghĩa là tiêu chí này vẫn có thể được đáp ứng (bằng cách thêm các thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) liên quan vào từng trường biểu mẫu riêng lẻ) ngay cả khi tự động hoàn thành cho chính biểu mẫu đã bị tắt.

## Vô hiệu hóa autocompletion

Để tắt autocompletion trong biểu mẫu, bạn có thể đặt thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) thành `"off"`:

```plain
autocomplete="off"
```

Bạn có thể làm điều này cho toàn bộ biểu mẫu, hoặc cho các phần tử input cụ thể trong biểu mẫu:

```html-nolint
<form method="post" action="/form" autocomplete="off">
  …
</form>
```

```html
<form method="post" action="/form">
  …
  <div>
    <label for="cc">Credit card:</label>
    <input type="text" id="cc" name="cc" autocomplete="off" />
  </div>
</form>
```

Đặt `autocomplete="off"` trên các trường có hai tác dụng:

- Nó báo cho trình duyệt không lưu dữ liệu do người dùng nhập để tự động hoàn thành sau này trên các biểu mẫu tương tự (một số trình duyệt có ngoại lệ cho các trường hợp đặc biệt, chẳng hạn nhắc người dùng lưu mật khẩu).
- Nó ngăn trình duyệt lưu dữ liệu biểu mẫu trong lịch sử phiên. Khi dữ liệu biểu mẫu được lưu trong lịch sử phiên, thông tin mà người dùng đã điền sẽ được hiển thị trong trường hợp người dùng đã gửi biểu mẫu và nhấn nút Back để quay lại trang biểu mẫu gốc.

Nếu một trình duyệt vẫn tiếp tục đưa ra gợi ý ngay cả sau khi đặt autocomplete thành off, thì bạn phải đổi thuộc tính `name` của phần tử `<input>`.

## Quản lý autofill cho các trường đăng nhập

Các trình duyệt hiện đại triển khai quản lý mật khẩu tích hợp: khi người dùng nhập tên người dùng và mật khẩu cho một site, trình duyệt sẽ đề nghị ghi nhớ chúng cho người dùng. Khi người dùng truy cập site lần nữa, trình duyệt sẽ tự động điền các trường đăng nhập bằng các giá trị đã lưu.

Ngoài ra, trình duyệt cho phép người dùng chọn một mật khẩu chính mà trình duyệt sẽ dùng để mã hóa thông tin đăng nhập đã lưu.

Ngay cả khi không có mật khẩu chính, quản lý mật khẩu trong trình duyệt vẫn thường được xem là một lợi ích ròng cho bảo mật. Vì người dùng không phải nhớ các mật khẩu mà trình duyệt lưu cho họ, họ có thể chọn mật khẩu mạnh hơn so với bình thường.

Vì lý do này, nhiều trình duyệt hiện đại không hỗ trợ `autocomplete="off"` cho các trường đăng nhập:

- Nếu một site đặt `autocomplete="off"` trên phần tử {{HTMLElement("form")}} và biểu mẫu bao gồm các trường nhập tên người dùng và mật khẩu, trình duyệt vẫn sẽ đề nghị ghi nhớ lần đăng nhập này. Nếu người dùng đồng ý, trình duyệt sẽ tự động điền các trường đó vào lần tiếp theo người dùng truy cập trang.
- Nếu một site đặt `autocomplete="off"` cho các trường {{HTMLElement("input")}} tên người dùng và mật khẩu, trình duyệt vẫn sẽ đề nghị ghi nhớ lần đăng nhập này. Nếu người dùng đồng ý, trình duyệt sẽ tự động điền các trường đó vào lần tiếp theo người dùng truy cập trang.

Nếu bạn đang định nghĩa một trang quản lý người dùng nơi người dùng có thể đặt mật khẩu mới cho người khác, và vì vậy bạn muốn ngăn tự động điền vào các trường mật khẩu, bạn có thể dùng `autocomplete="new-password"`.

Thuộc tính này chỉ là một gợi ý cho trình duyệt; một số trình duyệt có thể không tuân theo nó.
