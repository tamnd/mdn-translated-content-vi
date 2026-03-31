---
title: Strict-Transport-Security header
short-title: Strict-Transport-Security
slug: Web/HTTP/Reference/Headers/Strict-Transport-Security
page-type: http-header
browser-compat: http.headers.Strict-Transport-Security
sidebar: http
---

Tiêu đề HTTP **`Strict-Transport-Security`** {{Glossary("response header")}} (thường được viết tắt là {{Glossary("HSTS")}}) thông báo cho trình duyệt rằng {{Glossary("host")}} chỉ nên được truy cập bằng HTTPS, và bất kỳ nỗ lực truy cập trong tương lai bằng HTTP nên tự động được nâng cấp lên HTTPS.
Ngoài ra, trên các kết nối trong tương lai đến máy chủ, trình duyệt sẽ không cho phép người dùng bỏ qua các lỗi kết nối an toàn, chẳng hạn như chứng chỉ không hợp lệ.
HSTS xác định máy chủ chỉ bằng tên miền của nó.

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
Strict-Transport-Security: max-age=<expire-time>
Strict-Transport-Security: max-age=<expire-time>; includeSubDomains
Strict-Transport-Security: max-age=<expire-time>; includeSubDomains; preload
```

## Chỉ thị

- `max-age=<expire-time>`
  - : Thời gian, tính bằng giây, mà trình duyệt nên ghi nhớ rằng máy chủ chỉ được truy cập bằng HTTPS.
- `includeSubDomains` {{optional_inline}}
  - : Nếu chỉ thị này được chỉ định, chính sách HSTS cũng áp dụng cho tất cả các tên miền con của tên miền máy chủ.
- `preload` {{optional_inline}} {{non-standard_inline}}
  - : Xem [Tải trước Strict Transport Security](#preloading_strict_transport_security) để biết chi tiết. Khi sử dụng `preload`, chỉ thị `max-age` phải ít nhất là `31536000` (1 năm), và chỉ thị `includeSubDomains` phải có mặt.

## Mô tả

Tiêu đề `Strict-Transport-Security` thông báo cho trình duyệt rằng tất cả kết nối đến máy chủ phải sử dụng HTTPS.
Mặc dù nó là tiêu đề phản hồi, nó không ảnh hưởng đến cách trình duyệt xử lý phản hồi hiện tại, mà
cách nó thực hiện các yêu cầu trong tương lai.

Khi phản hồi HTTPS bao gồm tiêu đề `Strict-Transport-Security`, trình duyệt thêm tên miền của máy chủ
vào danh sách cố định các máy chủ HSTS của nó.
Nếu tên miền đã có trong danh sách, thời gian hết hạn và chỉ thị `includeSubDomains` được cập nhật.
Máy chủ được xác định chỉ bằng tên miền của nó. Địa chỉ IP không thể là máy chủ HSTS.
HSTS áp dụng cho tất cả các cổng của máy chủ, bất kể cổng nào được sử dụng cho yêu cầu.

Trước khi tải URL `http`, trình duyệt kiểm tra tên miền với danh sách máy chủ HSTS của nó.
Nếu tên miền khớp không phân biệt chữ hoa chữ thường với máy chủ HSTS hoặc là tên miền con của máy chủ đó đã chỉ định `includeSubDomains`,
thì trình duyệt thay thế scheme URL bằng `https`.
Nếu URL chỉ định cổng 80, trình duyệt thay đổi nó thành 443.
Bất kỳ số cổng rõ ràng nào khác vẫn không thay đổi, và trình duyệt kết nối đến cổng đó bằng HTTPS.

Nếu xảy ra cảnh báo hoặc lỗi TLS, chẳng hạn như chứng chỉ không hợp lệ, khi kết nối đến máy chủ HSTS,
trình duyệt không cung cấp cho người dùng cách tiến hành hoặc "nhấp qua" thông báo lỗi, điều này sẽ làm tổn hại đến
mục đích bảo mật nghiêm ngặt.

> [!NOTE]
> Máy chủ phải gửi tiêu đề `Strict-Transport-Security` chỉ qua HTTPS, không qua HTTP không an toàn.
> Trình duyệt bỏ qua tiêu đề nếu gửi qua HTTP để ngăn [manipulator-in-the-middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM)
> khỏi việc thay đổi tiêu đề để hết hạn sớm hoặc thêm nó cho máy chủ không hỗ trợ HTTPS.

### Hết hạn

Mỗi lần trình duyệt nhận được tiêu đề `Strict-Transport-Security`, nó cập nhật thời gian hết hạn HSTS của máy chủ bằng cách
thêm `max-age` vào thời gian hiện tại.
Sử dụng giá trị cố định cho `max-age` có thể ngăn HSTS hết hạn, vì mỗi phản hồi tiếp theo sẽ đẩy thời gian hết hạn thêm vào tương lai.

Nếu tiêu đề `Strict-Transport-Security` vắng mặt trong phản hồi từ máy chủ trước đó đã gửi một, tiêu đề trước đó vẫn có hiệu lực cho đến khi thời gian hết hạn của nó.

Để vô hiệu hóa HSTS, đặt `max-age=0`.
Điều này chỉ có hiệu lực sau khi trình duyệt thực hiện yêu cầu an toàn và nhận được tiêu đề phản hồi.
Theo thiết kế, bạn không thể vô hiệu hóa HSTS qua HTTP không an toàn.

### Tên miền con

Chỉ thị `includeSubDomains` hướng dẫn trình duyệt áp dụng chính sách HSTS của tên miền cho các tên miền con của nó.
Chính sách HSTS cho `secure.example.com` với `includeSubDomains` cũng áp dụng cho `login.secure.example.com`
và `admin.login.secure.example.com`. Nhưng nó không áp dụng cho `example.com` hoặc `insecure.example.com`.

Mỗi máy chủ tên miền con nên bao gồm tiêu đề `Strict-Transport-Security` trong các phản hồi của nó ngay cả khi
superdomain sử dụng `includeSubDomains`, vì trình duyệt có thể liên hệ với máy chủ tên miền con trước superdomain.
Ví dụ, nếu `example.com` bao gồm tiêu đề HSTS với `includeSubDomains`, nhưng tất cả các liên kết hiện có
đi trực tiếp đến `www.example.com`, trình duyệt sẽ không bao giờ thấy tiêu đề HSTS của `example.com`.
Do đó, `www.example.com` cũng nên gửi tiêu đề HSTS.

Trình duyệt lưu trữ chính sách HSTS cho mỗi tên miền và tên miền con một cách độc lập, bất kể chỉ thị `includeSubDomains`.
Nếu cả `example.com` và `login.example.com` đều gửi tiêu đề HSTS, trình duyệt lưu hai chính sách HSTS riêng biệt,
và chúng có thể hết hạn độc lập. Nếu `example.com` sử dụng `includeSubDomains`, thì `login.example.com` vẫn được bao phủ
nếu một trong các chính sách hết hạn.

Nếu `max-age=0`, `includeSubDomains` không có hiệu lực, vì tên miền đã chỉ định `includeSubDomains` là
bị xóa ngay lập tức khỏi danh sách máy chủ HSTS; điều này không xóa các chính sách HSTS riêng biệt của mỗi tên miền con.

### Yêu cầu HTTP không an toàn

Nếu máy chủ chấp nhận các yêu cầu HTTP không an toàn, nó nên phản hồi với chuyển hướng vĩnh viễn (như mã trạng thái {{HTTPStatus("301")}})
có URL `https` trong tiêu đề {{HTTPHeader("Location")}}.
Chuyển hướng không được bao gồm tiêu đề `Strict-Transport-Security` vì yêu cầu đã sử dụng HTTP không an toàn
nhưng tiêu đề phải được gửi qua HTTPS.
Sau khi trình duyệt theo chuyển hướng và thực hiện yêu cầu mới bằng HTTPS, phản hồi
nên bao gồm tiêu đề `Strict-Transport-Security` để đảm bảo rằng các nỗ lực tải URL `http` trong tương lai
sẽ sử dụng HTTPS ngay lập tức, mà không cần chuyển hướng.

Một điểm yếu của HSTS là nó không có hiệu lực cho đến khi trình duyệt đã thực hiện ít nhất một kết nối an toàn đến máy chủ
và nhận được tiêu đề `Strict-Transport-Security`.
Nếu trình duyệt tải URL `http` không an toàn trước khi biết rằng máy chủ là máy chủ HSTS, yêu cầu ban đầu là
dễ bị tấn công mạng.
[Tải trước](#preloading_strict_transport_security) giảm thiểu vấn đề này.

### Kịch bản ví dụ Strict Transport Security

1. Ở nhà, người dùng truy cập `http://example.com/` lần đầu tiên.
2. Vì scheme URL là `http` và trình duyệt không có nó trong danh sách máy chủ HSTS, kết nối sử dụng HTTP không an toàn.
3. Máy chủ phản hồi với chuyển hướng `301 Moved Permanently` đến `https://example.com/`.
4. Trình duyệt thực hiện yêu cầu mới, lần này sử dụng HTTPS.
5. Phản hồi, được thực hiện qua HTTPS, bao gồm tiêu đề:

   ```http
   Strict-Transport-Security: max-age=31536000; includeSubDomains
   ```

   Trình duyệt ghi nhớ `example.com` là máy chủ HSTS, và rằng nó đã chỉ định `includeSubDomains`.

6. Vài tuần sau, người dùng ở sân bay và quyết định sử dụng Wi-Fi miễn phí. Nhưng không biết, họ kết nối đến điểm truy cập giả mạo chạy trên laptop của kẻ tấn công.
7. Người dùng mở `http://login.example.com/`. Vì trình duyệt ghi nhớ `example.com` là máy chủ HSTS và chỉ thị `includeSubDomains` đã được sử dụng, trình duyệt sử dụng HTTPS.
8. Kẻ tấn công chặn yêu cầu bằng máy chủ HTTPS giả mạo, nhưng không có chứng chỉ hợp lệ cho tên miền.
9. Trình duyệt hiển thị lỗi chứng chỉ không hợp lệ, và không cho phép người dùng bỏ qua nó, do đó ngăn họ cung cấp mật khẩu cho kẻ tấn công.

### Tải trước Strict Transport Security

Google duy trì [dịch vụ tải trước HSTS](https://hstspreload.org/).
Bằng cách tuân theo các hướng dẫn và gửi tên miền của bạn thành công, bạn có thể đảm bảo rằng trình duyệt sẽ kết nối đến tên miền của bạn chỉ qua các kết nối an toàn.
Mặc dù dịch vụ được lưu trữ bởi Google, tất cả các trình duyệt đang sử dụng danh sách tải trước này.
Tuy nhiên, nó không phải là một phần của đặc tả HSTS và không nên được coi là chính thức.

- Thông tin về danh sách tải trước HSTS trong Chrome: https://www.chromium.org/hsts/
- Tra cứu danh sách tải trước HSTS của Firefox: [nsSTSPreloadList.inc](https://searchfox.org/firefox-main/source/security/manager/ssl/nsSTSPreloadList.inc)

## Ví dụ

### Sử dụng Strict-Transport-Security

Tất cả tên miền con hiện tại và tương lai sẽ là HTTPS với `max-age` 1 năm.
Điều này chặn quyền truy cập vào các trang hoặc tên miền con chỉ có thể phục vụ qua HTTP.

```http
Strict-Transport-Security: max-age=31536000; includeSubDomains
```

Mặc dù `max-age` 1 năm được chấp nhận cho tên miền, hai năm là giá trị được khuyến nghị như đã giải thích trên https://hstspreload.org.

Trong ví dụ sau, `max-age` được đặt thành 2 năm, và được thêm hậu tố `preload`, điều này cần thiết để đưa vào danh sách tải trước HSTS của tất cả các trình duyệt web lớn, như Chromium, Edge, và Firefox.

```http
Strict-Transport-Security: max-age=63072000; includeSubDomains; preload
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Features restricted to secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts/features_restricted_to_secure_contexts)
- [HTTP Strict Transport Security has landed!](https://blog.sidstamm.com/2010/08/http-strict-transport-security-has.html) trên blog.sidstamm.com (2010)
- [HTTP Strict Transport Security (force HTTPS)](https://hacks.mozilla.org/2010/08/firefox-4-http-strict-transport-security-force-https/) trên hacks.mozilla.org (2010)
- [HTTP Strict Transport Security](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Strict_Transport_Security_Cheat_Sheet.html) cheatsheet trên owasp.org
- [HTTP Strict Transport Security](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security) trên Wikipedia
- [Dịch vụ tải trước HSTS](https://hstspreload.org/)
