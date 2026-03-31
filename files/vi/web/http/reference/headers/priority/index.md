---
title: Priority header
short-title: Priority
slug: Web/HTTP/Reference/Headers/Priority
page-type: http-header
browser-compat: http.headers.Priority
sidebar: http
---

Tiêu đề HTTP **`Priority`** chỉ báo sở thích của máy khách về thứ tự ưu tiên mà phản hồi chứa tài nguyên được yêu cầu nên được gửi, so với các yêu cầu tài nguyên khác trên cùng kết nối.
Nếu tiêu đề không được chỉ định trong yêu cầu, ưu tiên mặc định được giả định. Máy chủ cũng có thể bao gồm tiêu đề này trong phản hồi để chỉ báo rằng nó muốn thay đổi các tùy chọn ưu tiên mà máy khách đã quảng cáo.
Trong phản hồi, thông tin này có thể được sử dụng làm đầu vào cho quá trình ưu tiên hóa cho các máy chủ cache và các máy chủ khác đang chuyển tiếp phản hồi.

Máy chủ không bị ràng buộc bởi ưu tiên của máy khách và chỉ có thể sử dụng ưu tiên máy khách như gợi ý cho quá trình ưu tiên hóa của riêng mình.
Ví dụ: máy chủ có thể biết rằng một hình ảnh cụ thể là quan trọng cho trải nghiệm người dùng và nên được gửi ở mức ưu tiên cao nhất.
Ưu tiên máy chủ cũng có thể bị ảnh hưởng bởi các yếu tố như tắc nghẽn mạng.

Yêu cầu này có thể được lưu vào cache, và máy chủ dự kiến kiểm soát khả năng cache hoặc tính áp dụng được của phản hồi đã cache bằng các trường tiêu đề kiểm soát hành vi cache, chẳng hạn như {{HTTPHeader("Cache-Control")}} và {{HTTPHeader("Vary")}}.

> [!NOTE]
> Tiêu đề này là một phần của "Extensible Prioritization Scheme for HTTP" được định nghĩa trong {{rfc("9218")}}.
> Cũng có các khung `PRIORITY_UPDATE` HTTP/2 và HTTP/3 có thể được sử dụng để ưu tiên lại yêu cầu tài nguyên sau khi nó được gửi.
> Yêu cầu có thể được gửi trong bất kỳ phiên bản HTTP nào.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Priority: u=<priority>
Priority: i
Priority: u=<priority>, i
```

## Chỉ thị

- `u=<priority>`
  - : Tham số "urgency" (`u`) chỉ định giá trị ưu tiên `<priority>` cho tài nguyên.
    Giá trị là số nguyên từ 0 đến 7, theo thứ tự ưu tiên giảm dần (0 là khẩn cấp nhất).
    Giá trị ưu tiên mặc định cho yêu cầu là 3.
    Không có giá trị ưu tiên mặc định cho phản hồi: việc vắng mặt tiêu đề trong phản hồi chỉ báo rằng máy chủ đã chọn không sửa đổi ưu tiên máy khách.
    Ưu tiên 7 chỉ nên được sử dụng cho các tài nguyên không có khả năng ảnh hưởng đến trải nghiệm người dùng, chẳng hạn như các tác vụ nền hoặc phân phối cập nhật phần mềm.

    Trình duyệt nên yêu cầu các tài liệu có khả năng sử dụng các tài nguyên khác ở mức ưu tiên mặc định.
    Sau đó, các tài nguyên được tham chiếu nên được yêu cầu bằng các giá trị phản ánh tác động tương đối đến trải nghiệm người dùng về thời gian đến của chúng.

    Máy chủ có thể có quan điểm khác về ưu tiên so với máy khách, và có thể phản hồi bằng giá trị khác để cung cấp gợi ý ưu tiên cho các máy chủ trung gian.
    Việc vắng mặt tiêu đề `Priority` trong phản hồi chỉ báo rằng máy chủ đã chọn không sửa đổi ưu tiên máy khách.

- `i`
  - : Chỉ thị tăng dần (`i`), nếu có, chỉ báo rằng phản hồi HTTP có thể được xử lý tăng dần.

    Các tài nguyên có thể được xử lý tăng dần là những tài nguyên mà người nhận có thể làm gì đó hữu ích ngay khi một đoạn đến, thay vì chờ toàn bộ tài nguyên khả dụng.

    Nếu trình duyệt đặt chỉ thị này thì máy chủ có thể chọn phục vụ đồng thời tất cả các yêu cầu tăng dần với cùng mức khẩn cấp.
    Điều này phân phối nhiều yêu cầu qua băng thông kết nối, kết quả là tất cả các yêu cầu bắt đầu được xử lý sớm hơn nhưng mất nhiều thời gian hơn để hoàn thành.

    Nếu trình duyệt không đặt chỉ thị này thì nó chỉ báo rằng nó sẽ không xử lý tài nguyên tăng dần.
    Trong trường hợp này, máy chủ nên gửi phản hồi với cùng mức khẩn cấp từng cái một, theo thứ tự mà các yêu cầu liên quan của chúng được tạo ra.

> [!NOTE]
> Máy chủ dự kiến bỏ qua các chỉ thị trên tiêu đề này mà chúng không hiểu.
> Các chỉ thị mới được thêm vào trong tương lai dự kiến tương thích với các chỉ thị hiện có này để chúng có thể được bỏ qua một cách an toàn.

## Ví dụ

### Đặt mức khẩn cấp tài nguyên

Ví dụ sau hiển thị yêu cầu cho tệp HTML.
Mức khẩn cấp không được đặt, vì vậy mặc định là 3, với `i` là false.
Đây là cài đặt bình thường cho tài liệu sở hữu các tài nguyên khác.

```http
:method = GET
:scheme = https
:authority = example.net
:path = /index.html
```

Yêu cầu bên dưới là yêu cầu tiếp theo có thể cho tệp CSS được sử dụng bởi HTML.
Mức khẩn cấp được đặt thành 2, chỉ báo rằng trình duyệt coi nó là ưu tiên khá cao, nhưng `i` không được đặt vì tệp CSS không thể được xử lý tăng dần.

```http
:method = GET
:scheme = https
:authority = example.net
:path = /style.css
priority = u=2
```

> [!NOTE]
> Các yêu cầu trên sử dụng định dạng có thể đọc được của người từ thông số kỹ thuật HTTP/2 hoặc HTTP/3.
> Định dạng HTTP/1.1 được sử dụng trong phần lớn tài liệu này sẽ là:
>
> ```http
> GET /style.css HTTP/1.1
> Host: example.net
> Priority: u=2
> ```

Phản hồi có thể trông như hiển thị bên dưới. Lưu ý rằng trong trường hợp này `priority` không được chỉ định, chỉ báo rằng máy chủ không cảm thấy cần thay đổi ưu tiên cho các máy chủ trung gian.

```http
:status: 200
content-type: text/css
content-length: 610
date: [current date]
```

### Đặt chỉ thị tăng dần

Tiêu đề bên dưới hiển thị yêu cầu trình duyệt cho hình ảnh có thể được kết xuất tăng dần.
Trong trường hợp này, ưu tiên được đặt thành 4 (thấp hơn mặc định là 3), và `i` được đặt để chỉ báo rằng máy khách có thể xử lý tệp JPG tăng dần.

```http
:method = GET
:path = /image.jpg
:scheme = https
:authority = example.net
priority = u=4, i
```

Máy chủ có thể gửi phản hồi như bên dưới. Trong trường hợp này, ưu tiên được đặt thành 1, chỉ báo rằng máy chủ hiểu rằng hình ảnh cụ thể đó nên được gửi ở ưu tiên cao.

```http
:status: 200
content-type = image/jpeg
content-length = 610
...
priority = u=1, i
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cache-Control")}}
- {{HTTPHeader("Vary")}}
