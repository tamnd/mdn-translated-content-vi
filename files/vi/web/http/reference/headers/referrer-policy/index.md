---
title: Referrer-Policy header
short-title: Referrer-Policy
slug: Web/HTTP/Reference/Headers/Referrer-Policy
page-type: http-header
browser-compat: http.headers.Referrer-Policy
sidebar: http
---

Tiêu đề HTTP **`Referrer-Policy`** {{Glossary("response header")}} kiểm soát lượng [thông tin người giới thiệu](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns) (được gửi với tiêu đề {{HTTPHeader("Referer")}}) nên được bao gồm trong các yêu cầu.
Ngoài tiêu đề HTTP, bạn có thể [đặt chính sách này trong HTML](#integration_with_html).

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
Referrer-Policy: no-referrer
Referrer-Policy: no-referrer-when-downgrade
Referrer-Policy: origin
Referrer-Policy: origin-when-cross-origin
Referrer-Policy: same-origin
Referrer-Policy: strict-origin
Referrer-Policy: strict-origin-when-cross-origin
Referrer-Policy: unsafe-url
```

> [!NOTE]
> Tên tiêu đề {{HTTPHeader("Referer")}} là lỗi chính tả của từ "referrer". Tiêu đề `Referrer-Policy` không có lỗi chính tả này.

## Chỉ thị

- `no-referrer`
  - : Tiêu đề {{HTTPHeader("Referer")}} sẽ bị bỏ qua: các yêu cầu được gửi không bao gồm bất kỳ thông tin người giới thiệu nào.
- `no-referrer-when-downgrade`
  - : Gửi {{glossary("origin")}}, đường dẫn và chuỗi truy vấn trong {{HTTPHeader("Referer")}} khi mức độ bảo mật giao thức duy trì hoặc cải thiện (HTTP→HTTP, HTTP→HTTPS, HTTPS→HTTPS). Không gửi tiêu đề {{HTTPHeader("Referer")}} cho các yêu cầu đến đích kém bảo mật hơn (HTTPS→HTTP, HTTPS→file).
- `origin`
  - : Chỉ gửi {{glossary("origin")}} trong tiêu đề {{HTTPHeader("Referer")}}.
    Ví dụ: tài liệu tại `https://example.com/page.html` sẽ gửi người giới thiệu `https://example.com/`.
- `origin-when-cross-origin`
  - : Khi thực hiện yêu cầu {{glossary("Same-origin_policy", "cùng nguồn gốc")}}, gửi {{glossary("origin")}}, đường dẫn và chuỗi truy vấn. Chỉ gửi nguồn gốc cho các yêu cầu khác nguồn gốc và các yêu cầu đến đích kém bảo mật hơn (HTTPS→HTTP).
- `same-origin`
  - : Gửi {{glossary("origin")}}, đường dẫn và chuỗi truy vấn cho yêu cầu {{glossary("Same-origin_policy", "cùng nguồn gốc")}}. Không gửi tiêu đề {{HTTPHeader("Referer")}} cho các yêu cầu khác nguồn gốc.
- `strict-origin`
  - : Chỉ gửi nguồn gốc khi mức độ bảo mật giao thức duy trì (HTTPS→HTTPS). Không gửi tiêu đề {{HTTPHeader("Referer")}} đến đích kém bảo mật hơn (HTTPS→HTTP).
- `strict-origin-when-cross-origin` (mặc định)
  - : Gửi nguồn gốc, đường dẫn và chuỗi truy vấn khi thực hiện yêu cầu cùng nguồn gốc. Cho các yêu cầu khác nguồn gốc chỉ gửi nguồn gốc khi mức độ bảo mật giao thức duy trì (HTTPS→HTTPS). Không gửi tiêu đề {{HTTPHeader("Referer")}} đến đích kém bảo mật hơn (HTTPS→HTTP).

    > [!NOTE]
    > Đây là chính sách mặc định nếu không có chính sách nào được chỉ định, hoặc nếu giá trị cung cấp không hợp lệ (xem bản sửa đổi thông số kỹ thuật [tháng 11 năm 2020](https://github.com/whatwg/fetch/pull/1066)). Trước đây, mặc định là `no-referrer-when-downgrade`.

- `unsafe-url`
  - : Gửi nguồn gốc, đường dẫn và chuỗi truy vấn khi thực hiện bất kỳ yêu cầu nào, bất kể bảo mật.

    > [!WARNING]
    > Chính sách này sẽ rò rỉ thông tin có thể riêng tư từ URL tài nguyên HTTPS đến các nguồn gốc không an toàn. Xem xét cẩn thận tác động của cài đặt này.

## Tích hợp với HTML

Bạn cũng có thể đặt chính sách người giới thiệu bên trong HTML. Ví dụ: bạn có thể đặt chính sách người giới thiệu cho toàn bộ tài liệu bằng phần tử {{HTMLElement("meta")}} với [name](/en-US/docs/Web/HTML/Reference/Elements/meta/name) là `referrer`:

```html
<meta name="referrer" content="origin" />
```

Bạn có thể chỉ định thuộc tính `referrerpolicy` trên phần tử {{HTMLElement("a")}}, {{HTMLElement("area")}}, {{HTMLElement("img")}}, {{HTMLElement("iframe")}}, {{HTMLElement("script")}}, hoặc {{HTMLElement("link")}} để đặt chính sách người giới thiệu cho các yêu cầu riêng lẻ:

```html
<a href="http://example.com" referrerpolicy="origin">…</a>
```

Ngoài ra, bạn có thể đặt [quan hệ liên kết](https://en.wikipedia.org/wiki/Link_relation) `noreferrer` trên phần tử `a`, `area` hoặc `link`:

```html
<a href="http://example.com" rel="noreferrer">…</a>
```

> [!WARNING]
> Như đã thấy ở trên, quan hệ liên kết `noreferrer` được viết không có dấu gạch ngang. Khi bạn chỉ định chính sách người giới thiệu cho toàn bộ tài liệu bằng phần tử {{HTMLElement("meta")}}, nó nên được viết _có_ dấu gạch ngang: `<meta name="referrer" content="no-referrer">`.

## Tích hợp với CSS

CSS có thể tải các tài nguyên được tham chiếu từ stylesheets. Những tài nguyên này cũng tuân theo chính sách người giới thiệu:

- Các stylesheet CSS bên ngoài sử dụng chính sách mặc định (`strict-origin-when-cross-origin`), trừ khi nó bị ghi đè bởi tiêu đề HTTP `Referrer-Policy` trong phản hồi của stylesheet CSS.
- Đối với các phần tử {{HTMLElement("style")}} hoặc [thuộc tính `style`](/en-US/docs/Web/API/HTMLElement/style), chính sách người giới thiệu của tài liệu sở hữu được sử dụng.

## Ví dụ

### `no-referrer`

| Từ tài liệu                | Điều hướng đến | Người giới thiệu sử dụng      |
| -------------------------- | -------------- | ----------------------------- |
| `https://example.com/page` | _bất kỳ đâu_   | _(không có người giới thiệu)_ |

### `no-referrer-when-downgrade`

| Từ tài liệu                 | Điều hướng đến                  | Người giới thiệu sử dụng      |
| --------------------------- | ------------------------------- | ----------------------------- |
| `https://example.com/page`  | `https://example.com/otherpage` | `https://example.com/page`    |
| `https://example.com/page`  | `https://mozilla.org`           | `https://example.com/page`    |
| `https://example.com/page`  | **http**://example.com          | _(không có người giới thiệu)_ |
| **http**://example.com/page | _bất kỳ đâu_                    | `http://example.com/page`     |

### `origin`

| Từ tài liệu                | Điều hướng đến | Người giới thiệu sử dụng |
| -------------------------- | -------------- | ------------------------ |
| `https://example.com/page` | _bất kỳ đâu_   | `https://example.com/`   |

### `origin-when-cross-origin`

| Từ tài liệu                | Điều hướng đến                  | Người giới thiệu sử dụng   |
| -------------------------- | ------------------------------- | -------------------------- |
| `https://example.com/page` | `https://example.com/otherpage` | `https://example.com/page` |
| `https://example.com/page` | `https://mozilla.org`           | `https://example.com/`     |
| `https://example.com/page` | **http**://example.com/page     | `https://example.com/`     |

### `same-origin`

| Từ tài liệu                | Điều hướng đến                  | Người giới thiệu sử dụng      |
| -------------------------- | ------------------------------- | ----------------------------- |
| `https://example.com/page` | `https://example.com/otherpage` | `https://example.com/page`    |
| `https://example.com/page` | `https://mozilla.org`           | _(không có người giới thiệu)_ |

### `strict-origin`

| Từ tài liệu                 | Điều hướng đến         | Người giới thiệu sử dụng      |
| --------------------------- | ---------------------- | ----------------------------- |
| `https://example.com/page`  | `https://mozilla.org`  | `https://example.com/`        |
| `https://example.com/page`  | **http**://example.com | _(không có người giới thiệu)_ |
| **http**://example.com/page | _bất kỳ đâu_           | `http://example.com/`         |

### `strict-origin-when-cross-origin`

| Từ tài liệu                | Điều hướng đến                  | Người giới thiệu sử dụng      |
| -------------------------- | ------------------------------- | ----------------------------- |
| `https://example.com/page` | `https://example.com/otherpage` | `https://example.com/page`    |
| `https://example.com/page` | `https://mozilla.org`           | `https://example.com/`        |
| `https://example.com/page` | **http**://example.com          | _(không có người giới thiệu)_ |

### `unsafe-url`

| Từ tài liệu                      | Điều hướng đến | Người giới thiệu sử dụng         |
| -------------------------------- | -------------- | -------------------------------- |
| `https://example.com/page?q=123` | _bất kỳ đâu_   | `https://example.com/page?q=123` |

### Chỉ định chính sách dự phòng

Nếu bạn muốn chỉ định chính sách dự phòng trong trường hợp chính sách mong muốn không được hỗ trợ đủ rộng trong trình duyệt, sử dụng danh sách phân tách bằng dấu phẩy với chính sách mong muốn được chỉ định cuối cùng:

```http
Referrer-Policy: no-referrer, strict-origin-when-cross-origin
```

Trong tình huống trên, `no-referrer` chỉ được sử dụng nếu trình duyệt không hỗ trợ chính sách `strict-origin-when-cross-origin`.

> [!NOTE]
> Chỉ định nhiều giá trị chỉ được hỗ trợ trong tiêu đề HTTP `Referrer-Policy`, không phải trong thuộc tính `referrerpolicy`.

## Tùy chọn/cài đặt dành riêng cho trình duyệt

### Tùy chọn Firefox

Bạn có thể cấu hình chính sách người giới thiệu _mặc định_ trong tùy chọn Firefox. Tên tùy chọn dành riêng cho phiên bản:

- Firefox phiên bản 59 trở lên: `network.http.referer.defaultPolicy` (và `network.http.referer.defaultPolicy.pbmode` cho mạng riêng tư)
- Phiên bản Firefox 53 đến 58: `network.http.referer.userControlPolicy`

Tất cả các cài đặt này có cùng tập hợp giá trị: `0 = no-referrer`, `1 = same-origin`, `2 = strict-origin-when-cross-origin`, `3 = no-referrer-when-downgrade`.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bảo mật web > Tiêu đề Referer: mối lo ngại về quyền riêng tư và bảo mật](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns)
- Khi sử dụng [Fetch](/en-US/docs/Web/API/Fetch_API): {{domxref("Request.referrerPolicy")}}
- [Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
- [HTTP referer trên Wikipedia](https://en.wikipedia.org/wiki/HTTP_referer)
- [Tighter Control Over Your Referrers – Mozilla Security Blog](https://blog.mozilla.org/security/2015/01/21/meta-referrer/)
