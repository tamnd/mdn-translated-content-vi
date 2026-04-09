---
title: scope_extensions
slug: Web/Progressive_web_apps/Manifest/Reference/scope_extensions
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.scope_extensions
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member manifest `scope_extensions` được dùng để mở rộng scope của một ứng dụng web để bao gồm các origin khác. Điều này cho phép nhiều domain được trình bày như một ứng dụng web duy nhất.

## Cú pháp

```json
"scope_extensions": [
  { "type": "origin", "origin": "https://support.example.com"},
  { "type": "origin", "origin": "https://shop.example.com"},
  { "type": "origin", "origin": "https://example.de"},
  { "type": "origin", "origin": "https://example.co.uk"}
]
```

### Giá trị

- `scope_extensions`
  - : Một mảng các đối tượng, mỗi đối tượng chứa các thuộc tính sau:
    - `type`
      - : Một chuỗi xác định kiểu mở rộng scope. Hiện tại luôn là `origin`, nhưng các mở rộng trong tương lai có thể thêm kiểu khác.
    - `origin`
      - : Một chuỗi đại diện cho origin mà ứng dụng web muốn mở rộng scope tới.

## Mô tả

Member `scope_extensions` có thể mở rộng scope của ứng dụng web để bao gồm các origin khác. Các trường hợp dùng điển hình gồm:

- Các subdomain khác nhau cho nội dung hoặc chức năng, ví dụ `https://support.example.com`, `https://shop.example.com`, `https://maps.example.com`, `https://auth.example.com`.
- Các subdomain khác nhau cho ngôn ngữ/locale, ví dụ `https://uk.example.com`, `https://de.example.com`, `https://jp.example.com`, `https://no.example.com`.
- Các domain độc lập có liên quan, ví dụ `https://example.jp`, `https://my-example.com`, `https://my-partner-site.com`, `https://example.slack.com`.

Ứng dụng web chính (ví dụ, `https://example.com`) cần bao gồm các origin mà nó muốn đưa vào scope bên trong member manifest `scope_extensions`:

```json
{
  "scope_extensions": [
    { "type": "origin", "origin": "https://example.jp" },
    { "type": "origin", "origin": "https://my-example.com" },
    { "type": "origin", "origin": "https://my-partner-site.com" },
    { "type": "origin", "origin": "https://example.slack.com" }
  ]
}
```

### Tự chấp nhận qua tệp .well-known

Để chấp nhận việc liên kết, các site có origin được chỉ định là nằm trong scope trong member manifest `scope_extensions` của ứng dụng web cần bao gồm một tệp [.well-known](https://en.wikipedia.org/wiki/Well-known_URI) có tên `web-app-origin-association` tại URL tương đối `/.well-known/web-app-origin-association`. Tệp này phải chứa một cấu trúc JSON bao gồm một hoặc nhiều thuộc tính mà khóa của chúng bằng với các member manifest [`id`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/id) của từng ứng dụng web mà site đó đang chấp nhận đưa vào scope.

Ví dụ:

```json
{
  "https://example.com": {
    "scope": "/"
  },
  "https://beta.example.com": {
    "scope": "/"
  }
}
```

Giá trị của mỗi thuộc tính là một đối tượng chứa thuộc tính `scope` với giá trị chỉ định đường dẫn chính xác sẽ nằm trong scope cho ứng dụng web đang tham chiếu.

> [!NOTE]
> Không thể chỉ định các scope khác nhau cho cùng một ứng dụng web - bạn không thể bao gồm nhiều mục cho cùng một khóa.

### Tác động của `scope_extensions`

Khi các origin được bao gồm trong `scope_extensions` của ứng dụng web đã chấp nhận thành công, bạn có thể liên kết tới các vị trí bên trong scope của các origin đó, và khi các liên kết đó được theo, các vị trí sẽ xuất hiện trong cửa sổ ứng dụng giống hệt như các vị trí bên trong scope của chính ứng dụng web.

Nếu bạn theo một liên kết tới vị trí không nằm trong scope của ứng dụng web, nó sẽ xuất hiện như một vị trí bên ngoài, đúng như mong đợi.

## Ví dụ

Hãy lấy một ứng dụng web mẫu nằm tại `https://example.com/app`:

```json
{
  "id": "https://example.com/app",
  "name": "My App",
  "icons": [
    {
      "src": "icon/hd_hi",
      "sizes": "128x128"
    }
  ],
  "start_url": "/app/index.html",
  "scope": "/app",
  "display": "standalone",
  "scope_extensions": [
    { "type": "origin", "origin": "https://example.co.uk" },
    { "type": "origin", "origin": "https://help.example.com" }
  ]
}
```

Để chấp nhận đưa vào scope của ứng dụng, `https://example.co.uk` và `https://help.example.com` sẽ cần bao gồm một `/.well-known/web-app-origin-association` trông như sau:

```json
{
  "https://example.com/app": {
    "scope": "/"
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) manifest member
