---
title: Triển khai tính toàn vẹn tài nguyên con (SRI)
short-title: Tính toàn vẹn tài nguyên con (SRI)
slug: Web/Security/Practical_implementation_guides/SRI
page-type: guide
sidebar: security
---

[Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) (SRI) cho phép trình duyệt xác minh rằng các tài nguyên mà chúng tải về (ví dụ: từ một CDN) được phân phối mà không có sự sửa đổi bất ngờ. Cách này hoạt động bằng việc cho bạn cung cấp một hash mật mã mà tài nguyên được tải phải khớp.

## Vấn đề

Nếu kẻ tấn công khai thác một mạng phân phối nội dung (CDN) và sửa đổi nội dung của các thư viện JavaScript được lưu trữ trên CDN đó, điều này sẽ tạo ra lỗ hổng trong tất cả các website sử dụng những thư viện đó.

Ví dụ, JavaScript được lưu trữ trên `library.org` và được tải từ `example.org` có thể truy cập toàn bộ nội dung của `example.org`. Nếu kẻ tấn công sửa đổi JavaScript được lưu trữ đó để chèn mã độc, nó có thể thay đổi liên kết tải xuống, làm biến dạng site, đánh cắp thông tin xác thực, gây ra các cuộc tấn công từ chối dịch vụ (DoS), v.v.

## Giải pháp

Dùng SRI để khóa một tài nguyên JavaScript bên ngoài vào nội dung đã biết của nó tại một thời điểm cụ thể. Việc này được xác minh bằng một hash mật mã được mã hóa base64. Chỉ định hash này trong thuộc tính `integrity` khi bạn tải tài nguyên.

Nếu tệp bị sửa đổi sau thời điểm đó, hash sẽ không khớp và các trình duyệt web hỗ trợ sẽ từ chối tải nó.

SRI nên được dùng khi tải các tài nguyên JavaScript hoặc stylesheet bên ngoài. Các tài nguyên này nên được tải qua HTTPS.

Lưu ý rằng CDN phải dùng [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/Security/Practical_implementation_guides/CORS) bằng cách đặt tiêu đề [`Access-Control-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin).

## Ví dụ

Tải jQuery 2.1.4 từ CDN của nó:

```html
<script
  src="https://code.jquery.com/jquery-2.1.4.min.js"
  integrity="sha384-R4/ztc4ZlRqWjqIuvf6RX5yb/v90qNGx6fS48N0tRxiGkqveZETq72KgDVJCp2TC"
  crossorigin="anonymous"></script>
```

Tải AngularJS 1.4.8 từ CDN của nó:

```html
<script
  src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"
  integrity="sha384-r1y8TJcloKTvouxnYsi4PJAx+nHNr90ibsEn3zznzDzWBN9X3o3kbHLSgcIPtzAp"
  crossorigin="anonymous"></script>
```

Tự tạo hash:

```bash
$ curl -s https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js | \
    openssl dgst -sha384 -binary | \
    openssl base64 -A

r1y8TJcloKTvouxnYsi4PJAx+nHNr90ibsEn3zznzDzWBN9X3o3kbHLSgcIPtzAp
```

## Xem thêm

- {{htmlelement("link")}}
- {{htmlelement("script")}}
- [SRI Hash Generator](https://srihash.org/) trên `srihash.org`: Tạo các phần tử {{htmlelement("script")}} cần thiết cho bạn, và cho biết nếu CDN thiếu hỗ trợ CORS.
