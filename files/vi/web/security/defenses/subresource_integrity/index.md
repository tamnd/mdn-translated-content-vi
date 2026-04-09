---
title: Tính toàn vẹn của tài nguyên con
slug: Web/Security/Defenses/Subresource_Integrity
page-type: guide
browser-compat:
  - html.elements.link.integrity
  - html.elements.script.integrity
sidebar: security
---

**Subresource Integrity** (SRI) là một tính năng bảo mật cho phép trình duyệt xác minh rằng các tài nguyên mà chúng tìm nạp, ví dụ từ một [CDN](/en-US/docs/Glossary/CDN), được phân phối mà không có sự can thiệp ngoài mong muốn. Nó hoạt động bằng cách cho phép bạn cung cấp một giá trị băm mật mã mà tài nguyên được tìm nạp phải khớp.

> [!NOTE]
> Đối với việc xác minh subresource-integrity của một tài nguyên được phục vụ từ một origin khác với tài liệu mà nó được nhúng vào, trình duyệt còn kiểm tra tài nguyên bằng [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS), để đảm bảo origin đang phục vụ tài nguyên cho phép tài nguyên đó được chia sẻ với origin yêu cầu.

## Cách Subresource Integrity hỗ trợ

Các website đôi khi chọn phụ thuộc vào một bên thứ ba như một {{glossary("CDN", "Content Delivery Network (CDN)")}} để lưu trữ một số tài nguyên của họ, thay vì tự lưu trữ tất cả. Ví dụ, một tài liệu được phục vụ từ `https://example.com` có thể bao gồm một tài nguyên từ một vị trí khác:

```html
<script src="https://not-example.com/script.js"></script>
```

Điều này đi kèm rủi ro, vì nếu kẻ tấn công giành được quyền kiểm soát host bên thứ ba, kẻ tấn công có thể chèn nội dung độc hại tùy ý vào các tệp của nó (hoặc thay thế hoàn toàn các tệp) và do đó cũng có thể tấn công các site tìm nạp tệp từ đó.

Subresource Integrity cho phép bạn giảm thiểu một phần rủi ro của những cuộc tấn công như vậy, bằng cách đảm bảo rằng các tệp mà ứng dụng web hoặc tài liệu web của bạn tìm nạp đã được phân phối mà không có việc kẻ tấn công chèn thêm bất kỳ nội dung nào vào các tệp đó - và không có bất kỳ thay đổi nào khác dưới bất kỳ hình thức nào đã được thực hiện đối với các tệp đó.

## Sử dụng Subresource Integrity

Bạn sử dụng tính năng Subresource Integrity bằng cách chỉ định một giá trị băm mật mã được mã hóa base64 của một tài nguyên (tệp) mà bạn yêu cầu trình duyệt tìm nạp, trong giá trị của thuộc tính `integrity` của một phần tử {{HTMLElement("script")}} hoặc một phần tử {{HTMLElement("link")}} với [`rel="stylesheet"`](/en-US/docs/Web/HTML/Reference/Attributes/rel#stylesheet), [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload), hoặc [`rel="modulepreload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload).

Giá trị `integrity` bắt đầu bằng ít nhất một chuỗi, trong đó mỗi chuỗi bao gồm một tiền tố chỉ ra một thuật toán băm cụ thể (hiện tại các tiền tố hợp lệ là `sha256`, `sha384`, và `sha512`), theo sau là dấu gạch ngang, và kết thúc bằng giá trị băm base64 thực tế.

> [!NOTE]
> Một giá trị **integrity** có thể chứa nhiều giá trị băm được phân tách bằng khoảng trắng. Một tài nguyên sẽ được tải nếu nó khớp với một trong các giá trị băm đó.

Ví dụ chuỗi `integrity` với giá trị băm sha384 được mã hóa base64:

```plain
sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC
```

Vì vậy `oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC` là phần "hash", còn tiền tố `sha384` cho biết đây là một hash sha384.

> [!NOTE]
> Phần "hash" của một giá trị `integrity`, nói chính xác hơn, là một **_digest_ _mật mã_** được tạo bằng cách áp dụng một hàm băm cụ thể lên một đầu vào nào đó (ví dụ, một tệp script hoặc stylesheet). Nhưng người ta thường dùng cách gọi tắt "hash" để chỉ _cryptographic_ _digest_, nên đó là cách dùng trong bài viết này.

### Công cụ tạo SRI hash

#### SRI Hash Generator

[SRI Hash Generator](https://srihash.org/) là một công cụ trực tuyến mà bạn có thể dùng để tạo SRI hash.

#### Dùng OpenSSL

Bạn có thể tạo SRI hash từ dòng lệnh bằng **OpenSSL** với một lệnh như sau:

```bash
cat FILENAME.js | openssl dgst -sha384 -binary | openssl base64 -A
```

Trong môi trường Windows, bạn có thể tạo một công cụ để sinh SRI hash bằng đoạn mã sau:

```batch
@echo off
set bits=384
openssl dgst -sha%bits% -binary %1% | openssl base64 -A > tmp
set /p a= < tmp
del tmp
echo sha%bits%-%a%
pause
```

Để dùng đoạn mã đó:

1. Lưu đoạn mã đó vào một tệp tên `sri-hash.bat` trong thư mục Windows SendTo của môi trường bạn (ví dụ: `C:\Users\USER\AppData\Roaming\Microsoft\Windows\SendTo`).
2. Nhấp chuột phải vào một tệp trong File Explorer, chọn **Send to…**, rồi chọn `sri-hash`. Bạn sẽ thấy giá trị integrity trong một hộp lệnh.
3. Chọn giá trị integrity và nhấp chuột phải để sao chép nó vào Clipboard.
4. Nhấn bất kỳ phím nào để đóng hộp lệnh.

> [!NOTE]
> Nếu OpenSSL chưa được cài đặt trên hệ thống của bạn, hãy truy cập [trang dự án OpenSSL](https://www.openssl.org/) để biết thông tin về cách tải xuống và cài đặt nó. Bản thân dự án OpenSSL không lưu trữ các bản phân phối nhị phân của OpenSSL, nhưng có duy trì một danh sách không chính thức các bản phân phối từ bên thứ ba: https://github.com/openssl/openssl/wiki/Binaries.

#### Dùng shasum

Bạn có thể tạo SRI hash bằng [**shasum**](https://linux.die.net/man/1/shasum) với một lệnh như sau:

```bash
shasum -b -a 384 FILENAME.js | awk '{ print $1 }' | xxd -r -p | base64
```

- Bước pipe qua `xxd` lấy đầu ra dạng thập lục phân từ `shasum` và chuyển nó thành nhị phân.
- Bước pipe qua `awk` là cần thiết vì `shasum` sẽ đưa tên tệp đã băm vào đầu ra của nó cho `xxd`. Điều này có thể gây hậu quả nghiêm trọng nếu tên tệp tình cờ chứa các ký tự hex hợp lệ - vì `xxd` cũng sẽ giải mã phần đó và truyền nó tới `base64`.

### Chia sẻ tài nguyên chéo origin và Subresource Integrity

Đối với việc xác minh subresource-integrity của một tài nguyên được phục vụ từ một origin khác với tài liệu mà nó được nhúng vào, trình duyệt còn kiểm tra tài nguyên bằng [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS), để đảm bảo origin đang phục vụ tài nguyên cho phép tài nguyên đó được chia sẻ với origin yêu cầu. Vì vậy, tài nguyên phải được phục vụ với một tiêu đề [`Access-Control-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin) cho phép tài nguyên đó được chia sẻ với origin yêu cầu; ví dụ:

```http
Access-Control-Allow-Origin: *
```

## Cách trình duyệt xử lý Subresource Integrity

Trình duyệt xử lý SRI bằng cách thực hiện như sau:

1. Khi trình duyệt gặp một phần tử {{HTMLElement("script")}} hoặc {{HTMLElement("link")}} có thuộc tính `integrity`, trước khi thực thi script hoặc trước khi áp dụng bất kỳ stylesheet nào được phần tử {{HTMLElement("link")}} chỉ định, trình duyệt phải trước tiên so sánh script hoặc stylesheet với giá trị băm mong đợi được cung cấp trong giá trị `integrity`.

   Đối với việc xác minh subresource-integrity của một tài nguyên được phục vụ từ một origin khác với tài liệu mà nó được nhúng vào, trình duyệt còn kiểm tra tài nguyên bằng [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS), để đảm bảo origin đang phục vụ tài nguyên cho phép tài nguyên đó được chia sẻ với origin yêu cầu.

2. Nếu script hoặc stylesheet không khớp với giá trị `integrity` của nó, trình duyệt phải từ chối thực thi script hoặc áp dụng stylesheet, và thay vào đó phải trả về một lỗi mạng cho biết việc tìm nạp script hoặc stylesheet đó thất bại.

## Chính sách toàn vẹn

Các tiêu đề HTTP {{httpheader("Integrity-Policy")}} và {{httpheader("Integrity-Policy-Report-Only")}} cho phép một tài liệu thực thi chính sách về các yêu cầu siêu dữ liệu toàn vẹn đối với các subresource script và stylesheet được tải.

Khi tiêu đề `Integrity-Policy` được chỉ định, trình duyệt sẽ chặn các yêu cầu có chế độ [no-cors](/en-US/docs/Web/API/Request/mode#no-cors) hoặc không có thuộc tính `integrity`, và cũng sẽ báo cáo vi phạm nếu có chỉ định một reporting endpoint hợp lệ.
Khi tiêu đề `Integrity-Policy-Report-Only` được chỉ định, trình duyệt cho phép các yêu cầu vi phạm chính sách, nhưng sẽ báo cáo vi phạm tới reporting endpoint (nếu có chỉ định một reporting endpoint hợp lệ).

Thông thường, các nhà phát triển sẽ dùng `Integrity-Policy-Report-Only` như bước triển khai đầu tiên trong hành trình áp dụng Integrity Policy, để đảm bảo rằng tất cả script và stylesheet được tải trong tài liệu của họ đều có siêu dữ liệu toàn vẹn phù hợp. Khi thấy rằng không còn nhận được báo cáo vi phạm nào, họ sẽ biết rằng có thể bật chặn bằng tiêu đề `Integrity-Policy` mà không lo gây hỏng trải nghiệm của người dùng.

Giá trị tiêu đề được định nghĩa như các structured field dictionary với các khóa sau:

- `blocked-destinations`
  - : Xác định danh sách các [request destinations](/en-US/docs/Web/API/Request/destination) sẽ bị chặn. Các giá trị duy nhất được phép là `script` và `style`.
- `sources` {{optional_inline}}
  - : Xác định danh sách các integrity source. Giá trị mặc định và duy nhất hiện được hỗ trợ là `inline`. Vì vậy, thêm `sources=(inline)` vào tiêu đề có tác dụng tương tự như bỏ qua `sources`.
- `endpoints` {{optional_inline}}
  - : Xác định danh sách các [reporting endpoints](/en-US/docs/Web/HTTP/Reference/Headers/Reporting-Endpoints#endpoint). Các reporting endpoint cần được định nghĩa trong tiêu đề {{httpheader("Reporting-Endpoints")}}.

Trong các trường hợp một yêu cầu bị chặn bởi integrity policy, một báo cáo vi phạm [Reporting API](/en-US/docs/Web/API/Reporting_API) sẽ được tạo ra với thuộc tính type là `integrity-violation` và cấu trúc được định nghĩa bởi {{domxref("IntegrityViolationReport")}}, bao gồm các thông tin như URL của tài liệu và tài nguyên bị chặn.

Một báo cáo điển hình có thể trông như sau

```json
{
  "type": "integrity-violation",
  "url": "https://example.com",
  "body": {
    "documentURL": "https://example.com",
    "blockedURL": "https://example.com/main.js",
    "destination": "script",
    "reportOnly": false
  }
}
```

## Ví dụ

Trong các ví dụ sau, giả sử `oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC` đã được biết là giá trị băm SHA-384 mong đợi (digest) của một script cụ thể `example-framework.js`, và có một bản sao của script đó được lưu trữ tại `https://example.com/example-framework.js`.

### Subresource Integrity với phần tử \<script>

Bạn có thể dùng phần tử {{HTMLElement("script")}} sau để báo cho trình duyệt rằng trước khi thực thi script `https://example.com/example-framework.js`, trình duyệt phải trước tiên so sánh script với giá trị băm mong đợi và xác minh rằng có khớp.

```html
<script
  src="https://example.com/example-framework.js"
  integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
  crossorigin="anonymous"></script>
```

> [!NOTE]
> Để biết thêm chi tiết về mục đích của thuộc tính `crossorigin`, xem [CORS settings attributes](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin).

### Thực thi integrity với tiêu đề `Integrity-Policy`

Bạn có thể thêm tiêu đề {{httpheader("Integrity-Policy")}} vào tài liệu của mình để đảm bảo rằng các tài nguyên bên ngoài mà nó tải (trong trường hợp này là scripts) được tải kèm integrity (và không được tải ở chế độ [no-cors](/en-US/docs/Web/API/Request/mode#no-cors))

```http
Integrity-Policy: blocked-destinations=(script), endpoints=(integrity-endpoint, some-other-integrity-endpoint)
```

Nếu bạn không chắc rằng tất cả các script bên ngoài đều có siêu dữ liệu integrity, bạn có thể bật phiên bản chỉ báo cáo của tính năng và bắt đầu nhận báo cáo vi phạm.
Bạn có thể làm điều đó bằng tiêu đề {{httpheader("Integrity-Policy-Report-Only")}}.

```http
Integrity-Policy-Report-Only: blocked-destinations=(script), endpoints=(integrity-endpoint, some-other-integrity-endpoint)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP)
- Tiêu đề HTTP {{httpheader("Content-Security-Policy")}}.
- [Một CDN không thể XSS bạn: Sử dụng Subresource Integrity](https://frederikbraun.de/using-subresource-integrity.html)
- [SRI Hash Generator](https://srihash.org/)
