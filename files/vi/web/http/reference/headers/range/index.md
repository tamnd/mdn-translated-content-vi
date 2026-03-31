---
title: Range header
short-title: Range
slug: Web/HTTP/Reference/Headers/Range
page-type: http-header
browser-compat: http.headers.Range
sidebar: http
---

Tiêu đề HTTP **`Range`** {{Glossary("request header")}} chỉ báo phần tài nguyên mà máy chủ nên trả về.
Một số phần có thể được yêu cầu đồng thời trong một tiêu đề `Range`, và máy chủ có thể gửi lại các phạm vi này trong tài liệu nhiều phần.
Nếu máy chủ gửi lại các phạm vi, nó sử dụng mã trạng thái {{HTTPStatus("206", "206 Partial Content")}} cho phản hồi.
Nếu các phạm vi không hợp lệ, máy chủ trả về lỗi {{HTTPStatus("416", "416 Range Not Satisfiable")}}.

Máy chủ không hỗ trợ yêu cầu phạm vi có thể bỏ qua tiêu đề `Range` và trả về toàn bộ tài nguyên với mã trạng thái {{HTTPStatus("200")}}.
Các trình duyệt cũ hơn đã sử dụng tiêu đề phản hồi {{HTTPHeader("Accept-Ranges", "Accept-Ranges: none")}} để tắt các tính năng như 'tạm dừng' hoặc 'tiếp tục' trong trình quản lý tải xuống, nhưng vì máy chủ bỏ qua tiêu đề `Range` có cùng ý nghĩa với việc phản hồi bằng `Accept-Ranges: none`, nên tiêu đề hiếm khi được sử dụng theo cách này.

Hiện tại chỉ [đơn vị `bytes` được đăng ký](https://www.iana.org/assignments/http-parameters/http-parameters.xhtml#range-units) là _độ lệch_ (bắt đầu từ 0 và bao gồm cả hai đầu).
Nếu dữ liệu được yêu cầu có [mã hóa nội dung](/en-US/docs/Web/HTTP/Reference/Headers/Content-Encoding) áp dụng, mỗi phạm vi byte biểu diễn chuỗi byte được mã hóa, không phải các byte sẽ thu được sau khi giải mã.

Tiêu đề là [tiêu đề yêu cầu được liệt kê an toàn CORS](/en-US/docs/Glossary/CORS-safelisted_request_header) khi chỉ thị chỉ định một phạm vi byte duy nhất.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Range: <unit>=<range-start>-
Range: <unit>=<range-start>-<range-end>
Range: <unit>=<range-start>-<range-end>, …, <range-startN>-<range-endN>
Range: <unit>=-<suffix-length>
```

## Chỉ thị

- `<unit>`
  - : Đơn vị trong đó các phạm vi được xác định.
    Hiện tại chỉ `bytes` là đơn vị được đăng ký.
- `<range-start>`
  - : Số nguyên trong đơn vị đã cho chỉ báo vị trí bắt đầu của phạm vi yêu cầu.
- `<range-end>`
  - : Số nguyên trong đơn vị đã cho chỉ báo vị trí kết thúc của phạm vi được yêu cầu.
    Giá trị này là tùy chọn và, nếu bỏ qua, cuối tài nguyên được sử dụng làm cuối phạm vi.
- `<suffix-length>`
  - : Số nguyên chỉ báo số đơn vị ở cuối tài nguyên để trả về.

## Ví dụ

Các ví dụ sau đây cho thấy cách thực hiện yêu cầu bằng tiêu đề `Range` cho yêu cầu được liệt kê an toàn CORS, và cho việc yêu cầu nhiều phạm vi.
Các ví dụ khác có thể được tìm thấy trong hướng dẫn [Yêu cầu phạm vi HTTP](/en-US/docs/Web/HTTP/Guides/Range_requests).

### Phạm vi byte đơn và yêu cầu được liệt kê an toàn CORS

Tiêu đề `Range` là [tiêu đề yêu cầu được liệt kê an toàn CORS](/en-US/docs/Glossary/CORS-safelisted_request_header) khi giá trị là phạm vi byte đơn.
Điều này có nghĩa là nó có thể được sử dụng trong các yêu cầu khác nguồn gốc mà không kích hoạt yêu cầu [preflight](/en-US/docs/Glossary/Preflight_request), điều này hữu ích cho việc yêu cầu phương tiện và tiếp tục tải xuống.

Ví dụ sau yêu cầu 500 byte đầu tiên của tài nguyên:

```http
Range: bytes=0-499
```

Để yêu cầu 500 byte thứ hai:

```http
Range: bytes=500-999
```

Bỏ qua vị trí kết thúc yêu cầu tất cả các đơn vị còn lại của tài nguyên, vì vậy 100 byte cuối cùng của tài nguyên có độ dài 1000 byte có thể được yêu cầu bằng cách sử dụng:

```http
Range: bytes=900-
```

Ngoài ra, nếu kích thước của tài nguyên không được biết, `n` byte cuối cùng có thể được yêu cầu bằng cách sử dụng phạm vi suffix của `-n`:

```http
Range: bytes=-100
```

### Yêu cầu nhiều phạm vi

Cho tài nguyên có độ dài 10000 byte, ví dụ sau yêu cầu ba phạm vi riêng biệt; `200`-`999` (800 byte), `2000`-`2499` (500 byte), và cuối cùng `9500-`.
Giá trị ranges-specifier `9500-` bỏ qua vị trí kết thúc chỉ báo rằng tất cả các byte từ 9500 trở đi là một phần của phạm vi thứ ba (500 byte).

```http
Range: bytes=200-999, 2000-2499, 9500-
```

Ví dụ này yêu cầu 500 byte đầu tiên và 500 byte cuối cùng của tệp.
Yêu cầu có thể bị từ chối bởi máy chủ nếu các phạm vi này chồng lên nhau (nếu tài nguyên được yêu cầu ngắn hơn 1000 byte, chẳng hạn).

```http
Range: bytes=0-499, -500
```

### Kiểm tra xem máy chủ có hỗ trợ yêu cầu phạm vi không

Lệnh curl sau thực hiện yêu cầu {{HTTPMethod("HEAD")}} cho một hình ảnh:

```bash
curl -v --http1.1 -I https://i.imgur.com/z4d4kWk.jpg
# or using the OPTIONS method:
# curl -v --http1.1 -X OPTIONS https://i.imgur.com/z4d4kWk.jpg
```

Kết quả là yêu cầu HTTP sau:

```http
HEAD /z4d4kWk.jpg HTTP/1.1
Host: i.imgur.com
User-Agent: curl/8.7.1
Accept: */*
```

Máy chủ phản hồi với phản hồi `200`, và tiêu đề `Accept-Ranges: bytes` có mặt (một số tiêu đề bị bỏ qua để ngắn gọn):

```http
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 146515
Content-Type: image/jpeg
…
Accept-Ranges: bytes
```

### Lấy phạm vi từ URL blob

URL [`blob:`](/en-US/docs/Web/URI/Reference/Schemes/blob) cũng hỗ trợ yêu cầu phạm vi bằng cách sử dụng [`fetch()`](/en-US/docs/Web/API/Window/fetch).

```js
const blob = new Blob(["Hello, world!"], { type: "text/plain" });
const url = URL.createObjectURL(blob);
fetch(url, {
  headers: {
    Range: "bytes=7-11",
  },
})
  .then((response) => response.text())
  .then((text) => console.log(text)); // "world"
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề yêu cầu có điều kiện {{HTTPHeader("If-Range")}}
- Tiêu đề phản hồi {{HTTPHeader("Content-Range")}}
- {{HTTPHeader("Content-Type")}}
- {{HTTPHeader("Accept-Ranges")}}
- {{HTTPStatus("206", "206 Partial Content")}}
- {{HTTPStatus("416", "416 Range Not Satisfiable")}}
- Hướng dẫn [Yêu cầu phạm vi HTTP](/en-US/docs/Web/HTTP/Guides/Range_requests)
- [Tiêu đề yêu cầu được liệt kê an toàn CORS](/en-US/docs/Glossary/CORS-safelisted_request_header)
