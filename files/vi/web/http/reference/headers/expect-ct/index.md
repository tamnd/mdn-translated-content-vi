---
title: Expect-CT header
short-title: Expect-CT
slug: Web/HTTP/Reference/Headers/Expect-CT
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Expect-CT
sidebar: http
---

{{Deprecated_Header}}

Tiêu đề `Expect-CT` {{Glossary("response header")}} cho phép các trang web chọn tham gia vào báo cáo và/hoặc thực thi các yêu cầu [Minh bạch chứng chỉ](/en-US/docs/Web/Security/Defenses/Certificate_Transparency).
Minh bạch chứng chỉ (CT) nhằm mục đích ngăn chặn việc sử dụng các chứng chỉ được cấp sai cho trang web đó mà không bị chú ý.

Chỉ Google Chrome và các trình duyệt dựa trên Chromium khác đã triển khai `Expect-CT`, và Chromium đã ngừng hỗ trợ tiêu đề từ phiên bản 107, vì Chromium hiện thực thi CT theo mặc định.
Xem cập nhật [Chrome Platform Status](https://chromestatus.com/feature/6244547273687040).

Các yêu cầu CT có thể được đáp ứng thông qua một trong các cơ chế sau:

- Tiện ích chứng chỉ X.509v3 để cho phép nhúng dấu thời gian chứng chỉ đã ký do các nhật ký riêng lẻ cấp. Hầu hết các chứng chỉ TLS do CA đáng tin cậy công khai cấp và được sử dụng trực tuyến đều chứa CT nhúng.
- Tiện ích mở rộng TLS loại `signed_certificate_timestamp` được gửi trong quá trình bắt tay
- Hỗ trợ ghim OCSP (tức là tiện ích mở rộng TLS `status_request`) và cung cấp `SignedCertificateTimestampList`

> [!NOTE]
> Khi một trang web bật tiêu đề `Expect-CT`, họ yêu cầu trình duyệt kiểm tra rằng bất kỳ chứng chỉ nào cho trang web đó xuất hiện trong **[nhật ký CT công khai](https://github.com/google/certificate-transparency-community-site/blob/master/docs/google/known-logs.md)**.

> [!NOTE]
> Trình duyệt **bỏ qua** tiêu đề `Expect-CT` qua HTTP; tiêu đề chỉ có hiệu lực trên các kết nối HTTPS.

> [!NOTE]
> `Expect-CT` hầu như đã lỗi thời từ tháng 6 năm 2021.
> Từ tháng 5 năm 2018, tất cả các chứng chỉ TLS mới được kỳ vọng hỗ trợ SCT theo mặc định.
> Các chứng chỉ được cấp trước tháng 3 năm 2018 được phép có thời hạn 39 tháng, vì vậy chúng đã hết hạn vào tháng 6 năm 2021.
> Chromium có kế hoạch ngừng hỗ trợ tiêu đề `Expect-CT` và cuối cùng sẽ xóa nó.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Expect-CT: report-uri="<uri>",
           enforce,
           max-age=<age>
```

## Chỉ thị

- `max-age`
  - : Số giây sau khi nhận được trường tiêu đề `Expect-CT` mà trong đó tác nhân người dùng nên coi máy chủ của thông báo nhận được là máy chủ `Expect-CT` đã biết.

    Nếu bộ nhớ đệm nhận được giá trị lớn hơn nó có thể biểu diễn, hoặc nếu bất kỳ tính toán tiếp theo nào của nó bị tràn, bộ nhớ đệm sẽ coi giá trị này là 2,147,483,648 (2^31) hoặc số nguyên dương lớn nhất mà nó có thể biểu diễn.

- `report-uri="<uri>"` {{optional_inline}}
  - : URI mà tác nhân người dùng nên báo cáo các lỗi `Expect-CT` đến.

    Khi có cùng với chỉ thị `enforce`, cấu hình được gọi là cấu hình "enforce-and-report", báo hiệu cho tác nhân người dùng rằng cả việc tuân thủ chính sách Minh bạch chứng chỉ phải được thực thi _và_ các vi phạm phải được báo cáo.

- `enforce` {{optional_inline}}
  - : Báo hiệu cho tác nhân người dùng rằng việc tuân thủ chính sách Minh bạch chứng chỉ phải được thực thi (thay vì chỉ báo cáo tuân thủ) và rằng tác nhân người dùng nên từ chối các kết nối trong tương lai vi phạm chính sách Minh bạch chứng chỉ của nó.

    Khi cả chỉ thị `enforce` và `report-uri` đều có, cấu hình được gọi là cấu hình "enforce-and-report".

## Ví dụ

Ví dụ sau đây chỉ định thực thi Minh bạch chứng chỉ trong 24 giờ và báo cáo vi phạm đến `foo.example.com`.

```http
Expect-CT: max-age=86400, enforce, report-uri="https://foo.example.com/report"
```

## Ghi chú

CA gốc được thêm thủ công vào kho lưu trữ tin cậy ghi đè và ngăn chặn báo cáo/thực thi `Expect-CT`.

Trình duyệt sẽ không ghi nhớ chính sách `Expect-CT` trừ khi trang web đã "chứng minh" nó có thể phục vụ chứng chỉ đáp ứng các yêu cầu về minh bạch chứng chỉ. Trình duyệt triển khai mô hình tin cậy của riêng chúng liên quan đến nhật ký CT nào được tin cậy để chứng chỉ đã được đăng ký vào.

Các phiên bản Chrome được thiết kế để ngừng thực thi chính sách `Expect-CT` 10 tuần sau ngày xây dựng của cài đặt.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts)
- Thuật ngữ:
  - {{glossary('TLS', 'Transport Layer Security (TLS)')}}
  - {{glossary('SSL', 'Secure Sockets Layer (SSL)')}}
  - {{glossary('HTTPS')}}
