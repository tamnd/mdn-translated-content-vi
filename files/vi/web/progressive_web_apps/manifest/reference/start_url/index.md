---
title: start_url
slug: Web/Progressive_web_apps/Manifest/Reference/start_url
page-type: web-manifest-member
browser-compat: manifests.webapp.start_url
sidebar: pwasidebar
---

Member manifest `start_url` được dùng để chỉ định URL sẽ được mở khi người dùng khởi chạy ứng dụng web của bạn, chẳng hạn khi chạm vào biểu tượng ứng dụng trên màn hình chính của thiết bị hoặc trong danh sách ứng dụng.

> [!NOTE]
> `start_url` là một gợi ý cho trình duyệt. [Trình duyệt có tính linh hoạt](#description) trong cách xử lý `start_url` và có thể không luôn dùng giá trị được chỉ định.

## Cú pháp

```json-nolint
/* URL tuyệt đối */
"start_url": "https://example.com/myapp"
"start_url": "https://myapp.com/home"

/* URL tương đối */
"start_url": "/"
"start_url": "../index.html"
```

### Giá trị

- `start_url`
  - : Một chuỗi đại diện cho URL khởi đầu của ứng dụng web.
    URL có thể là tuyệt đối hoặc tương đối.
    Nếu giá trị là tương đối, nó được phân giải dựa trên URL của tệp manifest.

    Nếu `start_url` không được chỉ định hoặc giá trị không hợp lệ (tức là không phải chuỗi, không phải URL hợp lệ, hoặc không {{glossary("origin", "same-origin")}} với trang liên kết tới manifest), URL của trang liên kết tới manifest sẽ được dùng.

    > [!NOTE]
    > Trên một số trình duyệt, `start_url` _phải_ được chỉ định để [PWA có thể cài đặt được](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#installability) (xem phần tương thích bên dưới).
    > Bạn có thể đặt `"start_url": "./"` để dùng hành vi mặc định trên mọi trình duyệt.

    > [!NOTE]
    > Nếu [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) không được chỉ định trong manifest thì nó sẽ được suy ra từ `start_url` (hoặc `start_url` hiệu lực nếu giá trị không được xác định hoặc không hợp lệ).

## Mô tả

`start_url` cho phép bạn gợi ý một điểm vào chung phù hợp cho tất cả người dùng.

Khi người dùng cài đặt một ứng dụng web, việc cài đặt diễn ra từ trang mà họ hiện đang xem.
Trong quá trình cài đặt, trình duyệt sẽ tải tệp manifest được liên kết từ trang này.
Mặc dù tệp manifest có thể được phục vụ từ bất kỳ origin nào, quá trình cài đặt lại gắn với trang nơi nó bắt đầu.
Hãy xét một kịch bản trong đó:

- Trang cài đặt là `https://myapp.example.com/index.html`.
- Tệp manifest được lưu trữ tại `https://assets.cdn.com/manifest.json`.
- `start_url` là `https://myapp.example.com/home`.

Giá trị `start_url` được chỉ định trong ví dụ này sẽ được dùng vì nó cùng origin với trang mà ứng dụng đang được cài đặt.
Nếu `start_url` được chỉ định nằm trên origin khác (ví dụ, `https://differentapp.example.com/home`), trình duyệt sẽ quay về dùng URL của trang cài đặt làm điểm khởi đầu.
Điều này bảo đảm ứng dụng web chỉ khởi động trên các trang trong chính origin của nó.

Lưu ý, tuy nhiên, rằng trình duyệt không bắt buộc phải dùng URL được chỉ định.
Chúng có thể bỏ qua giá trị được chỉ định hoặc cho người dùng lựa chọn không dùng nó.
Chúng cũng có thể cho phép người dùng sửa URL khi tạo bookmark cho ứng dụng web hoặc vào thời điểm sau đó.
Hãy ghi nhớ điều này khi thiết kế ứng dụng để cho phép có sự biến thiên trong `start_url`.

### Thực hành tốt nhất

URL này nên đưa người dùng tới một trang quan trọng của ứng dụng, chẳng hạn dashboard.
Hãy cân nhắc những tính năng mà người dùng muốn truy cập ngay sau khi khởi chạy ứng dụng.
Nếu trang chính của ứng dụng nằm ở gốc site, bạn có thể đặt `start_url` thành `/`.
Bạn cũng có thể chỉ định một deep link (ví dụ, `https://myapp.com/product/whatsnew`) để đưa người dùng trực tiếp tới nội dung cụ thể trong ứng dụng.
Tránh chỉ định một trang khởi đầu chung chung.

Vì lý do bảo mật, `start_url` phải cùng origin với URL của manifest.
Nếu chỉ định `start_url` không cùng origin, trình duyệt sẽ quay về dùng trang liên kết tới manifest làm trang khởi đầu mặc định.

## Cân nhắc quyền riêng tư

- **Fingerprinting**:

  Việc mã hóa các chuỗi vào `start_url` để nhận diện duy nhất người dùng (ví dụ, các định danh do máy chủ gán, như `?user=123`, `/user/123/`, hoặc `https://user123.example.com`) tạo ra một fingerprint bền vững.
  Người dùng có thể không biết rằng thông tin nhạy cảm về quyền riêng tư của họ vẫn còn tồn tại ngay cả sau khi họ đã xóa dữ liệu site.
  Việc đưa bất kỳ thông tin nào có thể nhận diện duy nhất người dùng vào `start_url` là thực hành không tốt.

  Trình duyệt có thể cung cấp biện pháp bảo vệ chống lại kiểu fingerprinting này.
  Ví dụ, khi người dùng xóa dữ liệu của một origin, trình duyệt có thể nhắc họ gỡ cài đặt các ứng dụng nằm trong scope của origin đó.
  Điều này loại bỏ mọi fingerprint tiềm ẩn từ `start_url` của ứng dụng.

- **Theo dõi khởi chạy**:

  Thêm tham số vào `start_url` để cho biết ứng dụng được khởi chạy từ bên ngoài trình duyệt (ví dụ, `"start_url": "index.html?launcher=homescreen"`) có thể hữu ích cho phân tích và tùy biến.
  Tuy nhiên, thông tin này có thể được dùng như một phần của fingerprint số của người dùng.
  Hãy cân nhắc các tác động quyền riêng tư khi triển khai kiểu theo dõi này.

## Ví dụ

### Chỉ định URL khởi đầu tuyệt đối

Giả sử tệp manifest cho ứng dụng web đi bộ đường dài của bạn nằm tại `https://hiking-pro.com/resources/manifest.json`, và `https://hiking-pro.com/index.html` liên kết tới tệp manifest.
Bạn muốn người dùng đến trang `trail-hub.html` khi họ khởi chạy ứng dụng.
Bạn có thể chỉ định URL khởi đầu này trong manifest như sau:

```json
{ "start_url": "https://hiking-pro.com/trail-hub.html" }
```

Giá trị `start_url` này hợp lệ vì nó cùng origin với URL manifest (`https://hiking-pro.com/resources/manifest.json`).

`start_url` sau đây không hợp lệ vì nó không cùng origin với URL manifest:

```json example-bad
{ "start_url": "https://other-domain.com/trail-hub.html" }
```

Trong trường hợp trên, `https://hiking-pro.com/index.html` sẽ được dùng làm trang khởi đầu mặc định khi người dùng khởi chạy ứng dụng.

### Chỉ định URL khởi đầu tương đối

Đối với ứng dụng đi bộ đường dài của bạn trong kịch bản trước, bạn có thể chỉ định cùng điểm khởi đầu bằng URL tương đối như bên dưới.
URL tương đối này sẽ được phân giải thành `https://hiking-pro.com/trail-hub.html` bằng cách dùng URL của tệp manifest (`https://hiking-pro.com/resources/manifest.json`) làm cơ sở.

```json
{ "start_url": "../trail-hub.html" }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Glossary("Application_context", "Application context")}}
- {{Glossary("Same-origin_policy", "Same-origin policy")}}
- [The web app manifest](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable#the_web_app_manifest) để làm cho ứng dụng web của bạn có thể cài đặt
- [Security on the web](/en-US/docs/Web/Security)
